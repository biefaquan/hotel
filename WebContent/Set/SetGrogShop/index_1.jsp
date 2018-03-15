<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    

<link media="all" href="/hotel/css/set/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="set">
        <div class="fl" style="width: 10%;">
            <iframe src="/hotel/Set/SetGrogShop/index_2.jsp" id="menu_left" name="menu_left" scrolling="yes" style="float: left; background: rgb(243, 243, 243) none repeat scroll 0% 0%; border-right: 1px solid rgb(221, 221, 221); display: block;" width="119" height="468" frameborder="0"></iframe>
        </div>

        <div class="fr" id="div" style="width: 90%;">
            <!--酒店信息-->
            <!--<iframe src="Company.html" width="100%" frameborder="0" id="set_main" name="set_main" scrolling="yes" frameborder="0" style="float: left"></iframe>-->
            <iframe src="/hotel/GrogShopController/query" id="set_main" name="set_main" scrolling="yes" style="display: block;" width="100%" height="468" frameborder="0"></iframe>
            <!--end-->

        </div>
    </div>



</body>
</html>
