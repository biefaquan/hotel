<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
    
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script> 
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#g_name").val(null);
		//添加退货商品信息
		$("#btnSave").click(function(){
			var vform = $("#myadd").serialize();
			$.ajax({
				url:"/hotel/StockChangeController/addGoods",
				type:"POST",
				data:vform,
				dataType:"json",
				success:function(g){
				$("#tbgoods tbody").append("<tr><td>"+g.g_name+"</td><td>"+g.g_type+"</td><td>"+g.g_unit+"</td><td>"+g.g_unitprice+"</td><td></td><td>"+g.g_number+"</td><td>"+g.g_money+"</td><td>"+g.g_reward+"</td><td><a onclick='Delete(this)'>删除</a></td></tr>");
				computeMoney(g);
			},
			error:function(){
				alert("系统错误！！");
			}
		  });
		});
		//将商品信息置空
		$("#btnDel").click(function(){
			$("#g_name").val(null);
			$("#g_type").val(null);
			$("#g_unit").val(null);
			$("#g_unitprice").val(null);
			$("#allnum").val(null);
			$("#g_number").val(null);
			$("#g_money").val(null);
			$("#g_reward").val(null);
		});
		//根据商品确定可退数量
		$("#g_name").change(function(){
			var name = this.value;
			var sh_id= $("#sc_outsh").val();
			$.ajax({
				url:"/hotel/StockListController/queryGoods",
				type:"POST",
				data:"g_name="+name+"&sh_id="+sh_id,
				dataType:"json",
				success:function(g){
					$("#g_type").val(g.g_type);
					$("#g_unit").val(g.g_unit);
					$("#g_unitprice").val(g.g_unitprice);
					$("#allnum").val(g.g_number);
					$("#g_number").val(0);
			},
			error:function(){
				$("#g_type").val(null);
				$("#g_unit").val(null);
				$("#g_unitprice").val(0);
				$("#allnum").val(0);
				$("#g_number").val(0);
			}
		  });
		});
		//调拨数量不能高于库存数
		$("#g_number").blur(function(){
			if(Number($("#g_number").val())>Number($("#allnum").val())){
				alert("大于可拨数量，请重新输入！！");
				$("#g_number").focus();
			}
		});
	});
	//动态删除行
	function Delete(td) {
		var tr = $(td).parent().parent();
		var g_name=tr.children().eq(0).text();
		//计算金额
		computeMoney1(tr.children().eq(5).text(),tr.children().eq(6).text());
		$.ajax({
			url:"/hotel/StockChangeController/deleteGoods",
			type:"POST",
			data:"g_name="+g_name,
			dataType:"json",
			success:function(c){
		},
		error:function(){
		}
	  });
		tr.remove();
	} 
	//添加商品时计算总金额
	function computeMoney(g) {
		var TotalNumber = document.getElementById("TotalNumber");
		var TotalAmount = document.getElementById("TotalAmount");
		var rl_money = document.getElementById("rl_money");
		TotalNumber.innerText=Number(TotalNumber.innerText)+Number(g.g_number);
		TotalAmount.innerText=Number(TotalAmount.innerText)+Number(g.g_money);
		rl_money.value=TotalAmount.innerText;
	}
	//删除商品时计算总金额
	function computeMoney1(num,amount) {
		var TotalNumber = document.getElementById("TotalNumber");
		var TotalAmount = document.getElementById("TotalAmount");
		var rl_money = document.getElementById("rl_money");
		TotalNumber.innerText=Number(TotalNumber.innerText)-Number(num);
		TotalAmount.innerText=Number(TotalAmount.innerText)-Number(amount);
		rl_money.value=TotalAmount.innerText;
	}
	//根据单价和数量计算金额
	function compute() {
		var g_unitprice = document.getElementById("g_unitprice").value;
		var g_number = document.getElementById("g_number").value;
		var g_money = document.getElementById("g_money");
		g_money.value = g_unitprice*g_number;
	}
	//当出库仓库改边时，商品随之改变
	function changGoods() {
		var sh_id = document.getElementById("sc_outsh").value;
		$.ajax({
			url:"/hotel/StockChangeController/queryGList",
			type:"POST",
			data:"sh_id="+sh_id,
			dataType:"json",
			success:function(glist){
				//清空下拉框
				$("#g_name").empty();
				$("#g_type").val(null);
				$("#g_unit").val(null);
				$("#g_unitprice").val(0);
				for(var i=0;i<glist.length;i++){
					$("#g_name").append("<option>"+glist[i].g_name+"</option>");
				}
				$("#g_name").val(null);
		},
		error:function(){
			alert("系统错误！！");
		}
	  });
	}
</script>
<link media="all" href="/hotel/css/stock/returnlist/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="">
            
