<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>结算明细报表</title>
    
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>  

<link media="all" href="/hotel/css/reports/closedetail/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
<form method="post" action="/hotel/AgreementController/queryAgreementByReason">
    <h1 class="report_h1">
        <b>结算明细报表</b>
        <b class="rq">
            <div class="ftt_search fontYaHei">
               <label>结账时间：</label><input name="starttime" id="StartDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
               <label>至</label><input name="endtime" id="EndDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>协议编号：</label>
                <input name="typenum" style="width: 100px;" id="CardNo" value="${typenum }" type="text">
                
                <input class="qtantj" value="查询" id="btnSearch" type="submit">
            </div>
        </b>
    </h1></form>
    <table class="report_table" id="tbList" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th width="4%">类型</th>
                <th width="6%">单位编号</th>
                <th width="4%">单位名称</th>
                <th width="4%">联系人</th>
                <th width="4%">电话</th>
                <th width="4%">单号</th>
                <th width="5%">房号</th>
                <th width="5%">房间类型</th>
                 <th width="8%">支付类型</th>
                <th width="8%">入住时间</th>
                <th width="8%">结账时间</th>
                <th width="4%">天数</th>
                <th width="4%">房价</th>
                <th width="4%">房租</th>
                <th width="4%">消费</th>
            </tr>
        </thead>
        <c:forEach items="${pb.list }" var="b">
        	<tr>
        	<c:forEach items="${alist }" var="a">
        		<c:if test="${a.a_id==b.b_typenum }">
        			<td>${a.at.at_name }</td>
        			<td>${a.a_cardnum }</td>
        			<td>${a.a_name }</td>
        			<td>${a.a_username }</td>
        			<td>${a.a_userphone }</td>
        		</c:if>
        	</c:forEach>
        		<td>${b.b_id }</td>
        		<td>${b.r.r_roomnum }</td>
        		<td>${b.r.rt.rt_name }</td>
        		<td>${b.b_paytype }</td>
        		<td><fmt:formatDate value="${b.b_starttime }" pattern="yyyy-MM-dd" /></td>
        		<td><fmt:formatDate value="${b.b_endtime }" pattern="yyyy-MM-dd" /></td>
        		<td>${b.b_days }</td>
        		<td>${b.r.rt.rt_price }</td>
        		<td>${b.b_allmoney/b.b_days }</td>
        		<td>${b.b_allmoney }</td>
        	</tr>
        </c:forEach>
        
        
    </table>
    <div class="report_db">
        <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
    </div>


</body>
</html>
