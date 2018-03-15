<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
<script type="text/javascript">
	function mychecked(){
		var OldPwd = document.getElementById("txtOldPwd").value;
		var NewPwd = document.getElementById("txtNewPwd").value;
		var RepPwd = document.getElementById("txtRepPwd").value;
		var u_password = document.getElementById("password").value;
		if(OldPwd==""||NewPwd==""||RepPwd==""){
			alert("输入不能为空！！");
			return false;
		}else{
			if(OldPwd==u_password){
				if(NewPwd==RepPwd){
					return confirm("确定修改？");
				}else{
					alert("两次输入密码不一致！！");
					return false;
				}
			}else{
				alert("旧密码有误！！");
				return false;
			}
		}
	}
	
	
</script>    
    
    
    
    

<link media="all" href="/hotel/css/set/setpwd/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--修改密码-->
    <form action="/hotel/UserController/updatepassword" target="_top" method="post" onsubmit="return mychecked()">
    <div class="main">
        <h1 class="password" style="padding: 0px;">修改密码 </h1>
        <div class="errortips" id="prompt" style="position: absolute; left: 80px; top: 8px;"></div>
        <ul class="password">
            <li>
                <label><b>*</b>旧密码：</label>
                <input id="txtOldPwd" onblur="VerifyOldPwd();" type="password">
            </li>
            <li>
                <label><b>*</b>新密码：</label>
                <input id="txtNewPwd" name="u_password" onblur="VerifyNewPwd()" type="password">
            </li>
            <li>
                <label><b>*</b>重复输入：</label>
                <input id="txtRepPwd" onblur="VerifyRepPwd();" type="password">
            </li>
            <li>
            	<input id="u_id" value="${user.u_id }" type="hidden"/>
            	<input id="password" value="${user.u_password }" type="hidden"/>
                <label>&nbsp;</label><input value="保存" class="bus_add" id="btnModify" type="submit">
            </li>
        </ul>
    </div>
    <!--end-->
</form>


</body>
</html>
