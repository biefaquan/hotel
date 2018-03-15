<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>

<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
//初始化开房时间
window.onload=function(){
	var txtEnterDate = document.getElementById("txtEnterDate");
	var year = new Date().getFullYear();
	var month = new Date().getMonth()+1;
	month = month>10?month:"0"+month;
	var day = new Date().getDate();
	day = day>10?day:"0"+day;
	txtEnterDate.value = year+"-"+month+"-"+day;
}
//点击入住信息显示不同内容
function SelectRZ() {
	var m01 = document.getElementById("m01");
	var m02 = document.getElementById("m02");
	var c01 = document.getElementById("c01");
	var c02 = document.getElementById("c02");
	m01.className="ok"
	m02.className=null;
	c01.style.display="block";
	c02.style.display="none";
}
function SelectZK() {
	var m01 = document.getElementById("m01");
	var m02 = document.getElementById("m02");
	var c01 = document.getElementById("c01");
	var c02 = document.getElementById("c02");
	m01.className=null;
	m02.className="ok";
	//获取房号
	var length=$("#table1 tr").length;
	//var tr=new Array();
	$("#Rooms option").remove();
	for(var i=1;i<length;i++){
		var id=$("#table1 tr").eq(i).children().eq(0).text();
		var num=$("#table1 tr").eq(i).children().eq(1).text();
		$("#Rooms").append("<option value='"+id+"'>"+num+"</option>");
	}
	c01.style.display="none";
	c02.style.display="block";
}
//根据开房方式确定价格
function SourceType(source) {
	var hyid = document.getElementById("hyid");
	var xydw = document.getElementById("xydw");
	var liMemberCardNo = document.getElementById("liMemberCardNo");
	var cardno = document.getElementById("CardNo");
	if(source.value=="会员"){
		hyid.style.display="block";
		xydw.style.display="none";
		liMemberCardNo.style.display="block";
		cardno.value=null;
	}else if(source.value=="协议单位"){
		hyid.style.display="none";
		xydw.style.display="block";
		liMemberCardNo.style.display="block";
		cardno.value=null;
	}else if(source.value=="客人自入"){
		liMemberCardNo.style.display="none";
		cardno.value=null;
	}
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
//计算总房价
function ChangeMoney(){
	var discountrate = document.getElementById("discountrate").value;
	var Days = parseInt(document.getElementById("Days").value);
	var Price =document.getElementById("Price").value;
	var allMoney = document.getElementById("allMoney");
	if(discountrate==""){
		allMoney.value = Days*Price;
	}else{
		allMoney.value = Days*Price*discountrate/100;
	}
}
//点击房间li确定选择房间
function SelectRoom(li) {
	if(li.style.backgroundColor=="rgb(255, 153, 0)"){
		li.style.backgroundColor=null;
		$.ajax({
			url:"/hotel/TeamInforController/deleteR_id",
			type:"POST",
			data:"r_id="+li.value,
			dataType:"json",
			success:function(data){
			//$("#yzm").val(data);
			
		},
		error:function(){
		}
	});}else{
		li.style.backgroundColor="rgb(255, 153, 0)";
		$.ajax({
			url:"/hotel/TeamInforController/addR_id",
			type:"POST",
			data:"r_id="+li.value,
			dataType:"json",
			success:function(data){
			
		},
		error:function(){
		}
	});
	}
}
//置空房价号r_id
function deleteAllR_id() {
	$.ajax({
		url:"/hotel/TeamInforController/deleteAllR_id",
		type:"POST",
		data:null,
		dataType:"json",
		success:function(data){
			
		},
		error:function(){
		}
	});
}
//动态table1删除行
function Delete(td) {
	var tr = $(td).parent().parent();
	var disprice=tr.children().eq(4).text();
	tr.remove();
	//改变房间数（-1）
	$("#allRoom").val(parseInt($("#allRoom").val())-1);
	//修改单日房价Price
	$("#Price").val(parseInt($("#Price").val())-disprice);
	ChangeMoney();
}
//动态table2删除行
function Delete1(td) {
	var tr = $(td).parent().parent();
	var c_idcard=tr.children().eq(4).text();
	$.ajax({
		url:"/hotel/TeamInforController/deletecustomer",
		type:"POST",
		data:"c_idcard="+c_idcard,
		dataType:"json",
		success:function(c){
	},
	error:function(){
	}
  });
	tr.remove();
	//总人数减少（-1）
	$("#lblCustomerCount").text(parseInt($("#lblCustomerCount").text())-1);
}
//根据房型确定是否有钟点房
$(function(){
	//初始化
	var rt_id=$("#selRoomTypes").val();
	$("#ulRooms li").remove();
	$.ajax({
		url:"/hotel/TeamInforController/queryAllByRt_id",
		type:"POST",
		data:"rt_id="+rt_id,
		dataType:"json",
		success:function(roomlist){
			//$("#yzm").val(data);
			for(var i=0;i<roomlist.length;i++){
				$("#txtRoomPrice").val(roomlist[i].rt.rt_price);
				$("#zdprice").val(roomlist[i].rt.rt_zdprice);
				$("#txtRoomDiscountPrice").val(roomlist[i].rt.rt_price);
				if(roomlist[i].rt.rt_zdstate==-1){
					$("#op01").hide();//确定是否有钟点房
				}else{
					$("#op01").show();
				}
				if(roomlist[i].r_state==0){
					$("#ulRooms").append("<li value="+roomlist[i].r_id+" onclick='SelectRoom(this)'>"+roomlist[i].r_roomnum+"</li>");
				}
			}
		},
		error:function(){
		}
	});
	////根据房型查找房号
	$("#selRoomTypes").change(function(){
		var rt_id=$("#selRoomTypes").val();
		$("#ulRooms li").remove();
		$.ajax({
			url:"/hotel/TeamInforController/queryAllByRt_id",
			type:"POST",
			data:"rt_id="+rt_id,
			dataType:"json",
			success:function(roomlist){
				//$("#yzm").val(data);
				for(var i=0;i<roomlist.length;i++){
					$("#txtRoomPrice").val(roomlist[i].rt.rt_price);
					$("#zdprice").val(roomlist[i].rt.rt_zdprice);
					$("#txtRoomDiscountPrice").val(roomlist[i].rt.rt_price);
					if(roomlist[i].rt.rt_zdstate==-1){
						$("#op01").hide();//确定是否有钟点房
					}else{
						$("#op01").show();
					}
					if(roomlist[i].r_state==0){
						$("#ulRooms").append("<li value="+roomlist[i].r_id+" onclick='SelectRoom(this)'>"+roomlist[i].r_roomnum+"</li>");
					}
				}
			},
			error:function(){
				alert("系统错误！！");
			}
		});
		//调用置空函数,以免重复添加房间号
		deleteAllR_id();
	});
	//根据开房方式确定折扣价
	$("#selOpenTypes").change(function(){
		var selOpenTypes=$("#selOpenTypes").val();
		var price=$("#txtRoomPrice").val();
		var zdprice=$("#zdprice").val();
		if(selOpenTypes=="天房"){
			$("#txtRoomDiscountPrice").val(price);
		}else if(selOpenTypes=="钟点房"){
			$("#txtRoomDiscountPrice").val(zdprice);
		}else if(selOpenTypes=="月租房"){
			$("#txtRoomDiscountPrice").val(price*30);
		}else if(selOpenTypes=="午夜房"){
			$("#txtRoomDiscountPrice").val(price/2);
		}
	});
	//点击房间添加按钮
	$("#aAddRooms").click(function(){
		var selOpenTypes=$("#selOpenTypes").val();
		var txtRoomDiscountPrice=$("#txtRoomDiscountPrice").val();
		$.ajax({
			url:"/hotel/TeamInforController/queryAllRoom",
			type:"POST",
			data:null,
			dataType:"json",
			success:function(rlist){
				//总房间数增加
				$("#allRoom").val(parseInt($("#allRoom").val())+rlist.length);
				for(var i=0;i<rlist.length;i++){
					$("#table1 tbody").append("<tr><td style='display:none;'>"+rlist[i].r_id+"</td><td>"+rlist[i].r_roomnum+"</td><td>"+rlist[i].rt.rt_name+"</td><td>"+rlist[i].rt.rt_price+"</td><td>"+txtRoomDiscountPrice+"</td><td>"+selOpenTypes+"</td><td><a onclick='Delete(this)'>删除</a></td></tr>");
					//添加房间确定单日房价
					$("#Price").val(parseInt($("#Price").val())+parseInt(txtRoomDiscountPrice));
					ChangeMoney();
				}
			},
			error:function(){
			}
		});
		//切换到入住界面
		SelectRZ();
	});
	//添加随客信息
	$("#btnSave").click(function(){
		var vform = $("#myadd").serialize();
		//身份证验证
		var idcard = $("#c_idcard").val();
	    if(!(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/.test(idcard))){
	    	alert("身份证有误，请重填");  
	    }else{
	    	$.ajax({
				url:"/hotel/TeamInforController/addcustomer",
				type:"POST",
				data:vform,
				dataType:"json",
				success:function(c){
				$("#table2 tbody").append("<tr><td>"+$("#Rooms option:selected").text()+"</td><td style='display:none;'>"+c.r_id+"</td><td>"+c.c_name+"</td><td>"+c.c_idtype+"</td><td>"+c.c_idcard+"</td><td>"+c.c_sex+"</td><td>"+c.c_nation+"</td><td>"+c.c_birthday+"</td><td>"+c.c_adress+"</td><td><a onclick='Delete1(this)'>删除</a></td></tr>");
				//总人数添加
				$("#lblCustomerCount").text(parseInt($("#lblCustomerCount").text())+1);
			},
			error:function(){
				alert("系统错误！！");
			}
		  });
	    }
	});
	//将随客信息置空
	$("#btnDel").click(function(){
		$("#c_name").val(null);
		$("#c_birthday").val(null);
		$("#c_sex").val("男");
		$("#c_nation").val("汉族");
		$("#c_idtype").val("身份证");
		$("#c_idcard").val(null);
		$("#c_adress").val(null);
	});
	//判断会员卡号和协议单位存不存在
	$("#CardNo").blur(function(){
		var Source = $("#selCustomerSources").val();
		if(Source=="会员"){
			$.ajax({
				url:"/hotel/MemberController/queryByCardnum",
				type:"POST",
				data:"m_cardnum="+this.value,
				dataType:"json",
				success:function(m){
					if(m!=null){
						alert("会员存在，可用");
						//存储会员或协议单位id
						$("#ri_typenum").val(m.m_id);
						//进行会员折扣
						$("#discountrate").val(m.mt.mt_discountrate);
						ChangeMoney();
					}else{
						alert("会员不存在，请换来源方式！！");
					}
				},
				error:function(){
					alert("会员不存在，请换来源方式！！");
					$("#ri_typenum").val(null);
					$("#discountrate").val(null);
				}
			});}else if(Source=="协议单位"){
				$.ajax({
					url:"/hotel/AgreementController/queryByCardnum",
					type:"POST",
					data:"a_cardnum="+this.value,
					dataType:"json",
					success:function(a){
					//$("#yzm").val(data);
					if(a!=null){
						alert("协议单位存在，可用");
						$("#ri_typenum").val(a.a_id);
						//进行协议单位折扣
						$("#discountrate").val(a.a_discountrate);
						ChangeMoney();
						//判断是否能挂账
						if(a.a_accountstate==1){
							$("#op1").show();
						}
					}else{
						alert("协议单位不存在，请换来源方式！！");
					}
				},
				error:function(){
					alert("协议单位不存在，请换来源方式！！");
					$("#ri_typenum").val(null);
					$("#discountrate").val(null);
				}
			});
		}
	});
});
function Checked() {
	//手机验证
	var phone = document.getElementById('txtLeaderPhone').value;
    if(!(/^1[34578]\d{9}$/.test(phone))){ 
        alert("手机号码有误，请重填");  
        return false; 
    }
    //所有验证通过
    return true;
}
</script>

<link media="all" href="/hotel/css/roomrack/openteam.css" type="text/css" rel="stylesheet">
</head>
<body style="overflow: hidden;">
    <!--团队开房-->
    <form id="myadd" action="/hotel/TeamInforController/add" target="_top" method="post" onsubmit="return Checked()">
    <div class="main " id="main_nu" style="width: 99%; margin-left: 1%; margin-bottom: 0px; overflow-y: auto; height: 435px;">
        <div class="teamroom">
            <div class="right" style="height: 408px;">
                <ul class="first">
                    <li>
                        <label>房型：</label><select id="selRoomTypes" onchange="IsZDF()" style="width: 188px;">
                        <c:forEach items="${rtlist }" var="rt">
                        <option value="${rt.rt_id }">${rt.rt_name }</option>
                        </c:forEach></select></li>
                    <li>
                        <label>开房方式：</label><select name="tc_keyway" id="selOpenTypes" style="width: 188px;">
                        <option value="天房">天房</option><option id="op01" value="钟点房">钟点房</option><option value="月租房">月租房</option><option value="午夜房">午夜房</option></select></li>                    
                    <li style="width: 50%;">
                        <label>标价：</label><input id="txtRoomPrice"  disabled="disabled" class="disabledcolor" type="text"></li>
                    <li style="width: 50%;">
                        <label>折扣价：</label><input id="txtRoomDiscountPrice" value="0.00" data-price="100.00" type="text"></li>
                    	<input id="zdprice" type="hidden"/>
                    	<input id="Price" value="0" type="hidden"/>
                </ul>
                <ul id="ulRooms" class="second" style="height: 169px; overflow-y: scroll; overflow-x: hidden; border-bottom: 1px solid rgb(176, 191, 227);">
                	
                </ul>
                <ul class="second" style="margin-bottom: 30px;">
                    <li class="last">
                        <p>全部房间：<label id="lblRoomCount">0</label></p>
                        <p>已选房间：<label id="lblSelectedRoomCount">0</label></p>
                    </li>
                    <li class="last"><a id="aAddRooms" class="bus_add">添加</a></li>
                </ul>
            </div>
            <div class="left">
                <!--<div class="titles"><h1>团队开房</h1><p>单号：20141224050432</p></div>-->
                <div class="error">
                    <div id="divErrors" class="errortips">
                        <!-- <span class="formTips note_no" id="btnRead"></span>
                        <span class="formTips note_no" id="prompt"></span>-->
                    </div>
                </div>
                <div style="border: 1px solid rgb(221, 221, 221); width: 98%; float: left; background: rgb(241, 241, 241) none repeat scroll 0% 0%; padding: 10px 1% 15px; margin-top: 20px; position: relative;">
                    <p id="pBookNo" style="position: absolute; border: 1px solid rgb(221, 221, 221); top: -1px; right: 10px; padding: 5px 20px; display: none; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">预订单号：<label id="lblBookNo"></label></p>
                    <ul class="first">
                        <li>
                            <label>团名：</label><input name="ti_name" id="txtTeamName" maxlength="30" value="" type="text">
                        </li>
                        <li>
                            <label>领队姓名：</label><input name="ti_leadername" id="txtLeaderName" maxlength="20" value="" type="text"></li>
                        <li>
                            <label><b style="color: red;">*</b>领队电话：</label><input name="ti_leaderphone" id="txtLeaderPhone" maxlength="11" value="" type="text"></li>
                    </ul>
                    <ul class="first">
                        <li>
                            <label>来源：</label><select name="ti_source" id="selCustomerSources" onclick="SourceType(this)">
                            <option value="客人自入">客人自入</option><option value="会员">会员</option><option value="协议单位">协议单位</option></select></li>
                        <li id="liMemberCardNo" style="width: 488px; position: relative;display: none">
                            <label id="hyid">会员卡号：</label>
                            <label id="xydw" style="display: none;">协议单位：</label>
                            <div class="dis_yes" style="float: left;">
                                <input id="CardNo" style="width: 290px; margin-right: 0px; display: inline;" autocomplete="off" class="ac_input" type="text"/>
                        		<input id="ri_typenum" name="ti_typenum" type="hidden"/>
                        		<input id="discountrate" name="discountrate" type="hidden"/>
                            </div>
                        </li>
                    </ul>
                    <ul class="first">
                        <li>
                            <label>入住时间：</label><input name="ti_opentime" id="txtEnterDate" maxlength="20" style="background: rgb(238, 238, 238) none repeat scroll 0% 0%;" readonly="readonly" value="<fmt:formatDate value="${nowdate }" pattern="yyyy-MM-dd" />" type="text"></li>
                        <li>
                            <label>预住天数：</label>
                            <input id="btnReduceStayDays" onclick="DelNum()" class="jia" value="-" type="button">
                            <input name="ti_days" id="Days" onchange="ChangeMoney()" maxlength="3" value="1" style="width: 66px; border-left: 0px none; border-right: 0px none; text-align: center;" type="text">
                            <input id="btnAddStayDays" onclick="AddNum()" class="jia" value="+" type="button">
                        </li>
                    </ul>
                </div>

                <ul class="list" style="position: relative;">
                    <li id="m01" onclick="SelectRZ()" class="ok" value="0">入住信息</li>
                    <li id="m02" onclick="SelectZK()" value="1" class="">住客信息</li>
                </ul>
                <div class="select_two" id="c01" style="display: block;">
                    <table id="table1" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th width="70">房号</th>
                                <th width="150">房型</th>
                                <th width="90">标价</th>
                                <th width="90">折扣价</th>
                                <th width="80">开房方式</th>
                                <th width="80">操作</th>
                            </tr>
                        </tbody>
                    </table>
                    <div style="height: 132px; overflow-y: scroll; width: 100%; float: left;">
                        <table id="tbSelectedRooms" style="width: 99%;" cellspacing="0" cellpadding="0">
                            <tbody>
                                <!--                                <tr data-no="1">
                                    <td>1010</td>
                                    <td>标准单人间</td>
                                    <td class="fr">128.00</td>
                                    <td class="fr">300.00</td>
                                    <td>标准单人间房价方案</td>
                                    <td>天房</td>
                                    <td>
                                        <img width="9" height="9" src="../images/010.gif" alt=""><span class="STYLE1"> [</span><a class="btnRowDelete" href="javascript:void(0)">删除</a><span class="STYLE1">]</span></td>
                                </tr>-->
                            </tbody>
                        </table>
                    </div>
                    <table cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr style="color: rgb(7, 137, 190);">
                                <td colspan="7">
                                    <p>总房数：<input name="ti_allroom" id="allRoom" style="border: 0" value="0" readonly="readonly" type="text"/></p>
                                    <p>总房价：<input name="ti_allmoney" id="allMoney" style="border: 0" value="0" readonly="readonly" type="text"/></p>
    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="select_two" id="c02" style="display: none;">
                    <table id="table2" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <th width="70">房号</th>
                                <th width="90">姓名</th>
                                <th width="90">证件</th>
                                <th width="140">证件号码</th>
                                <th width="60">性别</th>
                                <th width="100">名族</th>
                                <th width="100">生日</th>
                                <th>地址</th>
                                <th width="80">操作</th>
                            </tr>
                        </tbody>
                    </table>
                    <div style="height: 132px; overflow-y: scroll; width: 100%; float: left;">
                        <table id="tbCustomers" style="width: 99%;" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr data-row-template="true">
                                    <td width="60">
                                        <select id="Rooms" name="r_id">
                                        </select></td>
                                    <td width="80">
                                        <input id="c_name" name="c_name" maxlength="20" style="width: 70px;" type="text"></td>
                                    <td width="80">
                                        <select id="c_idtype" name="c_idtype">
                                        <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select></td>
                                    <td width="130">
                                        <input id="c_idcard" name="c_idcard" maxlength="30" style="width: 120px;" type="text"></td>
                                    <td width="50">
                                        <select id="c_sex" name="c_sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select></td>
                                    <td width="90">
                                        <select id="c_nation" name="c_nation" style="width: 90px;">
                                        <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select></td>
                                    <td width="90">
                                        <input id="c_birthday" name="c_birthday" maxlength="10" type="text" onclick="laydate()"></td>
                                    <td>
                                        <input id="c_adress" name="c_adress" maxlength="200" style="width: 237px;" type="text"></td>
                                    <td width="66">
                                    	<a id="btnSave" class="btnSave">
                        					<img src="/hotel/img/roomrack/save.png" height="12" width="12"/></a>
                   						 <a id="btnDel">
                        					<img src="/hotel/img/roomrack/010.gif" class="btnRowDelete" height="12" width="12"/></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <table cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr style="color: rgb(7, 137, 190);">
                                
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="divZF">
                    <ul class="first">
                        <li>
                            <label>支付方式：</label><select name="ti_paytype" style="width: 120px; margin-right: 32px; display: inline;" id="selPayMethods">
                            <option value="现金">现金</option><option value="银行卡">银行卡</option><option value="微信支付">微信支付</option><option value="支付宝支付">支付宝支付</option><option id="op1" style="display: none;" value="挂账">挂账</option></select></li>
                        <li>
                            <label>押金：</label>
                            <input id="txtDeposit" name="ti_depositfee" maxlength="8" style="width: 100px; margin-right: 25px; display: inline;" value="" type="text">
                        </li>
                        <li style="display: block;" class="prepaidpay1">
                            <label class="paytitle">操作人：</label><input value="${user.u_name }" style="border: 0;" type="text"></li>
                            <input  name="u.u_id" value="${user.u_id }" type="hidden"/>
                    </ul>
                </div>
                <ul class="first" style="display: none;" id="liBookDeposit">
                    <li>
                        <label>已交订金：</label><input id="txtBookDeposit" maxlength="10" value="0.00" type="text"></li>
                    
                </ul>
                <ul class="first" style="margin-top: 20px;">
                    <li>
                        <label>手工单号：</label><input id="ManualNumber" maxlength="20" value="" type="text">
                    </li>
                    <li style="width: 688px;">
                        <label>备注：</label><input id="txtRemark" maxlength="200" style="width: 570px;" value="" type="text"></li>
                    </ul>
            </div>
        </div>
        <div class="teamroom_foot">
            <input id="btnSubmit" class="a_butn" value="" type="submit"/>    
        </div>
    </div>
    </form>
    <input id="hidBookId" value="" type="hidden">
    <input id="hidBookNo" value="" type="hidden">
    <input id="hidTeamId" value="" type="hidden">
    <input id="txtWayPrint" value="1" type="hidden">
    


<div class="xdsoft_datetimepicker xdsoft_noselect xdsoft_"><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev" style="visibility: visible;"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>二月</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="0">一月</div><div class="xdsoft_option xdsoft_current" data-value="1">二月</div><div class="xdsoft_option " data-value="2">三月</div><div class="xdsoft_option " data-value="3">四月</div><div class="xdsoft_option " data-value="4">五月</div><div class="xdsoft_option " data-value="5">六月</div><div class="xdsoft_option " data-value="6">七月</div><div class="xdsoft_option " data-value="7">八月</div><div class="xdsoft_option " data-value="8">九月</div><div class="xdsoft_option " data-value="9">十月</div><div class="xdsoft_option " data-value="10">十一月</div><div class="xdsoft_option " data-value="11">十二月</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2017</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option xdsoft_current" data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option " data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next" style="visibility: visible;"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr><td data-date="29" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_disabled xdsoft_other_month xdsoft_weekend" title=""><div>29</div></td><td data-date="30" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_disabled xdsoft_other_month" title=""><div>30</div></td><td data-date="31" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_disabled xdsoft_other_month" title=""><div>31</div></td><td data-date="1" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_disabled" title=""><div>1</div></td><td data-date="2" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today" title=""><div>2</div></td><td data-date="3" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>3</div></td><td data-date="4" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>4</div></td></tr><tr><td data-date="5" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>5</div></td><td data-date="6" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>6</div></td><td data-date="7" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>7</div></td><td data-date="8" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>8</div></td><td data-date="9" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>9</div></td><td data-date="10" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>10</div></td><td data-date="11" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>11</div></td></tr><tr><td data-date="12" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>12</div></td><td data-date="13" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>13</div></td><td data-date="14" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>14</div></td><td data-date="15" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>15</div></td><td data-date="16" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>16</div></td><td data-date="17" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>17</div></td><td data-date="18" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>18</div></td></tr><tr><td data-date="19" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>19</div></td><td data-date="20" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>20</div></td><td data-date="21" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>21</div></td><td data-date="22" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>22</div></td><td data-date="23" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>23</div></td><td data-date="24" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>24</div></td><td data-date="25" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>25</div></td></tr><tr><td data-date="26" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>26</div></td><td data-date="27" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>27</div></td><td data-date="28" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>28</div></td><td data-date="1" data-month="2" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_other_month" title=""><div>1</div></td><td data-date="2" data-month="2" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_other_month" title=""><div>2</div></td><td data-date="3" data-month="2" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month" title=""><div>3</div></td><td data-date="4" data-month="2" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend" title=""><div>4</div></td></tr></tbody></table></div><button type="button" class="xdsoft_save_selected blue-gradient-button" style="display: none;">Save Selected</button></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time " data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time " data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time xdsoft_current" data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div></body>
</html>
