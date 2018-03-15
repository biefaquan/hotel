<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>会员消费报表</title>
    
 <script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>   
 <script type="text/javascript" src="/hotel/js/excel.js" ></script>

<link media="all" href="/hotel/css/reports/occupancy/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form method="post" action="/hotel/MemberController/queryConsumeDetail1" id="ctl00">
    <h1 class="report_h1">
        <b>
            <div class="ftt_search fontYaHei">
                <label>结账时间：</label><input name="starttime" id="StartDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>至</label><input name="endtime" id="EndDate" style="width: 120px; margin-right: 5px;" value="<fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text">
                <label>卡号：</label><input name="typenum" id="CardNo" style="width: 120px; margin-right: 5px;" value="${typenum }" type="text">
                <input name="btnQuery" value="查询" onclick="return(checkDate());" id="btnQuery" class="qtantj" type="submit">
            </div>
        </b>
        <b style="margin: 8px 0px 0px 20px; display: inline;">
            <div class="z-btn">
                <div class="z-btn-left"><i>&nbsp;</i></div>
                <div class="z-btn-center">
                    <em>
                        <input value="打印预览" onclick="javascript:window.print()" class="z-button z-btn-text icon-print" id="btnPrint" width="300px" type="button">
                    </em>
                </div>
                <div class="z-btn-right"><i>&nbsp;</i></div>
            </div>
            <div class="z-btn">
                <div class="z-btn-left"><i>&nbsp;</i></div>
                <div class="z-btn-center">
                    <em>
                        <input name="btnExport" onclick="javascript:method1('printTable')" value="导出EXCEL" id="btnExport" class="z-button z-btn-text icon-excel" type="button">
                    </em>
                </div>
                <div class="z-btn-right"><i>&nbsp;</i></div>
            </div>
        </b>
    </h1>
    <div id="printContent" style="width: 960px; margin: 0px auto;"> 
        
        <div class="report_h2">
            <b>会员消费报表</b>
            <p>
                <span id="DateSpan" style="width: 240px;">时间范围：<fmt:formatDate value='${startdate }' pattern='yyyy-MM-dd' /> 至 <fmt:formatDate value='${enddate }' pattern='yyyy-MM-dd' /></span>
                <span id="ZbrSpan">制表人：${uer.u_name }</span>
            </p>
        </div>
        <table class="report_table" id="printTable" cellspacing="0" cellpadding="0" border="1">
            <thead>
                <tr class="tis">
                    <td>会员类型</td>
                    <td>卡号</td>
                    <td>姓名</td>
                    <td>电话</td>
                    <td>单号</td>
                    <td>房号</td>
                    <td>房间类型</td>
                    <td>入住时间</td>
                    <td>结账时间</td>
                    <td>天数</td>
                    <td>房价</td>
                    <td>房租</td>
                    <td>消费</td>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${blist }" var="b">
                 <tr>
                 	<c:forEach items="${mlist }" var="m">
                 		<c:if test="${m.m_id==b.b_typenum }">
                 		 <td>${m.mt.mt_name }</td>
                 		 <td>${m.m_cardnum }</td>
                 		</c:if>
                 	</c:forEach>
                    <td>${b.c.c_name }</td>
                    <td>${b.c.c_phone }</td>
                    <td>${b.b_id }</td>
                    <td>${b.r.r_roomnum }</td>
                    <td>${b.r.rt.rt_name }</td>
                    <td><fmt:formatDate value='${b.b_starttime }' pattern='yyyy-MM-dd' /></td>
                    <td><fmt:formatDate value='${b.b_endtime }' pattern='yyyy-MM-dd' /></td>
                    <td>${b.b_days }</td>
                    <td>${b.r.rt.rt_price }</td>
                    <td>${b.b_allmoney/b.b_days }</td>
                    <td>${b.b_allmoney }</td>
                </tr>
                </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="9" style="text-align: right;">合计:</td>
                    <td style="text-align: right;">${sc.s1 }</td>
                    <td style="text-align: right;">${sc.s2 }</td>
                    <td style="text-align: right;">${sc.s3 }</td>
                    <td style="text-align: right;">${sc.s4 }</td>
                </tr>
            </tfoot>
        </table>

    </div>
    </form>



</body>
</html>
