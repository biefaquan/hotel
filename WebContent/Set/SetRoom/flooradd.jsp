<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
    <!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->
    
    
    
    

<link media="all" href="/hotel/css/set/setroom/index_4.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
    <form action="/hotel/FloorController/add" target="_top" method="post">
    <div class="louceng">
        <div class="line">添加楼层</div>
        <ul>
            <li>
                <label><b style="color: red;">*</b>楼层：</label><input id="Name" name="f_num" maxlength="10"  type="text"></li>
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
