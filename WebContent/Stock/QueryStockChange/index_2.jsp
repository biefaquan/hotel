<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
<title>库存管理系统</title>
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
});
</script>    
    

    

<link media="all" href="/hotel/css/stock/supplier/index_2.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="glossymenu">
        <div class="caidan">
                <div id="d1" class="select">
                    <a class="menuitem submenuheader" headerindex="0h"><span class="accordprefix"></span>
                        <span class="accordprefix">单据中心</span>
                    <span id="s1" class="accordsuffix"><img src="/hotel/img/roomrack/plus.gif" class="statusicon"></span></a>
                </div>
                <div id="dd1" class="submenu" contentindex="0c" style="display: none;">
                    <ul>
                        <li class="lis"><a href="/hotel/Stock/PurchaseList/purchaselist.jsp" target="_top">进货单</a></li>
                        <li class="lis"><a href="/hotel/Stock/ReturnList/returnlist.jsp" target="_top">退货单</a></li>
                        <li class="lis"><a href="/hotel/Stock/PickList/picklist.jsp" target="_top">领料单</a></li>
                        <li class="lis"><a href="/hotel/Stock/ReturnPick/returnpick.jsp" target="_top">领料退货单</a></li>
                        <li class="lis"><a href="/hotel/Stock/StockChange/stockchange.jsp" target="_top">库存调拨单</a></li>
                    </ul>
                </div>
                <div id="d2" class="select">
                    <a class="menuitem submenuheader" headerindex="1h"><span class="accordprefix"></span>
                        <span class="accordprefix">查询中心</span>
                    <span id="s2" class="accordsuffix"><img src="/hotel/img/roomrack/minus.gif" class="statusicon"></span></a>
                </div>
                <div id="dd2" class="submenu" contentindex="1c" style="display: block;">
                    <ul>
                        <li class="lis"><a href="/hotel/Stock/QueryPurchase/querypurchase.jsp" target="_top">进货单查询</a></li>
                        <li class="lis"><a href="/hotel/Stock/QueryReturn/queryreturn.jsp" target="_top">退货单查询</a></li>
                        <li class="lis"><a href="/hotel/Stock/QueryPick/querypick.jsp" target="_top">领料单查询</a></li>
                        <li class="lis"><a href="/hotel/Stock/QueryReturnPick/queryreturnpick.jsp" target="_top">领料退货单查询</a></li>
                        <li class="lis"><a href="/hotel/Stock/QueryStockChange/querystockchange.jsp" target="_top" class="select">库存调拨查询</a></li>
                        <li class="lis"><a href="/hotel/Stock/QueryAllStock/queryallstock.jsp" target="_top">当前库存</a></li>
                    </ul>
                </div>
                <div id="d3" class="select">
                    <a class="menuitem submenuheader" headerindex="2h"><span class="accordprefix"></span>
                        <span class="accordprefix">基本信息</span> 
                    <span id="s3" class="accordsuffix"><img src="/hotel/img/roomrack/plus.gif" class="statusicon"></span></a>
                </div>
                <div id="dd3" class="submenu" contentindex="2c" style="display: none;">
                    <ul>
                        <li class="lis"><a href="/hotel/Stock/StockInfor/stockinfor.jsp" target="_top">仓库信息</a></li>
                        <li class="lis"><a href="/hotel/Stock/Supplier/supplier.jsp" target="_top">供应商信息</a></li>
                    </ul>
                </div>
            
        </div>
        <div style="line-height: 10px;">&nbsp;</div>
    </div>


</body>
</html>
