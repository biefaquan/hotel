<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
//Jquery初始化下拉框
$(function(){
	$("#Status").val("${u_state}");
});
	function CloseDiv(div) {
		var d = $(div).parent().parent();
		d.hide();
	}

	function mycheck() {
		var name=document.getElementById("d_name").value;
		if(name!=""){
			return true;
		}else{
			alert("部门名称不能为空！！");
			return false;
		}
	}
	
	function DeptEdit(d_id){   //修改部门信息
		//window.location.href="/hotel/DeptController/queryById?d_id="+d_id;
		var iframe1 = document.getElementById("iframe1");
		iframe1.src = "/hotel/DeptController/queryById?d_id="+d_id;
		
		var div2 = document.getElementById("div2");
		div2.style.display = "block";
	}
	
	function DeptDell(d_id){  //删除部门信息
		if(confirm("删除部门信息，将会将属于该部门的所有人员删除，是否删除？")){
			top.location.href="/hotel/DeptController/delete?d_id="+d_id;
		}
	}
	
	function add() {    //将用户添加页面设置可见
		var div1 = document.getElementById("div1");
		div1.style.display = "block";
	}
	
	function UserEdit(u_id) {    //将修改页面设置可见
		var iframe2 = document.getElementById("iframe2");
		iframe2.src = "/hotel/UserController/queryById?u_id="+u_id;
		var div3 = document.getElementById("div3");
		div3.style.display = "block";
	}
	function UserDell(u_id){
		if(confirm("确定删除？")){
			top.location.href="/hotel/UserController/delete?u_id="+u_id;
		}
	}
</script>
    
    
    
    
    

<link media="all" href="/hotel/css/set/setemployee/index_3.css" type="text/css" rel="stylesheet">
<link media="all" href="/hotel/css/roomrack/index.css" type="text/css" rel="stylesheet">

</head>
<body>
    <div class="main" style="width: 98%;">
    <form action="/hotel/UserController/queryByReason" method="post">
        <h1 class="itset">员工信息
            <div class="search_goods">
                <label>状态：</label>
                <select id="Status" name="u_state">
                    <option value="-1">全部</option>
                    <option value="1">在职</option>
                    <option value="0">离职</option>
                </select>
                <input id="txtKey" name="u_name" placeholder="请输入员工姓名" value="${u_name }" type="text">
                <input id="btnQuery" value="查询" class="bus_search" type="submit">
            </div>
        </h1></form>
        <ul class="staff" id="li_kind"><li id="li_0" class="select"><span id="sp_0">全部</span></li>
          <c:forEach items="${dlist }" var="d">
        	<li id="li_23"><span id="sp_23">${d.d_name }</span><em onclick="DeptEdit(${d.d_id})" id="ea_23" class="edit"></em><em onclick="DeptDell(${d.d_id})" id="em_23" class="dell"></em></li> <li id="li_end" class="end">&nbsp;</li> <li class="add"> 
          </c:forEach>
        <form action="/hotel/DeptController/add" target="_top" method="post" onsubmit="return mycheck()">
          <input maxlength="10" id="d_name" name="d_name" placeholder="部门名称"  type="text">
          <input value="+" id="btnSPFLAdd" class="bus_add_add" type="submit"></li>
        </form>
        </ul>
        <div class="staff_table">
            <table id="tblgood" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr><th>工号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>部门</th>
                    <th>职位</th>
                    <th>学历</th>
                    <th>身份证</th>
                    <th>地址</th>
                    <th>手机号</th>
                    <th>入职日期</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pb.list }" var="u">
                <tr id="tr_30">
                	<td>${u.u_jobnum }</td>
                	<td>${u.u_name }</td>	
                	<td>${u.u_sex }</td>
                	<td>${u.d.d_name }</td>
                	<td>${u.u_position }</td>
                	<td>${u.u_school }</td>
                	<td>${u.u_idcard }</td>
                	<td>${u.u_adress }</td>
                	<td>${u.u_phone }</td>
                	<td><fmt:formatDate value="${u.u_date }" pattern="yyyy-MM-dd" /></td>
                	<c:if test="${u.u_state==0 }">
                		<td>离职</td>
                	</c:if><c:if test="${u.u_state==1 }">
                		<td>在职</td>
                	</c:if>
                	<td><img src="/hotel/img/roomrack/037.gif" width="9" height="9"><span class="STYLE1"> [</span><a onclick="UserEdit(${u.u_id})" id="a_30">编辑</a><span class="STYLE1">]</span> <img src="/hotel/img/roomrack/010.gif" width="9" height="9"> <span class="STYLE1">[</span><a onclick="UserDell(${u.u_id})" id="a_30">删除</a><span class="STYLE1">]</span></td></tr>
                </c:forEach></tbody>
            </table>
        </div>
	
        <div class="goods_db" style="width: 100%; margin-left: 0px;">
            <div class="fl" style="margin-left: 150px; display: inline;">
                <input onclick="add()" class="bus_add" value="新增" style="margin-left: 0px;" id="btnAdd" type="button">
            </div>
            <div class="fr">
                <div id="divPage"><div class="page jcpage"><wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/></div></div>
            </div>
        </div>

    </div>
    <!-- 这是部门修改界面 -->
	<div id="div2" class="white_content pwin" style="cursor: pointer; width: 300px; height: 200px; top: 100px; left: 300px; display: none;">
    	<iframe id="iframe1"  name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
    <!-- 添加员工界面 -->
    <div id="div1" class="white_content pwin" style="cursor: pointer; width: 650px; height: 500px; top: 10px; left: 200px; display: none;">
    	<iframe src="/hotel/UserController/queryByAdd" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>
    <!-- 修改员工界面 -->
    <div id="div3" class="white_content pwin" style="cursor: pointer; width: 650px; height: 500px; top: 10px; left: 200px; display: none;">
    	<iframe id="iframe2" name="win" scrolling="yes" style="float: left;" width="100%" height="500" frameborder="0"></iframe>
    	<div class="close" tag="pwin">
         <a onclick="CloseDiv(this)" style="cursor: pointer;">&nbsp;</a>
     </div>
    </div>

</body>
</html>
