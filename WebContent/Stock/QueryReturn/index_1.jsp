<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
    
    

    

<link media="all" href="/hotel/css/stock/supplier/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="stock_set">
        <div class="fl">
            <iframe src="/hotel/Stock/QueryReturn/index_2.jsp" id="menu_left" name="menu_left" scrolling="yes" style="background: rgb(243, 243, 243) none repeat scroll 0% 0%; border-right: 1px solid rgb(221, 221, 221); display: block;" width="130" height="468" frameborder="0"></iframe>
        </div>
        <div class="fr">
            <iframe src="/hotel/StockListController/queryAllByPage1" id="set_main" name="set_main" scrolling="yes" style="display: block;" width="100%" height="468" frameborder="0"></iframe>
        </div>
    </div>


    <div class="white_content pwin" style="cursor: pointer;">
        <div class="close" tag="pwin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin_black"></div>

    <div class="white_content pwin2" style="z-index: 1004; cursor: pointer;">
        <div class="close" tag="pwin2">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin2');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin2_black" style="z-index: 1003;"></div>



</body>
</html>
