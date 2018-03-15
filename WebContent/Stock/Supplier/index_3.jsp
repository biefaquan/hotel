<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
//Jquery初始化下拉框
$(function(){
	$("#ZT").val("${s_state}");
});
	function Add() {
		var iframe1 = parent.parent.document.getElementById("iframe1");
		iframe1.src="/hotel/Stock/Supplier/addsupplier.jsp";
		var div1 = parent.parent.document.getElementById("div1");
		div1.style.display="block";
	}
	function Edit(id) {
		var iframe2 = parent.parent.document.getElementById("iframe2");
		iframe2.src="/hotel/SupplierController/queryById?s_id="+id;
		var div2 = parent.parent.document.getElementById("div2");
		div2.style.display="block";
	}
	function Delete(id) {
		if(confirm("确定删除该仓库？")){
			top.location.href="/hotel/SupplierController/delete?s_id="+id;
		}
	}
</script>

<link media="all" href="/hotel/css/stock/supplier/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main">
        
<div class="main">
    <h1 class="titles">供应商信息</h1>
<form action="/hotel/SupplierController/queryByReason"id="form0" method="post">    <div class="ftt_search fontYaHei">
        <label>单位名称：</label>
        <input id="searchindexkey" name="s_name" placeholder="请输入名称" value="${s_name }" type="text">
        <label>状态：</label>
        <select id="ZT" name="s_state"><option value="-1">全部</option>
			<option value="0">停用</option>
			<option value="1">启用</option>
		</select>
        <input id="btnSearch" value="查询" class="qtantj" type="submit">
    </div>
</form>     <div id="divUpdateView">
        

<table class="hotel_price" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <th>单位编号</th>
            <th>单位名称</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>联系地址</th>
            <th>传真</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pb.list }" var="s">
            <tr>
                <td>${s.s_num }</td>
                <td>${s.s_name }</td>
                <td>${s.s_linkman }</td>
                <td>${s.s_linkphone }</td>
                <td>${s.s_adress }</td>
                <td>${s.s_fax }</td>
                <c:if test="${s.s_state==1 }">
                	<td>启用</td>
                </c:if>
                <c:if test="${s.s_state==0 }">
                	<td>停用</td>
                </c:if>
                <td>
                    <img src="037.gif" width="9" height="9">
                    <span class="STYLE1">[</span><a onclick="Edit(${s.s_id})">编辑</a><span class="STYLE1">]</span>
                    <img src="010.gif" width="9" height="9">
                    <span class="STYLE1">[</span>
                    <a onclick="Delete(${s.s_id})">删除</a><span class="STYLE1">]</span></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="fr">
    <div class="page">
        <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
    </div>
</div>

    </div>
    


    <div class="fote">
        <div class="fl">
            <input class="bus_add" value="新增" style="margin-left: 0px;" onclick="Add();" type="button"></div>
     
    </div>

</div>

    </div>


</body>
</html>
