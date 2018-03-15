<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript">
	function zdf() {
		var r0 = document.getElementById("r0");
		var li1=document.getElementById("li1");
		if(r0.checked){
			li1.style.display="block";
		}else{
			li1.style.display="none";
		}
	}
</script>   
    
    
    <!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->
    

<link media="all" href="/hotel/css/set/setroom/index_5.css" type="text/css" rel="stylesheet">
<link media="all" href="/hotel/css/set/setroom/roomupdate.css" type="text/css" rel="stylesheet">

</head>
<body>
    <form action="/hotel/RoomTypeController/add" target="_top"  method="post">
    <div class="fangjian">
        <div class="line">添加房型</div>
        <ul>
            <li>
                <label>房型名称：</label><input id="Name" name="rt_name" maxlength="10"  type="text"></li>
            <li>
                <label>挂牌价：</label><input id="Price" name="rt_price" maxlength="10"  type="text"></li>
            <li id="listatus">
                <label>钟点房：</label>
                <input name="rt_zdstate" id="r0" onclick="zdf()" value="0" class="radio"  type="radio"><em>开启</em>
                <input name="rt_zdstate" id="r1" onclick="zdf()" value="-1" class="radio" checked="checked" type="radio"><em>关闭</em>
            </li>
            <li id="li1" style="display: none">
                <label>钟点价格：</label><input id="ZDPrice" name="rt_zdprice" maxlength="10" value="0" type="text"></li>
            
            <li>
                <label>床位数：</label><input id="txtBedCount" name="rt_num" maxlength="3"  type="text"></li>
            <li>
                <label>备注：</label><textarea name="rt_remark" rows="8" cols="40" id="Description"></textarea></li>
            <li>
                <label>&nbsp;</label><input value="保存" class="bus_add" onclick="SubmitFrom();" type="submit"></li>
        </ul>
    </div>
    </form>


</body>
</html>
