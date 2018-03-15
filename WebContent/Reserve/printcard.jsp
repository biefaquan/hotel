<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>押金凭证</title>
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
//确定预订天数（预订时的天数）
window.onload=function(){
	var start=new Date("${rr.rr_startdate}").toLocaleDateString();
	var end=new Date("${rr.rr_enddate}").toLocaleDateString();
	start=start.replace(/-/g,"/");
	var startdate=new Date(start);
	end=end.replace(/-/g,"/");
	var enddate=new Date(end);
	var time=enddate.getTime()-startdate.getTime();
	var days=parseInt(time/(1000 * 60 * 60 * 24));
	$("#Days").val(days);
}
</script>
    
    
    
    

<link media="all" href="/hotel/css/reserve/printcard.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="z-btn">
            <div class="z-btn-left"><i>&nbsp;</i></div>
            <div class="z-btn-center">
                <em>
                    <input value="打印" class="z-button z-btn-text icon-print" id="btnPrint" type="button" onclick="javascript:window.print();"></em>
            </div>
            <div class="z-btn-right"><i>&nbsp;</i></div>
        </div>
    </div>
    <div style="padding: 0px; width: 100%; float: left;">
        <div class="print" id="print" style="margin: 0px auto; background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 800px;">
            <h1 id="lblCompany">预订收款凭证</h1>
            <div class="number" id="BookNo" style="width: 140px; float: right;">单号： ${rr.rr_id }</div>
            <div class="main">
                <div id="ShowDate">
                <c:forEach items="${rr.rnlist }" var="rn">
               	 	<ul><li><label> 房类：</label><b>${rn.r.rt.rt_name }</b></li><li><label>房价：</label><b>${rn.r.rt.rt_price }</b></li><li><label> 房数：</label><b>1间</b></li></ul></div>
                </c:forEach>
                <h2>基本信息</h2>
                <ul>
                    <li id="YJDName">
                        <label>预订人：</label><b id="Name">${rr.rr_name }</b></li>
                    <li id="YJDDays">
                        <label>预住天数：</label><b><input id="Days" style="width: 20px;border: 0;" disabled="disabled" type="text"/></b></li>
                    <li id="YJDPhone">
                        <label>电话：</label><b id="Phone">${rr.rr_phone }</b></li>
                    <li id="YJDEnterDate">
                        <label>来店时间：</label><b id="EnterDate"><fmt:formatDate value="${rr.rr_startdate }" pattern="yyyy-MM-dd" /></b></li>
                    <li id="YJDExpireDate">
                        <label>留房时间：</label><b id="ExpireDate"><fmt:formatDate value="${rr.rr_enddate }" pattern="yyyy-MM-dd" /></b></li>
                </ul>
                <ul id="YJDRemark">
                    <li style="width: 100%;">
                        <label>备注：</label><b id="Remark">${rr.rr_reward }</b></li>
                </ul>
                <h2>收款</h2>
                <ul>
                    <li id="YJDPayMented">
                        <label>支付方式：</label><b id="PayMented">${rr.rr_paytype }</b></li>
                    <li id="YJDAmount">
                        <label>订金：</label><b id="Amount">${rr.rr_depositfee }</b></li>
                </ul>
            </div>
            <div class="wxts">
                <label id="lbl1" style="display: none;">温馨提示：</label>
                <div id="lbl2" style="display: none;">尊敬的顾客,非常荣幸您选择本酒店作为您的下塌之处,我谨在职此感谢你 给予我们的支持与厚爱!</div>
            </div>
            
        </div>
    </div>


</body>
</html>
