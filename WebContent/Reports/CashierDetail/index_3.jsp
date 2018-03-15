<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>  
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#Category").val("${type}");
	$("#PayMethodName").val("${paytype}");
});
</script>
<link media="all" href="/hotel/css/reports/cashierdetail/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <h1 class="report_h1">
        <b>收银明细</b>
        <b class="rq">
        <form action="/hotel/MoneyDetailController/queryDetail" method="post">
            <div class="ftt_search fontYaHei">
                <label>入账时间：</label><input name="startdate" style="width: 110px; margin-right: 5px; font-size: 12px;" id="StartDate" value="<fmt:formatDate value='${starttime }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>至</label><input name="enddate" style="width: 110px; margin-right: 5px; font-size: 12px;" id="EndDate" value="<fmt:formatDate value='${endtime }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">              
                <label>类型：</label>
                <select name="type" id="Category">
                    <option value="全部">全部</option>
                    <option value="定金">订金</option>
                    <option value="押金">押金</option>
                    <option value="结账">结账</option>
                    <option value="会员充值">会员充值</option>   
                    <option value="挂账结算">挂账结算</option>                  
                </select>
                <label>支付方式：</label>
                <select name="paytype" id="PayMethodName">
                	<option value="全部">全部</option>
                	<option value="现金">现金</option>
                	<option value="银行卡">银行卡</option>
                	<option value="微信支付">微信支付</option>
                	<option value="挂账">挂账</option>
                	<option value="支付宝支付">支付宝支付</option>
                </select>
                <input class="qtantj" value="查询" id="btnSearch" type="submit">
                      <input class="qtantj" value="导出" id="btnExport" style="margin-left: 10px;" type="button">

                <input value="打印" class="qtantj" id="Button1" onclick="Print()" style="margin-left: 10px;" type="button">
            </div>
            </form>
        </b>
    </h1>
    <table class="report_table" id="tbList" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th width="120">单号</th>
                <th width="80">房号</th>
                <th width="100">类型</th>
                <th width="100">支付方式</th>
                <th width="120">收银金额</th>
                <th width="120">操作员</th>
                <th width="160">入帐时间</th>
                <th>备注</th>
            </tr>
        </thead>
        <c:forEach items="${pb.list }" var="md">
        	<tr>
        		<td>${md.md_id }</td>
        		<td>${md.md_roomnum }</td>
        		<td>${md.md_type }</td>
        		<td>${md.md_paytype }</td>
        		<td>${md.md_money }</td>
        		<td>${md.md_name }</td>
        		<td><fmt:formatDate value="${md.md_starttime }" pattern="yyyy-MM-dd" /></td>
        		<td>${md.md_reward }</td>
        	</tr>
        </c:forEach>
        <tbody>
        <c:if test="${pb.list==null }">
        <tr><td colspan="14" style="color: red;">没找到相应的数据</td></tr></c:if></tbody>
    </table>
    <div class="report_db">
        <div class="page">
            <ul style="float: right; width: 400px;">
                <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
            </ul>
        </div>
    </div>
    <!--打印容器开始-->
    <div id="print" style="display: none; width: 960px; margin: 0px auto;">
        
        <h1 style="width: 100%; font-size: 20px; color: rgb(0, 0, 0); text-align: center; float: left; line-height: 45px;">收银明细</h1>
        <table id="printTable" style="width: 100%;" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                <th width="auto">单号</th>
                <th width="auto">房号</th>
                <th width="100">类型</th>
                <th width="100">支付方式</th>
                <th width="auto">收银金额</th>
                <th width="auto">操作员</th>
                <th width="160">入帐时间</th>
                <th>手工单号</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
            <tr class="zonglist">
                <td class="right" colspan="4">总合计：</td>
                <td class="right" id="PpageAmount">0.00</td>
                <td colspan="4">&nbsp;</td>
            </tr>
            </tfoot>
        </table>
    </div>
    <!--打印容器结束-->


</body>
</html>
