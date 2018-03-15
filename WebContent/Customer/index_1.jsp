<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理平台</title>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wc" uri="http://javacrazyer.iteye.com/tags/pager" %>   
    
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#state").val("${state}");
	$("#source").val("${source}");
});
function PrintCard() {
	var ri_id = document.getElementsByName("ri_id");
	var size=0;
	var id;
	for(var i=0;i<ri_id.length;i++){
		if(ri_id[i].checked){
			size++;
			id=ri_id[i].value;
		}
	}
	if(size>1){
		alert("只能选择一个，请重新选择！！");
	}else if(id!=null){
		var iframe1 = parent.document.getElementById("iframe1");
		iframe1.src="/hotel/RegistrationInforController/queryRI?ri_id="+id;
		var div1 = parent.document.getElementById("div1");
		div1.style.display="block";	
	}
}
//入住单详细
function detail(id,spare2) {
	var iframe2 = parent.document.getElementById("iframe2");
	iframe2.src="/hotel/RegistrationInforController/queryRI1?ri_id="+id+"&spare2="+spare2;
	var div2 = parent.document.getElementById("div2");
	div2.style.display="block";
}
</script>   
    
    
    
    
    
    
    
    
    
      
    
    
    

<link media="all" href="/hotel/css/customer/index_1.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="main " style="width: 98%; margin-left: 1%;">
        <form action="/hotel/RegistrationInforController/queryAllDetail">
        <div class="ftt_search fontYaHei">
            <label>类型：</label>
            <select id="state" name="state">
            	<option value="-1">全部</option>
                <option value="1">在住客人</option>
                <option value="2">今日预离</option>
                <option value="3">已退房</option>
                <option value="4">挂单客人</option>
                <option value="5">撤单客人</option>
                <option value="6">催钱房租</option>
            </select>
            <label>来源：</label>
            <select id="source" name="source">
            	<option value="-1">全部</option>
                <c:forEach items="${rtlist }" var="rt">
                	<option value="${rt.rt_id }">${rt.rt_name }</option>
                </c:forEach>
            </select>
            <input class="qtantj" value="查询" id="btnSearch" type="submit">
        </div>
		</form>
		
        <table class="ruzhu" id="tbList" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                	<th></th>
                    <th>订单编号</th>
                    <th>房号</th>
                    <th>房型</th>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>来源</th>
                    <th>是否团队</th>
                    <th>入住时间</th>
                    <th>离店时间</th>
                    <th>状态</th>
                    <th id="LevaTime">预住天数</th>
                    <th>已住天数</th>
                    <th>房价</th>
                    <th>收款</th>
                    <th>定金</th>
                    <th>产生房租</th>
                    <th id="YuE">余额</th>
                    <th style="width: 100px;">备注</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${pb.list }" var="ri">
            	<tr>
            		<td><input name="ri_id" value="${ri.ri_id }" type="checkbox"/></td>
            		<td><a onclick="detail(${ri.ri_id },${ri.spare2 })" class="orderno">${ri.ri_id }</a></td>
            		<td>${ri.r.r_roomnum }</td> <td>${ri.r.rt.rt_name }</td>
            		<td>${ri.c.c_name }</td>
            		<td>${ri.c.c_phone }</td>
            		<td>${ri.ri_source }</td>
            		<c:forEach items="${tilist }" var="ti">
            			<c:if test="${ri.ti_id==ti.ti_id }"><td>${ti.ti_name }</td></c:if>
            			<c:if test="${ri.ti_id!=ti.ti_id }"><td></td></c:if>
            		</c:forEach>
            		<td><fmt:formatDate value="${ri.ri_opentime }" pattern="yyyy-MM-dd" /></td>
            		<c:if test="${ri.ri_state==0 }">
            			<td><fmt:formatDate value="${ri.ri_endtime }" pattern="yyyy-MM-dd" /></td>
            			<td>已退房</td>
            		</c:if>
            		<c:if test="${ri.ri_state==1 }">
            			<td></td>
            			<td>入住中</td>
            		</c:if>
            		<c:if test="${ri.ri_state==-1 }">
            			<td><fmt:formatDate value="${ri.ri_endtime }" pattern="yyyy-MM-dd" /></td>
            			<td>撤销入住</td>
            		</c:if>
            		<td>${ri.ri_days }</td>
            		<td>${ri.spare }</td>
            		<td style="text-align: right;">${ri.r.rt.rt_price }</td>
            		<td style="text-align: right;" class="rowspan" rowspan="1">${ri.ri_allmoney }</td>
            		<td style="text-align: right;" class="rowspan" rowspan="1">${ri.ri_depositfee }</td>
            		<td style="text-align: right;" class="rowspan" rowspan="1">${ri.spare2 }</td>
            		<td style="text-align: right;" class="rowspan YuE" rowspan="1">${ri.spare3 }</td>
            		<td>${ri.ri_reward }</td></tr>
            </c:forEach></tbody>
            <tfoot>
               
            </tfoot>
        </table>

        <div class="ruzhu_infor" style="width: 100%; padding: 0px;">
            <div class="types">
                <ul style="float: left; width: 850px; margin-top: -5px;">
                    <li>
                        <input onclick="PrintCard()" class="bus_add " tag="3" id="btn3" value="补打入住单" style="display: block;" type="button"></li>
               </ul>

                <ul style="float: right; width: 400px;">
                    <wc:pager pageNo="${pb.pageNo }" pageSize="${pb.pageSize }" url="${pb.url }" recordCount="${pb.count }"/>
                </ul>
            </div>
        </div>
        <div class="ping_open" style="display: none; height: 150px;">
            <h1>请选择要打印的续住单：</h1>
            <table cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th width="58%">续住时间</th>
                        <th width="30%">操作</th>
                    </tr>
                </thead>
            </table>
            <div style="height: 95px; overflow-y: scroll; float: left; width: 100%;">
                <table class="tbchooseorder" cellspacing="0" cellpadding="0">
                    <tbody>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>


