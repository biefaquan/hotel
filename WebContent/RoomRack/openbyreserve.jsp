<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
<title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	//关闭本界面
	function closewindow() {
		$.ajax({
			url:"/hotel/RegistrationInforController/deleteallcustomer1",
			type:"POST",
			data:null,
			dataType:"json",
			success:function(c){
		},
		error:function(){
		}
	  });
		var div2 = parent.document.getElementById("div2");
		div2.style.display = "none";
	}
	//根据开房方式确定价格
	function ChoseType(opentype) {
		var Price = document.getElementById("Price");
		var rt_price = document.getElementById("rt_price").value;
		if(opentype.value=="天房"){
			Price.value=rt_price;
			ChangMoney();
		}else if(opentype.value=="月租房"){
			Price.value=rt_price*30;
			ChangMoney();
		}else if(opentype.value=="午夜房"){
			Price.value=rt_price/2;
			ChangMoney();
		}
	}
	//根据开房方式确定价格
	function SourceType(source) {
		var hyid = document.getElementById("hyid");
		var xydw = document.getElementById("xydw");
		var li1 = document.getElementById("li1");
		var op01 = document.getElementById("op01");
		var cardno = document.getElementById("CardNo");
		if(source.value=="会员"){
			hyid.style.display="block";
			xydw.style.display="none";
			li1.style.display="block";
			op01.style.display="none";
			cardno.value=null;
		}else if(source.value=="协议单位"){
			hyid.style.display="none";
			xydw.style.display="block";
			li1.style.display="block";
			op01.style.display="none";
			cardno.value=null;
		}else if(source.value=="客人自入"){
			li1.style.display="none";
			op01.style.display="none";
			cardno.value=null;
		}
	}
	//“-”和“+”的功能实现
	function AddNum() {
		var Days = document.getElementById("Days");
		Days.value++;
		ChangMoney();
	}
	function DelNum() {
		var Days = document.getElementById("Days");
		if(Days.value>1){
			Days.value--;
			ChangMoney();
		}
	}
	//计算总房价
	function ChangMoney(){
		var discountrate = document.getElementById("discountrate").value;
		var Days = document.getElementById("Days").value;
		var Price = document.getElementById("Price").value;
		var AllMoney = document.getElementById("AllMoney");
		if(discountrate==""){
			AllMoney.value = Days*Price;
		}else{
			AllMoney.value = Days*Price*discountrate/100;
		}
	}
	//展开功能
	function OpenCumster() {
		var otherdiv = document.getElementById("othercumster");
		otherdiv.style.display="block";
	}
	
	$(function(){
		//将下拉列表确定
		var source = "${rr.rr_source}";
		$("#Source").val(source);
		if(source=="会员"){
			$("#hyid").show();
			$("#xydw").hide();
			$("#li1").show();
			$("#CardNo").val("${m.m_cardnum}");
			$("#rr_typenum").val("${m.m_id}");
			$("#discountrate").val("${m.mt.mt_discountrate}");
		}else if(source=="协议单位"){
			$("#hyid").hide();
			$("#xydw").show();
			$("#li1").show();
			$("#CardNo").val("${a.a_cardnum}");
			$("#rr_typenum").val("${a.a_id}");
			$("#discountrate").val("${a.a_discountrate}");
		}
		//确定预订天数（预订时的天数）
		var start=new Date("${rr.rr_startdate}").toLocaleDateString();
   		var end=new Date("${rr.rr_enddate}").toLocaleDateString();
 		start=start.replace(/-/g,"/");
		var startdate=new Date(start);
 		end=end.replace(/-/g,"/");
		var enddate=new Date(end);
		var time=enddate.getTime()-startdate.getTime();
		var days=parseInt(time/(1000 * 60 * 60 * 24));
		$("#Days").val(days);
		
		//判断会员卡号和协议单位存不存在
		$("#CardNo").blur(function(){
			var Source = $("#Source").val();
			if(Source=="会员"){
				$.ajax({
					url:"/hotel/MemberController/queryByCardnum",
					type:"POST",
					data:"m_cardnum="+this.value,
					dataType:"json",
					success:function(m){
						if(m!=null){
							alert("会员存在，可用");
							var year = new Date(m.c.c_birthday).getFullYear();
							var month = new Date(m.c.c_birthday).getMonth()+1;
							month = month<10?("0"+month):month;
							var day = new Date(m.c.c_birthday).getDate();
							day = day<10?("0"+day):day;
							var birthday = year+"-"+month+"-"+day;
							$("#Customer_Name").val(m.c.c_name);
							$("#Customer_Id").val(m.c.c_id);
							$("#Customer_CardType").val(m.c.c_idtype);
							$("#Customer_CardNo").val(m.c.c_idcard);
							$("#Customer_Phone").val(m.c.c_phone);
							$("#Customer_Birthday").val(birthday);
							$("#Customer_Sex").val(m.c.c_sex);
							$("#Customer_Ethnic").val(m.c.c_nation);
							$("#Customer_Address").val(m.c.c_adress);
							$("#ri_typenum").val(m.m_id);
							//进行会员折扣
							$("#discountrate").val(m.mt.mt_discountrate);
							ChangMoney();
						}else{
							alert("会员不存在，请换来源方式！！");
						}
					},
					error:function(){
						alert("会员不存在，请换来源方式！！");
						$("#Customer_Name").val(null);
						$("#Customer_Id").val(null);
						$("#Customer_CardType").val(null);
						$("#Customer_CardNo").val(null);
						$("#Customer_Phone").val(null);
						$("#Customer_Birthday").val(null);
						$("#Customer_Sex").val(null);
						$("#Customer_Ethnic").val(null);
						$("#Customer_Address").val(null);
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
							ChangMoney();
							//确定是否可挂账（如存在在下拉列表显示）
							if(a.a_accountstate==1){
								$("#op01").show();
							}else{
								$("#op01").hide();
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
		//添加随客信息
		$("#btnSave").click(function(){
			var vform = $("#myadd").serialize();
			$.ajax({
				url:"/hotel/RegistrationInforController/addcustomer",
				type:"POST",
				data:vform,
				dataType:"json",
				success:function(c){
				$("#table1 tbody").append("<tr><td>"+c.c_name+"</td><td>"+c.c_birthday+"</td><td>"+c.c_sex+"</td><td>"+c.c_nation+"</td><td>"+c.c_idtype+"</td><td>"+c.c_idcard+"</td><td>"+c.c_adress+"</td><td><a onclick='Delete(this)'>删除</a></td></tr>");
			},
			error:function(){
				alert("系统错误！！");
			}
		  });
		});
		//将随客信息置空
		$("#btnDel").click(function(){
			$("#c_name").val(null);
			$("#c_birthday").val(null);
			$("#c_sex").val(null);
			$("#c_nation").val(null);
			$("#c_idtype").val(null);
			$("#c_idcard").val(null);
			$("#c_adress").val(null);
		});
		//根据房号确定价格
		$("#RoomTypeId").change(function(){
			var r_id = $("#RoomTypeId").val();
			$.ajax({
				url:"/hotel/ReserveRoomController/queryRoomById",
				type:"POST",
				data:"r_id="+r_id,
				dataType:"json",
				success:function(r){
					$("#Price").val(r.rt.rt_price);
					$("#rt_price").val(r.rt.rt_price);
					ChangMoney();
			},
			error:function(){
				$("#Price").val(null);
				$("#rt_price").val(r.rt.rt_price);
			}
		  });
		});
	});
	//动态删除行
	function Delete(td) {
		var tr = $(td).parent().parent();
		var c_idcard=tr.children().eq(5).text();
		$.ajax({
			url:"/hotel/RegistrationInforController/deletecustomer",
			type:"POST",
			data:"c_idcard="+c_idcard,
			dataType:"json",
			success:function(c){
		},
		error:function(){
		}
	  });
		tr.remove();
	}
	/*//动态复制添加div
	function AddDiv() {
		var otherdiv = document.getElementById("othercumster");
		var v=document.createElement("div");
		v.innerHTML=otherdiv.innerHTML;
		document.getElementById("addbtn").parentNode.appendChild(v);
	}*/
	function Checked() {
		//手机验证
		var phone = document.getElementById('Customer_Phone').value;
	    if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        alert("手机号码有误，请重填");  
	        return false; 
	    }
	    //身份证验证
	    var idcard = document.getElementById('Customer_CardNo').value;
	    if(!(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/.test(idcard))){
	    	alert("身份证有误，请重填");  
	        return false;
	    }
	    //所有验证通过
	    return true;
	}
</script>
<link media="all" href="/hotel/css/roomrack/open.css" type="text/css" rel="stylesheet">
</head>

<body>
    <!--入住弹出窗口-->
    <form id="myadd" action="/hotel/RegistrationInforController/add2" target="_top" method="post" onsubmit="return Checked()">
    <div class="ruzhu_infor" style="width: 860px;">
        <div class="line">
            <div class="fl ordertitle">预订转入住信息</div>
            <div class="errortips" id="btnRead"></div>
            <div class="errortips" id="prompt"></div>
            <div class="fr bookno none">预定单号：<span id="BookNo"></span></div>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <ul>
                <li>
                    <label style="width: 50px;">房号：</label>
                    <select name="r.r_id" style="width: 140px; margin-right: 40px; display: inline;" id="RoomTypeId">
          				<option value="${room.r_id }">${room.r_roomnum }</option>
                    </select></li>
                <li id="li1" style="position: relative;display: none" id="MemberCardli">
                    <label id="hyid"><b style="color: red;">*</b>会员卡号：</label>
                    <label id="xydw" style="display: none"><b style="color: red;">*</b>协议单位：</label>
                    <div class="dis_yes" style="float: left;">
                        <input id="CardNo" style="width: 290px; margin-right: 0px; display: inline;" autocomplete="off" class="ac_input" type="text"/>
                        <input id="ri_typenum" name="ri_typenum" type="hidden"/>
                        <input id="discountrate" type="hidden"/>
                        <input name="rr_id" value="${rr.rr_id }" type="hidden"/>
                    </div>
                    <div class="dis_no" style="display: none; float: left;">
                        <input id="" value="酒店未开通会员功能" style="width: 290px; margin-right: 0px; display: inline;" disabled="" type="text"/>
                        <a href="#" id="OpenModelSet" style="text-align: right; position: absolute; right: 10px; top: 5px"/>开通功能</a>
                    </div>
                </li>
            </ul>
            <ul>
                <li>
                    <label style="width: 50px;">来源：</label>
                    <select name="ri_source" onchange="SourceType(this)" style="width: 140px; margin-right: 40px; display: inline;" id="Source">
                    <option value="客人自入">客人自入</option><option value="会员">会员</option><option value="协议单位">协议单位</option></select></li>
               
                <li>
                    <label>开房方式：</label>
                    <select name="ri_keyway" id="OpenType" onchange="ChoseType(this)" style="width: 112px; margin-right: 27px; display: inline;">
                        <option value="天房">天房</option>
                        
                        <option value="月租房">月租房</option>
                        <option value="午夜房">午夜房</option>
                    </select></li>
                <li>
                    <label style="margin-left: 20px;">房价：</label>
                    <input style="width: 70px; display: inline;background: rgb(238, 238, 238);" id="Price" onchange="ChangMoney()" class="input_keynote" maxlength="8"  value="${room.rt.rt_price }" readonly="readonly"  type="text">
                    <input id="rt_price" value="${room.rt.rt_price }" type="hidden">
                	
                </li>
                <li>
                    <label data-type="day">预住天数：</label>
                    <input onclick="DelNum()" value="-" class="jia reduceDays" style="margin-right: -1px;" type="button"/>
                    <input name="ri_days" style="width: 60px;" value="1" id="Days" type="text" onchange="ChangMoney()"/>
                    <input onclick="AddNum()" value="+" class="jia addDays" style="margin-left: -1px; margin-right: 22px; display: inline;" type="button"/></li>
                <li>
                    <label style="width: 50px;">时间：</label>
                    <input name="ri_opentime" id="EnterDate" value="<fmt:formatDate value="${nowdate }" pattern="yyyy-MM-dd HH:mm" />" readonly="readonly" style="width: 132px; margin-right: 40px; display: inline; background: rgb(238, 238, 238) none repeat scroll 0% 0%;" type="text">
                </li>
                <!-- <li>
                    <label>预离时间：</label><input id="WantLeaveDate" style="width: 106px; margin-right: 27px; display: inline;" value="2017-01-15 13:00" type="text">
                </li> -->
                
            </ul>
        </div>

        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <ul>
                <li>
                    <label style="width: 50px;"><b style="color: red;">*</b>姓名：</label>
                    <input name="c.c_name" id="Customer_Name" maxlength="20" style="width: 132px; margin-right: 40px; display: inline;" autocomplete="off" class="ac_input" type="text"/>
                    <input name="c.c_id" id="Customer_Id" value="0" type="hidden"/>
                </li>
                <li>
                    <label>证件类型：</label>
                    <select name="c.c_idtype" id="Customer_CardType" style="width: 120px; margin-right: 40px; display: inline;">
                        <!--<option value="">请选择证件类型</option>-->
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select></li>
                <li style="position: relative;">
                    <label><b style="color: red;">*</b>证件号码：</label><input name="c.c_idcard" id="Customer_CardNo" maxlength="20" style="width: 284px;" value="" type="text">
                    <a href="javascript:void(0);" id="btnCustomer" class="history" style="display: none;">查看客史</a>
                </li>
                <!--<li>
                    <label>人数：</label>
                    <input type="button" value="+" class="jia addPersonCount" style="margin-right: -1px;" />
                    <input type="text" style="width: 20px" value="1" id="PersonCount" />
                    <input type="button" value="-" class="jia reducePersonCount" style="margin-left: -1px;" /></li>-->
            </ul>
            <ul>
                <li>
                    <label style="width: 50px;"><b style="color: red;">*</b>电话：</label><input name="c.c_phone" id="Customer_Phone" maxlength="20" style="width: 132px; margin-right: 40px;" type="text"></li>
                <li>
                    <label>出生年月：</label><input name="c.c_birthday" id="Customer_Birthday" style="width: 112px; margin-right: 40px; display: inline;" value="" type="text" onclick="laydate()"/></li>
                <li>
                    <label>性别：</label>
                    <select name="c.c_sex" id="Customer_Sex" style="width: 60px; margin-right: 15px; display: inline;">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select></li>
                <li>
                    <label style="width: 50px;">民族：</label>
                    <select name="c.c_nation" id="Customer_Ethnic" style="width: 158px; margin-right: 0px; display: inline;">
                     <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select></li>
                <li>
                    <label style="width: 50px;">地址：</label><input name="c.c_adress" id="Customer_Address" maxlength="100" style="width: 786px;" value="" type="text"></li>
            </ul>
        </div>
        <div class="types" style="margin-top: 0px;">
            <h1 style="padding-bottom: 0px; border-bottom: 1px solid rgb(221, 221, 221);">
                <div class="fr">
                    <span style="font-size: 12px;">新增随客信息</span>
                    <a onclick="OpenCumster()" class="sss btnOpenCustomer">展开&gt;&gt;</a>
                </div>
            </h1>
            <div id="othercumster" class="divOtherCustomer none" style="display: none;">
                <table id="table1" class="ruzhu" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>姓名</th>
                            <th>出生年月</th>
                            <th>性别</th>
                            <th>民族</th>
                            <th>证件类型</th>
                            <th width="160">证件号码</th>
                            <th width="180">地址</th>
                            <th width="65">操作</th>
                        </tr>
                    </thead>
                   
                   
                    <tbody>
                    <tr>
                <td>
                    <input id="c_name" name="c_name" maxlength="25" type="text"></td>
                <td>
                    <input id="c_birthday" name="c_birthday" onclick="laydate()" class="OtherCustomer_Birthday" value="" type="text"></td>
                <td>
                    <select id="c_sex" name="c_sex">
                        <option>男</option>
                        <option>女</option>
                    </select></td>
                <td>
                    <select id="c_nation" name="c_nation">
                      <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select></td>
                <td>
                    <select id="c_idtype" name="c_idtype">
                        <!--<option value="">请选择</option>-->
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select></td>
                <td>
                    <input id="c_idcard" name="c_idcard" maxlength="20" style="width: 160px;" value="" type="text"></td>
                <td>
                    <input id="c_adress" name="c_adress" maxlength="100" style="width: 160px;" value="" type="text"></td>
                <td>
                    <input name="RowData" type="hidden"/>
                    <input name="RowState" value="1" type="hidden"/>
                    <a id="btnSave" class="btnSave">
                        <img src="/hotel/img/roomrack/save.png" alt="" height="12" width="12"/></a>
                    <a id="btnDel">
                        <img src="/hotel/img/roomrack/010.gif" alt="" height="12" width="12"/></a>
                </td>
            </tr></tbody>
                </table>
                <input id="addbtn" onclick="AddDiv()" value="+" class="butn btnAddOtherCustomer" type="button"/>
            </div>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <div id="divZF">
                <ul>
                    <li>
                        <label>支付方式：</label>
                        <select name="ri_paytype" id="PayMethod" style="width: 120px; margin-right: 32px; display: inline;">
                            <!--<option value="">请选择支付方式</option>-->
                        <option value="现金">现金</option><option value="银行卡">银行卡</option><option value="微信支付">微信支付</option><option value="支付宝支付">支付宝支付</option><option id="op01" style="display: none;" value="挂账">挂账</option></select>
                    </li>
                    <li>
                        <label>押金：</label><input name="ri_depositfee" id="Deposit" value="0" maxlength="8" class="input_keynote" style="width: 100px; margin-right: 25px; display: inline;" type="text"/></li>
                    <li style="display: none;" class="prepaidpay1">
                        <label class="paytitle">会员卡号：</label><input disabled="disabled" name="MemberCardNo" value="" type="text"><a href="javascript:void(0)" onclick="payment(this)" style="padding-left: 10px; margin-top: 5px; line-height: 24px;">选择</a></li>
                   
                </ul>
            </div>
            <ul>
                <li class="bookdeposit none">
                    <label>已交订金：</label><input id="BookDeposit" value="" maxlength="10" readonly="readonly" style="width: 113px; margin-right: 32px; display: inline;" type="text"></li>
                <li class="">
                    <label>业务员：</label>
                   		<input value="${user.u_name }" readonly="readonly" type="text" style="width: 112px; margin-right: 40px; display: inline;background: rgb(238, 238, 238) none repeat scroll 0% 0%;"/>
                   		<input name="u.u_id" value="${user.u_id }" type="hidden"/>
                    </li>
                <li>
                    <label>总房价：</label><input id="AllMoney" name="ri_allmoney" value="${room.rt.rt_price }" readonly="readonly" style="width: 100px; margin-right: 20px; display: inline; background: rgb(238, 238, 238) none repeat scroll 0% 0%;border: 0"/>
                </li>
                <li class="bookdeposit none">
                    <!--<label>已转订金：</label><input id="ReduceDeposit" value="0.00" maxlength="10" readonly="readonly" type="text" style="width: 100px; margin-right: 0px; display: inline" />-->
                </li>
                </ul>
            <ul>
                
                <li>
                    <label style="display: none;">床号：</label><input id="BedNo" maxlength="20" style="display: none;" value="" type="text">
                </li>
                <li style="width: 100%;">
                    <label>备注：</label><textarea name="ri_reward" id="Remark" rows="4" cols="80"></textarea></li>
            </ul>
        </div>
        <div class="types">
            <ul style="margin-left:350px; width: 390px;">
                <li>
                    <input class="bus_add" id="btnSubmit" value="开房" type="submit"></li>
                <li>
                    <input onclick="closewindow()" class="bus_dell " id="btnClose" value="关闭" style="margin-right: 0px;" type="button"></li>
            </ul>
        </div>
    </div>
    </form>
    <table id="divEditRow" class="none">
        <tbody>
            <tr>
                <td>
                    <input name="RowName" maxlength="25" value="" type="text"></td>
                <td>
                    <input name="RowBirthday" class="OtherCustomer_Birthday" value="" type="text"></td>
                <td>
                    <select name="RowSex">
                        <option>男</option>
                        <option>女</option>
                    </select></td>
                <td>
                    <select name="RowEthnic">
                        <option value="">请选择</option>
                    <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select></td>
                <td>
                    <select name="RowCardType">
                        <!--<option value="">请选择</option>-->
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select></td>
                <td>
                    <input name="RowCardNo" maxlength="20" style="width: 160px;" value="" type="text"></td>
                <td>
                    <input name="RowAddress" maxlength="100" style="width: 160px;" value="" type="text"></td>
                <td>
                    <input name="RowData" type="hidden">
                    <input name="RowState" value="1" type="hidden">
                    <a href="javascript:void(0)" class="btnSave" onclick="RowSave(this)">
                        <img src="/hotel/img/roomrack/save.png" alt="" height="12" width="12"></a>
                    <a href="javascript:void(0)" onclick="RowDelete(this)">
                        <img src="010.gif" alt="" height="12" width="12"></a>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="divDetailRow" class="none">
        <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input name="RowData" type="hidden">
                    <input name="RowState" value="0" type="hidden">
                    <a href="javascript:void(0)" onclick="RowEdit(this)">
                        <img src="037.gif" alt="" height="12" width="12"></a>
                    <a href="javascript:void(0)" onclick="RowDelete(this)">
                        <img src="010.gif" alt="" height="12" width="12"></a></td>
            </tr>
        </tbody>
    </table>


</html>
