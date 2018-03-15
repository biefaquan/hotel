<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>酒店管理平台</title>

<script type="text/javascript" src="/hotel/laydate/laydate.js" ></script>
<script type="text/javascript" src="/hotel/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function CloseOpenMember(){
		var div1=parent.parent.document.getElementById("div1");
		div1.style.display="none";
	}
	//免卡费时，修改会员余额
	function BtnCardFee(btn) {
		var money=document.getElementById("money");
		if(btn.checked){
			money.value=0;
		}else{
			money.value=-20;
		}
	}
	//表单验证
	function IsOK() {
		var bool=document.getElementById("bool").value;
		if(bool=="false"){
			alert("请先验证卡号是否可用！！");
			return false;
		}
		//手机验证
		var phone = document.getElementById('Phone').value;
	    if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        alert("手机号码有误，请重填");  
	        return false; 
	    }
	    //身份证验证
	    var idcard = document.getElementById('CardNo').value;
	    if(!(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/.test(idcard))){
	    	alert("身份证有误，请重填");  
	        return false;
	    }
	    //所有验证通过
	    return true;
	}
	//判断是否会员卡号存在
	$(function(){
		$("#btnQuery").click(function(){
			var m_cardnum = $("#MemberCardNo").val();
			if(m_cardnum!=""){
			$.ajax({
				url:"/hotel/MemberController/queryByCardnum",
				type:"POST",
				data:"m_cardnum="+m_cardnum,
				dataType:"json",
				success:function(m){
					//$("#yzm").val(data);
					if(m!=null){
						$("#bool").val("false");
						alert("会员号已存在存在，请重新填写！！");
					}
				},
				error:function(){
					$("#bool").val("true");
					alert("会员号可用！！");
				}
			});}else{
				alert("卡号为空！！！");
			}
		});
	});
</script>
    
   

