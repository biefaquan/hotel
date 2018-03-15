<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
    
    
    
    
    
    

<link media="all" href="/hotel/css/reports/businessdetail/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="report">
        <div class="fl" style="float: left; width: 10%;">
            <iframe src="/hotel/Reports/BusinessAnalysis/index_2.jsp" id="menu_left" name="menu_left" scrolling="no" style="float: left; background: rgb(243, 243, 243) none repeat scroll 0% 0%; border-right: 1px solid rgb(221, 221, 221); display: block;" width="119" height="468" frameborder="0"></iframe>
        </div>
        <div class="fr" id="div" style="width: 90%;">
            <!--营业明细查询-->
            <iframe src="/hotel/InAccountController/queryInAccount" id="report_main" name="report_main" scrolling="yes" style="display: block;" width="100%" height="468" frameborder="0"></iframe>
            <!--end-->
        </div>
    </div>

    


</body>
</html>
