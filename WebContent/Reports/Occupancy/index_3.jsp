<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>入住率分析报表</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>     
<script type="text/javascript" src="/hotel/js/excel.js" ></script>
<script src="/hotel/js/echarts.min.js"></script>
<script type="text/javascript">
function LineChart() {
var x = ${occ.names()};
var y = ${occ.values()};
//alert(x);
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('div1'));
// 指定图表的配置项和数据
var option = {
	    title: {
	        text: '入住率分析',
	        subtext: '入住率'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['最高率','最低率']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: x
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        }
	    },
	    series: [
	        {
	            name:'',
	            type:'line',
	            data:y,
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
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
    <form method="post" action="/hotel/InAccountController/queryOccupancy1" id="ctl00">
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
        <div id="printContent" style="width: 960px; margin: 0px auto;">

            <div class="report_h2">
                <b>入住率分析</b>
                <p>
                    <span id="DateSpan" style="width: 240px;">时间范围：<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' /> 至 <fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' /></span>
                    <span id="ZbrSpan">制表人：${user.u_name }</span>
                </p>
            </div>
            <div style="width: 1000px;height:400px;" id="div1"></div>
            <script type="text/javascript">LineChart()</script>
            <div style="margin-top: 120px;"></div>
            <table class="report_table" id="printTable" cellspacing="0" cellpadding="0" border="1">
                <thead>
                    <tr class="tis">
                        <td>营业日</td>
                        <td>入住数</td>
                        <td>总房数</td>
                        <td>入住率</td>
                        <td>房租</td>
                        <td>平均房价</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sclist }" var="sc">
                    <tr>
                        <td>${sc.name }</td>
                        <td>${sc.s1 }</td>
                        <td>${sc.s2 }</td>
                        <td>${sc.s3 }%</td>
                        <td class="right">${sc.s4 }</td>
                        <td class="right">${sc.s5 }</td>
                    </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                        <td>合计</td>
                        <td id="footEnterCount">${num }</td>
                        <td id="footRoomCount">${allnum }</td>
                        <td id="footEnterPoint">${occupancy }%</td>
                        <td class="right" id="footRoomCharge">${money }</td>
                        <td class="right" id="footAvagPrice">${avgmoney }</td>
                    </tr>
                </tfoot>
            </table>

        </div>
    </form>


</body>
</html>
