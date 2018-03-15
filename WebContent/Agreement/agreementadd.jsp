<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>增加协议类型</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript">
	window.onload=function(){
		var startdate = document.getElementById("startdate");
		var enddate = document.getElementById("enddate");
		var year = new Date().getFullYear();
		var month = new Date().getMonth()+1;
		month = month<10?("0"+month):month;
		var day = new Date().getDay();
		day = day<10?("0"+day):day;
		startdate.value = year+"-"+month+"-"+day;
		enddate.value = (year+1)+"-"+month+"-"+day;
	}
	function ButtonClose() {
		var div2 = parent.document.getElementById("div2");
		div2.style.display = "none";
	}
	//点击是否挂账，改变其值
	function AllowAccount(account) {
		if(account.checked){
			account.value = "1";
		}else{
			account.value = "0";
		}
	}
	function Checked() {
		var code = document.getElementById('UnitCode').value;
		if(code==""){    
			 alert("编号不能为空！！"); 
		     return false; 
		}
		//验证姓名
		var name = document.getElementById('ContractName').value;
	    if(name==""){ 
	        alert("联系人不能为空！！"); 
	        return false; 
	    }
		//手机验证
		var phone = document.getElementById('ContractPhone').value;
	    if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        alert("手机号码有误，请重填");  
	        return false; 
	    }
	    //所有验证通过
	    return true;
	}
</script>   

<link media="all" href="/hotel/css/agreement/agreementadd.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="p_main">
        

