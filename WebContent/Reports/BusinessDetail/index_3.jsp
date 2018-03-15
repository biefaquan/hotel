<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>  
<script type="text/javascript">
/** 
*js中更改日期  
* y年， m月， d日， h小时， n分钟，s秒  
*/  
Date.prototype.add = function (part, value) {  
    value *= 1;  
    if (isNaN(value)) {  
        value = 0;  
    }  
    switch (part) {  
        case "y":  
            this.setFullYear(this.getFullYear() + value);  
            break;  
        case "m":  
            this.setMonth(this.getMonth() + value);  
            break;  
        case "d":  
            this.setDate(this.getDate() + value);  
            break;  
        case "h":  
            this.setHours(this.getHours() + value);  
            break;  
        case "n":  
            this.setMinutes(this.getMinutes() + value);  
            break;  
        case "s":  
            this.setSeconds(this.getSeconds() + value);  
            break;  
        default:  
   
    }  
} 
function QueryDetail() {
	var startdate = document.getElementById("StartDate").value;
	var enddate = document.getElementById("EndDate").value;
	var roomnum = document.getElementById("RoomNo").value;
	window.location.href="/hotel/InAccountController/queryDetail?startdate="+startdate+"&enddate="+enddate+"&roomnum="+roomnum;
}
</script> 
    
    


<link media="all" href="/hotel/css/reports/businessdetail/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <h1 class="report_h1">
        <b>营业明细</b>
        <b class="rq">
            <div class="ftt_search fontYaHei">
                <label>入账时间：</label><input style="width: 110px; margin-right: 5px; font-size: 12px;" id="StartDate" value="<fmt:formatDate value='${starttime }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>至</label><input style="width: 110px; font-size: 12px;" id="EndDate" value="<fmt:formatDate value='${endtime }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>房号：</label>
                <c:if test="${roomnum!=0 }">
                	<input style="width: 40px; font-size: 12px;" id="RoomNo" value="${roomnum }" type="text">
                </c:if>
                <c:if test="${roomnum==0 }">
                	<input style="width: 40px; font-size: 12px;" id="RoomNo" type="text">
                </c:if>
                <input class="qtantj" value="查询" id="btnSearch" onclick="QueryDetail()" type="button">
                <input class="qtantj" value="导出" id="btnExport" style="margin-left: 10px;" type="button">
                <input value="打印" class="qtantj" onclick="Print()" style="margin-left: 10px;" type="button">
            </div>
        </b>
    </h1>
    <table class="report_table" id="tbList" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th width="120">单号</th>
                <th width="80">房号</th>
                <th width="140">房间类型</th>
                <th width="140">项目名称</th>
                <th width="120">消费金额</th>
                <th width="160">入账时间</th>
                <th width="120">操作员</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${pb.list }" var="ia">
        		<tr>
        			<td>${ia.ia_id }</td>
        			<td>${ia.r.r_roomnum }</td>
        			<td>${ia.r.rt.rt_name }</td>
        			<td>房租</td>
        			<td>${ia.ia_money }</td>
        			<td><fmt:formatDate value="${ia.ia_intime }" pattern="yyyy-MM-dd" /></td>
        			<td>系统</td>
        		</tr>
        	</c:forEach>
        </tbody>
        <tfoot>
            <tr style="color: rgb(7, 137, 190);">
                <td class="right" colspan="3">当前合计：</td>
                <td class="right" id="xiao">${money }</td>
                <td colspan="3"></td>
            </tr>
        </tfoot>
    </table>
    <div class="report_db">
        <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
    </div>
    <!--打印容器开始-->
    <div id="print" style="display: none; width: 960px; margin: 0px auto;">
        
        <h1 style="width: 100%; font-size: 20px; color: rgb(0, 0, 0); text-align: center; float: left; line-height: 45px;">营业明细</h1>
        <table id="printTable" style="width: 100%;" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th style="width: 120px;">单号</th>
                    <th style="width: 80px;">房号</th>
                    <th style="width: 140px;">项目名称</th>
                    <th style="width: 120px;">消费金额</th>
                    <th style="width: 160px;">入账时间</th>
                    <th style="width: 120px;">操作员</th>
                    <th style="width: auto;">备注</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
            <tfoot>
            <tr>
                <td class="right" colspan="3">总合计：</td>
                <td class="right" id="PpageAmount">0.00</td>
                <td colspan="3">&nbsp;</td>
            </tr>
            </tfoot>
        </table>
    </div>
    <!--打印容器结束-->


</body>
</html>
