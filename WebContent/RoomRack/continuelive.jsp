<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript">
function Close(){
	var div5 = parent.document.getElementById("div5");
	div5.style.display="none";
}
//“-”和“+”的功能实现
function AddNum() {
	var Days = document.getElementById("Days");
	Days.value++;
	ChangeMoney();
}
function DelNum() {
	var Days = document.getElementById("Days");
	if(Days.value>1){
		Days.value--;
		ChangeMoney();
	}
}
function ChangeMoney() {
	var dept = "${dept}";
	var Days = document.getElementById("Days").value;
	var Price = "${room.rt.rt_price}";
	var AllMoney = document.getElementById("AllMoney");
	if(dept==""){
		AllMoney.value = Days*Price;
	}else{
		AllMoney.value = Days*Price*dept/100;
	}
}
//验证改时间段内是否有预订订单
function Checked() {
	var start = "${date.time }";
	var days = document.getElementById("Days").value;
	var startdate = "${rr.rr_startdate.time}";
	var id = "${rr.rr_id}";
	if(id!=0&&(startdate-start)/(24*3600*1000)<=days){
		alert("该时间段内已有预订订单,请与客户协商！！");
		return false;
	}else{
		return true;
	}
}
</script>   


<link media="all" href="/hotel/css/roomrack/continuelive.css" type="text/css" rel="stylesheet">
</head>
<body>
	<form action="/hotel/RegistrationInforController/continueLive" onsubmit="return Checked()" target="_top" method="post">
    <!--续住弹出窗口-->
    <div class="ruzhu_infor" style="width: 860px;">
        <div class="line" id="DivList">
            <div class="fl">续住</div>
        </div>

        <div class="types" id="ULList">
            <h1>
                <div class="errortips" id="btnRead"></div>
            </h1>
        <ul><li style="margin-right: 42px; display: inline;"><label style="width: 50px;">房号：</label><p>${room.r_roomnum }</p></li>
        	<li style="margin-right: 42px; display: inline;"><label>房间类型：</label><p>${room.rt.rt_name }</p></li>
        	<li style="margin-right: 42px; display: inline;"><label>客人姓名：</label><p>${customer.c_name }</p></li>
        	<li style="margin-right: 0px; display: inline;"><label>入住时间：</label><p><fmt:formatDate value="${opentime }" pattern="yyyy-MM-dd" /></p></li>
        	<li style="margin-right: 42px; display: inline;"><label style="width: 50px;">来源：</label><p>${source }</p></li>
        	<li style="margin-right: 42px; display: inline;"><label>开房方式：</label><p>${keyway }</p></li>
        	<li style="margin-right: 42px; display: inline;"><label>已交押金：</label><p style="width: 120px;">${depositfee }</p></li>
        	<li style="margin-right: 0px; display: inline;"><label>剩余天数：</label><p>${days }</p></li></ul></div>

        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <!-- <h1>
                <div class="fl">续住信息</div>
            </h1>-->
            <ul>
                <li style="margin-right: 90px; display: inline;">
                    <label>原定离期：</label>
                    <input id="WantLeaveDate" readonly="readonly" style="background: rgb(238, 238, 238) none repeat scroll 0% 0%; width: 144px;" value="<fmt:formatDate value='${date }' pattern='yyyy-MM-dd' />" type="text"></li>
                <li style="margin-right: 90px; display: inline;">
                    <label><b style="color: red;">*</b>续住天数：</label>
                    <input onclick="DelNum()" value="-" class="jia reduceDays" style="margin-left: -1px;" type="button">
                    <input name="cl_days" onchange="ChangeMoney()" style="width: 60px;" value="0" id="Days" type="text">
                    <input onclick="AddNum()" value="+" class="jia addDays" style="margin-right: -1px;" type="button">
                </li>

                 </ul>
            <ul>
                <li style="margin-right: 90px; display: inline;">
                    <label>支付方式：</label>
                    <select name="cl_paytype" id="PayMethod" style="width: 150px;">
                    <c:if test="${ri.ri_paytype!='挂账' }">
                    	<option value="现金">现金</option>
                    	<option value="银行卡">银行卡</option>
                    	<option value="微信支付">微信支付</option>
                    	<option value="支付宝支付">支付宝支付</option>
                    </c:if>
                    <c:if test="${ri.ri_paytype=='挂账' }">
                    	<option value="挂账">挂账</option>
                    </c:if>
                    </select>
                </li>
                <li style="margin-right: 90px;">
                    <label>续住金：</label><input name="cl_money" style="width: 110px;" id="AllMoney" maxlength="10" value="${room.rt.rt_price*dept/100 }" type="text"></li>
               
            </ul>
            <ul>
                <li>
                    <label>备注：</label><input name="cl_reward" style="width: 766px;" id="Remark" value="" type="text"></li>
            </ul>
        </div>
		<!-- 一些参数值 -->
		<input name="r.r_id" value="${room.r_id }" type="hidden"/>
		<input name="c.c_id" value="${customer.c_id }" type="hidden"/>
		<input name="cl_typenum" value="${typenum }" type="hidden"/>
		<input name="cl_source" value="${source }" type="hidden"/>
		<input name="cl_keyway" value="${keyway }" type="hidden"/>
		<input name="cl_opentime" value="${opentime }" type="hidden"/>
		<input name="u.u_id" value="${user.u_id }" type="hidden"/>
		<input name="selecttype" value="${selecttype }" type="hidden"/>
		<input name="selectid" value="${selectid }" type="hidden"/>

        <div class="types">
            <ul style="float: right; width: 184px;">
                <li>
                    <input class="bus_add" value="续住" id="btnSubmit" type="submit">
                </li>
                <li style="margin-right: 0px;">
                    <input onclick="Close()" class="bus_dell " value="关闭" id="close" style="margin-right: 0px;" type="button"></li>
            </ul>
        </div>

    </div>
	</form>

</body>
</html>
