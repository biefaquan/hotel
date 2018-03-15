<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function CloseDiv(div) {
		var d = $(div).parent().parent();
		d.hide();
	}
	function FloorAdd(){
		var div1 = document.getElementById("div1");
		div1.style.display="block";
	}
	function FloorEdit(f_id){
		var iframe1 = document.getElementById("iframe1");
		iframe1.src = "/hotel/FloorController/queryById?f_id="+f_id;
		var div4 = document.getElementById("div4");
		div4.style.display="block";
	}
	function FloorDell(f_id){
		if(confirm("删除楼层，所有该楼层的房间都将删除，确定删除？")){
			top.location.href="/hotel/FloorController/delete?f_id="+f_id;
		}
	}
	
	function RoomTypeAdd(){
		var div2 = document.getElementById("div2");
		div2.style.display="block";
	}
	function RoomTypeEdit(rt_id){
		var iframe2 = document.getElementById("iframe2");
		iframe2.src = "/hotel/RoomTypeController/queryById?rt_id="+rt_id;
		var div5 = document.getElementById("div5");
		div5.style.display="block";
	}
	function RoomTypeDell(rt_id){
		if(confirm("删除房型，所有属于该房型的房间都将删除，确定删除？")){
			top.location.href="/hotel/RoomTypeController/delete?rt_id="+rt_id;
		}
	}
	
	function RoomAdd(){
		var div3 = document.getElementById("div3");
		div3.style.display="block";
	}
	function RoomEdit(r_id){
		var iframe3 = document.getElementById("iframe3");
		iframe3.src = "/hotel/RoomController/queryById?r_id="+r_id;
		var div6 = document.getElementById("div6");
		div6.style.display="block";
	}
	function RoomDell(r_id){
		if(confirm("确定删除？")){
			top.location.href="/hotel/RoomController/delete?r_id="+r_id;
		}
	}
	
</script>  
    
    

<link media="all" href="/hotel/css/set/setroom/index_3.css" type="text/css" rel="stylesheet">
<link media="all" href="/hotel/css/roomrack/index.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main">
       <h1 class="room">房间信息<span>第一步添加楼层，第二步添加房型，第三步添加房间。</span></h1>        
        <ul class="room">
            <li>
                <div class="l">楼层：</div>
                <div class="r floorlist">
                    <div class="lines floorAll select" data-id="0"><span>全 部</span></div>
                    <c:forEach items="${flist }" var="f">
                    <div class="lines flooritem" data-id="331"><span>${f.f_num }</span><em onclick="FloorEdit(${f.f_id})" class="edit" title="编辑"></em><em onclick="FloorDell(${f.f_id})" class="dell" title="删除"></em></div>
                    </c:forEach>
                    <div class="lines add">
                        <input value="+" class="butns" onclick="FloorAdd()" type="button"></div>
                </div>
            </li>
            <li>
                <div class="l">房型：</div>
                <div class="r roomtypelist">
                    <div class="lines roomtypeAll select" data-id="0"><span>全 部</span></div>
                    <c:forEach items="${roomtypelist }" var="rt">
                    <div class="lines roomtypeitem" data-id="436"><span>${rt.rt_name }</span><em onclick="RoomTypeEdit(${rt.rt_id})" class="edit" title="编辑"></em><em onclick="RoomTypeDell(${rt.rt_id})" class="dell" title="删除"></em></div>
                    </c:forEach>
                    <div class="lines add">
                        <input value="+" class="butns" onclick="RoomTypeAdd()" type="button"></div>
                </div>
            </li>
            <li>
                <div class="l">房间：</div>
                <div class="r roomlist">
                <c:forEach items="${list }" var="r">
                    <div class="rfj blue roomitem" data-id="3033"><div class="rom">${r.r_roomnum }</div><div class="type">${r.rt.rt_name }</div><em onclick="RoomEdit(${r.r_id})" class="edit" title="编辑"></em><em onclick="RoomDell(${r.r_id})" class="dell" title="删除"></em></div>
                </c:forEach>
                    <div class="rfj gray add">
                        <div class="adds" onclick="RoomAdd()">+</div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <!-- 添加界面 -->
	 <div id="div1" class="white_content pwin" style="cursor: pointer; width: 300px; height: 200px; top: 100px; left: 300px; display: none;">
	 	<iframe src="/hotel/Set/SetRoom/flooradd.jsp" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
	 	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
    <div id="div2" class="white_content pwin" style="cursor: pointer; width: 650px; height: 400px; top: 20px; left: 250px; display: none;">
    	<iframe src="/hotel/Set/SetRoom/roomtypeadd.jsp" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
    <div id="div3" class="white_content pwin" style="cursor: pointer; width: 650px; height: 400px; top: 20px; left: 250px; display: none;">
    	<iframe src="/hotel/RoomController/queryByAdd" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
    
    <!-- 修改界面 -->
     <div id="div4" class="white_content pwin" style="cursor: pointer; width: 300px; height: 200px; top: 100px; left: 300px; display: none;">
    	<iframe id="iframe1" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
     <div id="div5" class="white_content pwin" style="cursor: pointer; width: 650px; height: 400px; top: 20px; left: 250px; display: none;">
    	<iframe id="iframe2"  name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
     <div id="div6" class="white_content pwin" style="cursor: pointer; width: 650px; height: 400px; top: 20px; left: 250px; display: none;">
    	<iframe id="iframe3" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>

</body>
</html>
