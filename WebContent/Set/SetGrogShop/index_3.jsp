<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>

<script type="text/javascript">
	function mycheck(myform){
		if(myform.gs_name.value==""){
			alert("酒店名称不能为空！！");
			return false;
		}
		if(myform.s_province.value=="省份"||myform.s_city.value=="地级市"||myform.s_county.value=="市、县级市"){
			alert("请填写地址！");
			return false;
		}
	}
	

</script>
    
    
    
    
    

<link media="all" href="/hotel/css/set/index_3.css" type="text/css" rel="stylesheet">
</head>

<body>
    <!--酒店信息-->
    <form id="form1" name="form1" action="/hotel/GrogShopController/update" target="_top" method="post" onsubmit="return mycheck(form1)">
    <div class="main">
        <h1 class="hotel_infor">酒店信息</h1>
        <ul class="hotel_infor">
            <li>
                <label><b>*</b>酒店名称：</label>
                <input name="gs_name" id="txtName" style="background: rgb(238, 238, 238) none repeat scroll 0% 0%;" value="${gs.gs_name }" type="text">
            </li>
            <li>
                <label><b>*</b>联系人：</label>
                <input name="gs_linkman" id="txtContactName" value="${gs.gs_linkman }" type="text">
            </li>
            <li>
                <label><b>*</b>电话：</label>
                <input name="gs_phone" id="txtPhone" value="${gs.gs_phone }" type="text">
            </li>
            <li>
                <label><b></b>传真：</label>
                <input name="gs_fax" id="txtFax" value="${gs.gs_fax }" type="text">
            </li>
            <li>
                <label>地址市：</label>
				<select id="s_province" name="s_province"></select>  
    			<select id="s_city" name="s_city" ></select>  
    			<select id="s_county" name="s_county"></select>
    			<script class="resources library" src="/hotel/js/area.js" type="text/javascript"></script>
    			<script type="text/javascript">_init_area();</script>
            </li>
            
            
            <li>
                <label>简介：</label>
                <textarea name="gs_introduction" id="Discription">${gs.gs_introduction }</textarea>
            </li>
            <li>
                <label>&nbsp;</label>
                <input value="保 存" class="bus_add" id="btnSure" type="submit">
            </li>
        </ul>
    </div>
    </form>
    <!--end-->


</body>
</html>
