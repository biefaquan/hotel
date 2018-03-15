<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
    <!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->    
<script type="text/javascript">
	//对添加协议类别时，进行表单验证
	function checked() {
		var at_name = document.getElementById("at_name").value;
		if(at_name==""){
			alert("协议名称不能为空！！");
			return false;
		}else{
			return true;
		}
	}
</script>   
    
    

<link media="all" href="/hotel/css/set/setroom/index_4.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
    <form action="/hotel/AgreementTypeController/update" target="_top" method="post" onsubmit="return checked()">
    <div class="louceng">
        <div class="line">修改协议类别</div>
        <ul>
            <li>
                <label><b style="color: red;">*</b>协议名称：</label><input id="at_name" name="at_name" value="${at.at_name }" maxlength="10"  type="text"></li>
                <input name="at_id" value="${at.at_id }" type="hidden"/>
            <li class="floorlist">
            </li>
            <li>
                <input id="hdNames" name="hdNames" type="hidden">
                <label>&nbsp;</label><input value="保存" class="bus_add" onclick="SubmitFrom();" type="submit"></li>
        </ul>
    </div>
    </form>


</body>
</html>
