<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
    
    <title>协议单位</title>
<script type="text/javascript">
//Jquery初始化下拉框
$(function(){
	$("#txtStatus").val("${a_state}");
});
	//对添加协议类别时，进行表单验证
	function checked() {
		var at_name = document.getElementById("at_name").value;
		if(at_name==""){
			alert("协议名称不能为空！！");
			return false;
		}else{
			return true;
		}
	}
	//修改协议类别(打开隐藏界面)
	function AtEdit(at_id) {
		var iframe1=parent.document.getElementById("iframe1");
		iframe1.src="/hotel/AgreementTypeController/queryById?at_id="+at_id;
		var div1=parent.document.getElementById("div1");
		div1.style.display="block";
	}
	//删除协议类别
	function AtDell(at_id) {
		if(confirm("删除该协议，所有属于该协议类别的协议单位都将被删除！！")){
			top.location.href="/hotel/AgreementTypeController/delete?at_id="+at_id;
		}
	}
	//添加协议信息（打开隐藏界面）
	function btnAddProtocolclick() {
		var div2 = parent.document.getElementById("div2");
		div2.style.display = "block";
	}
	//修改协议信息（打开隐藏界面）
	function AgreementEdit(a_id) {
		var iframe2=parent.document.getElementById("iframe2");
		iframe2.src="/hotel/AgreementController/queryById?a_id="+a_id;
		var div3 = parent.document.getElementById("div3");
		div3.style.display = "block";
	}
	//协议信息删除
	function AgreementDell(a_id) {
		if(confirm("确定删除？")){
			top.location.href="/hotel/AgreementController/delete?a_id="+a_id;
		}
	}
	//挂账结算
	function btnSettlementclick() {
		var a_id = document.getElementsByName("a_id");
		var size=0;
		var id;
		for(var i=0;i<a_id.length;i++){
			if(a_id[i].checked){
				size++;
				id=a_id[i].value;
			}
		}
		if(size>1){
			alert("只能选择一个，请重新选择！！");
		}else if(id!=null){
			top.location.href="/hotel/AgreementController/payId?a_id="+id;
		}
	}
</script>
    


<link media="all" href="/hotel/css/agreement/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="p_main">
<form action="/hotel/AgreementController/queryByReason" method="post">    <div class="p_main_search fontYaHei">
        <label>单位名称：</label><input id="txtCode" name="a_name" value="${a_name }" maxlength="20" type="text">
        <label>联系人：</label><input id="txtPhone" name="a_username" maxlength="20" value="${a_username }" type="text">
        <label>状态：</label>
        <select name="a_state" id="txtStatus">
            <option value="-1">全部</option>
            <option value="1">启用</option>
            <option value="0">禁用</option>
        </select>
        <input value="查询" class="qtantj" id="btnSelect" type="submit">
    </div>
</form>
<div style="float: left; width: 150px;">
    <div id="divTemplet">

<ul class="vip_protocol">
        <li>全部</li>
	<c:forEach items="${atlist }" var="at">
        <li data-id="1190">
            <a>${at.at_name }</a>
            <em onclick="AtEdit(${at.at_id})" class="edit"></em>
            <em onclick="AtDell(${at.at_id})" class="dell"></em>
        </li>
    </c:forEach>
    <form action="/hotel/AgreementTypeController/add" target="_top" method="post" onsubmit="return checked()">        
    <li class="add">
            <input id="at_name" name="at_name" placeholder="协议类型" style="float: left; margin-left: 15px; border-right: 0px none; height: 24px; width: 80px; text-align: left;" maxlength="20" value="" type="text">
            <input class="bus_add_add fontYaHei" value="+" style="float: left;" id="btnAddProtocolType" type="submit"></li>
        <li class="end">&nbsp;</li>
</form></ul>

</div>
    
        
</div>
<div class="table_protocol" id="divTable">

<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
        <th width="10"></th>
        <th width="80">协议编号</th>
        <th class="auto-style1" width="150">单位名称</th>
        <th width="80">协议类别</th>
        <th width="80">联系人</th>
        <th width="80">联系电话</th>
        <th width="80">是否挂账</th>
        <th width="80">挂账金额</th>
        <th width="80">挂账限额</th>
        <th width="80">销售员</th>
        <th width="80">生效时间</th>
        <th width="80">失效时间</th>
        <th width="100">房间折扣率</th>
        <th width="50">状态</th>
        <th width="100">操作</th>
        <c:if test="${pb.list==null }">
            </tr><tr><td colspan="13" style="color: red;">无数据</td></tr>
		</c:if>
		<c:forEach items="${pb.list }" var="a">
			<tr>
				<td><input id="a_id" name="a_id" value="${a.a_id }" type="checkbox"/></td>
				<td>${a.a_cardnum }</td>
				<td>${a.a_name }</td>
				<td>${a.at.at_name}</td>
				<td>${a.a_username }</td>
				<td>${a.a_userphone }</td>
				<c:if test="${a.a_accountstate==0 }">
					<td>否</td>
				</c:if>
				<c:if test="${a.a_accountstate==1 }">
					<td>是</td>
				</c:if>
				<td>${a.a_deptmoney }</td>
				<td>${a.a_accountmoney }</td>
				<td>${a.u.u_name }</td>
				<td><fmt:formatDate value="${a.a_startdate }" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${a.a_enddate }" pattern="yyyy-MM-dd" /></td>
				<td>${a.a_discountrate }</td>
				<c:if test="${a.a_state==0 }">
					<td>停用</td>
				</c:if>
				<c:if test="${a.a_state==1 }">
					<td>启用</td>
				</c:if>
				<td><img src="/hotel/img/roomrack/037.gif" width="9" height="9"><span class="STYLE1"> [</span><a onclick="AgreementEdit(${a.a_id})" id="a_30">编辑</a><span class="STYLE1">]</span><br> <img src="/hotel/img/roomrack/010.gif" width="9" height="9"> <span class="STYLE1">[</span><a onclick="AgreementDell(${a.a_id})" id="a_30">删除</a><span class="STYLE1">]</span></td>
			</tr>
		</c:forEach>

   <tr><td colspan="15"><wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/></td></tr>
    </tbody>
</table>
<div class="protocol_db">
    <div class="fl">
        <input class="bus_add" value="添加协议单位" id="btnAddProtocol" onclick="btnAddProtocolclick()" type="button">                    
        <input class="bus_add" value="挂账结算" id="btnSettlement" onclick="btnSettlementclick()" type="button">    </div>
    <div class="fr">
    </div>
</div>
</div>


    </div>
    
    


  </body>
</html>
