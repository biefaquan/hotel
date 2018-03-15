<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>会员动态查询</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>  

<link media="all" href="/hotel/css/reports/closedetail/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
<form method="post" action="/hotel/MemberHandleController/queryAllByReason">
    <h1 class="report_h1">
        <b>会员动态查询</b>
        <b class="rq">
            <div class="ftt_search fontYaHei">
                <label>时间：</label><input name="starttime" id="StartDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>至</label><input name="endtime" id="EndDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>卡号：</label><input name="typenum" id="SearchKey" style="width: 100px;" value="${typenum }" type="text">
                <input class="qtantj" id="btnSearch" value="查询" type="submit">
            </div>
        </b>
    </h1></form>
    <table class="report_table" id="tbList" cellspacing="0" cellpadding="0">
        <thead>            
            <tr>
                <th width="4%">类型</th>
                <th width="6%">卡号</th>
                <th width="4%">姓名</th>
                <th width="8%">电话</th>
                <th width="8%">操作</th>
                <th width="9%">时间</th>
                <th width="7%">操作员</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pb.list }" var="mh">
        	<tr>
        		<td>${mh.m.mt.mt_name }</td>
        		<td>${mh.m.m_cardnum }</td>
        		<td>${mh.m.c.c_name }</td>
        		<td>${mh.m.c.c_phone }</td>
        		<td>${mh.mh_handle }</td>
        		<td><fmt:formatDate value="${mh.mh_date }" pattern="yyyy-MM-dd" /></td>
        		<td>${mh.u.u_name }</td>
        	</tr>
        </c:forEach>
       </tbody>
    </table>
    <div class="report_db">
        <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
    </div>



</body>
</html>
