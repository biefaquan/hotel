<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  
    <title>酒店管理平台</title>
    
<link media="all" href="/hotel/css/roomrack/index_1.css" type="text/css" rel="stylesheet">
<link href="/hotel/css/roomrack/index.css" type="text/css" rel="stylesheet">
<link media="all" href="/hotel/css/roomrack/menu.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>

</head>
<script type="text/javascript">
	//Jquery初始化下拉框
	$(function(){
		$("#selFloor").val("${f_id}");
		$("#selRoomType").val("${rt_id}");
		$("#selZT").val("${r_state}");
	});

	//关闭浏览器自带的右键菜单
	document.oncontextmenu=function(){    
		return false;
	}
	//右键显示菜单
	function openmenu(event,id,id1,id2,id3){     
			$("#MoveRoom").hide();   
			var e = event||window.event;
			var mm = document.getElementById("mm");
			var mouse = document.getElementById("mouse");
			mouse.value = 1;
			var r_id = document.getElementById("r_id");
			var rr_id = document.getElementById("rr_id");
			var ri_id = document.getElementById("ri_id");
			var ti_id = document.getElementById("ti_id");
			//清空上次操作缓存的数据
			r_id.value = -1;
			ri_id.value = -1;
			ti_id.value = -1;
			rr_id.value = -1;
			
			r_id.value = id;
			if(id1!=null){
				rr_id.value = id1;
			}else{
				rr_id.value = -1;
			}
			if(id2!=null){
				ri_id.value = id2;
			}else{
				ri_id.value = -1;
			}
			if(id3!=null){
				ti_id.value = id3;
			}else{
				ti_id.value = -1;
			}
			if(e.button=="2"){
					mm.style.left=e.clientX+"px";
					mm.style.top=e.clientY+"px";
					mm.style.position="absolute";
					mm.style.display="block";
					return false;
				}
	}
	//菜单中 开房功能
	function openRoom(){
		var ri_id = document.getElementById("ri_id").value;
		var r_id = document.getElementById("r_id").value;
		if(ri_id<0){
			var iframe1 = parent.document.getElementById("iframe1");
			iframe1.src="/hotel/RegistrationInforController/deleteallcustomer?r_id="+r_id;
			//将菜单关闭
			var mm = document.getElementById("mm");
			mm.style.display="none";
			//将开房界面显示
			var div1 = parent.document.getElementById("div1");
			div1.style.display="block";
		}
	}
	//团队开房
	function openTeam(){
		//将菜单关闭
		var mm = document.getElementById("mm");
		mm.style.display="none";
		//将团队界面显示
		top.window.location.href="/hotel/TeamInforController/deleteAllR_id1";
	}
	//菜单中 预订转入住功能
	function openByReserve(){
		var r_id = document.getElementById("r_id").value;
		var rr_id = document.getElementById("rr_id").value;
		if(rr_id>0){
			var iframe2 = parent.document.getElementById("iframe2");
			iframe2.src="/hotel/RegistrationInforController/querybyreserve?r_id="+r_id+"&rr_id="+rr_id;
			//将菜单关闭
			var mm = document.getElementById("mm");
			mm.style.display="none";
			//将开房界面显示
			var div2 = parent.document.getElementById("div2");
			div2.style.display="block";
		}
	}
	//结账
	function closeAccount() {
		var r_id = document.getElementById("r_id").value;
		var ri_id = document.getElementById("ri_id").value;
		var ti_id = document.getElementById("ti_id").value;
		var iframe3 = parent.document.getElementById("iframe3");
		if(ri_id>0){
			iframe3.src="/hotel/RegistrationInforController/queryClose?r_id="+r_id+"&ri_id="+ri_id;
		}else if(ti_id>0){
			iframe3.src="/hotel/RegistrationInforController/queryClose1?r_id=+"+r_id+"&ti_id="+ti_id;
		}
		if(ri_id>0||ti_id>0){
			//将菜单关闭
			var mm = document.getElementById("mm");
			mm.style.display="none";
			//将结账界面显示
			var div3 = parent.document.getElementById("div3");
			div3.style.display="block";
		}
	}
	//换房
	function changeroom(){
		var r_id = document.getElementById("r_id").value;
		var ri_id = document.getElementById("ri_id").value;
		var ti_id = document.getElementById("ti_id").value;
		var iframe4 = parent.document.getElementById("iframe4");
		if(ri_id>0){
			iframe4.src="/hotel/RegistrationInforController/queryChangeRoom?id="+r_id+"&ri_id="+ri_id;
		}else if(ti_id>0){
			iframe4.src="/hotel/RegistrationInforController/queryChangeRoom1?id="+r_id+"&ti_id="+ti_id;
		}
		if(ri_id>0||ti_id>0){
			//将菜单关闭
			var mm = document.getElementById("mm");
			mm.style.display="none";
			//将结账界面显示
			var div4 = parent.document.getElementById("div4");
			div4.style.display="block";
		}
	}
	//续住
	function continuelive(){
		var r_id = document.getElementById("r_id").value;
		var ri_id = document.getElementById("ri_id").value;
		var ti_id = document.getElementById("ti_id").value;
		var iframe5 = parent.document.getElementById("iframe5");
		if(ri_id>0){
			iframe5.src="/hotel/RegistrationInforController/queryContinueLive?id="+r_id+"&ri_id="+ri_id;
		}else if(ti_id>0){
			iframe5.src="/hotel/RegistrationInforController/queryContinueLive1?id="+r_id+"&ti_id="+ti_id;
		}
		if(ri_id>0||ti_id>0){
			//将菜单关闭
			var mm = document.getElementById("mm");
			mm.style.display="none";
			//将结账界面显示
			var div5 = parent.document.getElementById("div5");
			div5.style.display="block";
		}
	}
	
	
	//当鼠标左键点击时，是操作界面隐藏
	function mouseclick() {
		var mouse = document.getElementById("mouse").value;
		if(mouse==1){
			var mm = document.getElementById("mm");
			mm.style.display="none";
		}
	}
	//清空数据
	function emptyAll() {
		var r_id = document.getElementById("r_id");
		var ri_id = document.getElementById("ri_id");
		var ti_id = document.getElementById("ti_id");
		var rr_id = document.getElementById("rr_id");
		r_id.value = -1;
		ri_id.value = -1;
		ti_id.value = -1;
		rr_id.value = -1;
	}
	//修改客人信息
	function updateCustomer() {
		//将右键菜单隐藏
		var mm = document.getElementById("mm");
		mm.style.display="none";
		var r_id = document.getElementById("r_id").value;
		var ri_id = document.getElementById("ri_id").value;
		var ti_id = document.getElementById("ti_id").value;
		if(ri_id==null||ri_id==""){
			ri_id=-1;
		}
		if(ti_id==null||ti_id==""){
			ti_id = -1;
		}
		if(ri_id>0){
			var iframe6 = parent.document.getElementById("iframe6");
			iframe6.src="/hotel/RegistrationInforController/queryUpateCustomer?r_id="+r_id+"&ri_id="+ri_id+"&ti_id="+ti_id;
			var div6 = parent.document.getElementById("div6");
			div6.style.display="block";
		}
	}
	//撤销入住
	function checkIn() {
		//将右键菜单隐藏
		var mm = document.getElementById("mm");
		mm.style.display="none";
		var r_id = document.getElementById("r_id").value;
		var ri_id = document.getElementById("ri_id").value;
		var ti_id = document.getElementById("ti_id").value;
		if(ri_id==null||ri_id==""){
			ri_id=-1;
		}
		if(ti_id==null||ti_id==""){
			ti_id = -1;
		}
		if(ri_id>0&&confirm("确定撤销入住？")){
			top.location.href="/hotel/RegistrationInforController/checkIn?id="+r_id+"&ri_id="+ri_id+"&ti_id="+ti_id;
		}
	}
	//补交房租
	function payRent() {
		var ri_id = document.getElementById("ri_id").value;
		if(ri_id==null||ri_id==""){
			ri_id=-1;
		}
		if(ri_id>0){
			var iframe6 = parent.document.getElementById("iframe7");
			iframe6.src="/hotel/RegistrationInforController/queryPayRent?&ri_id="+ri_id;
			var div6 = parent.document.getElementById("div7");
			div6.style.display="block";
		}
	}
	//补交房租（提示框的操作）
	function payRent1(ri_id) {
		var iframe6 = parent.document.getElementById("iframe7");
		iframe6.src="/hotel/RegistrationInforController/queryPayRent?&ri_id="+ri_id;
		var div6 = parent.document.getElementById("div7");
		div6.style.display="block";
	}
	//修改房态
	function changeState(state) {
		var ri_id = document.getElementById("ri_id").value;
		if(ri_id<0){
			var r_id = document.getElementById("r_id").value;
			top.location.href="/hotel/RegistrationInforController/changeState?id="+r_id+"&state="+state;
		}
	}
	//鼠标移动到div就显示，离开就消失
	var timer;
	function move(div,ri_id) {
		if($("#MoveRoom").is(":hidden")){
			var mm = document.getElementById("MoveRoom");
			mm.style.left=(div.offsetLeft+30)+"px";
			mm.style.top=(div.offsetTop-50)+"px";
			mm.style.position="absolute";
			//获取数据填充
			$.ajax({
				url:"/hotel/RoomController/queryRI",
				type:"POST",
				data:"ri_id="+ri_id,
				dataType:"json",
				success:function(ri){
					if(ri!=null){
						$("#p1").text(ri.c.c_name);
						$("#p2").text(ri.r.r_roomnum);
						$("#p3").text(ri.c.c_idcard);
						var startdate = new Date();
						var enddate = new Date();
						startdate.setTime(ri.ri_opentime);
						enddate.setTime(ri.ri_endtime);
						$("#p4").text(startdate.toLocaleDateString());
						$("#p5").text(enddate.toLocaleDateString());
					}
				},
				error:function(){
					//alert("网络出错！！");
				}
			});
			timer=setTimeout(function(){mm.style.display='block'},1000);  
		}
	}
	function movereserve(div,rr_id) {
		if($("#MoveRoom").is(":hidden")){
			var mm = document.getElementById("MoveRoom");
			mm.style.left=(div.offsetLeft+30)+"px";
			mm.style.top=(div.offsetTop-50)+"px";
			mm.style.position="absolute";
			//获取数据填充
			$.ajax({
				url:"/hotel/RoomController/queryRR",
				type:"POST",
				data:"rr_id="+rr_id,
				dataType:"json",
				success:function(rr){
					if(rr!=null){
						$("#p1").text(rr.rr_name);
						$("#p2").text("");
						$("#p3").text("无");
						var startdate = new Date();
						var enddate = new Date();
						startdate.setTime(rr.rr_startdate);
						enddate.setTime(rr.rr_enddate);
						$("#p4").text(startdate.toLocaleDateString());
						$("#p5").text(enddate.toLocaleDateString());
					}
				},
				error:function(){
					//alert("网络出错！！");
				}
			});
			timer=setTimeout(function(){mm.style.display='block'},500);  
		}
	}
	function leave() {
		clearTimeout(timer);  
	    $("#MoveRoom").hide();   
	}
	//关闭提示
	function closediv() {
		$("#div1").hide();
	}
