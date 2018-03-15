<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript">
	function BtnClose() {
		var div1 = parent.document.getElementById("div1");
		div1.style.display="none";
	}
</script> 

<link media="all" href="/hotel/css/set/setemployee/index_4.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--弹出窗口-->
    <form action="/hotel/UserController/add" target="_top" method="post">
    <div class="pop">
        <div class="line"><div class="fl">添加员工</div>
        <div class="errortips" id="btnRead" style="float: left; font-size: 12px; width: 530px; overflow: hidden;"></div></div>
        <ul class="as">
            <li>
                <label><b style="color: red;">*</b>工号：</label><input name="u_jobnum" id="WorkNo" maxlength="10"  type="text"></li>
            <li>
                <label><b style="color: red;">*</b>姓名：</label><input name="u_name" id="Name" maxlength="10"  type="text"></li>
            <li>
                <label>性别：</label>
                <select id="Sex" name="u_sex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select></li>
            <li>
                <label>部门：</label>
                <select id="Department" name="d.d_id">
                <c:forEach items="${deptlist }" var="d">
                <option value="${d.d_id }">${d.d_name }</option>
                </c:forEach></select></li>
            <li>
                <label>职位：</label><input name="u_position" id="PYM" maxlength="25" type="text"></li>
            <li>
                <label><b style="color: red;">*</b>身份证号：</label><input name="u_idcard" maxlength="18" id="CardNo"  type="text"></li>
            <li>
                <label>学历：</label>
                <select id="Degree" name="u_school">
                    <option value="中专">中专</option>
                    <option value="大专">大专</option>
                    <option value="本科">本科</option>
                    <option value="研究生">研究生</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                    <option value="其他">其他</option>
                </select></li>
            <li>
                <label>联系地址：</label><input name="u_adress" class="rili" id="Birthday" type="text"></li>
            <li>
                <label><b style="color: red; margin-right: 5px;">*</b>手机号：</label><input name="u_phone" id="Phone" maxlength="11" type="text"></li>
            <li>
                <label>入职日期：</label><input name="startdate" id="Tel" onclick="laydate()" maxlength="15" type="text"></li>
           
            <li>
                <label>状态：</label>
                <input class="radio" name="u_state" checked="checked" value="1" type="radio"><p>在职</p>
                <input class="radio" name="u_state" value="0" type="radio"><p>离职</p>
            </li>
           
            <li style="margin: 30px 0px 10px 220px;">
                <input value="确认" class="bus_add" id="BtnAdd" onclick="this.disabled=true;this.form.submit()" type="button">
                <input onclick="BtnClose()" value="关闭" class="bus_dell" id="BtnDel" type="button">
            </li>
        </ul>
    </div>
</form>

</html>
