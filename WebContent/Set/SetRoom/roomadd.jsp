<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
    <!--<script type="text/javascript" src="../Scripts/public/Base.js"></script>-->
    
    
    
    

<link media="all" href="/hotel/css/set/setroom/index_6.css" type="text/css" rel="stylesheet">
</head>
<body>
   <form action="/hotel/RoomController/add" target="_top" method="post">
    <div class="fangjian">
        <div class="line">添加房间<span style="font-size: 12px; color: rgb(255, 0, 0); padding-left: 20px;">说明：一次只能同时添加同一楼层同一房型的房间信息，中文房号尽量控制在5个字以内。</span></div>
        <ul>
            <li>
                <label><b style="color: red;">*</b>房号：</label>
                <input id="RoomNo" name="r_roomnum" maxlength="10" style="width: 170px;" type="text">
                </li>
            <li class="roomlist">
                <input id="hdRoomNos" type="hidden">
            </li>
            <li>
                <label><b style="color: red;">*</b>楼层：</label><select id="FloorId" name="f.f_id"><option>请选择楼层</option>
                <c:forEach items="${flist }" var="f">
                <option value="${f.f_id }">${f.f_num }</option>
                </c:forEach></select></li>
            <li>
                <label><b style="color: red;">*</b>房型：</label>
                <select id="RoomTypeId" name="rt.rt_id">
                    <option>请选择房型</option>
                <c:forEach items="${roomtypelist }" var="rt">
                <option value="${rt.rt_id }">${rt.rt_name }</option>
                </c:forEach></select></li>
            
            <li>
                <label>&nbsp;</label><input value="保存" class="bus_add" id="btnSave" onclick="Add();" type="submit"></li>
        </ul>
    </div>
  </form>

</body>
</html>
