<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
<script type="text/javascript">
	function ResetPwd(id) {
		if(confirm("确定密码重置？")){
			top.location.href="/hotel/UserController/setpassword?u_id="+id;
		}
	}
</script>

<link media="all" href="/hotel/css/set/setaccount/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main">
        <h1 class="account">账号管理</h1>
        <table class="account" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>工号</th>
                    <th>使用人</th>
                    <th>职位</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody id="UserList">
            <tr>
            	<td>${user.u_jobnum }</td>
            	<td>${user.u_name }</td>
            	<td>${user.u_position }</td>
            	<c:if test="${user.u_state==1 }">
            		<td>开启</td>
            	</c:if>
            	<c:if test="${user.u_state==0 }">
            		<td>关闭</td>
            	</c:if>
            	<td><img src="/hotel/img/roomrack/07.png" width="11" height="11"><span class="STYLE1"> [</span><a onclick="ResetPwd(${user.u_id})">密码重置</a><span class="STYLE1">]</span></td></tr></tbody>
        </table>
       
    </div>


</body>
</html>
