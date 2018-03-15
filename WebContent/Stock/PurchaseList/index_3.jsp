<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>库存管理系统</title>
<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script> 
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		//添加随客信息
		$("#btnSave").click(function(){
			var vform = $("#myadd").serialize();
			$.ajax({
				url:"/hotel/StockListController/addGoods",
				type:"POST",
				data:vform,
				dataType:"json",
				success:function(g){
				$("#tbgoods tbody").append("<tr><td>"+g.g_name+"</td><td>"+g.g_type+"</td><td>"+g.g_unit+"</td><td>"+g.g_unitprice+"</td><td>"+g.g_number+"</td><td>"+g.g_money+"</td><td>"+g.g_reward+"</td><td><a onclick='Delete(this)'>删除</a></td></tr>");
				computeMoney(g);
			},
			error:function(){
				alert("系统错误！！");
			}
		  });
		});
		//将随客信息置空
		$("#btnDel").click(function(){
			$("#g_name").val(null);
			$("#g_type").val(null);
			$("#g_unit").val(null);
			$("#g_unitprice").val(null);
			$("#g_number").val(null);
			$("#g_money").val(null);
			$("#g_reward").val(null);
		});
	});
	//动态删除行
	function Delete(td) {
		var tr = $(td).parent().parent();
		var g_name=tr.children().eq(0).text();
		//计算总金额
		computeMoney1(tr.children().eq(4).text(),tr.children().eq(5).text());
		$.ajax({
			url:"/hotel/StockListController/deleteGoods",
			type:"POST",
			data:"g_name="+g_name,
			dataType:"json",
			success:function(c){
		},
		error:function(){
		}
	  });
		tr.remove();
	} 
	//添加商品时计算总金额
	function computeMoney(g) {
		var TotalNumber = document.getElementById("TotalNumber");
		var TotalAmount = document.getElementById("TotalAmount");
		var sl_money = document.getElementById("sl_money");
		TotalNumber.innerText=Number(TotalNumber.innerText)+Number(g.g_number);
		TotalAmount.innerText=Number(TotalAmount.innerText)+Number(g.g_money);
		sl_money.value=TotalAmount.innerText;
	}
	//删除商品时计算总金额
	function computeMoney1(num,amount) {
		var TotalNumber = document.getElementById("TotalNumber");
		var TotalAmount = document.getElementById("TotalAmount");
		var sl_money = document.getElementById("sl_money");
		TotalNumber.innerText=Number(TotalNumber.innerText)-Number(num);
		TotalAmount.innerText=Number(TotalAmount.innerText)-Number(amount);
		sl_money.value=TotalAmount.innerText;
	}
	//根据单价和数量计算金额
	function compute() {
		var g_unitprice = document.getElementById("g_unitprice").value;
		var g_number = document.getElementById("g_number").value;
		var g_money = document.getElementById("g_money");
		g_money.value = g_unitprice*g_number;
	}
</script>
<link media="all" href="/hotel/css/stock/purchaselist/index_3.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div>
        <div class="">
            
