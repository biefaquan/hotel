<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    <title>酒店管理平台</title>
 
<link media="all" href="/hotel/css/reserve/index_1.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript">
//Jquery初始化下拉框
$(function(){
	$("#Status").val("${rr_state}");
});
	function AddReserve() {
		var div1 = parent.document.getElementById("div1");
		div1.style.display="block";
	}
	function Edit(rr_id) {
		var iframe1 = parent.document.getElementById("iframe1");
		iframe1.src="/hotel/ReserveRoomController/queryById?rr_id="+rr_id;
		var div2 = parent.document.getElementById("div2");
		div2.style.display="block";
	}
	function Cancel(rr_id) {
		if(confirm("确定删除？")){
			top.location.href="/hotel/ReserveRoomController/delete?rr_id="+rr_id;
		}
	}
	//预订转入时，需要判断（只能选择一个）
	function OpenRoom() {
		var date = ${date.time};
		var rr_id = document.getElementsByName("rr_id");
		var size=0;
		var id;
		for(var i=0;i<rr_id.length;i++){
			if(rr_id[i].checked){
				size++;
				id=rr_id[i].value;
			}
		}
		if(size>1){
			alert("只能选择一个，请重新选择！！");
		}else if(id!=null){
			$.ajax({
				url:"/hotel/ReserveRoomController/queryByRr_id",
				type:"POST",
				data:"rr_id="+id,
				dataType:"json",
				success:function(r){
					if(date>=r.rr_startdate){
						if(r.rr_state==1||r.rr_state==3){
							var iframe2 = parent.document.getElementById("iframe2");
							iframe2.src="/hotel/RegistrationInforController/deleteallcustomer2?rr_id="+id;
							var div3 = parent.document.getElementById("div3");
							div3.style.display="block";	
						}else if(r.rr_state==2){
							alert("已转入主，请勿重复操作！！");
						}else if(r.rr_state==4){
							alert("逾期，无法操作！！");
						}
					}else{
						alert("时间未到，无法执行此操作！！");
					}
			},
			error:function(){
				alert("已转入主，请勿重复操作！！");
			}
		  });
		}
	}
	//打印入住单（只能选择一个）
	function PrintCard() {
		var rr_id = document.getElementsByName("rr_id");
		var size=0;
		var id;
		for(var i=0;i<rr_id.length;i++){
			if(rr_id[i].checked){
				size++;
				id=rr_id[i].value;
			}
		}
		if(size>1){
			alert("只能选择一个，请重新选择！！");
		}else if(id!=null){
			var iframe3 = parent.document.getElementById("iframe3");
			iframe3.src="/hotel/ReserveRoomController/queryRR1?rr_id="+id;
			var div4 = parent.document.getElementById("div4");
			div4.style.display="block";	
		}
	}
