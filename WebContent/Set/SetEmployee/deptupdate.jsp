<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
    <!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->
    
 <script type="text/javascript">
	function mycheck() {
		var name=document.getElementById("d_name").value;
		if(name!=""){
			return true;
		}else{
			alert("部门名称不能为空！！");
			return false;
		}
	}
</script>   
    
    

<link media="all" href="/hotel/css/set/setroom/index_4.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
    <form action="/hotel/DeptController/update" target="_top" method="post" onsubmit="return mycheck()">
    <div class="louceng">
        <div class="line">修改部门</div>
        <ul>
            <li>
                <label><b style="color: red;">*</b>部门名称：</label><input id="d_name" name="d_name" maxlength="10" value="${d.d_name }"  type="text"></li>
            <li class="floorlist">
            </li>
            <li>
                <input id="hdNames" name="d_id" value="${d.d_id }" type="hidden">
                <label>&nbsp;</label><input value="修改" class="bus_add" onclick="SubmitFrom();" type="submit"></li>
        </ul>
    </div>
    </form>


</body>
</html>