<div class="xdsoft_datetimepicker xdsoft_noselect xdsoft_"><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev" style="visibility: visible;"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>一月</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option xdsoft_current" data-value="0">一月</div><div class="xdsoft_option " data-value="1">二月</div><div class="xdsoft_option " data-value="2">三月</div><div class="xdsoft_option " data-value="3">四月</div><div class="xdsoft_option " data-value="4">五月</div><div class="xdsoft_option " data-value="5">六月</div><div class="xdsoft_option " data-value="6">七月</div><div class="xdsoft_option " data-value="7">八月</div><div class="xdsoft_option " data-value="8">九月</div><div class="xdsoft_option " data-value="9">十月</div><div class="xdsoft_option " data-value="10">十一月</div><div class="xdsoft_option " data-value="11">十二月</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2017</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option xdsoft_current" data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option " data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next" style="visibility: visible;"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr><td data-date="1" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>1</div></td><td data-date="2" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>2</div></td><td data-date="3" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>3</div></td><td data-date="4" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>4</div></td><td data-date="5" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today" title=""><div>5</div></td><td data-date="6" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>6</div></td><td data-date="7" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>7</div></td></tr><tr><td data-date="8" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>8</div></td><td data-date="9" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>9</div></td><td data-date="10" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>10</div></td><td data-date="11" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>11</div></td><td data-date="12" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>12</div></td><td data-date="13" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>13</div></td><td data-date="14" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>14</div></td></tr><tr><td data-date="15" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>15</div></td><td data-date="16" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>16</div></td><td data-date="17" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>17</div></td><td data-date="18" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>18</div></td><td data-date="19" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>19</div></td><td data-date="20" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>20</div></td><td data-date="21" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>21</div></td></tr><tr><td data-date="22" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>22</div></td><td data-date="23" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>23</div></td><td data-date="24" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>24</div></td><td data-date="25" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>25</div></td><td data-date="26" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>26</div></td><td data-date="27" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>27</div></td><td data-date="28" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>28</div></td></tr><tr><td data-date="29" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>29</div></td><td data-date="30" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>30</div></td><td data-date="31" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>31</div></td><td data-date="1" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_other_month" title=""><div>1</div></td><td data-date="2" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_other_month" title=""><div>2</div></td><td data-date="3" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month" title=""><div>3</div></td><td data-date="4" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend" title=""><div>4</div></td></tr></tbody></table></div><button type="button" class="xdsoft_save_selected blue-gradient-button" style="display: none;">Save Selected</button></div><div class="xdsoft_timepicker active"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time " data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time xdsoft_current" data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div><div class="xdsoft_datetimepicker xdsoft_noselect xdsoft_"><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev" style="visibility: visible;"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>一月</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option xdsoft_current" data-value="0">一月</div><div class="xdsoft_option " data-value="1">二月</div><div class="xdsoft_option " data-value="2">三月</div><div class="xdsoft_option " data-value="3">四月</div><div class="xdsoft_option " data-value="4">五月</div><div class="xdsoft_option " data-value="5">六月</div><div class="xdsoft_option " data-value="6">七月</div><div class="xdsoft_option " data-value="7">八月</div><div class="xdsoft_option " data-value="8">九月</div><div class="xdsoft_option " data-value="9">十月</div><div class="xdsoft_option " data-value="10">十一月</div><div class="xdsoft_option " data-value="11">十二月</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2017</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option xdsoft_current" data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option " data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next" style="visibility: visible;"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr><td data-date="1" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>1</div></td><td data-date="2" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>2</div></td><td data-date="3" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>3</div></td><td data-date="4" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>4</div></td><td data-date="5" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today" title=""><div>5</div></td><td data-date="6" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>6</div></td><td data-date="7" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>7</div></td></tr><tr><td data-date="8" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>8</div></td><td data-date="9" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>9</div></td><td data-date="10" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>10</div></td><td data-date="11" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>11</div></td><td data-date="12" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>12</div></td><td data-date="13" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>13</div></td><td data-date="14" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>14</div></td></tr><tr><td data-date="15" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>15</div></td><td data-date="16" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>16</div></td><td data-date="17" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>17</div></td><td data-date="18" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>18</div></td><td data-date="19" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>19</div></td><td data-date="20" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>20</div></td><td data-date="21" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>21</div></td></tr><tr><td data-date="22" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>22</div></td><td data-date="23" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>23</div></td><td data-date="24" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>24</div></td><td data-date="25" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>25</div></td><td data-date="26" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>26</div></td><td data-date="27" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>27</div></td><td data-date="28" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>28</div></td></tr><tr><td data-date="29" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>29</div></td><td data-date="30" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>30</div></td><td data-date="31" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>31</div></td><td data-date="1" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_other_month" title=""><div>1</div></td><td data-date="2" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_other_month" title=""><div>2</div></td><td data-date="3" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month" title=""><div>3</div></td><td data-date="4" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend" title=""><div>4</div></td></tr></tbody></table></div><button type="button" class="xdsoft_save_selected blue-gradient-button" style="display: none;">Save Selected</button></div><div class="xdsoft_timepicker active"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time " data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time xdsoft_current" data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div></body>
</html>
