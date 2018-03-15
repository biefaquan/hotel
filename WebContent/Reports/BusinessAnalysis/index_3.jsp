<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>
	营业情况分析表
</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>  
<script type="text/javascript" src="/hotel/js/excel.js" ></script>
<script type="text/javascript">
function QueryDetail() {
	var startdate = document.getElementById("StartDate").value;
	window.location.href="/hotel/InAccountController/queryInAccount1?date="+startdate;
} 
</script>
<link media="all" href="/hotel/css/reports/businessanalysis/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form method="post" action="http://report.jdd365.cn/Report/BussinessAnalysis.aspx" id="form1">
        <h1 class="report_h1">

        <b>
            <div class="ftt_search fontYaHei">
                <label>营业日：</label> 
                <input name="StartDate" id="StartDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${date }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <input name="btnQuery" value="查询" onclick="QueryDetail();" id="btnQuery" class="qtantj" type="button">
            </div>
        </b>
        <b style="margin: 8px 0px 0px 20px; display: inline;">
            <div class="z-btn">
                <div class="z-btn-left"><i>&nbsp;</i></div>
                <div class="z-btn-center">
                    <em>
                        <input value="打印预览" onclick="javascript:window.print()" class="z-button z-btn-text icon-print" id="btnPrint" width="300px" type="button">
                    </em>
                </div>
                <div class="z-btn-right"><i>&nbsp;</i></div>
            </div>
            <div class="z-btn">
                <div class="z-btn-left"><i>&nbsp;</i></div>
                <div class="z-btn-center">
                    <em>
                        <input name="btnExport" onclick="javascript:method1('table1')" value="导出EXCEL" id="btnExport" class="z-button z-btn-text icon-excel" type="button">
                    </em>
                </div>
                <div class="z-btn-right"><i>&nbsp;</i></div>
            </div>
        </b>
    </h1>

    <input id="IsHideZeroData" value="0" type="hidden">

    <div id="printContent" style="width: 960px; margin: 0px auto;"> 
        

        <div class="report_h2">
            <b>营业情况分析报表</b>
            <p>
                <span style="width: 220px;">营业日：<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" /></span>   
                <span>制表人：${user.u_name }</span>
                <span style="float: right; padding-right: 0px;"></span>
            </p>
        </div>

        <table id="table1" class="report_table" cellspacing="0" cellpadding="0" border="1">
            <tbody>
                <tr>
                    <td class="titles" colspan="13">一、收入分析</td>
                </tr>
                <tr class="tis">
                    <td width="100">营业项目</td>
                    <td colspan="3">当日</td>
                    <td colspan="3">本月累计</td>
                    <td colspan="3">上月累计</td>
                    <td colspan="3">本年累计</td>
                </tr>
               
                 
                     <tr><td>房租</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent4 }</td></tr>
                    
                    <tr style="color: rgb(255, 0, 0); font-weight: bold;"><td>合计：</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent4 }</td></tr>
                    
                <tr>
                    <td class="titles" colspan="13">二、收款分析</td>
                </tr>
                <tr class="tis">
                    <td width="100">支付方式</td>
                    <td colspan="3">当日</td>
                    <td colspan="3">本月累计</td>
                    <td colspan="3">上月累计</td>
                    <td colspan="3">本年累计</td>
                </tr>
                
                   
                    <tr><td>现金</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${cash1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${cash2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${cash3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${cash4 }</td> </tr>
                    
                    <tr><td>银行卡</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${bank1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${bank2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${bank3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${bank4 }</td> </tr>
                   
                    <tr><td>微信支付</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${wechat1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${wechat2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${wechat3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${wechat4 }</td> </tr>
                    
                    <tr><td>协议挂账</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${agree1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${agree2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${agree3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${agree4 }</td> </tr>
                    
                    <tr><td>支付宝支付</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${alipay1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${alipay2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${alipay3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${alipay4 }</td> </tr>
                    
                    <tr style="color: rgb(255, 0, 0); font-weight: bold;"><td>合计:</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent1 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent2 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent3 }</td>
                    <td colspan="3" class="right" style="padding-right: 30px;">${rent4 }</td> </tr>
                    

                <tr>
                    <td class="titles" colspan="13">三、客源分析</td>
                </tr>
                <tr class="tis">
                    <td rowspan="2" width="100">客源类型</td>
                    <td colspan="3">当日</td>
                    <td colspan="3">本月累计</td>
                    <td colspan="3">上月累计</td>
                    <td colspan="3">本年累计</td>
                </tr>
                
                <tr class="tis">
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                </tr>
              
                
                <tr>
                    <td>客人自入</td>
                    <td class="right">${kezr1 }</td>
                    <td class="right">${kezr2 }</td>
                    <td class="right">${kezr3 }%</td>
                    <td class="right">${kezr4 }</td>
                    <td class="right">${kezr5 }</td>
                    <td class="right">${kezr6 }%</td>
                    <td class="right">${kezr7 }</td>
                    <td class="right">${kezr8 }</td>
                    <td class="right">${kezr9 }%</td>
                    <td class="right">${kezr10 }</td>
                    <td class="right">${kezr11 }</td>
                    <td class="right">${kezr12 }%</td>
                </tr>
                  
                <tr>
                    <td>会员</td>
                    <td class="right">${mem1 }</td>
                    <td class="right">${mem2 }</td>
                    <td class="right">${mem3 }%</td>
                    <td class="right">${mem4 }</td>
                    <td class="right">${mem5 }</td>
                    <td class="right">${mem6 }%</td>
                    <td class="right">${mem7 }</td>
                    <td class="right">${mem8 }</td>
                    <td class="right">${mem9 }%</td>
                    <td class="right">${mem10 }</td>
                    <td class="right">${mem11 }</td>
                    <td class="right">${mem12 }%</td>
                </tr>
                  
                <tr>
                    <td>协议单位</td>
                    <td class="right">${xydw1 }</td>
                    <td class="right">${xydw2 }</td>
                    <td class="right">${xydw3 }%</td>
                    <td class="right">${xydw4 }</td>
                    <td class="right">${xydw5 }</td>
                    <td class="right">${xydw6 }%</td>
                    <td class="right">${xydw7 }</td>
                    <td class="right">${xydw8 }</td>
                    <td class="right">${xydw9 }%</td>
                    <td class="right">${xydw10 }</td>
                    <td class="right">${xydw11 }</td>
                    <td class="right">${xydw12 }%</td>
                </tr>
                  
                <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                    <td>合计</td>
                    <td class="right">${kezr1+mem1+xydw1 }</td>
                    <td class="right">${kezr2+mem2+xydw2 }</td>
                    <td class="right">${kezr3+mem3+xydw3 }%</td>
                    <td class="right">${kezr4+mem4+xydw4 }</td>
                    <td class="right">${kezr5+mem5+xydw5 }</td>
                    <td class="right">${kezr6+mem6+xydw6 }%</td>
                    <td class="right">${kezr7+mem7+xydw7 }</td>
                    <td class="right">${kezr8+mem8+xydw8 }</td>
                    <td class="right"><fmt:formatNumber type="number" value="${kezr9+mem9+xydw9 }" pattern="0.0" maxFractionDigits="1"/>%</td>
                    <td class="right">${kezr10+mem10+xydw10 }</td>
                    <td class="right">${kezr11+mem11+xydw11 }</td>
                    <td class="right">${allsource }%</td>

                </tr>
                  
                

                <tr>
                    <td class="titles" colspan="13">四、房型分析</td>
                </tr>
                <tr class="tis">
                    <td rowspan="2">房间类型</td>
                    <td colspan="3">当日</td>
                    <td colspan="3">本月累计</td>
                    <td colspan="3">上月累计</td>
                    <td colspan="3">本年累计</td>
                </tr>
                <tr class="tis">
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                </tr>
                 <c:forEach items="${supplelist }" var="sc">
                <tr>
                    <td>${sc.name }</td>
                    <td class="right">${sc.s1 }</td>
                    <td class="right">${sc.s2 }</td>
                    <td class="right">${sc.s3 }%</td>
                    <td class="right">${sc.s4 }</td>
                    <td class="right">${sc.s5 }</td>
                    <td class="right">${sc.s6 }%</td>
                    <td class="right">${sc.s7 }</td>
                    <td class="right">${sc.s8 }</td>
                    <td class="right">${sc.s9 }%</td>
                   <td class="right">${sc.s10 }</td>
                    <td class="right">${sc.s11 }</td>
                    <td class="right">${sc.s12 }%</td>
                </tr>
                </c:forEach> 
                  
                <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                    <td style="color: rgb(255, 0, 0);">合计</td>
                    <td class="right">${fjlx1 }</td>
                    <td class="right">${fjlx2 }</td>
                    <td class="right">${fjlx3 }%</td>
                    <td class="right">${fjlx4 }</td>
                    <td class="right">${fjlx5 }</td>
                    <td class="right">${fjlx6 }%</td>
                    <td class="right">${fjlx7 }</td>
                    <td class="right">${fjlx8 }</td>
                    <td class="right">${fjlx9 }%</td>
                   <td class="right">${fjlx10 }</td>
                    <td class="right">${fjlx11 }</td>
                    <td class="right">${fjlx12 }%</td>
                </tr>
                  
              

                <tr>
                    <td class="titles" colspan="13">五、开房方式分析</td>
                </tr>
                <tr class="tis">
                    <td rowspan="2">房价方案</td>
                    <td colspan="3">当日</td>
                    <td colspan="3">本月累计</td>
                    <td colspan="3">上月累计</td>
                    <td colspan="3">本年累计</td>
                </tr>
                <tr class="tis">
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                    <td>数量</td>
                    <td>金额</td>
                    <td>入住率</td>
                </tr>

                  
                <tr>
                    <td>天房</td>
                    <td class="right">${kf1.s1 }</td>
                    <td class="right">${kf1.s2 }</td>
                    <td class="right">${kf1.s3 }%</td>
                    <td class="right">${kf1.s4 }</td>
                    <td class="right">${kf1.s5 }</td>
                    <td class="right">${kf1.s6 }%</td>
                    <td class="right">${kf1.s7 }</td>
                    <td class="right">${kf1.s8 }</td>
                    <td class="right">${kf1.s9 }%</td>
                   <td class="right">${kf1.s10 }</td>
                    <td class="right">${kf1.s11 }</td>
                    <td class="right">${kf1.s12 }%</td>
                </tr>
                  
                <tr>
                    <td>午夜房</td>
                     <td class="right">${kf2.s1 }</td>
                    <td class="right">${kf2.s2 }</td>
                    <td class="right">${kf2.s3 }%</td>
                    <td class="right">${kf2.s4 }</td>
                    <td class="right">${kf2.s5 }</td>
                    <td class="right">${kf2.s6 }%</td>
                    <td class="right">${kf2.s7 }</td>
                    <td class="right">${kf2.s8 }</td>
                    <td class="right">${kf2.s9 }%</td>
                   <td class="right">${kf2.s10 }</td>
                    <td class="right">${kf2.s11 }</td>
                    <td class="right">${kf2.s12 }%</td>
                </tr>
                  
                <tr>
                    <td>钟点房</td>
                    <td class="right">${kf3.s1 }</td>
                    <td class="right">${kf3.s2 }</td>
                    <td class="right">${kf3.s3 }%</td>
                    <td class="right">${kf3.s4 }</td>
                    <td class="right">${kf3.s5 }</td>
                    <td class="right">${kf3.s6 }%</td>
                    <td class="right">${kf3.s7 }</td>
                    <td class="right">${kf3.s8 }</td>
                    <td class="right">${kf3.s9 }%</td>
                   <td class="right">${kf3.s10 }</td>
                    <td class="right">${kf3.s11 }</td>
                    <td class="right">${kf3.s12 }%</td>
                </tr>
                  
                <tr>
                    <td>月租房</td>
                     <td class="right">${kf4.s1 }</td>
                    <td class="right">${kf4.s2 }</td>
                    <td class="right">${kf4.s3 }%</td>
                    <td class="right">${kf4.s4 }</td>
                    <td class="right">${kf4.s5 }</td>
                    <td class="right">${kf4.s6 }%</td>
                    <td class="right">${kf4.s7 }</td>
                    <td class="right">${kf4.s8 }</td>
                    <td class="right">${kf4.s9 }%</td>
                   <td class="right">${kf4.s10 }</td>
                    <td class="right">${kf4.s11 }</td>
                    <td class="right">${kf4.s12 }%</td>
                </tr>
                  
                <tr style="color: rgb(255, 0, 0); font-weight: bold;">
                    <td>合计</td>
                    <td class="right">${kf1.s1+kf2.s1+kf3.s1+kf4.s1 }</td>
                    <td class="right">${kf1.s2+kf2.s2+kf3.s2+kf4.s2 }</td>
                    <td class="right">${kf1.s3+kf2.s3+kf3.s3+kf4.s3 }%</td>
                    <td class="right">${kf1.s4+kf2.s4+kf3.s4+kf4.s4 }</td>
                    <td class="right">${kf1.s5+kf2.s5+kf3.s5+kf4.s5 }</td>
                    <td class="right">${kf1.s6+kf2.s6+kf3.s6+kf4.s6 }%</td>
                    <td class="right">${kf1.s7+kf2.s7+kf3.s7+kf4.s7 }</td>
                    <td class="right">${kf1.s8+kf2.s8+kf3.s8+kf4.s8 }</td>
                    <td class="right">${kf1.s9+kf2.s9+kf3.s9+kf4.s9 }%</td>
                    <td class="right">${kf1.s10+kf2.s10+kf3.s10+kf4.s10 }</td>
                    <td class="right">${kf1.s11+kf2.s11+kf3.s11+kf4.s11 }</td>
                    <td class="right">${kf1.s12+kf2.s12+kf3.s12+kf4.s12 }%</td>
                </tr>
                  
            </tbody>
        </table>
    </div>
    </form>


</body>
</html>
