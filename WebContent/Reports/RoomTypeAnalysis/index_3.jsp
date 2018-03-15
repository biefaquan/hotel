<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>房型分析报表</title>
 <script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>     
  <script type="text/javascript" src="/hotel/js/excel.js" ></script>
<script src="/hotel/js/echarts.min.js"></script>   
<script type="text/javascript">
function LineChart() {
var name = ${roomname.names()};
var roomtype = ${roomtype };
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('div1'));
// 指定图表的配置项和数据
var option = {
	    title : {
	        text: '',
	        subtext: '百分比',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: name
	    },
	    series : [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:roomtype,
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
//使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
}    
</script>   
    

<link media="all" href="/hotel/css/reports/occupancy/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form method="post" action="/hotel/InAccountController/queryRoomType1" id="Form1">
<div>
            <b>
                <div class="ftt_search fontYaHei">
                   <label>营业日：</label><input name="start" id="StartDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                    <label>至</label><input name="end" id="EndDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                    <input name="btnQuery" value="查询" id="btnQuery" class="qtantj" type="submit">
                     <div class="z-btn">
                    <div class="z-btn-left"><i>&nbsp;</i></div>
                    <div class="z-btn-center">
                        <em>
                            <input value="打印预览" onclick="javascript:window.print()" class="z-button z-btn-text icon-print" id="btnPrint" type="button">
                        </em>
                    </div>
                    <div class="z-btn-right"><i>&nbsp;</i></div>
                </div>
                <div class="z-btn">
                    <div class="z-btn-left"><i>&nbsp;</i></div>
                    <div class="z-btn-center">
                        <em>
                            <input name="btnExport" onclick="javascript:method1('printTable')" value="导出EXCEL" id="btnExport" class="z-button z-btn-text icon-excel" type="button">
                        </em>
                    </div>
                    <div class="z-btn-right"><i>&nbsp;</i></div>
                </div>
                </div>
            </b>
            <b style="margin: 8px 0px 0px 20px; display: inline;">
               
            </b>
        </div>
        <input id="IsHideZeroData" value="0" type="hidden">
        <div id="printContent" style="width: 960px; margin: 0px auto;"> 
            
            <div class="report_h2">
                <b>房型分析</b>
                <p>
                    <span id="DateSpan" style="width: 240px;">时间范围：<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' /> 至 <fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' /></span>
                    <span id="ZbrSpan">制表人：${user.u_name }</span>
                </p>
            </div>
            <div style="width: 1000px;height:400px;" id="div1"></div>
            <script type="text/javascript">LineChart()</script>
            <div style="margin-top: 50px;"></div>

            <table class="report_table" id="printTable" cellspacing="0" cellpadding="0" border="1">
                <thead>
                    <tr class="tis">
                        <td rowspan="2">营业日</td>
                        <td colspan="${size+1 }">房型</td>
                    </tr>
                    <tr class="tis">
                        <c:forEach items="${rtlist }" var="rt">
                        	<td>${rt.rt_name }</td>
                    	</c:forEach>
                        <td>小计</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sclist }" var="sc">
                    <tr>
                        <td>${sc.name }</td>
                        <c:forEach items="${rtlist }" var="rt">
                        	 <c:set var="flag" value="0"></c:set>
                        	 <c:forEach items="${sc.map }" var="map">
                        		<c:if test="${map.key==rt.rt_name }">
                        			<c:set var="flag" value="1"></c:set>
                        			<td class="right">${map.value }</td>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${flag==0 }">
                        		<td class="right">0.0</td>
                        	</c:if>
                        </c:forEach>
                        <td>${sc.s1 }</td>
                    </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                        <td>合计：</td>
                        <c:forEach items="${rtlist }" var="rt">
                        	<c:set var="flag" value="0"></c:set>
                        	<c:forEach items="${supplemap }" var="map">
                        		<c:if test="${map.key==rt.rt_name }">
                        			<td class="right">${map.value }</td>
                        			<c:set var="flag" value="1"></c:set>
                        		</c:if>
                        	</c:forEach>
                        	<c:if test="${flag==0 }">
                        		<td class="right">0.0</td>
                        	</c:if>
                        </c:forEach>
                        <td class="right">${allnum }</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>


</body>
</html>