<!--库存调拨单-->
<form id="myadd" action="/hotel/StockChangeController/add" target="_top" method="post">    
<div class="main" style="width: 1200px;">
        <img src="4.png" class="seal" style="display: none;" id="ShowT">
        <img src="2.png" class="seal" style="display: none;" id="ShowC">
        <input id="ProductData" type="hidden">
        <h1 class="titles">库存调拨单</h1>
        <div class="absult">
            <div id="divDH" style="display: none;">
                <label>单号：</label><p></p>
            </div>
            <input id="DH" name="DH" value="" type="hidden">
            <input id="CKMC" name="CKMC" type="hidden">
            <input id="JSRMC" name="JSRMC" type="hidden">
            <input id="p_data" name="p_data" value="" type="hidden">
            <input id="ZT" name="ZT" value="10" type="hidden">
            <input id="ID" name="ID" type="hidden">
        </div>
        <ul class="in">
            <li>
                <label><b style="color: red;">*</b>出库仓库：</label>
                <select id="sc_outsh" name="sc_outsh" onchange="changGoods()">
                	<c:forEach items="${shlist}" var="sh">
                		<option value="${sh.sh_id }">${sh.sh_name }</option>
                	</c:forEach>
                </select>
            </li>
            <li>
                <label><b style="color: red;">*</b>入库仓库：</label>
                <select id="sc_insh" name="sc_insh" onchange="changGoods()">
                	<c:forEach items="${shlist}" var="sh">
                		<option value="${sh.sh_id }">${sh.sh_name }</option>
                	</c:forEach>
                </select>
            </li>
            <li>
                <label><b style="color: red;">*</b>经手人：</label>
                <select name="u.u_id">
                	<c:forEach items="${ulist }" var="u">
                        <option value="${u.u_id }">${u.u_name }</option>
                    </c:forEach>
                </select>
            </li>
            <li><label><b style="color: red;">*</b>单据日期：</label><input name="sc_date" class="rili" value="<fmt:formatDate value='${date }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text"/></li>
            <li style="width: 570px;">
                <label>摘要：</label>
                <textarea id="ZY" name="sc_remark" maxlength="100"></textarea>
            </li>
            <li style="width: 570px;">
                <label>说明：</label>
                <textarea id="SM" name="sc_instruction" maxlength="100"></textarea>
            </li>
        </ul>
        <div class="rit">
            <input id="P_BH" value="" type="hidden">
            <input id="P_ProductName" value="" type="hidden">
            <input id="P_GoodsTypeName" value="" type="hidden">
            <input id="P_ProductUnit" value="" type="hidden">
            <input id="P_SPID" value="" type="hidden">
            <input id="P_SPDJ" value="" type="hidden">
            <input id="P_SPSL" value="" type="hidden">
            <table class="in" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr><th width="15%">名称</th>
                    <th width="8%">类别</th>
                    <th width="6%">单位</th>
                    <th width="8%">单价</th>
                    <th width="8%">可拨数量</th>
                    <th width="8%">数量</th>
                    <th width="6%">金额</th>
                    <th width="14%">备注</th>
                    <th width="5%">操作</th>
                </tr></tbody>
            </table>
            <div class="in_goods" id="div_Test">
                <table id="tbgoods" cellspacing="0" cellpadding="0">
                    <tbody>
                            <tr>
                                <td width="15%">
                                	<select id="g_name" name="g_name" style="width: 100px;">
                                		<c:forEach items="${glist }" var="g">
                                			<option>${g.g_name }</option>
                                		</c:forEach>
                                	</select>
                                </td>
                                <td width="8%"><input id="g_type" name="g_type" value="" type="text"/></td>
                                <td width="6%"><input id="g_unit" name="g_unit" value="" type="text"/></td>
                                <td width="8%"><input id="g_unitprice" name="g_unitprice" value="0" onchange="compute()" type="text"/></td>
                                <td width="8%"><input id="allnum" value="0" type="text"/></td>
                                <td width="8%"><input id="g_number" name="g_number" value="0" onchange="compute()" type="text"/></td>
                                <td width="6%"><input id="g_money" name="g_money" value="0" type="text"/></td>
                                <td width="14%"><input id="g_reward" name="g_reward" value="" type="text"/></td>
                                <td width="5%">
                        			<a id="btnSave" class="btnSave">
                        				<img src="/hotel/img/roomrack/save.png" alt="" height="12" width="12"/></a>
                    				<a id="btnDel" style="margin-left: 10px;">
                        				<img src="/hotel/img/roomrack/010.gif" alt="" height="12" width="12"/></a>
               					</td>
                            </tr>
                    </tbody>
                </table>
            </div>
            <div class="foot_table">
                <table class="in" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td colspan="6" width="60%">汇总：</td>
                            <td id="TotalNumber" width="10%">0.00</td>
                            <td id="TotalAmount" width="6%">0.00</td>
                            <input id="rl_money" name="sc_money" value="0" type="hidden"/>
                      		<input name="sc_uid" value="${user.u_id }" type="hidden"/>
                            <td colspan="2" width="28%"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="fote">
                <div style="text-align: center;">
                    <input class="bus_add" id="btnSubmit" value="直接过账" type="submit">
                    <input class="bus_add" id="btnDel" value="清空" type="button">
                </div>
            </div>
        </div>
    </div>
    <table id="tbItem" style="display: none;">
        <tbody>
            <tr>
                <td width="15%">
                    <input class="search shop" value="" type="text">
                </td>
                <td width="15%"></td>
                <td width="8%"></td>
                <td width="6%"></td>
                <td width="8%"></td>
                <td class="ktsl" width="10%"></td>
                <td width="8%"></td>
                <td class="amout" width="6%"></td>
                <td width="14%"></td>
                <td width="14%"></td>
            </tr>
        </tbody>
    </table>
</form><!--end-->

        </div>
    </div>


</body>
</html>