<!--进货单-->
<form id="myadd" action="/hotel/StockListController/add" target="_top" method="post">    
<div class="main" style="width: 1200px;">
        <img src="4.png" class="seal" style="display: none;" id="ShowT">
        <img src="2.png" class="seal" style="display: none;" id="ShowC">
        <input id="ProductData" type="hidden">

        <h1 class="titles">进货单</h1>
        <div class="absult">
            <div id="divDH" style="display: none;">
                <label>单号：</label><p></p>
            </div>
            <input id="DH" value="" type="hidden">
            <input id="CKMC" type="hidden">
            <input id="JSRMC"  type="hidden">
            <input id="p_data"  value="" type="hidden">
            <input id="ZT" value="10" type="hidden">
            <input id="ID" type="hidden">
        </div>
        <ul class="in">
            <li>
                <label><b style="color: red;">*</b>供应商：</label>
                <select name="s.s_id" >
                	<c:forEach items="${slist }" var="s">
                		<option value="${s.s_id }">${s.s_name }</option>
                	</c:forEach>
                </select>
            </li>
            <li>
                <label><b style="color: red;">*</b>入库仓库：</label>
                <select name="sh.sh_id">
                	<c:forEach items="${shlist}" var="sh">
                		<option value="${sh.sh_id }">${sh.sh_name }</option>
                	</c:forEach>
                </select>
            </li>
            <li>
                <label><b style="color: red;">*</b>经手人：</label>
                <select name="u.u_id">
                	<c:forEach items="${ulist }" var="u">
                        <option value="${u.u_id }">${u.u_name }</option>
                    </c:forEach>
                </select>
            </li>
            <li><label><b style="color: red;">*</b>单据日期：</label><input name="sl_date" class="rili" value="<fmt:formatDate value='${date }' pattern='yyyy-MM-dd' />" onclick="laydate()" type="text"/></li>
            <li style="width: 570px;">
                <label>摘要：</label>
                <textarea id="ZY" name="sl_remark" maxlength="100"></textarea>
            </li>
            <li style="width: 570px;">
                <label>说明：</label>
                <textarea id="SM" name="sl_instruction" maxlength="100"></textarea>
            </li>
        </ul>
        <div class="rit">
            <input id="P_BH" value="" type="hidden">
            <input id="P_ProductName" value="" type="hidden">
            <input id="P_GoodsTypeName" value="" type="hidden">
            <input id="P_ProductUnit" value="" type="hidden">
            <input id="P_SPID" value="" type="hidden">
            <input id="P_SPDJ" value="" type="hidden">
            <table class="in" cellspacing="0" cellpadding="0">
                <tbody>
                    <th width="15%">名称</th>
                    <th width="8%">类别</th>
                    <th width="8%">单位</th>
                    <th width="8%">单价</th>
                    <th width="8%">数量</th>
                    <th width="10%">金额</th>
                    <th width="18%">备注</th>
                    <th width="5%">操作</th>
                </tr></tbody>
            </table>
            <div class="in_goods" id="div_Test">
                <table id="tbgoods" cellspacing="0" cellpadding="0">
                    <tbody>
                            <tr>
                                <td width="15%"><input id="g_name" name="g_name" value="" type="text" list="list1" autocomplete="off"/></td>
                                <td width="8%"><input id="g_type" name="g_type" value="" type="text"/></td>
                                <td width="8%"><input id="g_unit" name="g_unit" value="" type="text"/></td>
                                <td width="8%"><input id="g_unitprice" name="g_unitprice" value="0" onchange="compute()" type="text"/></td>
                                <td width="8%"><input id="g_number" name="g_number" value="0" onchange="compute()" type="text"/></td>
                                <td width="10%"><input id="g_money" name="g_money" value="0" type="text"/></td>
                                <td width="18%"><input id="g_reward" name="g_reward" value="" type="text"/></td>
                                <td width="5%">
                        			<a id="btnSave" class="btnSave">
                        				<img src="/hotel/img/roomrack/save.png" alt="" height="12" width="12"/></a>
                    				<a id="btnDel" style="margin-left: 10px;">
                        				<img src="/hotel/img/roomrack/010.gif" alt="" height="12" width="12"/></a>
               					 </td>
                            </tr>
                    </tbody>
                </table>
            </div>
            <div class="foot_table">
                <table class="in" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td colspan="5" width="51%">汇总：</td>
                            <td id="TotalNumber" width="8%">0</td>
                            <td id="TotalAmount" width="10%">0</td>
                            <input id="sl_money" name="sl_money" value="0" type="hidden"/>
                      		<input name="sl_uid" value="${user.u_id }" type="hidden"/>
                            <td colspan="2" width="28%"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="fote">
                <div class="fl">
                    <div id="show" style="float: left; display: none;">
                        <label>&nbsp;&nbsp;数量：</label>
                        <input id="Num" value="1" style="width: 40px; text-align: center;" type="text">
                    </div>
                </div>
                <div style="text-align: center;">
                    <input class="bus_add" id="btnSubmit" value="直接过账" type="submit">
                    <input class="bus_add" id="btnDel" value="清空" type="button">
                </div>
            </div>
        </div>
    </div>
    <table id="tbItem" style="display: none;">
        <tbody>
            <tr>
                <td width="15%">
                    <input class="search shop" value="" type="text">
                </td>
                <td width="15%"></td>
                <td width="8%"></td>
                <td width="8%"></td>
                <td width="8%"></td>
                <td width="8%"></td>
                <td width="10%"></td>
                <td width="18%"></td>
                <td width="10%"></td>
            </tr>
        </tbody>
    </table>
    <datalist id="list1" onselect="selectList()"> 
    	<c:forEach items="${gnamelist }" var="g">
    		<option>${g }</option>
    	</c:forEach>
	</datalist>
</form><!--end-->

        </div>
    </div>


<div class="xdsoft_datetimepicker xdsoft_noselect "><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>一月</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option xdsoft_current" data-value="0">一月</div><div class="xdsoft_option " data-value="1">二月</div><div class="xdsoft_option " data-value="2">三月</div><div class="xdsoft_option " data-value="3">四月</div><div class="xdsoft_option " data-value="4">五月</div><div class="xdsoft_option " data-value="5">六月</div><div class="xdsoft_option " data-value="6">七月</div><div class="xdsoft_option " data-value="7">八月</div><div class="xdsoft_option " data-value="8">九月</div><div class="xdsoft_option " data-value="9">十月</div><div class="xdsoft_option " data-value="10">十一月</div><div class="xdsoft_option " data-value="11">十二月</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div></div><div class="xdsoft_label xdsoft_year"><span>2017</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option xdsoft_current" data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option " data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div></div><button type="button" class="xdsoft_next"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr><td data-date="1" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date"><div>2</div></td><td data-date="3" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date"><div>3</div></td><td data-date="4" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date"><div>4</div></td><td data-date="5" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date"><div>5</div></td><td data-date="6" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_current xdsoft_today"><div>6</div></td><td data-date="7" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>7</div></td></tr><tr><td data-date="8" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>8</div></td><td data-date="9" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date"><div>9</div></td><td data-date="10" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date"><div>10</div></td><td data-date="11" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date"><div>11</div></td><td data-date="12" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date"><div>12</div></td><td data-date="13" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date"><div>13</div></td><td data-date="14" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>14</div></td></tr><tr><td data-date="15" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>15</div></td><td data-date="16" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date"><div>16</div></td><td data-date="17" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date"><div>17</div></td><td data-date="18" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date"><div>18</div></td><td data-date="19" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date"><div>19</div></td><td data-date="20" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date"><div>20</div></td><td data-date="21" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>21</div></td></tr><tr><td data-date="22" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>22</div></td><td data-date="23" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date"><div>23</div></td><td data-date="24" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date"><div>24</div></td><td data-date="25" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date"><div>25</div></td><td data-date="26" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date"><div>26</div></td><td data-date="27" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date"><div>27</div></td><td data-date="28" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>28</div></td></tr><tr><td data-date="29" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date"><div>30</div></td><td data-date="31" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date"><div>31</div></td><td data-date="1" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_other_month"><div>1</div></td><td data-date="2" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_other_month"><div>2</div></td><td data-date="3" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month"><div>3</div></td><td data-date="4" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>4</div></td></tr></tbody></table></div></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time xdsoft_current" data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time " data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time " data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div></body>
</html>