<form action="/hotel/AgreementController/add" target="_top" method="post" onsubmit="return Checked()">
<div class="protocol_m" style="width: 860px;">
    <div class="line">
        <div class="fl">协议单位信息</div>
        <div class="errortips" id="btnRead" style="font-size: 12px;"></div>
    </div>
    <ul class="first">
        <li>
            <label><b style="color: red;">*</b>编号：</label><input name="a_cardnum" id="UnitCode" maxlength="25" onblur="CheckUnitCode()" type="text">
            <label>单位名称：</label><input name="a_name" id="Name" maxlength="25" style="width: 300px;" type="text">
            <label>协议类别：</label>
            <select name="at.at_id" style="width: 126px;">
                <c:forEach items="${atlist }" var="at">
                    <option value="${at.at_id }">${at.at_name }</option>
                </c:forEach>
            </select>
        </li>
        <li>
            <label><b style="color: red;">*</b>联系人：</label><input name="a_username" id="ContractName" maxlength="25" type="text">
            <label><b style="color: red;">*</b>电话：</label><input name="a_userphone" id="ContractPhone" maxlength="25" type="text">
            <input name="a_accountstate" id="accountstate" onclick="AllowAccount(this)" value="0" type="checkbox">
            <label style="margin-right: 95px;" for="AllowBill">是否可挂账</label>
            <label>挂账限额：</label>
            <input name="a_accountmoney" id="MaxBillTotal" style="margin-right: 0px;" maxlength="10" placeholder="0或者空表示不限制" type="text">
        </li>
        <li>
            <label>地址：</label>
            <select id="s_province" name="s_province" style="width: 126px;"></select>  
    		<select id="s_city" name="s_city" style="width: 120px;"></select>  
    		<select id="s_county" name="s_county" style="width: 120px;"></select>
    		<script class="resources library" src="/hotel/js/area.js" type="text/javascript"></script>
   			<script type="text/javascript">_init_area();</script>
            <input name="a_adress" style="width: 160px;" id="Address" maxlength="50" type="text">
            <label>操作员：</label>
            <input value="${user.u_name }" readonly="readonly" style="margin-right: 0px;"maxlength="10"  type="text">
            <input name="u.u_id" value="${user.u_id }" type="hidden"/>
        </li>
        <li>
            <label>生效时间：</label><input id="startdate" name="a_startdate" onclick="laydate()" type="text">
            <label>失效时间：</label><input id="enddate" name="a_enddate" onclick="laydate()" type="text">
            <label>状态：</label>
            <input id="Radio_1" name="a_state" checked="checked" value="1" type="radio">
            <label style="text-align: left; width: 40px;" for="Radio_1">启用</label>
            <input id="Radio_2" name="a_state" value="0" type="radio"><label style="text-align: left;" for="Radio_2">停用</label>
        </li>
        <li>
            <label>备注：</label><textarea name="a_reward" cols="20" id="Remark" maxlength="100" rows="2"></textarea>
        </li>
     </ul>
    <ul class="list">
       	<li id="m02" class="ok" value="0">价格列表</li>
    </ul>
    <div class="select_two" id="c02">
            <ul class="first" style="width: 98%; margin-left: 1%;">
                <li>
                    <label>房价折率：</label>
                    <input name="a_discountrate" type="text"/>
                    <label style="width: 310px; float: right;">折扣请直接输入数字，如：95折输入95，100代表无折扣</label>
                </li>
            </ul>
            <div class="protocol_table" style="display: none">
                <table class="adds" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr><th width="40">
                            <input id="check_all" checked="checked" type="checkbox"></th>
                        <th>房型</th>
                        <th width="70">标价</th>
                        <th width="90">天房折扣</th>
                        <th width="90">天房价</th>
                        <th width="90">午夜折扣</th>
                        <th width="90">午夜价</th>
                        <th width="85">月租折扣</th>
                        <th width="120">月租价</th>
                    </tr></tbody>
                </table>
                <div style="height: 130px; width: 98%; overflow-y: scroll; margin-left: 1%; border-bottom: 1px solid rgb(221, 221, 221);">
                    <table class="adds_cont" id="tblUser" cellspacing="0" cellpadding="0"><tbody><tr id="tr_0" data-id="436" data-price="100.00"><td width="30px"><input id="chk_0" checked="checked" onclick="IsCheck(0)" type="checkbox"></td><td>大床房</td><td width="80px">100.00</td><td width="80px"><input maxlength="8" name="DayRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'DayRoomPrice')" id="txt_discount_0" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="DayRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'DayRoomDiscount')" id="txt_discountprice_0" value="100.00" type="text"></td><td width="80px"><input maxlength="8" name="NightRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'NightRoomPrice')" id="txt_midnightdiscount_0" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="NightRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'NightRoomDiscount')" id="txt_midnightdiscountprice_0" value="100.00" type="text"></td><td width="80px"><input maxlength="8" name="MonthRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'MonthRoomPrice')" id="txt_monthdiscount_0" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="MonthRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'MonthRoomDiscount')" id="txt_monthdiscountprice_0" value="100.00" type="text"></td></tr><tr id="tr_1" data-id="437" data-price="100.00"><td width="30px"><input id="chk_1" checked="checked" onclick="IsCheck(1)" type="checkbox"></td><td>豪华单人间</td><td width="80px">100.00</td><td width="80px"><input maxlength="8" name="DayRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'DayRoomPrice')" id="txt_discount_1" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="DayRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'DayRoomDiscount')" id="txt_discountprice_1" value="100.00" type="text"></td><td width="80px"><input maxlength="8" name="NightRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'NightRoomPrice')" id="txt_midnightdiscount_1" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="NightRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'NightRoomDiscount')" id="txt_midnightdiscountprice_1" value="100.00" type="text"></td><td width="80px"><input maxlength="8" name="MonthRoomDiscount" onclick="select();" onblur="PriceCalculate(this,'MonthRoomPrice')" id="txt_monthdiscount_1" value="100.0" type="text"></td><td width="80px"><input maxlength="8" name="MonthRoomPrice" onclick="select();" onblur="DiscountCalculate(this,'MonthRoomDiscount')" id="txt_monthdiscountprice_1" value="100.00" type="text"></td></tr></tbody></table>
                </div>
            </div>
    </div>
    <div class="select_two" id="c01" style="display: none;">
        <div class="protocol_table">
            <table class="adds" style="width: 840px;" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr><th style="width: 80px;">签单人</th>
                    <th style="width: 100px;">性别</th>
                    <th style="width: 90px;">证件类型</th>
                    <th style="width: 200px;">证件号码</th>
                    <th style="width: 60px;">手机</th>
                    <th style="width: 240px;">备注</th>
                    <th style="width: 70px; text-align: left;">操作</th>
                </tr></tbody>
            </table>
            <div style="height: 164px; width: 98%; overflow-y: scroll; margin-left: 1%; border-bottom: 1px solid rgb(221, 221, 221);">
                <table class="adds_cont" id="table_signperson" cellspacing="0" cellpadding="0">
                    <tbody><tr><td style="width: 100px;"><input name="txtName" style="text-align: left;" maxlength="5" value="" type="text"></td><td style="width: 80px;"><select name="txtSex"><option value="男">男</option><option value="女">女</option></select></td><td style="width: 100px;"><select name="txtCardType"><option value="24393">身份证</option><option value="24394">驾驶证</option><option value="24395">士兵证</option><option value="24396">军官证</option></select></td><td style="width: 100px;"><input maxlength="20" name="txtCardNo" style="width: 140px; text-align: left;" onblur="CheckIdCard(this)" onfocus="RemoveErrorClass()" value="" type="text"></td><td style="width: 120px;"><input maxlength="15" name="txtPhone" style="width: 90px; text-align: left;" onfocus="RemoveErrorClass()" value="" type="text"></td><td><input name="txtRemark" style="width: 140px; text-align: left;" maxlength="50" onfocus="RemoveErrorClass()" value="" type="text"></td><td style="width: 100px;"><img onclick="DeleteTableTr(this)" style="cursor: pointer;" src="010.gif" height="9" width="9"></td></tr><tr>
                        <td colspan="7">
                            <input class="addinputbutns fontYaHei" value="+" style="float: right;" id="btn_addtr" onclick="LoadTableTr(false)" type="button"></td>
                    </tr>
                </tbody></table>
            </div>
        </div>
    </div>
    <div class="protocol_db">
        <div class="fr">
            <input class="bus_add" value="保存" id="btnSave" type="submit">
            <input onclick="ButtonClose()" class="bus_dell" value="关闭" id="btnClose" type="button">
        </div>
    </div>
</div>
</form>


    </div>
    
    <div class="white_content pwin" style="cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="pwin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin_black"></div>

     <div class="white_content pwin2" style="z-index: 1004; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="pwin2">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin2');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin2_black" style="z-index: 1003;"></div>


	</body>
</html>