<link media="all" href="/hotel/css/member/membertype/index_4.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--楼层弹出窗口-->
   	<form action="/hotel/MemberController/add" target="_top" method="post" onsubmit="return IsOK()">
   	<input id="bool" value="false" type="hidden"/>
    <div class="vip_infor" style="width: 600px;">
        <div class="line">
            <div class="fl" id="divfa">会员发卡</div>
            <div class="errortips" id="btnRead"></div>
            <input id="CardInfoId" value="0" type="hidden">
            <input id="CardFees" type="hidden">
            <input id="Price" type="hidden">
            <input id="OpenAmount" type="hidden">
            <input id="PrepaidEnable" type="hidden">
        </div>
        <div class="types" id="CAdd" style="display: block; margin-top: 0px;">
            <ul>
                <li>
                    <label><b style="color: red;">*</b>会员卡号：</label>
                    <input name="m_cardnum" class="txt inps" id="MemberCardNo" maxlength="20" type="text">
                </li>
                <li>
                    <input id="btnQuery" class="credit" value="查询" id="btnSearch" type="button">
                    <em style="background-color: red">会员卡号：张三+生日   zs19940101</em>
                </li>
            </ul>
        </div>
        <!-- 
        <div class="types" id="CEdit" style="display: none; margin-top: 0px;">
            <ul>
                <li>
                    <label>卡号：</label>
                    <span style="width: 120px;" class="txt inps" id="CCardNo">0</span>
                </li>
            </ul>
        </div> 
        -->
        
        <div class="types" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221); margin-top: 0px;">
            <ul>
                <li>
                    <label style="width: 70px;"><b style="color: red;">*</b>姓名：</label>
                    <input name="c.c_name" class="txt inps" style="width: 100px;" id="Name" maxlength="20" type="text">
                </li>
                <li>
                    <label>性别：</label>
                    <select name="c.c_sex" class="txt" style="width: 86px;" id="Sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </li>
                <li>
                    <label style="width: 70px;">证件：</label>
                    <select name="c.c_idtype" style="width: 98px;" id="CardType">
                    <option value="身份证">身份证</option><option value="驾驶证">驾驶证</option><option value="士兵证">士兵证</option><option value="军官证">军官证</option></select>
                </li>
                <li>
                    <label style="width: 70px;"><b style="color: red;">*</b>证件号码：</label>
                    <input name="c.c_idcard" class="inps txt" style="width: 100px; margin-right: 0px;" id="CardNo" maxlength="20" type="text">
                    
                </li>
                <li>
                    <label style="width: 75px;">会员类型：</label>
                    <select name="mt.mt_id" class="txt" id="CategoryId" onchange="CategoryType()" style="width: 86px;">
                    <c:forEach items="${mtlist }" var="mt">
                    <option value="${mt.mt_id }">${mt.mt_name }</option>
                    </c:forEach></select>
                </li>
                <li>
                    <label style="width: 70px;">操作员：</label>
                    <input class="inps txt" style="width: 92px; margin-right: 0px;" disabled="disabled" id="CardNo" maxlength="20" value="${user.u_name }" type="text">
                    <input name="u.u_id" value="${user.u_id }" type="hidden"/>
                </li>
                <li>
                    <label style="width: 70px;"><b style="color: red;">*</b>手机号码：</label>
                    <input name="c.c_phone" class="inps txt" style="width: 100px;" id="Phone" maxlength="11" type="text">
                </li>
                <li>
                    <label>生日：</label>
                    <input name="c.c_birthday" class="inps txt" style="width: 78px;" id="BirthDay" onclick="laydate()"  type="text">
                </li>
                
                <li style="width: 100%;">
                    <label style="width: 70px;">喜好：</label>
                    <input name="c.c_like" class="inps" style="width: 500px;" id="Love" maxlength="100" type="text">
                </li>
                <li style="width: 100%;">
                    <label style="width: 70px;">地址：</label>
                    <input name="c.c_adress" class="inps" style="width: 500px;" id="Address" maxlength="100" type="text">
                </li>
                <li style="width: 100%;">
                    <label style="width: 70px;">备注：</label>
                    <input name="c.c_reward" class="inps" style="width: 500px;" id="Remark" maxlength="100" type="text">
                </li>
            </ul>
        </div>
       
        <div class="types" id="showDiv" style="background: rgb(239, 239, 239) none repeat scroll 0% 0%; border: 1px solid rgb(221, 221, 221); display: none;">
            <ul>
                <li>
                    <label>&nbsp;&nbsp;总积分：</label>
                    <span style="width: 90px;" class="txt inps" id="TotalScore">0.00</span>
                </li>
                <li>
                    <label>兑换积分：</label>
                    <span style="width: 80px;" class="txt inps" id="UsedScore">0.00</span>
                </li>
                <li>
                    <label>剩余积分：</label>
                    <span style="width: 80px;" class="inps" id="UsableScore">0.00</span>
                </li>
                <li>
                    <label>冻结积分：</label>
                    <span style="width: 90px;" class="txt inps" id="FrozenScore">0.00</span>
                </li>
                <li>
                    <label>&nbsp;&nbsp;总储值：</label>
                    <span style="width: 80px;" class="txt inps" id="TotalAmount">0.00</span>
                </li>
                <li>
                    <label>消费储值：</label>
                    <span style="width: 80px;" class="inps" id="UsedAmount">0.00</span>
                </li>
                <li>
                    <label>储值余额：</label>
                    <span style="width: 90px;" class="txt inps" id="UsableAmount">0.00</span>
                </li>
                <li>
                    <label>消费次数：</label>
                    <span style="width: 80px;" class="txt inps" id="ConsumeTimes">0.00</span>
                </li>
                <li>
                    <label>消费金额：</label>
                    <span style="width: 80px;" class="inps" id="ConsumeAmount">0.00</span>
                </li>
                <li>
                    <label>卡片状态：</label>
                    <span style="width: 90px;" class="txt inps" id="StatusName">&nbsp;</span>
                </li>
                <li>
                    <label>发卡时间：</label>
                    <span style="width: 80px;" class="txt inps" id="OpenDate">&nbsp;</span>
                </li>
                <li>
                    <label>有效时间：</label>
                    <span style="width: 80px;" class="inps" id="ExprieDate">&nbsp;</span>
                </li>
            </ul>
        </div>
        <div class="types">
            <ul style="float: right; width: 380px;">
                <li id="ShowFee" style="padding-right: 20px; line-height: 30px; color: rgb(51, 51, 51);">
                    <input class="inps" id="NoCardFee" value="1" onchange="BtnCardFee(this)" style="border: 0px none; margin-top: 6px;" type="checkbox">&nbsp;免卡费
                </li>
                
                <li>
                	<input name="m_money" id="money" value="-20" type="hidden"/>
                    <input class="bus_add " value="会员发卡" id="BtnSave" type="submit">
                </li>
                <li style="margin-right: 0px;">
                    <input id="BtnDel" onclick="CloseOpenMember()" class="bus_dell " value="关闭" style="margin-right: 0px;" type="button">
                </li>
            </ul>
        </div>
    </div>
