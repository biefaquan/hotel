<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
function Close(){
	var div4 = parent.document.getElementById("div4");
	div4.style.display="none";
}    
function roomTypeChange(){
	//根据房型找到相应的房间号
	var rt_id=$("#RoomTypeId").val();
	var dept = ${dept};
	var price = "${room.rt.rt_price}";
	var days = "${days}";
	$("#RoomId option").remove();
		$.ajax({
			url:"/hotel/TeamInforController/queryAllByRt_id",
			type:"POST",
			data:"rt_id="+rt_id,
			dataType:"json",
			success:function(roomlist){
				//$("#yzm").val(data);
				for(var i=0;i<roomlist.length;i++){
					if(roomlist[i].r_state==0){
						$("#RoomId").append("<option value="+roomlist[i].r_id+" onclick='SelectRoom(this)'>"+roomlist[i].r_roomnum+"</option>");
						//房价
						$("#RoomPrice").val(roomlist[i].rt.rt_price);
						//折扣价
						$("#disprice").val(roomlist[i].rt.rt_price*dept/100);
						//计算房间差价
						$("#diffprice").val((roomlist[i].rt.rt_price-price)*days*dept/100);
					}else{
						$("#diffprice").val(0);
					}
				}
			},
			error:function(){
				//alert("系统错误！！");
			}
		});
}
</script>  
    
    

    

<link media="all" href="/hotel/css/roomrack/changeroom.css" type="text/css" rel="stylesheet">
</head>
<body>
<form action="/hotel/RegistrationInforController/changeRoom" target="_top" method="post">
    <!--换房弹出窗口-->
    <div class="ruzhu_infor">
        <div class="line" id="DivList">
            <div class="fl">换房</div>
       
        <div class="types" id="ULList">
            <div class="errortips" id="btnRead"></div>
        <ul><li style="margin-right: 42px; display: inline;"><label style="width: 50px;">房号：</label><p id="oldRoomNo">${room.r_roomnum }</p></li>
        <li style="margin-right: 42px; display: inline;"><label>房间类型：</label><p>${room.rt.rt_name }</p></li>
        <li style="margin-right: 42px; display: inline;"><label>客人姓名：</label><p style="width: 130px;">${customer.c_name }</p></li>
        <li style="margin-right: 0px; display: inline;"><label>入住时间：</label><p><fmt:formatDate value="${opentime }" pattern="yyyy-MM-dd" /></p></li>
        <li style="margin-right: 42px; display: inline;"><label style="width: 50px;">来源：</label><p>${source }</p></li>
        <li style="margin-right: 34px; display: inline;"><label>开房方式：</label><p>${keyway }</p></li>
        <li style="margin-right: 0px; display: inline;"><label>房价：</label><p>${room.rt.rt_price }</p></li>
        <li style="padding-left: 70px"><label>剩余天数：</label ><p>${days }</p></li></ul></div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221); width: 868px;">
            <ul>
                <li>
                    <label style="width: 50px;"><b style="color: red;">*</b>房型：</label>
                    <select id="RoomTypeId" onchange="roomTypeChange()">
                    	<option>请选择房型</option>
                    <c:forEach items="${rtlist }" var="rt">
                    	<option value="${rt.rt_id }">${rt.rt_name }</option>
                    </c:forEach>
                    </select>
                </li>
               
                <li>
                    <label><b style="color: red;">*</b>房号：</label>
                    <select id="RoomId" name="new_r_id" style="width: 120px;">
                    </select>
                </li>
                <li style="display: none;"><label style="width: 40px;">床号：</label><input id="BedNo" maxlength="20" style="width: 60px;" value="" type="text"></li>

                <li class="price" style="">
                    <label>房价：</label><input id="RoomPrice" maxlength="10" data-price="100.00" value="0.00" type="text">
                </li>
                <li class="price" style="">
                    <label>折扣价：</label><input id="disprice" maxlength="10" data-price="100.00" value="0.00" type="text">
                </li>
                <li class="pprice" style="display: none;">
                    <label>起钟价：</label>
                    <input style="width: 90px;" value="30.00" id="StartPrice" maxlength="10" type="text">(元)
                </li>
                <li class="pprice" style="display: none;">
                    <label>起钟小时：</label>
                    <input style="width: 50px; background: rgb(238, 238, 238) none repeat scroll 0% 0%;" value="3" disabled="true" id="StartHour" maxlength="10" type="text">(每小时)
                </li>
                <li class="pprice" style="display: none;">
                    <label>加钟价：</label>
                    <input value="10.00" id="AddHourPrice" maxlength="10" type="text">(元)
                </li>
                <li>
                    <label style="width: 50px;">原因：</label><input name="cr_reason" style="width: 695px;" id="Remark" value="" type="text">
                </li>
                <li>
                    <label style="width: 50px;">差价：</label>
                    <input name="cr_money" id="diffprice" style="width: 90px;" value="0.00" maxlength="10" type="text">(元)
                </li>
            </ul>
        </div>
        <input name="old_r_id" value="${room.r_id }" type="hidden"/>
        <input name="c.c_id" value="${customer.c_id }" type="hidden"/>
        <input name="cr_typenum" value="${typenum }" type="hidden"/>
        <input name="cr_source" value="${source }" type="hidden"/>
        <input name="cr_keyway" value="${keyway }" type="hidden"/>
        <input name="cr_opentime" value="${opentime }" type="hidden"/>
        <input name="cr_days" value="${days }" type="hidden"/>
        <input name="u.u_id" value="${user.u_id }" type="hidden"/>
        <input name="selecttype" value="${selecttype }" type="hidden"/>
        <input name="selectid" value="${selectid }" type="hidden"/>
        
        <div class="types" id="Divlist">
            <ul style="float: right; width: 300px;">
                <li>
                    <input class="bus_add" value="换房" id="btnSubmit" type="submit"></li>
                
                <li style="margin-right: 0px;">
                    <input class="bus_dell " onclick="Close()" value="关闭" id="close" style="margin-right: 0px;" type="button">
                </li>
            </ul>
        </div>
    </div>
	</div>
</form>
</body>

</html>
