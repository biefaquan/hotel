<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#d1").click(function(){
		if($("#dd1").is(":hidden")){
	        $("#dd1").show();    //如果元素为隐藏,则将它显现
		}else{
	       $("#dd1").hide();     //如果元素为显现,则将其隐藏
		}
	});
	
	$("#d2").click(function(){
		if($("#dd2").is(":hidden")){
	        $("#dd2").show();    //如果元素为隐藏,则将它显现
		}else{
	       $("#dd2").hide();     //如果元素为显现,则将其隐藏
		}
	});
	
	$("#d3").click(function(){
		if($("#dd3").is(":hidden")){
	        $("#dd3").show();    //如果元素为隐藏,则将它显现
		}else{
	       $("#dd3").hide();     //如果元素为显现,则将其隐藏
		}
	});
	
	$("#d4").click(function(){
		if($("#dd4").is(":hidden")){
	        $("#dd4").show();    //如果元素为隐藏,则将它显现
		}else{
	       $("#dd4").hide();     //如果元素为显现,则将其隐藏
		}
	});
});
</script>   
<link media="all" href="/hotel/css/reports/businessdetail/index_2.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="glossymenu">
        <div class="caidan">
            <div id="d1" class="select">
                <a class="menuitem submenuheader" headerindex="0h"><span class="accordprefix"></span>
                    <span class="accordprefix">查询中心</span>
                    <span class="accordsuffix"><img src="/hotel/img/roomrack/minus.gif" class="statusicon"></span>
               </a>
            </div>
            <div id="dd1" class="submenu" contentindex="0c" style="display: block;">
                <ul id="cxcenter" style="height: 100px; overflow-y: auto; overflow-x: hidden;">
                    <li class="lis" id="CX001">
                        <a href="/hotel/Reports/BusinessDetail/businessdetail.jsp" target="_top" style="cursor: pointer;">营业明细查询</a></li>
                    <li class="lis" id="CX002">
                        <a href="/hotel/Reports/CloseDetail/closedetail.jsp" target="_top" style="cursor: pointer;">退房结账明细</a></li>
                    <li class="lis" id="CX003">
                        <a href="/hotel/Reports/CashierDetail/cashierdetail.jsp" target="_top" style="cursor: pointer;" class="select">收银明细查询</a></li>
                    
                 </ul>
            </div>
            <div id="d2" class="select">
                <a class="menuitem submenuheader" headerindex="1h"><span class="accordprefix"></span>
                    <span class="accordprefix">报表中心</span>
                    <span class="accordsuffix"><img src="/hotel/img/roomrack/plus.gif" class="statusicon"></span>
                </a>
            </div>
            <div id="dd2" class="submenu" contentindex="1c" style="display: none;">
                <ul id="bbcenter" style="height: 150px; overflow-y: auto; overflow-x: hidden;">
                    <li class="lis" id="BB001"><a href="/hotel/Reports/BusinessAnalysis/businessanalysis.jsp" target="_top" style="cursor: pointer;">营业情况分析</a></li>
                    <li class="lis" id="BB002"><a href="/hotel/Reports/Occupancy/occupancy.jsp" target="_top" style="cursor: pointer;">入住率分析</a></li>
                    <li class="lis" id="BB004"><a href="/hotel/Reports/SourceAnalysis/sourceanalysis.jsp" target="_top" style="cursor: pointer;">来源分析</a></li>
                    <li class="lis" id="BB005"><a href="/hotel/Reports/RoomTypeAnalysis/roomtypeanalysis.jsp" target="_top" style="cursor: pointer;">房型分析</a></li>
                    <li class="lis" id="BB006"><a href="/hotel/Reports/OpenRoomAnalysis/openroomanalysis.jsp" target="_top" style="cursor: pointer;">开房方式分析</a></li>
                     
                </ul>
            </div>
            
            <div id="d3" class="select">
                <a class="menuitem submenuheader" headerindex="2h"><span class="accordprefix"></span>
                    <span class="accordprefix">会员报表</span>
                    <span class="accordsuffix"><img src="/hotel/img/roomrack/plus.gif" class="statusicon"></span>
                </a>
            </div>
            <div id="dd3" class="submenu" contentindex="2c" style="display: none;">
                <ul id="hycenter">
                    <li class="lis" id="HY001"><a href="/hotel/Reports/AddMemberAnalysis/addmemberanalysis.jsp" target="_top" style="cursor: pointer;">会员开卡统计</a></li>
                    <li class="lis" id="HY003"><a href="/hotel/Reports/ConsumeMemberAnalysis/consumememberanalysis.jsp" target="_top" style="cursor: pointer;">会员消费报表</a></li>
                    <li class="lis" id="HY005"><a href="/hotel/Reports/HandleMemberAnalysis/handlememberanalysis.jsp" target="_top" style="cursor: pointer;">会员动态查询</a></li>
                    <li class="lis" id="HY008"><a href="/hotel/Reports/MoneyMemberAnalysis/moneymemberanalysis.jsp" target="_top" style="cursor: pointer;">会员充值记录</a></li>
                </ul>
            </div>

            <div id="d4" class="select">
                <a class="menuitem submenuheader" headerindex="3h"><span class="accordprefix"></span>
                    <span class="accordprefix">协议单位报表</span>
                    <span class="accordsuffix"><img src="/hotel/img/roomrack/plus.gif" class="statusicon"></span>
                </a>
            </div>
            <div id="dd4" class="submenu" contentindex="3c" style="display: none;">
                <ul id="xycenter">
                    <li class="lis" id="XY001"><a href="/hotel/Reports/AgreementCredit/agreementcredit.jsp" target="_top" style="cursor: pointer;">结算明细报表</a></li>
                </ul>
            </div>

            
        </div>
        <div style="line-height: 10px;">&nbsp;</div>
    </div>



</body>
</html>
