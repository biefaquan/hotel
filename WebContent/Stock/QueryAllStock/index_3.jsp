<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$("#CKId").val("${sh_id}");
});
function GoodsEdit(g_id) {
	var iframe1 = parent.parent.document.getElementById("iframe1");
	iframe1.src="/hotel/GoodsController/queryById?g_id="+g_id;
	var div1 = parent.parent.document.getElementById("div1");
	div1.style.display = "block";
}
//删除商品
function GoodsDell(g_id) {
	if(confirm("确定删除！！")){
		top.location.href="/hotel/GoodsController/delete?g_id="+g_id;
	}
}
</script>
<link media="all" href="/hotel/css/stock/supplier/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main">
        
<div class="main">
    <h1 class="titles">当前库存</h1>
<form action="/hotel/GoodsController/queryByReason" id="form0" method="post">        <div class="ftt_search fontYaHei">
            <label>商品名称：</label>
            <input placeholder="商品名称" id="SPBH" name="g_name" value="${g_name }" type="text">
            <label>仓库：</label>
            <select id="CKId" name="sh_id">
                <option value="0">全部</option>
                <c:forEach items="${shlist }" var="sh">
                	<option value="${sh.sh_id }">${sh.sh_name }</option>
                </c:forEach>
            </select>
            <input id="btnSearch" value="查询" class="qtantj" type="submit">
        </div>
</form>    <div id="divUpdateView">
        
<table class="hotel_price" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <th>仓库</th>
        <th>商品编号</th>
        <th>名称</th>
        <th>类别</th>
        <th>单位</th>
        <th>数量</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${pb.list }" var="g">
    	<tr>
    		<td>${g.sh.sh_name }</td>
    		<td>${g.g_id }</td>
    		<td>${g.g_name }</td>
    		<td>${g.g_type }</td>
    		<td>${g.g_unit }</td>
    		<td>${g.g_number }</td>
    		<td width="20%"><img src="/hotel/img/roomrack/037.gif" width="9" height="9"><span class="STYLE1"> [</span><a onclick="GoodsEdit(${g.g_id})" id="a_30">编辑</a><span class="STYLE1">]</span> <img src="/hotel/img/roomrack/010.gif" width="9" height="9"> <span class="STYLE1">[</span><a onclick="GoodsDell(${g.g_id})" id="a_30">删除</a><span class="STYLE1">]</span></td>
    	</tr>
    </c:forEach>
    </tbody>
</table>

<div class="fote">
    <div class="fr">
        <div class="page">
            <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
        </div>
    </div>
</div>

    </div>
</div>

    </div>


</body>
</html>
