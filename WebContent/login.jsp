<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<link rel="stylesheet" href="css/bootstrap.css" />
 
<script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		var u_name = $("#u_name").val();
		var u_password = $("#u_password").val();
		$.ajax({
			url:"/hotel/UserController/queryByName",
			type:"POST",
			data:"u_name="+u_name,
			dataType:"json",
			success:function(data){
				//$("#yzm").val(data);
				if(data!=null){
					if(u_password==data.u_password){
						window.location.href="/hotel/RoomRack/roomrack.jsp";
					}else{
						alert("密码错误！！");
					}
				}else{
					alert("用户名不存在，请联系管理员！！");
				}
			},
			error:function(){
				alert("用户名不存在，请联系管理员！！");
			}
		});
	});
});
</script>

<style type="text/css">
body{ background:#0066A8 url(img/login_bg.png) no-repeat center 0px;}
.tit{ margin:auto; margin-top:170px; text-align:center; width:350px; padding-bottom:20px;}
.login-wrap{ width:220px; padding:30px 50px 0 330px; height:220px; background:#fff url(img/20150212154319.jpg) no-repeat 30px 40px; margin:auto; overflow: hidden;}
.login_input{ display:block;width:210px;}
.login_user{ background: url(img/input_icon_1.png) no-repeat 200px center; font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif}
.login_password{ background: url(img/input_icon_2.png) no-repeat 200px center; font-family:"Courier New", Courier, monospace}
.btn-login{ background:#40454B; box-shadow:none; text-shadow:none; color:#fff; border:none;height:35px; line-height:26px; font-size:14px; font-family:"microsoft yahei";}
.btn-login:hover{ background:#333; color:#fff;}
.copyright{ margin:auto; margin-top:10px; text-align:center; width:370px; color:#CCC}
@media (max-height: 700px) {.tit{ margin:auto; margin-top:100px; }}
@media (max-height: 500px) {.tit{ margin:auto; margin-top:50px; }}
</style>
</head>

<body>
<div class="tit"><img src="img/tit.png" alt="" /></div>
<div class="login-wrap">

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" valign="bottom">用户名：</td>
    </tr>
    <tr>
      <td><input type="text" id="u_name" name="u_name" class="login_input login_user"  /></td>
    </tr>
    <tr>
      <td height="35" valign="bottom">密  码：</td>
    </tr>
    <tr>
      <td><input type="password" id="u_password" name="u_password" class="login_input login_password" /></td>
    </tr>
    <tr>
      <td height="60" valign="bottom"><input type="button" id="btn" class="btn btn-block btn-login" value="登录"></td>
    </tr>
   
  </table>
  
</div>
<div class="copyright">建议使用IE8以上版本或谷歌浏览器</div>
</body>
</html>
