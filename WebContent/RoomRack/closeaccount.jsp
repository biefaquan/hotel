<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript">
//关闭本界面
function closewindow() {
	var div3 = parent.document.getElementById("div3");
	div3.style.display = "none";
}
</script>
<link media="all" href="/hotel/css/roomrack/closeaccount.css" type="text/css" rel="stylesheet">
</head>
<body>
<form action="/hotel/RegistrationInforController/closeAccount" target="_top" method="post">
    <!--入住弹出窗口-->
    <div class="ruzhu_infor" style="overflow: hidden;" id="divBill">
        <div class="line">
            <div class="fl" id="divTitle">结账</div>
        </div>
        <div class="types">
            <h1 style="padding-bottom: 10px;">
                <div class="fl">
                    <label>房号：</label>
                    <input id="txtFH" style="border: 1px solid rgb(221, 221, 221); width: 80px; height: 20px; line-height: 20px;" autocomplete="off" class="ac_input" value="${room.r_roomnum }" type="text">
                    <a href="javascript:void(0);" style="font-size: 12px; color: rgb(7, 136, 189); text-decoration: underline; margin: 0px 15px;" id="lblMSK">读门锁卡</a>
                    <a href="javascript:void(0);" style="font-size: 12px; color: rgb(7, 136, 189); text-decoration: underline; display: none;" id="lblMX">查看明细</a>
                    <a href="javascript:void(0);" style="font-size: 12px; padding-left: 15px;" id="lblFHS">结账房间数：1间&nbsp;&nbsp;&nbsp;&nbsp;房号：${room.r_roomnum }</a>
                </div>
                <div class="fr">
                    <label id="lblName" style="padding-right: 20px;">姓名：${customer.c_name }</label>
                    <label id="lblRZSJ">入住时间：<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" /></label>
                </div>
            </h1>
            <h1 style="padding-bottom: 10px; display: none;" id="lianfangstate">
                <div class="fl">
                     <label class="lianfang" style="font-size: 14px; color: rgb(51, 51, 51);"></label>
                </div>
            </h1>
            <div style="width: 100%; background: rgb(0, 173, 239) none repeat scroll 0% 0%; float: left;">

                <table class="ruzhu" style="width: 98%;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <th width="10%">房号</th>
                            <th width="10%">项目名称</th>
                            <th width="10%">消费金额</th>
                            <th width="10%">支付结果</th>
                            <th width="10%">收款金额</th>
                            <th class="RowScore none" style="display: none;" width="10%">积分兑换</th>
                            <th width="15%">入账时间</th>
                            <th width="10%">操作员</th>
                            <th width="15%">备注</th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="gundong">
                <table class="ruzhu " id="tblzw" cellspacing="0" cellpadding="0">
                    <tbody>
                    <c:forEach items="${datelist }" var="d">
                        <tr id="tr_126513">
                        	<td data-newfh="101" width="10%">${room.r_roomnum }</td>
                        	<td width="10%">房租</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right;" width="10%">已付</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right; display: none;" class="RowScore none" width="10%">&nbsp;</td>
                        	<td width="15%"><fmt:formatDate value="${d }" pattern="yyyy-MM-dd" /> 3:00</td>
                        	<td width="10%">系统</td>
                        	<td width="15%"></td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${datelist1 }" var="d1">
                        <tr id="tr_126513">
                        	<td data-newfh="101" width="10%">${room.r_roomnum }</td>
                        	<td width="10%">房租</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right;" width="10%"></td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right; display: none;" class="RowScore none" width="10%">&nbsp;</td>
                        	<td width="15%"><fmt:formatDate value="${d1 }" pattern="yyyy-MM-dd" /> 3:00</td>
                        	<td width="10%">系统</td>
                        	<td width="15%"></td>
                        </tr>
                    	</c:forEach>
                    <!-- <c:if test="${days<=reservedays }">
                    	<c:forEach begin="0" end="${days }" step="1">
                        <tr id="tr_126513">
                        	<td data-newfh="101" width="10%">${room.r_roomnum }</td>
                        	<td width="10%">房租</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right;" width="10%">已付</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right; display: none;" class="RowScore none" width="10%">&nbsp;</td>
                        	<td width="15%">2017-01-14 03:00</td>
                        	<td width="10%">系统</td>
                        	<td width="15%"></td>
                        </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${days>reservedays }">
                    	<c:forEach begin="0" end="${reservedays }" step="1">
                        <tr id="tr_126513">
                        	<td data-newfh="101" width="10%">${room.r_roomnum }</td>
                        	<td width="10%">房租</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right;" width="10%">已付</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right; display: none;" class="RowScore none" width="10%">&nbsp;</td>
                        	<td width="15%">2017-01-14 03:00</td>
                        	<td width="10%">系统</td>
                        	<td width="15%"></td>
                        </tr>
                    	</c:forEach>
                    	<c:forEach begin="0" end="${days-reservedays }" step="1">
                        <tr id="tr_126513">
                        	<td data-newfh="101" width="10%">${room.r_roomnum }</td>
                        	<td width="10%">房租</td>
                        	<td style="text-align: right;" width="10%">${room.rt.rt_price }</td>
                        	<td style="text-align: right;" width="10%"></td>
                        	<td style="text-align: right;" width="10%">0.00</td>
                        	<td style="text-align: right; display: none;" class="RowScore none" width="10%">&nbsp;</td>
                        	<td width="15%">2017-01-14 03:00</td>
                        	<td width="10%">系统</td>
                        	<td width="15%"></td>
                        </tr>
                    	</c:forEach>
                    </c:if> -->
                        <tr>
                            <td width="10%"></td>
                            <td width="10%"></td>
                            <td style="text-align: right;" width="10%"></td>
                            <td style="text-align: right;" width="10%"></td>
                            <td style="text-align: right;" width="10%"></td>
                            <td class="RowScore none" style="display: none;" width="10%"></td>
                            <td width="15%"></td>
                            <td width="10%"></td>
                            <td width="15%"></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="types">
            <ul>
                <li style="margin-right: 22px; display: inline;">
                    <label style="width: 80px;">消费金额：</label><input id="txtXF" name="b_allmoney" value="${allmoney }" style="background: rgb(93, 192, 206) none repeat scroll 0% 0%;" readonly="readonly" type="text"></li>
                <li style="margin-right: 15px; display: inline;">
                    <label style="width: 76px;">已收金额：</label><input id="txtYS" name="b_receivedmoney" value="${receivedmoney }" style="background: rgb(93, 192, 206) none repeat scroll 0% 0%;" readonly="readonly" type="text"></li>
                <li style="margin-right: 22px; display: inline;">
                    <label id="lblBYS" tag="+" style="color: rgb(51, 51, 51);">本次应收：</label><input name="b_paymoney" value="${paymoney }" id="txtBYS" style="background: rgb(93, 192, 206) none repeat scroll 0% 0%;" readonly="readonly" class="input_keynote" type="text"></li>
                 <li style="margin-right: 0px; display: inline;" class="RowScore none">
                    <label style="width: 75px;">押金：</label><input value="${depositfee }" id="txtScore" style="background: rgb(238, 238, 238)" readonly="readonly" type="text"></li>
            </ul>
            <!--<ul>
                <li style="margin-right: 22px; display: inline">
                    <label style="width: 80px">预授权金额：</label><input type="text" id="txtYSC" value="0.00" style="background: #EEE" disabled="disabled" /></li>
                <li style="margin-right: 0px;">
                    <label style="width: 75px">备注：</label><input type="text" id="txtDes" maxlength="100" value="0.00" style="width: 558px" /></li>
            </ul>-->
            <ul>
                  <li style="margin-right: 0px;">
                    <label style="width: 75px;">备注：</label><input name="b_remark" id="txtDes" maxlength="100" value="" style="width: 584px;" type="text"></li>
            </ul>
            <ul id="ContractUnitsMeno">
                <li style="margin-right: 22px; display: inline;"></li>
            </ul>
        </div>
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221);" id="divZF">
            <ul>
                <li style="margin-right: 30px; display: inline;">
                   <label>支付方式：</label>
                   <select name="b_paytype" class="zffs" style="width: 130px;" id="selpay1">
                   <c:if test="${ri.ri_paytype!='挂账' }">
                    <option value="现金">现金</option>
                    <option value="银行卡">银行卡</option>
                    <option value="微信支付">微信支付</option>
                    <option value="支付宝支付">支付宝支付</option>
                   </c:if>
                   <c:if test="${ri.ri_paytype=='挂账' }">
                    <option value="挂账">挂账</option>
                   </c:if>
                 </select></li>
                <li style="margin-right: 30px; display: inline;">
                    <label id="lblPay1" class="paytitle" style="color: rgb(51, 51, 51);">收款金额：</label><input name="b_money" id="txtPay1" value="0" class="input_keynote" type="text"></li>
                <li style="display: block;" class="prepaidpay">
                    <label class="paytitle">操作员：</label><input readonly="readonly" name="MemberCardNo" value="${user.u_name }" type="text"></li>
                <li style="display: none; margin-left: -30px;" class="contractunitsmanli">
                    <label id="ContractUnitsManLable">签单人：</label><input name="ContractUnitsMan" value="" type="text"></li>
                
            </ul>
        </div>
        <div class="types">
            <ul style="float: left; width: 500px; color: rgb(7, 136, 189); font-size: 14px; padding-top: 5px;">
                <li id="ShowSign" style="display: none; margin-top: 10px;">
                    <input id="btnSign" class="bus_add" value="电子签名" type="button">
                    <input id="btnReSign" class="bus_add" style="display: none;" value="重新签名" type="button">
                    <img style="width: 120px; height: 40px; display: none;" id="imgSign" alt="">
                </li>
            
                
            </ul>

            <ul style="float: right; width: 400px;">
                <li style="display: none;">
                    <input class="bus_add" id="btnAddPrice" value="补差价" type="button">
                </li>
                <li>
                    <input id="listday" value="" type="hidden">
                    <input id="roomnumber" value="" type="hidden">
                    <input class="bus_add " id="btnOK" value="结账" type="submit"></li>
                <li style="">
                    <input class="bus_add " id="btnPrint" value="打印" onclick="javascript:window.print();" type="button"></li>
                <li style="margin-right: 0px;">
                    <input class="bus_dell " onclick="closewindow()" id="btnExit" value="关闭" style="margin-right: 0px;" type="button"></li>
            </ul>
            <!-- 需要传递到后台的属性值 -->
            <input name="r.r_id" value="${room.r_id }" type="hidden"/>
            <input name="c.c_id" value="${customer.c_id }" type="hidden"/>
            <input name="b_source" value="${source }" type="hidden"/>
            <input name="b_typenum" value="${typenum }" type="hidden"/>
            <input name="b_keyway" value="${keyway }" type="hidden"/>
            <input name="u.u_id" value="${user.u_id }" type="hidden"/>
            <input name="b_starttime" value="${date }" type="hidden"/>
            <input name="selecttype" value="${selecttype }" type="hidden"/>
            <input name="selectid" value="${selectid }" type="hidden"/>
        </div>
    </div>
</form>




</body>
</html>
