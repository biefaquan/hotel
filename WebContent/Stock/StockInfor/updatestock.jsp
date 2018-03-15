<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
<script type="text/javascript">
	//关闭本界面
	function closewindow() {
		var div2 = parent.document.getElementById("div2");
		div2.style.display = "none";
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
	    //所有验证通过
	    return true;
	}
</script>   

<link media="all" href="/hotel/css/stock/stockinfor/addstock.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="pop">
            

<form action="/hotel/StoreHouseController/update" target="_top" method="post" onsubmit="return Checked()" novalidate="novalidate"><div class="line">编辑仓库</div>
<ul>
	<input name="sh_id" value="${sh.sh_id }" type="hidden"/>
     <li>
        <label><b style="color: red;">*</b>仓库编号：</label><input id="BH" maxlength="30" name="sh_num" value="${sh.sh_num }" type="text"/> </li>
    <li>
        <label><b style="color: red;">*</b>仓库名称：</label><input id="MC" maxlength="50" name="sh_name" value="${sh.sh_name }" type="text"/></li>
   
    <li style="height: auto;">
        <label>备注：</label><textarea cols="20" id="BZ" maxlength="300" name="sh_reward" rows="2">${sh.sh_reward }</textarea> <span class="field-validation-valid prompt" data-valmsg-for="BZ" data-valmsg-replace="true"></span></li>
    <li>
        <label>状态：</label>
        <c:if test="${sh.sh_state==1 }">
        	<input checked="checked" class="radio" id="ZT" name="sh_state" value="1" type="radio"><p>启用</p>
        	<input class="radio" id="ZT" name="sh_state" value="0" type="radio"><p>停用</p>
        </c:if>
        <c:if test="${sh.sh_state==0 }">
        	<input class="radio" id="ZT" name="sh_state" value="1" type="radio"><p>启用</p>
        	<input checked="checked" class="radio" id="ZT" name="sh_state" value="0" type="radio"><p>停用</p>
        </c:if>
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
