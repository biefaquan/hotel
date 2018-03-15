<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
   
<script type="text/javascript">
//关闭本界面
function closewindow() {
	var div2 = parent.document.getElementById("div2");
	div2.style.display = "none";
}
</script>
<link media="all" href="/hotel/css/customer/detail.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
    <div class="ruzhu_infor" style="width: 860px;">
        <div class="line">
            <div class="fl">入住单详情</div>
            <div class="fr" style="margin-left: 20px; display: inline;">入住单号：<span id="OrderNo">${ri.ri_id }</span></div>
        </div>
        <div class="types">
            <ul>
                <li style="margin-right: 42px; display: inline;">
                    <label style="width: 50px;">房号：</label><p id="RoomNo">${ri.r.r_roomnum }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>房间类型：</label><p id="RoomTypeName">${ri.r.rt.rt_name }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>客人姓名：</label><p id="CustomerName">${ri.c.c_name }</p>
                </li>
                <li style="margin-right: 10px; display: inline;">
                    <label>电话：</label><p id="Phone">${ri.c.c_phone }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label style="width: 50px;">来源：</label><p id="Source">${ri.ri_source }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>开房方式：</label><p id="OpenTypeName">${ri.ri_keyway }</p>
                </li>
                <li style="margin-right: 42px; display: inline;">
                    <label>房价：</label><p id="Price">${ri.r.rt.rt_price }</p>
                </li>
                <li style="margin-right: 0px; display: inline;">
                    <label>状态：</label>
                    <c:if test="${ri.ri_state==1 }">
                    	<p id="StatusName">在住</p>
                    </c:if>
                     <c:if test="${ri.ri_state==0 }">
                    	<p id="StatusName">退房</p>
                    </c:if>
                </li>
                <li style="margin-right: 0px; display: inline;">
                    <label>入住时间：</label><p id="EnterDate"><fmt:formatDate value="${ri.ri_opentime }" pattern="yyyy-MM-dd" /></p>
                </li>
                <li style="margin-right: 0px; display: inline;">
                    <label>天数：</label><p id="Days">${ri.ri_days }</p>
                </li>
                
            </ul>
        </div>
        <div class="types">
            <div style="width: 100%; background: rgb(0, 173, 239) none repeat scroll 0% 0%; float: left;">
                <table class="ruzhu" style="width: 98%;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr><th width="8%">房号</th>
                        <th width="18%">项目名称</th>
                        <th width="10%">消费金额</th>
                        <th width="10%">支付方式</th>
                        <th width="12%">收款金额</th>
                        <th width="16%">入账时间</th>
                        <th width="10%">操作员</th>
                        <th width="22%">备注</th>
                    </tr></tbody>
                </table>
            </div>
            <div class="gundong">
                <table class="ruzhu" id="AccountTB" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td width="8%">${ri.r.r_roomnum }</td>
                            <td width="18%">入住押金</td>
                            <td style="text-align: right;" class="consume" width="10%">${ri.spare2 }</td>
                            <td style="text-align: right;" width="10%">现金</td>
                            <td style="text-align: right;" class="pay" width="12%">${ri.ri_allmoney }</td>
                            <td width="16%"><fmt:formatDate value="${ri.ri_opentime }" pattern="yyyy-MM-dd" /></td>
                            <td width="10%">${ri.u.u_name }</td>
                            <td style="word-break: break-all;" width="30%">入住押金</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align: right;"></td>
                            <td style="text-align: right;"></td>
                            <td style="text-align: right;"></td>
                            <td></td>
                            <td></td>
                            <td style="word-break: break-all;"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align: right;"></td>
                            <td style="text-align: right;"></td>
                            <td style="text-align: right;"></td>
                            <td></td>
                            <td></td>
                            <td style="word-break: break-all;"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <ul style="float: right; width: 94px;">
                <li style="margin-right: 0px;">
                    <input onclick="closewindow()" class="bus_dell " id="btnClose" value="关闭" style="margin-right: 0px;" type="button"></li>
            </ul>
        </div>
    </div>

</body>
</html>
