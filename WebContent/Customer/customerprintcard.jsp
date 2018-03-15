<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>
	入住单
</title>

    
    
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link media="all" href="/hotel/css/customer/customerprintcard.css" type="text/css" rel="stylesheet">

</head>
<body>
    <form method="post" action="http://www.jdd365.cn/BillInfor/BillRZD.aspx?orderno=201703260002" id="form1">
        <div>
            <div class="z-btn">
                <div class="z-btn-left">
                    <i>&nbsp;</i>
                </div>
                <div class="z-btn-center">
                    <em>
                        <input value="打印" class="z-button z-btn-text icon-print" id="btnPrint" type="button" onclick="javascript:window.print();">
                    </em>
                </div>
                <div class="z-btn-right"><i>&nbsp;</i></div>
            </div>
        </div>
        <div style="padding: 0px; width: 100%; float: left;" id="printdiv">
            <div class="print" id="print">
                <h1>入住及押金凭证</h1>
                <div class="number" style="width: 150px;" id="OrderNo">
                    主单号：${ri.ri_id }
                </div>
                
                <div class="main">
                    
                    <ul>
                        <li id="FH">
                            <label>房号：</label><b>${ri.r.r_roomnum }</b></li>
                        <li id="RoomKind">
                            <label>房间类别：</label><b>${ri.r.rt.rt_name }</b></li>
                        <li id="BJ">
                            <label>标价：</label><b>${ri.r.rt.rt_price }</b></li>
                        <li id="Price">
                            <label>折后价：</label><b>200.00</b></li>
                        <li id="Name">
                            <label>姓名：</label><b>${ri.c.c_name }</b></li>
                        <li id="CardType">
                            <label>证件：</label><b>${ri.c.c_idtype }</b></li>
                        <li style="width: 250px;" id="CardNo">
                            <label>证件号码：</label><b class="sfz">${ri.c.c_idcard }</b></li>
                    </ul>
                    <ul>
                        <li id="RZSJ">
                            <label>来店时间：</label><b><fmt:formatDate value="${ri.ri_opentime }" pattern="yyyy-MM-dd" /></b></li>
                        <li id="RZDays">
                            
                              <label>预住天数：</label>
                            
                          <b>${ri.ri_days }</b></li>
                        <li id="YJ">
                            <label>押金：</label><b>${ri.ri_depositfee }</b></li>
                        <li id="OpenKind">
                            <label>开房方式：</label><b>${ri.ri_keyway }</b></li>
                        <li id="CZY">
                            <label>接待员：</label><b>${ri.u.u_name }</b></li>
                        <li style="width: 99%;" id="Addr">
                            <label>地址：</label>
                            <b>${ri.c.c_adress }</b>
                        </li>
                        <li style="width: 99%;" id="PayName">
                            <label>付款：</label>
                            <b>现金:${ri.ri_allmoney }</b>
                        </li>
                        
                    </ul>
                    
                </div>
                <div class="sign">
                    <div class="l"><p style="display: block; float: left; line-height: 40px; padding: 0px;">客人签名：</p>
                                                 
                        </div>
                    <div class="r" id="lblCurTime"><p style="display: block; float: left; line-height: 40px; padding: 0px;">时间：<fmt:formatDate value="${nowdate }" pattern="yyyy-MM-dd HH:mm" /></p></div>
                </div>
                <br>
                
            </div>
        </div>
    </form>


</body>
</html>