</script>
</head>
<body>
    <div class="main " style="width: 98%; margin-left: 1%; margin-bottom: 0px ! important;">
        <form action="/hotel/ReserveRoomController/queryByReason" method="post">
        <div class="ftt_search fontYaHei">
            <label>来店时间：</label><input name="starttime" id="StartDate" style="width: 80px; padding-right: 5px; margin-right: 5px;" value="<fmt:formatDate value='${startdate  }' pattern='yyyy-MM-dd'/>" onclick="laydate()" type="text">
            <label>至</label>
            <input id="EndDate" name="endtime" style="width: 80px; margin-right: 5px;" value="<fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd'/>" onclick="laydate()" type="text">
            <label>预订人：</label><input id="Key" name="rr_name" placeholder="请输入预定人姓名" style="width: 200px;" value="${rr_name }" type="text">
            
            <label>状态：</label><select id="Status" name="rr_state">
                <option value="-1">全部</option>
                <option value="1">预定</option>
                <option value="2">转入住</option>
                <option value="3">部分入住</option>
            </select>
            <input class="qtantj" id="btnSearch" value="查询" type="submit">           
        </div></form>
        <table class="ruzhu" id="tbList" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                	<th width="20"></th>
                    <th width="100">预订单号</th>
                    <th width="80">房型</th>
                    <th width="70">房号</th>
                    <th width="80">开房方式</th>
                    <th width="65">预订房数</th>
                    <th width="65">已开房数</th>
                    <!--<th width="120">预订时间</th>-->
                    <th width="80">来店时间</th>
                    <th width="80">下单时间</th>
                    <th width="80">留房时间</th>
                    <th width="80">预订人</th>
                    <th width="95">电话</th>
                    <th width="80">客人来源</th>
                    <th width="60">订金</th>
                    <th width="80">状态</th>
                    <th width="80">备注</th>
                    <th width="60">操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${pb.list }" var="rr">
            <tr class="734">
            	<td><input name="rr_id" value="${rr.rr_id }" type="checkbox"/></td>
            	<td>${rr.rr_id }<a href="javascript:void(0)" class="orderhide" onclick="showhide(this);" style="text-decoration: none;">&nbsp;</a></td>
            	
            	<td><c:forEach items="${rr.rnlist }" var="rn">${rn.r.rt.rt_name }</br></c:forEach></td>
            	<td><c:forEach items="${rr.rnlist }" var="rn">${rn.r.r_roomnum }</br></c:forEach></td>
            	
            	<td>${rr.rr_keyway }</td>
            	<td>${rr.rnlist.size() }</td>
            	<td>${rr.spare }</td>
            	<td class="rowspan" rowspan="1"><fmt:formatDate value="${rr.rr_startdate }" pattern="yyyy-MM-dd" /></td>
            	<td class="rowspan" rowspan="1"><fmt:formatDate value="${rr.rr_enddate }" pattern="yyyy-MM-dd" /></td>
            	<td class="rowspan" rowspan="1"><fmt:formatDate value="${rr.rr_nowdate }" pattern="yyyy-MM-dd" /></td>
            	<td class="rowspan" rowspan="1">${rr.rr_name }</td>
            	<td class="rowspan" rowspan="1">${rr.rr_phone }</td>
            	<td class="rowspan" rowspan="1">${rr.rr_source }</td>
            	<td style="text-align: right;" class="rowspan" rowspan="1">${rr.rr_depositfee }</td>
            	<c:if test="${date>=rr.rr_startdate }">
            	<td class="rowspan" rowspan="1"><span style="color: Green;"><c:if test="${rr.rr_state==0 }">预定取消</c:if><c:if test="${rr.rr_state==1 }">预定</c:if><c:if test="${rr.rr_state==2 }">转入住</c:if><c:if test="${rr.rr_state==3 }">部分入住</c:if><c:if test="${rr.rr_state==4 }">逾期</c:if></span></td>
            	</c:if>
            	<c:if test="${date<rr.rr_startdate }">
            		<td class="rowspan" rowspan="1"><span style="color: Green;">预订</span></td>
            	</c:if>
            	<td class="rowspan" rowspan="1">${rr.rr_reward }</td>
            	<td style="text-align: left;" class="rowspan" rowspan="1"><span class="STYLE1">[</span><a onclick="Edit(${rr.rr_id})">编辑</a><span class="STYLE1">]</span><span class="STYLE1">[</span><a onclick="Cancel(${rr.rr_id})">取消</a><span class="STYLE1">]</span></td>
            	</tr></c:forEach></tbody>
            
        </table>
        <div class="ruzhu_infor" style="width: 100%; padding: 0px;">
            <div class="types">
                <ul style="float: left; width: 1050px; margin-top: -5px;">
                    <li style="margin-right: 0px; display: inline;">
                        <input class="bus_add " id="btnAdd" onclick="AddReserve()" value="新增预订" type="button"></li>
                    <li style="margin-right: 0px; display: inline;">
                        <input class="bus_add" id="btnEnter" onclick="OpenRoom()" value="预订转入住" type="button"></li>
             
                    <li style="margin-right: 0px; display: inline;">
                        <input class="bus_add" id="btnPreOrder" onclick="PrintCard()" value="补打预订单" type="button"></li>
                    
                </ul>
                <ul style="float: right; width: 400px;">
                    <li style="display: inline; float: right; margin: 0px;" id="pager"><div class="page jcpage"><wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/></div></li>
                </ul>
                
            </div>
        </div>
    </div>
 

</body>
</html>
