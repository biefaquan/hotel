<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理系统</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
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
    <form action="/hotel/GoodsController/update" target="_top" method="post">
    <div class="pop">
        <div class="line"><div class="fl">修改商品 </div>
        <div class="errortips" id="btnRead" style="float: left; font-size: 12px; width: 530px; overflow: hidden;"></div></div>
        <ul class="as">
            <li>
                <label><b style="color: red; margin-right: 5px;">*</b>商品编号：</label>
                <input name="g_id" value="${g.g_id }" id="WorkNo" maxlength="10" readonly="readonly" type="text">
            </li>
            <li>
                <label><b style="color: red; margin-right: 5px;">*</b>名称：</label>
                <input name="g_name" value="${g.g_name }" id="Name" maxlength="10"  type="text">
            </li>
            <li>
                <label>类别：</label>
                <input name="g_type" value="${g.g_type }" id="Name" maxlength="10"  type="text">
            </li>
            <li>
                <label>单位：</label>
                <input name="g_unit" value="${g.g_unit }" id="Name" maxlength="10"  type="text">
            </li>
            <li>
                <label>单价：</label>
                <input name="g_unitprice" value="${g.g_unitprice }" id="Name" maxlength="10"  type="text">
            </li>
            <li>
                <label>数量：</label>
                <input name="g_number" value="${g.g_number }" id="PYM" maxlength="25" type="text"></li>
            <li>
                <label>金额：</label>
                <input name="g_money" value="${g.g_money }" maxlength="18" id="CardNo"  type="text">
            </li>
            <li>
                <label>备注：</label>
                <input name="g_reward" value="${g.g_reward }" id="Name" maxlength="10"  type="text">
            </li>
          	<input name="sh.sh_id" value="${g.sh.sh_id }" type="hidden"/>
            <li style="margin: 30px 0px 10px 220px;">
                <input value="确认" class="bus_add" id="BtnAdd" type="submit"/>
                <input onclick="BtnClose()" value="关闭" class="bus_dell" id="BtnDel" type="button"/>
            </li>
        </ul>
    </div>
</form>

</html>
