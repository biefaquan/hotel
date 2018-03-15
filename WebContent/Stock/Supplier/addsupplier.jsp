<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
    
<script type="text/javascript">
	//关闭本界面
	function closewindow() {
		var div1 = parent.document.getElementById("div1");
		div1.style.display = "none";
	}
	function Checked() {
		//验证编号
		var bh = document.getElementById('BH').value;
	    if(bh==""){ 
	        alert("编号不能为空！！"); 
	        return false; 
	    }
	  //验证姓名
		var mc = document.getElementById('MC').value;
	    if(mc==""){ 
	        alert("名称不能为空！！"); 
	        return false; 
	    }
	  //验证联系人
		var name = document.getElementById('name').value;
	    if(name==""){ 
	        alert("联系人不能为空！！"); 
	        return false; 
	    }
	  //手机验证
		var phone = document.getElementById('phone').value;
	    if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        alert("电话号码有误，请重填");  
	        return false; 
	    }
	  //验证地址
		var adress = document.getElementById('adress').value;
	    if(adress==""){ 
	        alert("地址不能为空！！"); 
	        return false; 
	    }
	    //所有验证通过
	    return true;
	}
</script>

<link media="all" href="/hotel/css/stock/stockinfor/addstock.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="pop">
            

<form action="/hotel/SupplierController/add" target="_top" method="post" onsubmit="return Checked()" novalidate="novalidate"><div class="line">添加供应商</div>
<ul>
     <li>
        <label><b style="color: red;">*</b>单位编号：</label><input id="BH" maxlength="30" name="s_num" value="" type="text"/> </li>
    <li>
        <label><b style="color: red;">*</b>单位名称：</label><input id="MC" maxlength="50" name="s_name" value="" type="text"/></li>
   <li>
        <label><b style="color: red;">*</b>联系人：</label><input id="name" maxlength="50" name="s_linkman" value="" type="text"/></li>
   <li>
        <label><b style="color: red;">*</b>联系电话：</label><input id="phone" maxlength="50" name="s_linkphone" value="" type="text"/></li>
   <li>
        <label><b style="color: red;">*</b>联系地址：</label><input id="adress" maxlength="50" name="s_adress" value="" type="text"/></li>
   <li>
        <label>传真：</label><input id="MC" maxlength="50" name="s_fax" value="" type="text"/></li>
    <li style="height: auto;">
        <label>备注：</label><textarea cols="20" id="BZ" maxlength="300" name="s_reward" rows="2"></textarea> <span class="field-validation-valid prompt" data-valmsg-for="BZ" data-valmsg-replace="true"></span></li>
    <li>
        <label>状态：</label>
        <input checked="checked" class="radio" id="ZT" name="s_state" value="1" type="radio"><p>启用</p>
        <input class="radio" id="ZT" name="s_state" value="0" type="radio"><p>停用</p>
    </li>

    <li>
        <label>&nbsp;</label><input value="确认" class="bus_add" id="btnSubmit" type="submit"/>
        <input value="关闭" class="bus_dell" onclick="closewindow()" type="button"/s></li>
</ul>
</form>
        </div>
    </div>


</body>
</html>