</script>


<body onclick="mouseclick()" self.event.returnvalue="false" onselectstart="return false" onkeyup="keyUp();">
   
    <div class="main" style="width: 98%; margin-left: 1%; margin-bottom: 0px;">
        <form action="/hotel/RoomController/queryAllByReason" method="post">
        <div class="ftt_search fontYaHei" id="divQuery">
            <label>楼层：</label>
            <select name="f_id" id="selFloor" style="width: 80px;">
                <option value="-10">全部</option>
            	<c:forEach items="${flist }" var="f">
            		<option value="${f.f_id }">${f.f_num }</option>
            	</c:forEach>
            </select>
            <label>房型：</label>
            <select name="rt_id" id="selRoomType" style="width: 100px;">
                <option value="-10">全部</option>
                <c:forEach items="${rtlist }" var="rt">
            		<option value="${rt.rt_id }">${rt.rt_name }</option>
            	</c:forEach>
            </select>
            <label>房态：</label><select name="r_state" id="selZT" style="width: 80px;"> <option value="-10">全部</option><option value="0">空房</option><option value="1">在住</option><option value="-1">打扫</option><option value="-3">维修</option><option value="2">预订</option></select>

            <!-- <div id="FeaturesSelect">房间特征<span class="nones">▼</span><span class="select">▲</span></div>  -->
            <ul id="FeaturesBox" style="top: 34px; left: 456.65px;"></ul>
            <input name="r_roomnum" id="txtKey" maxlength="50" style="width: 220px;" placeholder="请输入房号" value="${r_roomnum }" type="text"/>
            <input class="qtantj" style="margin-left: 10px;" value="查询" id="btnQueryKey" type="submit">
            
        </div></form>

        <div class="ftt_small" id="ftt_type">

         <div class="ftt_main fontYaHei " id="div_rooms" style="height: 382px;">
          <c:forEach items="${flist }" var="f">
            <div class="div_floor_room">
            <c:forEach items="${list }" var="r">
                <c:if test="${r.f.f_num==f.f_num }">
                   <c:if test="${r.r_state==0 }">
            		<div name="div_102" id="div_3090" class="divroom" oncontextmenu="openmenu(event,${r.r_id })"><div class="divs" style="background-color: rgb(102, 153, 0);"><div class="room">${r.r_roomnum }</div><div class="type">${r.rt.rt_name }</div><div class="features"></div></div></div>
            	   </c:if>
            	   <c:if test="${r.r_state==1 }">
            	   <!-- 个人或协议单位 -->
            	   		<c:forEach items="${rilist }" var="ri">  
            				<c:if test="${ri.r.r_id==r.r_id&&ri.ri_state==1&&ri.ti_id==0 }">
            					<div name="div_201" id="div_3034" class="divroom" onmouseover="move(this,${ri.ri_id})" onmouseout="leave()" oncontextmenu="openmenu(event,${r.r_id },null,${ri.ri_id })"><div class="divs red"> <div class="room">${r.r_roomnum }</div> <div class="type">${r.rt.rt_name }</div><div class="name" style="">${ri.c.c_name }<!-- <c:forEach items="${ri.rclist }" var="rc">&nbsp${rc.c.c_name }</c:forEach> --></div><div class="icon"><c:if test="${(ri.ri_endtime.time-nowdate.time)/1000/60/60==0 }"><em class="leave"></em></c:if><c:if test="${ri.ri_source=='协议单位' }"><em class="co"></em></c:if><c:if test="${ri.ri_source=='会员' }"><em style="color: black;font-weight: 900;">vip</em></c:if><em class="deposit"></em><em style="display: none;" class="contact C201701050002"></em><c:if test="${ri.ri_endtime.time-nowdate.time<0 }"><em class="qian"></em></c:if></div><div class="features"></div></div></div>
            				</c:if>
            				<c:if test="${ri.r.r_id==r.r_id&&ri.ri_state==1&&ri.ti_id!=0 }">
            					<!-- 团队开房-->
            					<c:forEach items="${tilist }" var="ti">
            						<c:if test="${ti.ti_id==ri.ti_id }">
            							<div name="div_201" id="div_3034" class="divroom" onmouseover="move(this,${ri.ri_id})" onmouseout="leave()" oncontextmenu="openmenu(event,${r.r_id },null,${ri.ri_id })"><div class="divs red"> <div class="room">${r.r_roomnum }</div> <div class="type">${r.rt.rt_name }</div><div class="name" style="">${ti.ti_name }</div><div class="icon"><em style="color: black;font-weight: 900;">团</em><c:if test="${(ri.ri_endtime.time-nowdate.time)/1000/60/60==0 }"><em class="leave"></em></c:if><c:if test="${tc.ti.ti_source=='协议单位' }"><em class="co"></em></c:if><c:if test="${tc.ti.ti_source=='会员' }"><em style="color: black;font-weight: 900;">vip</em></c:if><em class="deposit"></em><em style="display: none;" class="contact C201701050002"></em><c:if test="${ri.ri_endtime.time-nowdate.time<0 }"><em class="qian"></em></c:if></div><div class="features"></div></div></div>
            						</c:if>
            					</c:forEach>
            				</c:if>
            			</c:forEach> 
            	   	</c:if>
            	   	<c:if test="${r.r_state==2 }">
            	   		<!-- 预订 -->
            			<c:forEach items="${rrlist }" var="rr">
            				<c:set var="bool1" value="0"></c:set>
            				<c:forEach items="${rr.rnlist }" var="rn">
            					<c:if test="${r.r_id==rn.r.r_id }">
            						<c:set var="bool1" value="1"></c:set>
            					</c:if>
            				</c:forEach>
            				<c:if test="${bool1==1 && (rr.rr_state==1 || rr.rr_state==3) }">
            					<c:if test="${rr.rr_startdate.time-nowdate.time==0 }">
            						<div name="div_201" id="div_3034" class="divroom" onmouseover="movereserve(this,${rr.rr_id})" onmouseout="leave()" oncontextmenu="openmenu(event,${r.r_id },${rr.rr_id })"><div class="divs purple"> <div class="room">${r.r_roomnum }</div> <div class="type">${r.rt.rt_name }</div><div class="name" style="">${rr.rr_name }</div><div class="icon"><c:if test="${rr.rr_source=='协议单位' }"><em class="co"></em></c:if><c:if test="${rr.rr_source=='会员' }"><em style="color: black;font-weight: 900;">vip</em></c:if><em class="deposit"></em><em style="display: none;" class="contact C201701050002"></em></div><div class="features"></div></div></div>
            					</c:if>
            					<c:if test="${rr.rr_startdate.time-nowdate.time>0 }">
            						<div name="div_102" id="div_3090" class="divroom" oncontextmenu="openmenu(event,${r.r_id })"><div class="divs" style="background-color: rgb(102, 153, 0);"><div class="room">${r.r_roomnum }</div><div class="type">${r.rt.rt_name }</div><div class="features"></div></div></div>
            					</c:if>
            				</c:if>
            			</c:forEach>
            	   	</c:if>
            	   	<!-- 打扫 -->
            	   	<c:if test="${r.r_state==-1 }">
            		<div name="div_102" id="div_3090" class="divroom" oncontextmenu="openmenu(event,${r.r_id })"><div class="divs gray"><div class="room">${r.r_roomnum }</div><div class="type">${r.rt.rt_name }</div><div class="features"></div></div></div>
            	   </c:if>
            	   <!-- 修理中 -->
            	   <c:if test="${r.r_state==-3 }">
            		<div name="div_102" id="div_3090" class="divroom" oncontextmenu="openmenu(event,${r.r_id })"><div class="divs black"><div class="room">${r.r_roomnum }</div><div class="type">${r.rt.rt_name }</div><div class="features"></div></div></div>
            	   </c:if>
            	 </c:if>
            </c:forEach>
            </div>
          </c:forEach>

         
        </div>
            
            
            <!--拖动层-->
            <div id="MoveRoom" style="display: none;width: 250px;">
                <div class="first">
                    <div class="name"><p id="p1">李生</p></div>
                    <div class="room_type"><font color="#f00"><p id="p2">1014</p></font></div>
                </div>
                <div class="times">
                    <label>身份证：</label><p id="p3">432524198805048324</p>
                </div>
                <div class="times">
                    <label>开始时间：</label><p id="p4"></p>
                </div>
                <div class="times">
                    <label>预离时间：</label><p id="p5"></p>
                </div>
            </div>
        </div>
        
        <div>
            <div class="ftt_sks fontYaHei" id="divFoot" style="position:fixed;bottom:0px;left:15px;">
                <div class="colors">
                    <em class="" id="kf" style="background-color: rgb(102, 153, 0);">空房</em><a href="javascript:void(0);" onclick="BtnStatus(this,'0')" id="state1"><b>${sc.i1 }</b> 间&nbsp;&nbsp;${sc.i6 }%</a>
                </div>
                <div class="colors">
                    <em class="red" id="rz">入住</em><a href="javascript:void(0);" onclick="BtnStatus(this,'1')" id="state2"><b>${sc.i2 }</b> 间&nbsp;&nbsp;${sc.i7 }%</a>
                </div>
                <div class="colors">
                    <em class="gray" id="ds">打扫</em><a href="javascript:void(0);" onclick="BtnStatus(this,'2')" id="state3"><b>${sc.i3 }</b> 间&nbsp;&nbsp;${sc.i8 }%</a>
                </div>
                <div class="colors">
                    <em class="black" id="xl">修理</em><a href="javascript:void(0);" onclick="BtnStatus(this,'3')" id="state4"><b>${sc.i4 }</b> 间&nbsp;&nbsp;${sc.i9 }%</a>
                </div>
                <div class="colors">
                    <em class="purple" id="yl">预留</em><a href="javascript:void(0);" onclick="BtnStatus(this,'4')" id="state5"><b>${sc.i5 }</b> 间&nbsp;&nbsp;${sc.i10 }%</a>
                </div>
            </div>
        </div>
        
        


        <!--房租拖欠-->
        <c:if test="${rentlist.size()>=2 }">
        <div id="div1" class="ping_open" style="display: block;">
            <h1>拖欠房租两天以上，请及时处理：</h1>
            <table class="tbchooseorder" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>房号</th>
                        <th>预离时间</th>
                        <th width="78">操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${rentlist }" var="ri">
                    <tr>
                        <td>${ri.r.r_roomnum }</td>
                        <td><fmt:formatDate value="${ri.ri_endtime }" pattern="yyyy-MM-dd" /></td>
                        <td><a onclick="payRent1(${ri.ri_id})"><span class="qtantj">补交</span></a></td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
            <div class="close" onclick="closediv()">&nbsp;</div>
        </div>
        </c:if>


        <!--泡泡-->
        <div class="company_infor" id="pp" style="display: none;">
            <div class="infor">
                <h1 class="fontYaHei" id="Name">&nbsp;&nbsp;</h1>
                <a class="nextorder" href="javascript:void(0);" title="下一个入住单">NEXT»</a>
                <h2><em id="RoomNo">&nbsp;&nbsp;</em>/<em id="RoomType">&nbsp;&nbsp;</em></h2>
                <p><em id="StartDate">&nbsp;&nbsp;</em>&nbsp;至&nbsp;<em id="EndDate">&nbsp;&nbsp;</em></p>
            </div>
            <div class="days">
                <em id="OpenType">&nbsp;&nbsp;</em><em id="Status">&nbsp;&nbsp;</em>
            </div>
            <div class="prices">
                <div class="every">
                    <em class="one" id="Consumption">0.00</em><p class="two">消费</p>
                </div>
                <div class="every">
                    <em class="three" id="YSC">0.00</em><p class="three">预授权</p>
                </div>
                <div class="every">
                    <em class="two" id="Deposit">0.00</em><p class="two">收款</p>
                </div>
                <div class="every">
                    <em class="four" id="Balance">0.00</em><p class="four" id="Yue">余额</p>
                </div>
                <div class="remarks" id="show" style="display: none; border-top: 0px none; margin-top: -10px;">
                    <em>说明：</em>
                    <span>以上金额统计包含所有联房房间</span>
                </div>
            </div>
            <div class="remarks" id="TogetherLive">
                <em style="width: 60px;">同住客人：</em>
                <span id="Cohabit" style="width: 340px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <div class="remarks" id="div_Phone">
                <em style="width: 20%;">手机号码：</em>
                <span id="CusPhone" style="width: 80%; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <div class="remarks" id="div_BedNo" style="width: 50%;">
                <em style="width: 40%;">床号：</em>
                <span id="spanBedNo" style="width: 60%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <div class="remarks">
                <em>备注：</em>
                <span id="Remark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>


            <div class="close">&nbsp;</div>
        </div>



        <!--显示维修原因-->
        <div class="company_infor" id="room" style="display: none; width: 300px;">
            <div class="infor">
                <h1 class="fontYaHei" id="LogRoomNo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
            </div>
            <div class="remarks" style="border-top: 0px none;">
                <em>备注：</em>
                <span style="min-height: 60px; width: 260px;" id="LogRemark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </div>
            <div class="infor">
                <label>创建时间：</label><span id="CreateDate"></span>
            </div>
            <div class="close">&nbsp;</div>
        </div>

    </div>
    

