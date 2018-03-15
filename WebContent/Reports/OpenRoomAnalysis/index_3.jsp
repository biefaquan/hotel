<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>开房方式分析报表</title>
 <script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>     
  <script type="text/javascript" src="/hotel/js/excel.js" ></script>
<script src="/hotel/js/echarts.min.js"></script>   
<script type="text/javascript">
function LineChart() {
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
	        data: ['天房','午夜房','钟点房','月租房']
	    },
	    series : [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:[
	                {value:"${supple.s1}", name:'天房'},
	                {value:"${supple.s2}", name:'午夜房'},
	                {value:"${supple.s3}", name:'钟点房'},
	                {value:"${supple.s3}", name:'月租房'}
	            ],
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
    <form method="post" action="/hotel/InAccountController/queryOpenType1" id="Form1">
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
                <b>开房方式分析</b>
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
                        <td colspan="5">开房方式</td>
                    </tr>
                    <tr class="tis">
                        <td>天房</td>
                        <td>午夜房</td>
                        <td>钟点房</td>
                        <td>月租房</td>
                        <td>小计</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${sclist }" var="sc">
                    <tr>
                        <td>${sc.name }</td>
                        <td class="right">${sc.s1 }</td>
                        <td class="right">${sc.s2 }</td>
                        <td class="right">${sc.s3 }</td>
                        <td class="right">${sc.s4 }</td>
                        <td class="right">${sc.s1+sc.s2+sc.s3+sc.s4 }</td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                        <td>合计：</td>
                        <td class="right">${supple.s1 }</td>
                        <td class="right">${supple.s2 }</td>
                        <td class="right">${supple.s3 }</td>
                        <td class="right">${supple.s4 }</td>
                        <td class="right">${supple.s1+supple.s2+supple.s3+supple.s4 }</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>


</body>
</html>
