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
function closewindow() {
	var div1 = parent.parent.document.getElementById("div1");
	div1.style.display = "none";
}
</script>
<link media="all" href="/hotel/css/stock/purchaselist/detail.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
    <div class="ruzhu_infor" style="width: 860px;">
        <div class="line">
            <div class="fl">库存调拨单详情</div>
            <div class="fr none" id="divMemberCardNo" style="display: none;">会员卡号：<span id="MemberCardNo"></span>  可用积分:<span id="UsableScore"></span></div>
            <div class="fr none" id="divJzsgdh">手工单号：<span id="lblJzsgdh"></span></div>
        </div>
        <div class="types">
            <ul>
                <li style="margin-right: 42px; display: inline;">
                    <label style="width: 50px;">单号：</label><p id="RoomNo">${sc.sc_id }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>出库仓库：</label>
                    <c:forEach items="${shlist }" var="sh">
                    	<c:if test="${sh.sh_id==sc.sc_outsh }">
                    		<p id="RoomTypeName">${sh.sh_name }</p>
                    	</c:if>
                    </c:forEach>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>入库仓库：</label>
                    <c:forEach items="${shlist }" var="sh">
                    	<c:if test="${sh.sh_id==sc.sc_insh }">
                    		<p id="RoomTypeName">${sh.sh_name }</p>
                    	</c:if>
                    </c:forEach>
                </li>
                <li style="margin-right: 0px; display: inline;">
                    <label>单据日期：</label><p id="Phone"><fmt:formatDate value="${sc.sc_date }" pattern="yyyy-MM-dd" /></p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label style="width: 50px;">经手人：</label><p id="Source">${sc.u.u_name }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>合计金额：</label><p id="OpenTypeName">${sc.sc_money }</p>
                </li>
            </ul>
        </div>
        <div class="types">
            <div style="width: 100%; background: rgb(0, 173, 239) none repeat scroll 0% 0%; float: left;">
                <table class="ruzhu" style="width: 98%;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr><th width="8%">商品编号</th>
                        <th width="18%">商品名称</th>
                        <th width="10%">单位</th>
                        <th width="10%">单价</th>
                        <th width="12%">数量</th>
                        <th width="16%">金额</th>
                        <th width="22%">备注</th>
                    </tr></tbody>
                </table>
            </div>
            <div class="gundong">
                <table class="ruzhu" id="AccountTB" cellspacing="0" cellpadding="0">
                    <tbody>
                    <c:forEach items="${sc.scdlist }" var="scd">
                        <tr>
                            <td width="8%">${scd.g.g_id }</td>
                            <td width="18%">${scd.g.g_name }</td>
                            <td width="10%">${scd.g.g_unit }</td>
                            <td width="10%">${scd.scd_price }</td>
                            <td width="12%">${scd.scd_number }</td>
                            <td width="16%">${scd.scd_money }</td>
                            <td width="22%">${scd.scd_reward }</td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <ul style="float: right; width: 94px;">
                <li style="margin-right: 0px;">
                    <input class="bus_dell " onclick="closewindow()" id="btnClose" value="关闭" style="margin-right: 0px;" type="button"></li>
            </ul>
        </div>
    </div>

</body>
</html>
