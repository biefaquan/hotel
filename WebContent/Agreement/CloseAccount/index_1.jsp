<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>单位结算</title>


<link media="all" href="/hotel/css/agreement/close.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#state").val("${state}");
});
//挂账结算
	function payBill() {
		var a_id = "${a.a_id}";
		var b_id = document.getElementsByName("b_id");
		var size=0;
		var id;
		for(var i=0;i<b_id.length;i++){
			if(b_id[i].checked){
				size++;
				id=b_id[i].value;
			}
		}
		if(size>1){
			alert("只能选择一个，请重新选择！！");
		}else if(id!=null){
			top.location.href="/hotel/AgreementController/payBill?b_id="+id+"&a_id="+a_id;
		}
	}
</script>
<body>
    <div class="p_main">
        

<div class="p_main">
    <div class="p_main_search fontYaHei" id="divQueryUnit">
<form action="http://conunit.jdd365.cn/Trade/ContractUnitTrade" method="post" novalidate="novalidate">            
<label>单位名称/编号：</label>
        <input style="width: 200px;" value="${a.a_name }" maxlength="100" name="ContractUnitKeyword" autocomplete="off" class="ac_input" type="text">
        <input value="查询" class="qtantj" style="display: none;" type="submit">
</form>    </div>
    <ul class="settle">
        <li>
            <label>协议编号：</label><p>${a.a_cardnum }</p>
        </li>
        <li>
            <label>单位名称：</label><p>${a.a_name }</p>
        </li>
        <li>
            <label>协议类别：</label><p>${a.at.at_name }</p>
        </li>
        <li>
            <label>联系人：</label><p>${a.a_username }</p>
        </li>
        <li>
            <label>联系电话：</label><p>${a.a_userphone }</p>
        </li>
        <!-- <li>
            <label>挂账金额：</label><p>0.00</p>
        </li>
        <li>
            <label>可用金额：</label><p>0.00</p>
        </li> -->
    </ul>
    <ul class="list">
        <li id="m02" value="1">结算列表</li>
    </ul>
    <div class="select_two" id="c01">
        <div class="p_main_search fontYaHei" style="margin-left: 1%; width: 98%;">
<form action="/hotel/AgreementController/payCreditDetail" id="form0" method="post">               
 			<label>挂账时间：</label><input id="txtStartTime1" name="starttime" value="<fmt:formatDate value='${start }' pattern='yyyy-MM-dd' />" onclick="laydate()" maxlength="16" style="margin-right: 0px;" type="text"><label>&nbsp;至</label><input id="txtEndTime1" name="endtime" value="<fmt:formatDate value='${end }' pattern='yyyy-MM-dd' />" onclick="laydate()" maxlength="16" type="text">
                <label>状态：</label><select id="state" name="state">
                    <option value="-1">全部</option>
                    <option value="0">未结算</option>
                    <option value="1">已结算</option>
                </select>
                <input name="a_id" value="${a.a_id }" type="hidden">
                <input id="btnQueryBills" value="查询" class="qtantj" type="submit">
</form>        </div>
        <div id="bill_list">
            
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
        	<th width="30"></th>
        	<th width="120">单号</th>
        	<th width="60">房号</th>
        	<th width="80">姓名</th>
        	<th width="80">消费金额</th>
        	<th width="80">挂账金额</th>
       	 	<th width="120">挂账时间</th>
        	<th width="120">结算时间</th>
        	<th width="80">操作员</th>
        	<th width="60">状态</th>
        </tr>
        <c:forEach items="${blist }" var="b">
            <tr>
            	<c:if test="${b.b_state==0 }">
                	<td><input name="b_id" value="${b.b_id }" type="checkbox"></td>
                </c:if>
                <c:if test="${b.b_state==1 }">
                	<td><input name="b_id" disabled="disabled" value="${b.b_id }" type="checkbox"></td>
                </c:if>
                <td>${b.b_id }</td>
                <td>${b.r.r_roomnum }</td>
                <td>${b.c.c_name }</td>
                <td class="fr">${b.b_allmoney }</td>
                <td class="fr">${b.b_allmoney }</td>
                <td><fmt:formatDate value='${b.b_starttime }' pattern='yyyy-MM-dd' /></td>
                <td><fmt:formatDate value='${b.b_endtime }' pattern='yyyy-MM-dd' /></td>
                <td>${b.u.u_name }</td>
                <c:if test="${b.b_state==0 }">
                	<td>未结算</td>
                </c:if>
                <c:if test="${b.b_state==1 }">
                	<td>已结算</td>
                </c:if>
            </tr>
       </c:forEach>
    </tbody>
</table>
<div class="protocol_db" style="margin-left: 1%; width: 98%;">
    <div class="fl">
        <input id="btnCheckout" class="bus_add" value="结算" onclick="payBill()" type="button">
    </div>
</div>

        </div>
    </div>
</div>
</div>
    
</body>
</html>
