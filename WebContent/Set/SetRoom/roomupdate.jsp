<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
<!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#FloorId").val("${room.f.f_id}");
		$("#RoomTypeId").val("${room.rt.rt_id}");
	});
</script>
    
    

<link media="all" href="/hotel/css/set/setroom/roomupdate.css" type="text/css" rel="stylesheet">
</head>
<body>
   <form action="/hotel/RoomController/update" target="_top" method="post">
    <div class="fangjian">
        <div class="line">编辑房间</div>
        <ul>
            <li>
                <label><b style="color: red;">*</b>房号：</label><input name="r_roomnum" id="RoomNo" maxlength="10" readonly="readonly" class="disabledcolor" value="${room.r_roomnum }" type="text"/></li>
            <li>
                <label><b style="color: red;">*</b>楼层：</label><select name="f.f_id" id="FloorId" style="width: 194px;"><option value="">请选择楼层</option>
                 <c:forEach items="${flist }" var="f">
                <option value="${f.f_id }">${f.f_num }</option>
                </c:forEach></select></li>
            <li>
                <label><b style="color: red;">*</b>房型：</label>
                <select name="rt.rt_id" id="RoomTypeId" style="width: 194px;">
                    <option value="">请选择房型</option>
                <c:forEach items="${roomtypelist }" var="rt">
                <option value="${rt.rt_id }">${rt.rt_name }</option>
                </c:forEach></select></li>
            <li id="listatus">
                <label>状态：</label>
                <c:if test="${room.r_state==-1 }">
                <input name="r_state" id="0" value="0" class="radio"  type="radio"><em>使用</em>
                <input name="r_state" id="1" value="-1" class="radio" checked="checked" type="radio"><em>停用</em>
            	</c:if>
            	<c:if test="${room.r_state!=-1 }">
                <input name="r_state" id="0" value="${room.r_state }" class="radio" checked="checked" type="radio"><em>使用</em>
                <input name="r_state" id="1" value="-1" class="radio"  type="radio"><em>停用</em>
            	</c:if>
            </li>
            <li>
            	<input name="r_id" value="${room.r_id }" type="hidden"/>
                <label>&nbsp;</label><input value="修改" class="bus_add" onclick="Edit();" type="submit"></li>
        </ul>
    </div>
</form>

</body>
</html>