</form>

<div class="xdsoft_datetimepicker xdsoft_noselect xdsoft_"><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev" style="visibility: visible;"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>一月</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option xdsoft_current" data-value="0">一月</div><div class="xdsoft_option " data-value="1">二月</div><div class="xdsoft_option " data-value="2">三月</div><div class="xdsoft_option " data-value="3">四月</div><div class="xdsoft_option " data-value="4">五月</div><div class="xdsoft_option " data-value="5">六月</div><div class="xdsoft_option " data-value="6">七月</div><div class="xdsoft_option " data-value="7">八月</div><div class="xdsoft_option " data-value="8">九月</div><div class="xdsoft_option " data-value="9">十月</div><div class="xdsoft_option " data-value="10">十一月</div><div class="xdsoft_option " data-value="11">十二月</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2017</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option xdsoft_current" data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option " data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next" style="visibility: visible;"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>日</th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th></tr></thead><tbody><tr><td data-date="1" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>1</div></td><td data-date="2" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>2</div></td><td data-date="3" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>3</div></td><td data-date="4" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>4</div></td><td data-date="5" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today" title=""><div>5</div></td><td data-date="6" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>6</div></td><td data-date="7" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>7</div></td></tr><tr><td data-date="8" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>8</div></td><td data-date="9" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>9</div></td><td data-date="10" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>10</div></td><td data-date="11" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>11</div></td><td data-date="12" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>12</div></td><td data-date="13" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>13</div></td><td data-date="14" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>14</div></td></tr><tr><td data-date="15" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>15</div></td><td data-date="16" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>16</div></td><td data-date="17" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>17</div></td><td data-date="18" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>18</div></td><td data-date="19" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>19</div></td><td data-date="20" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>20</div></td><td data-date="21" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>21</div></td></tr><tr><td data-date="22" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>22</div></td><td data-date="23" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>23</div></td><td data-date="24" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>24</div></td><td data-date="25" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date" title=""><div>25</div></td><td data-date="26" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date" title=""><div>26</div></td><td data-date="27" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date" title=""><div>27</div></td><td data-date="28" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend" title=""><div>28</div></td></tr><tr><td data-date="29" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend" title=""><div>29</div></td><td data-date="30" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date" title=""><div>30</div></td><td data-date="31" data-month="0" data-year="2017" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date" title=""><div>31</div></td><td data-date="1" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_other_month" title=""><div>1</div></td><td data-date="2" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_other_month" title=""><div>2</div></td><td data-date="3" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month" title=""><div>3</div></td><td data-date="4" data-month="1" data-year="2017" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend" title=""><div>4</div></td></tr></tbody></table></div><button type="button" class="xdsoft_save_selected blue-gradient-button" style="display: none;">Save Selected</button></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time " data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time xdsoft_current" data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="display: block; height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div></body>
</html>
