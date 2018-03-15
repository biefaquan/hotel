<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript">
	function CheckPower() {
		var position = document.getElementById("position").value;
		if(position=="经理"){
			top.location.href="/hotel/Set/SetEmployee/setemployee.jsp";
		}else{
			alert("您的权限不足，请联系管理员！！");
		}
	}
</script>    
        
    
    
<link media="all" href="/hotel/css/set/index_2.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="set_lf  fontYaHei">
        <a href="/hotel/Set/SetGrogShop/set.jsp" target="_top" id="a_company">酒店信息</a>
        <a href="/hotel/Set/SetRoom/setroom.jsp" target="_top" id="a_room">房间信息</a>
        <a onclick="CheckPower()">员工信息</a>
        <a href="/hotel/Set/SetAccount/setaccount.jsp" target="_top" class="select">账户管理</a>
        <a href="/hotel/Set/SetPwd/setpwd.jsp" target="_top">修改密码</a>
    </div>
    <input id="txtPMSVersion" value="0" type="hidden">
	 <input id="position" value="${user.u_position }" type="hidden">

</body>
</html>
