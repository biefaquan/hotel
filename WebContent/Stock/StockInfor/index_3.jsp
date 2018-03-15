<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
  
<script type="text/javascript">
	function Add() {
		var iframe1 = parent.parent.document.getElementById("iframe1");
		iframe1.src="/hotel/Stock/StockInfor/addstock.jsp";
		var div1 = parent.parent.document.getElementById("div1");
		div1.style.display="block";
	}
	function Edit(id) {
		var iframe2 = parent.parent.document.getElementById("iframe2");
		iframe2.src="/hotel/StoreHouseController/queryById?sh_id="+id;
		var div2 = parent.parent.document.getElementById("div2");
		div2.style.display="block";
	}
</script>

<link media="all" href="/hotel/css/stock/stockinfor/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main">
        
<div class="main">
    <h1 class="titles">仓库信息</h1>

    <div id="divUpdateView">
        
<table cellspacing="0" cellpadding="0">
    <tbody id="warehousebody">
        <tr>
            <th>仓库编号</th>
            <th>仓库名称</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list }" var="sh">
            <tr>
                <td>${sh.sh_num }</td>
                <td>${sh.sh_name }</td>
                <c:if test="${sh.sh_state==1 }">
                	<td>启用</td>
                </c:if>
                <c:if test="${sh.sh_state==0 }">
                	<td>停用</td>
                </c:if>
                <td>
                    <img src="/hotel/img/roomrack/037.gif" width="9" height="9">
                    <span class="STYLE1">[</span><a onclick="Edit(${sh.sh_id})">编辑</a><span class="STYLE1">]</span>
				</td>

            </tr>
         </c:forEach>
    </tbody>
</table>

    </div>

    <div class="fote">
        <div class="fl">
            <input class="bus_add" value="新增" style="margin-left: 0px;" onclick="Add();" type="button">
        </div>
    </div>

</div>

    </div>


<iframe style="height: 0px; width: 0px;" src="index_4.html"></iframe></body>
</html>
