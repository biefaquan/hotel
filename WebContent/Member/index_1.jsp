<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
    
    <title>酒店管理平台</title>
<script type="text/javascript">
	//Jquery初始化下拉框
	$(function(){
		$("#Status").val("${m_state}");
	});
	//打开添加会员界面
	function OpenMemberCard(){
		var iframe2=parent.document.getElementById("iframe2");
		iframe2.src="/hotel/MemberController/queryMt";
		var div1=parent.document.getElementById("div1");
		div1.style.display="block";
	}
	//打开会员信息修改界面
	function MemberEdit(m_id) {
		var iframe1=parent.document.getElementById("iframe1");
		iframe1.src="/hotel/MemberController/queryById?m_id="+m_id;
		var div2=parent.document.getElementById("div2");
		div2.style.display="block";
	}
	function MemberDell(m_id) {
		if(confirm("确定删除？")){
			top.location.href="/hotel/MemberController/delete?m_id="+m_id;;
		}
	}
	//打开充值界面
	function AddMoney() {
		var div3=parent.document.getElementById("div3");
		div3.style.display="block";
	}
	//打开会员升级界面
	function Premium() {
		var iframe3=parent.document.getElementById("iframe3");
		iframe3.src="/hotel/MemberController/queryMt1";
		var div4=parent.document.getElementById("div4");
		div4.style.display="block";
	}
	//打开会员挂失界面
	function Loss() {
		var div5=parent.document.getElementById("div5");
		div5.style.display="block";
	}
	//打开会员换卡界面
	function Change() {
		var div6=parent.document.getElementById("div6");
		div6.style.display="block";
	}
	//打开会员退卡界面
	function Delete() {
		var div7=parent.document.getElementById("div7");
		div7.style.display="block";
	}
	//打开会员添加类型界面
	function MemberTypeAdd(){
		var div8=parent.document.getElementById("div8");
		div8.style.display="block";
	}
	//打开会员类型修改界面
	function MemberTypeEdit(mt_id) {
		var iframe4=parent.document.getElementById("iframe4");
		iframe4.src="/hotel/MemberTypeController/queryById?mt_id="+mt_id;
		var div9=parent.document.getElementById("div9");
		div9.style.display="block";
	}
	//打开会员类型删除界面
	function MemberTypeDell(mt_id) {
		if(confirm("删除该类型，属于该类型的所有会员都将被删除？")){
			top.window.location.href="/hotel/MemberTypeController/delete?mt_id="+mt_id;
		}
	}
</script> 
    

<link media="all" href="/hotel/css/member/membertype/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main" style="width: 98%; margin-left: 1%;">
    <form action="/hotel/MemberController/queryByReason" method="post">
        <div class="ftt_search fontYaHei">
            <label>姓名：</label>
            <input name="m_name" style="width: 180px;" placeholder="请输入姓名" id="Members" value="${m_name }" type="text">
            <label style="margin-left: 20px;">卡状态：</label><select name="m_state" style="width: 80px; margin-right: 25px;" id="Status">
                <option value="-1">全部</option>
                <option value="1">正常</option>
                <option value="0">挂失</option>
            </select>
            <input class="qtantj" value="查询" id="btnQuery" type="submit">
        </div></form>
         <div style="width: 10%; float: left;">
            <ul class="vip_member" id="li_kind" style="width: 100%;">
            	<li id="li_0" class=""><span id="sp_0">全部</span></li>
            	<c:forEach items="${mtlist }" var="mt">
            	<li id="li_20"><span id="sp_20">${mt.mt_name }</span><em onclick="MemberTypeEdit(${mt.mt_id})" class="edit"></em><em onclick="MemberTypeDell(${mt.mt_id})" class="dell"></em></li>
            	</c:forEach>
            	<li class="add"> <input value="添加" onclick="MemberTypeAdd()" id="btnSPFLAdd" class="bus_add" type="button"></li>
            </ul>
        </div>
        <div style="width: 90%;float: left;">
            <table class="vip_member" id="tblgood" style="width: 100%;" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr><th width="8%">卡号</th>
                    <th width="5%">类型</th>
                    <th width="7%">姓名</th>
                    <th width="8%">电话</th>
                    <th width="5%">状态</th>
                    <th width="7%">卡余额</th>
                    <th width="5%">性别</th>
                    <th width="8%">生日</th>
                    <th width="5%">证件类型</th>
                    <th width="10%">证件号码</th>
                    <th width="10%">发卡时间</th>
                    <th width="8%">操作员</th>
                    <th width="10%">操作</th>
                </tr>
                <c:if test="${pb.list==null }">
               	 <tr><td colspan="13" style="color: red;">没有找到对应的数据</td></tr>
        		</c:if>
                <c:forEach items="${pb.list }" var="m">
                <tr>
                	<td>${m.m_cardnum }</td>
                	<td>${m.mt.mt_name }</td>
                	<td>${m.c.c_name }</td>
                	<td>${m.c.c_phone }</td>
                	<c:if test="${m.m_state==-1 }">
                	<td>作废</td>
                	</c:if>
                	<c:if test="${m.m_state==0 }">
                	<td>挂失</td>
                	</c:if>
                	<c:if test="${m.m_state==1 }">
                	<td>可用</td>
                	</c:if>
                	<td>${m.m_money }</td>
                	<td>${m.c.c_sex }</td>
                	<td><fmt:formatDate value="${m.c.c_birthday }" pattern="yyyy-MM-dd" /></td>
                	<td>${m.c.c_idtype }</td>
                	<td>${m.c.c_idcard }</td>
                	<td><fmt:formatDate value="${m.m_date }" pattern="yyyy-MM-dd" /></td>
                	<td>${m.u.u_name }</td>
                	<td><img src="/hotel/img/roomrack/037.gif" width="9" height="9"><span class="STYLE1"> [</span><a onclick="MemberEdit(${m.m_id})" id="a_30">编辑</a><span class="STYLE1">]</span> <img src="/hotel/img/roomrack/010.gif" width="9" height="9"> <span class="STYLE1">[</span><a onclick="MemberDell(${m.m_id})" id="a_30">删除</a><span class="STYLE1">]</span></td>
                </tr>
                </c:forEach></tbody>
                <tr><td colspan="13"><wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/></td></tr>
           
            </table>
            <div class="vip_db" style="margin-left: 270px; width: 100%;">
                <div class="fl">
                    <input onclick="OpenMemberCard()" value="会员发卡" class="bus_add" id="MemberCard" type="button">
                    <input onclick="AddMoney()" value="会员充值" class="bus_add" id="Recharge" type="button">
                    <input onclick="Premium()" value="会员升级" class="bus_add" id="Memberup" type="button">
                    <input onclick="Loss()" value="会员挂失" class="bus_add" id="Memberloss" type="button">
                    <input onclick="Change()" value="会员换卡" class="bus_add" id="MemberIn" type="button">
                    <input onclick="Delete()" value="会员退卡" class="bus_add" id="MemberOut" type="button">
                    </div>
                <div class="fr">
                    <div id="divPage" data-need="search"></div>
                </div>
               
            </div>
        </div>
    </div>


</body>
</html>
