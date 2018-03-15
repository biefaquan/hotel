<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript">
	//页面初始化
	$(function(){
		$("#Customer_CardType").val("${customer.c_idtype}");
		$("#Customer_Sex").val("${customer.c_sex}");
		$("#Customer_Ethnic").val("${customer.c_nation}");
		//添加随客信息
		$("#btnSave").click(function(){
			var vform = $("#myadd").serialize();
			$.ajax({
				url:"/hotel/RegistrationInforController/addcustomer",
				type:"POST",
				data:vform,
				dataType:"json",
				success:function(c){
					$("#table1 tbody").append("<tr><td style='display:none;'>"+c.c_id+"</td><td>"+c.c_name+"</td><td>"+c.c_birthday+"</td><td>"+c.c_sex+"</td><td>"+c.c_nation+"</td><td>"+c.c_idtype+"</td><td>"+c.c_idcard+"</td><td>"+c.c_adress+"</td><td><a onclick='Delete(this)'>删除</a></td></tr>");
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
	});
	//动态删除行
	function Delete(td) {
		var tr = $(td).parent().parent();
		var c_idcard=tr.children().eq(6).text();
		var c_id = tr.children().eq(0).text();
		var r_id = "${r_id}";
		$.ajax({
			url:"/hotel/RegistrationInforController/deletecustomer",
			type:"POST",
			data:"c_idcard="+c_idcard+"&c_id="+c_id+"&r_id="+r_id,
			dataType:"json",
			success:function(c){
		},
		error:function(){
		}
	  });
		tr.remove();
	}
	//关闭界面
	function closewindow() {
		var div6 = parent.document.getElementById("div6");
		div6.style.display = "none";
	}
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


<link media="all" href="/hotel/css/roomrack/updatecustomer.css" type="text/css" rel="stylesheet">
</head>
<body>
<form id="myadd" action="/hotel/RegistrationInforController/updateCustomer" target="_top" method="post" onsubmit="return Checked()">
    <!--楼层弹出窗口-->
    <div class="ruzhu_infor" style="width: 860px;">
        <div class="line">
            <div class="fl">修改住客信息</div>
            <div class="errortips" id="btnRead"></div>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <ul>
                <li>
                    <label style="width: 50px;"><b style="color: red;">*</b>姓名：</label>
                    <input name="c.c_name" id="Customer_Name" maxlength="20" style="width: 130px; margin-right: 40px; display: inline;" value="${customer.c_name }" type="text">
                    <input name="c.c_id" value="${customer.c_id }" type="hidden"/>
                </li>
                <li>
                    <label>证件类型：</label>
                    <select name="c.c_idtype" id="Customer_CardType" style="width: 118px; margin-right: 80px; display: inline;">
                        
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select>
                </li>
                <li>
                    <label><b style="color: red;">*</b>证件号码：</label>
                    <input name="c.c_idcard" id="Customer_CardNo" maxlength="20" style="width: 240px;" value="${customer.c_idcard }" type="text">
                </li>
            </ul>
            <ul>
                <li>
                    <label style="width: 50px;"><b style="color: red;">*</b>电话：</label>
                    <input name="c.c_phone" id="Customer_Phone" maxlength="20" style="width: 130px; margin-right: 40px; display: inline;" value="${customer.c_phone }" type="text">
                </li>
                <li>
                    <label>出生年月：</label>
                    <input name="c.c_birthday" id="Customer_Birthday" style="width: 110px; margin-right: 80px; display: inline;" value="<fmt:formatDate value='${customer.c_birthday }' pattern='yyyy-MM-dd' />" type="text"></li>
                <li>
                    <label>性别：</label>
                    <select name="c.c_sex" id="Customer_Sex" style="width: 60px; margin-right: 10px; display: inline;">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </li>
                <li>
                    <label style="width: 50px;">民族：</label>
                    <select name="c.c_nation" id="Customer_Ethnic" style="width: 118px; margin-right: 0px; display: inline;">
                        <option value="">请选择民族</option>
                    <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select></li>
                <li>
                    <label style="width: 50px;">地址：</label>
                    <input name="c.c_adress" id="Customer_Address" maxlength="100" style="width: 778px;" value="${customer.c_adress }" type="text">
                </li>
            </ul>
        </div>
        <div class="types">
            <div class="divOtherCustomer">
                <table id="table1" class="ruzhu" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>姓名</th>
                            <th>出生年月</th>
                            <th>性别</th>
                            <th>民族</th>
                            <th>证件类型</th>
                            <th>证件号码</th>
                            <th>地址</th>
                            <th>操作</th>
                        </tr>
                    </thead>
         <tbody>
            <tr>
         		<td>
         			<input id="c_name" name="c_name" style="width: 50px" type="text"/>
         		</td>
         		<td>
         			<input id="c_birthday" name="c_birthday" style="width: 50px" type="text" onclick="laydate()"/>
         		</td>
         		<td>
         			<select id="c_sex" name="c_sex">
                        <option>男</option>
                        <option>女</option>
                    </select>
         		</td>
         		<td>
         			<select id="c_nation" name="c_nation">
                        <option value="">请选择</option>
                    <option value="汉族">汉族</option><option value="阿昌族">阿昌族</option><option value="白族">白族</option><option value="保安族">保安族</option><option value="布朗族">布朗族</option><option value="布依族">布依族</option><option value="朝鲜族">朝鲜族</option><option value="达斡尔族">达斡尔族</option><option value="傣族">傣族</option><option value="德昂族">德昂族</option><option value="侗族">侗族</option><option value="东乡族">东乡族</option><option value="独龙族">独龙族</option><option value="鄂伦春族">鄂伦春族</option><option value="俄罗斯族">俄罗斯族</option><option value="鄂温克族">鄂温克族</option><option value="高山族">高山族</option><option value="仡佬族">仡佬族</option><option value="哈尼族">哈尼族</option><option value="哈萨克族">哈萨克族</option><option value="赫哲族">赫哲族</option><option value="回族">回族</option><option value="基诺族">基诺族</option><option value="京族">京族</option><option value="景颇族">景颇族</option><option value="柯尔克孜族">柯尔克孜族</option><option value="拉祜族">拉祜族</option><option value="黎族">黎族</option><option value="傈僳族">傈僳族</option><option value="珞巴族">珞巴族</option><option value="满族">满族</option><option value="毛南族">毛南族</option><option value="门巴族">门巴族</option><option value="蒙古族">蒙古族</option><option value="苗族">苗族</option><option value="仫佬族">仫佬族</option><option value="纳西族">纳西族</option><option value="怒族">怒族</option><option value="普米族">普米族</option><option value="羌族">羌族</option><option value="撒拉族">撒拉族</option><option value="畲族">畲族</option><option value="水族">水族</option><option value="塔吉克族">塔吉克族</option><option value="塔塔尔族">塔塔尔族</option><option value="土族">土族</option><option value="土家族">土家族</option><option value="佤族">佤族</option><option value="维吾尔族">维吾尔族</option><option value="乌兹别克族">乌兹别克族</option><option value="锡伯族">锡伯族</option><option value="瑶族">瑶族</option><option value="彝族">彝族</option><option value="裕固族">裕固族</option><option value="藏族">藏族</option><option value="壮族">壮族</option></select>
         		</td>
         		<td>
         			<select id="c_idtype" name="c_idtype">
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select></td>
                </td>
         		<td>
         			<input id="c_idcard" name="c_idcard" type="text"/>
         		</td>
         		<td>
         			<input id="c_adress" name="c_adress" type="text"/>
         		</td>
         		<td>
         			<a id="btnSave" class="btnSave">
                        <img src="/hotel/img/roomrack/save.png" alt="" height="12" width="12"/></a>
                    <a id="btnDel">
                        <img src="/hotel/img/roomrack/010.gif" alt="" height="12" width="12"/></a>
         		</td>
         	</tr>
         <c:forEach items="${list }" var="c">
         	<tr>
         		<td style="display: none;">${c.c_id }</td>
         		<td>
         			${c.c_name }
         		</td>
         		<td>
         			<fmt:formatDate value="${c.c_birthday }" pattern="yyyy-MM-dd" />
         		</td>
         		<td>
         			${c.c_sex }
         		</td>
         		<td>
         			${c.c_nation }
         		</td>
         		<td>
         			${c.c_idtype }
         		</td>
         		<td>
         			${c.c_idcard }
         		</td>
         		<td>
         			${c.c_adress }
         		</td>
         		<td>
         			<a onclick="Delete(this)">删除</a>
         		</td>
         	</tr>
         </c:forEach>
         </tbody>
                </table>
               </div>
        </div>

        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);">
            <ul>
                <li>
                    <label>系统备注：</label>
                    <textarea id="SysRemark" rows="4" cols="80" readonly="readonly">${customer.c_reward }</textarea>
                </li>
            </ul>
            <ul>
                <li class="">
                    <label>业务员：</label>
                    <input value="${user.u_name }" readonly="readonly" type="text"/>
                    <label style="display: none;">床号：</label><input id="BedNo" maxlength="20" style="display: none;" value="" type="text">
                </li>
            </ul>
        </div>
        <div class="types">
            
            <ul style="float: right; width: 184px;">
                <li style="">
                    <input class="bus_add" id="btnSubmit" value="修改" type="submit"></li>
                <li style="margin-right: 0px;">
                    <input onclick="closewindow()" class="bus_dell " id="btnClose" value="关闭" style="margin-right: 0px;" type="button"></li>
            </ul>
        </div>
    </div>
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
                    <input name="RowId" value="0" type="hidden">
                    <a href="javascript:void(0)" class="btnSave" onclick="RowSave(this)">
                        <img src="save.png" height="12" width="12"></a>
                    <a href="javascript:void(0)" onclick="RowDelete(this)">
                        <img src="010.gif" height="12" width="12"></a></td>
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
                    <input name="RowData" type="hidden"/>
                    <input name="RowState" value="0" type="hidden"/>
                    <input name="RowId" value="0" type="hidden"/>
                    <a href="javascript:void(0)" onclick="RowEdit(this)">
                        <img src="037.gif" height="12" width="12"/></a>
                    <a href="javascript:void(0)" onclick="RowDelete(this)">
                        <img src="010.gif" height="12" width="12"/></a></td>
            </tr>
        </tbody>
    </table>

    <input name="selecttype" value="${selecttype }" type="hidden"/>
    <input name="selectid" value="${selectid }" type="hidden"/>
    <input name="r_id" value="${r_id }" type="hidden"/>
    <input name="keyway" value="${keyway }" type="hidden"/>
    <input name="opentime" value="${opentime }" type="hidden"/>
    <input name="days" value="${days }" type="hidden"/>
    <input name="money" value="${money }" type="hidden"/>
	
	</form>
	
</body>
</html>