<div id="mm" class="set_lf  fontYaHei" style="width: 120px; height: 285px; display: none; left: 0px; top: 0px;">
        <a onclick="openRoom()"><em class="RoomStateMenu menu-item" style="padding-left:15px">开房</em></a>
        <a onclick="openTeam()"><em class="RoomStateMenu menu-item" style="padding-left:15px">团队开房</em></a>
        <a onclick="closeAccount()"><em class="RoomStateMenu menu-item" style="padding-left:15px">结账</em></a>
        <a onclick="openByReserve()"><em class="RoomStateMenu menu-item" style="padding-left:15px">预订转入住</em></a>
   	
   		<span style="border-bottom: 1px solid rgb(221, 221, 221); width: 90%; line-height: 1px; height: 1px; float: left; margin-left: 5px; display: inline; margin-top: 5px;">&nbsp;</span>
            
        <a onclick="changeroom()"><em class="RoomStateMenu menu-item" style="padding-left:15px">换房</em></a>
        <a onclick="continuelive()"><em class="RoomStateMenu menu-item" style="padding-left:15px">续住</em></a>
        <a onclick="updateCustomer()"><em class="RoomStateMenu menu-item" style="padding-left:15px">修改客人信息</em></a>
        <a onclick="checkIn()"><em class="RoomStateMenu menu-item" style="padding-left:15px">撤销入住</em></a>
        <a onclick="payRent()"><em class="RoomStateMenu menu-item" style="padding-left:15px">补交房租</em></a>
        <span style="border-bottom: 1px solid rgb(221, 221, 221); width: 90%; line-height: 1px; height: 1px; float: left; margin-left: 5px; display: inline; margin-top: 5px;">&nbsp;</span>
        
        <a onclick="changeState(0)"><em class="RoomStateMenu menu-item" style="padding-left:15px">空房</em></a>
        <a onclick="changeState(-1)"><em class="RoomStateMenu menu-item" style="padding-left:15px">打扫</em></a>
        <a onclick="changeState(-3)"><em class="RoomStateMenu menu-item" style="padding-left:15px">维修</em></a>
        <a onclick="changeState(-2)"><em class="RoomStateMenu menu-item" style="padding-left:15px">停用</em></a>
        
</div></body>
                <input id="r_id" type="hidden"/>
                <input id="rr_id" type="hidden"/>
                <input id="ri_id" type="hidden"/>
                <input id="ti_id" type="hidden"/>
                <input id="mouse" value="0" type="hidden"/>
                <!-- 显示开房界面 -->
                
</html>


