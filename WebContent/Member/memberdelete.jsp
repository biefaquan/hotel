<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function CloseAddMoney() {
		var div7=parent.document.getElementById("div7");
		div7.style.display="none";
	}
	
	$(function(){
		$("#btnQuery").click(function(){
			var m_cardnum = $("#CardNo").val();
			$.ajax({
				url:"/hotel/MemberController/queryByCardnum",
				type:"POST",
				data:"m_cardnum="+m_cardnum,
				dataType:"json",
				success:function(m){
					//$("#yzm").val(data);
					if(m!=null){
						$("#name").val(m.c.c_name);
						$("#idtype").val(m.c.c_idtype);
						$("#idcard").val(m.c.c_idcard);
						$("#m_id").val(m.m_id);
						$("#membertype").val(m.mt.mt_name);
						$("#birthday").val(new Date(m.c.c_birthday).toLocaleDateString());
						$("#uname").val(m.u.u_name);
						$("#phone").val(m.c.c_phone);
						$("#like").val(m.c.c_like);
						$("#adress").val(m.c.c_adress);
						$("#reward").val(m.c.c_reward);
						$("#money").val(m.m_money);
						if(m.m_state==-1){
							$("#state").val("作废");
						}else if(m.m_state==-0){
							$("#state").val("挂失");
						}else if(m.m_state==1){
							$("#state").val("可用");
						}
						$("#date").val(new Date(m.m_date).toLocaleDateString());
					}else{
						alert("会员不存在，请联系管理员！！");
					}
				},
				error:function(){
					alert("会员不存在，请联系管理员！！");
				}
			});
		});
	});
	//表单验证
	function IsOK() {
		var bool=document.getElementById("name").value;
		if(bool==""){
			alert("请先验证卡号是否可用！！");
			return false;
		}
	    return true;
	}
</script>
    
    
    

<link media="all" href="/hotel/css/member/memberaddmoney.css" type="text/css" rel="stylesheet">
</head>
<body>
	<form action="/hotel/MemberController/delete" target="_top" method="post" onsubmit="return IsOK()">
    <div class="vip_infor" style="width: 800px;">
        <div class="line">
            <div class="fl">会员退卡</div>
            <input id="CardId" type="hidden">
            <div class="errortips" id="btnRead"></div>
            <input id="CCardNo" type="hidden">
            <input id="MemberPrepaid" value="" type="hidden">
        </div>
        <div class="types" style="margin: 0px;">
            <ul>
                <li>
                    <label><b style="color: red;">*</b>卡号：</label>
                    <input class="txt inps" id="CardNo" maxlength="20"   type="text">
                    <input class="credit" value="查询" id="btnQuery" type="button">
                    <input id="m_id" name="m_id" type="hidden"/>
                </li>
            </ul>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221); margin-top: 0px;">
            <ul>
                <li>
                    <label>姓名：</label>
                    <input id="name" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text">
                <li>
                    <label style="width: 60px;">证件：</label>
                   <input id="idtype" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label style="width: 70px;">证件号码：</label>
                   <input id="idcard" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label>类型：</label>
                    <input id="membertype" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label style="width: 60px;">生日：</label>
                    <input id="birthday" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label style="width: 70px;">销售员：</label>
                    <input id="uname" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label>手机：</label>
                    <input id="phone" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li style="width: 100%;">
                    <label>喜好：</label>
                    <input id="like" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li style="width: 100%;">
                    <label>地址：</label>
                    <input id="adress" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li style="width: 100%;">
                    <label>备注：</label>
                    <input id="reward" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
            </ul>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <ul>
                

                <li>
                    <label>余额：</label>
                    <input id="money" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text">
                </li>
               <li>
                    <label>卡片状态：</label>
                    <input id="state" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                <li>
                    <label>发卡时间：</label>
                    <input id="date" disabled="disabled" class="txt inps" style="width: 100px;" maxlength="20" type="text"></li>
                </ul>
        </div>
       
        <!--end-->
        <div class="types">
            <ul style="float: right; width: 174px;">
                <li style="">
                    <input class="bus_add " value="确定退卡" id="BtnSave" type="submit"></li>
                <li style="margin-right: 0px;">
                    <input onclick="CloseAddMoney()" class="bus_dell " id="BtnDel" value="关闭" style="margin-right: 0px;" type="button">
                </li>
            </ul>
        </div>
    </div>
</form>

</body>
</html>
