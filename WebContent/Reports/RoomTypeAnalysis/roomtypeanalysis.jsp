<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">

    
    <title>酒店管理系统 - 报表</title>
    <link href="/hotel/img/roomrack/favicon.ico" rel="icon">
    
    

<link media="all" href="/hotel/css/roomrack/index.css" type="text/css" rel="stylesheet">
</head>
<body>
    <!--头部-->
    <div class="head" id="head">
        <div class="logo"></div>
        <!--<a href="###" id="lreport" style="background:url(images/2015_3.png) bottom center no-repeat;display:none; width:120px; height:70px; float:left">&nbsp;</a>-->
        
       <div class="top_icon" style="margin-left: 340px; margin-right: 10px;" id="menulabel">
            <a id="btn_pre" style="cursor: pointer;"><img src="/hotel/img/roomrack/left.png" class="mb30" alt="" width="14" height="30"></a>
            <a id="btn_next" style="cursor: pointer;"><img src="/hotel/img/roomrack/right.png" class="mb30" alt="" width="14" height="30"></a>
            <div class="mb_div">
                <ul id="mb_table">
                    <a href="/hotel/RoomRack/roomrack.jsp"><li class="ftt">房态图</li></a>
                    <a href="/hotel/Customer/customer.jsp"><li class="zhk">住客</li></a>
                    <a href="/hotel/Member/member.jsp"><li class="vip">会员</li></a>
                    <a href="/hotel/Agreement/agreement.jsp"><li class="xieyi">协议</li></a>
                    <a href="/hotel/Reserve/reserve.jsp"><li class="yud">预订</li></a>
                    <a href="/hotel/Reports/BusinessDetail/businessdetail.jsp"><li class="baob  select">报表</li></a>
                    <a href="/hotel/Stock/PurchaseList/purchaselist.jsp"><li class="kuceng">库存</li></a>
                   <a href="/hotel/Set/SetGrogShop/set.jsp"><li class="shezh">设置</li></a>
                    
                </ul>
            </div>
        </div>

    </div>
    <!--end-->

    <!--菜单-->
    <div class="menu fontYaHei">
        <div id="scrollable">
            <a class="prev" href="#" style="cursor: pointer;"></a>
            <a class="next" href="#" style="cursor: pointer;"></a>
            <div class="items">
                <ul style="position: absolute; width: 200000em; left: 0px;" class="scrollable_demo">
                    <li class=""><span data-url="/FrontOp/RoomState.htm">房态图</span></li>
                <li class="select"><span data-url="/stockrequest.aspx">报表</span><em></em></li></ul>
                <br clear="all">
            </div>
        </div>
    </div>
    <!--end-->
    <iframe src="/hotel/Reports/RoomTypeAnalysis/index_1.jsp" id="main" name="main" scrolling="auto" width="100%" height="468" frameborder="0"></iframe>
    <!--底部-->
    <div class="footer">
        <div class="fl">
            <ul class="first">
            	<li><span class="LogonUserAccount">用户编号：${user.u_jobnum }</span></li>
                <li><span class="LogonUserName">姓&nbsp;&nbsp;&nbsp;名：${user.u_name }</span></li>
                <li><span class="LogonDate"><fmt:formatDate value="${today }" pattern="yyyy年MM月dd日" /></span></li>
            </ul>
        </div>
        <div class="fr">
            <ul style="float: right;">
                <li><a href="javascript:void(0);">帮 助</a><em></em>
                    <ul>
                      <li><a id="IEHelpLink" target="_top">帮助中心</a></li>
                      <li><a id="Version_update">版本更新</a></li>
                    </ul>
                </li>
                <li><span>|</span></li>
                <li><a href="/hotel/login.jsp">退出</a></li>
            </ul>
        </div>
    </div>
    <!--end-->



    <div class="white_content pwin" style="cursor: pointer; width: 450px; height: 280px; top: 162px; left: 458px; display: none;"><iframe src="index_4.html" name="win" scrolling="yes" style="float: left;" width="100%" height="280" frameborder="0"></iframe>
        <!--<div class="louceng">
        </div>-->

        <div class="close" tag="pwin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin_black" style="display: none;"></div>

    <div class="white_content pwin2" style="z-index: 1004; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="pwin2">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin2');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin2_black" style="z-index: 1003;"></div>

    <div class="white_content paymentwin" style="z-index: 1006; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="paymentwin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('paymentwin');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>

    <div class="white_content authorizationwin" style="z-index: 1006; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->

    </div>
    <div class="black_overlay authorizationwin_black" style="z-index: 1005;"></div>

    <div class="white_content wepaywin" style="z-index: 1008; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="wepaywin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('wepaywin');top.activeWin.location.reload();" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay wepaywin_black" style="z-index: 1007;"></div>


    <!-- 支付div -->
        <div class="white_content paywin" style="z-index: 1010; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="paywin">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('paywin');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay paywin_black" style="z-index: 1009;"></div>



    <div id="divLoading" class="black_overlay" style="display: none;">
        <img src="loading.gif" alt="数据加载中" style="left: 42%; top: 42%; position: absolute;">
    </div>

      <div class="white_content pwin3" style="z-index: 1007; cursor: pointer;">
        <!--<div class="louceng">
        </div>-->
        <div class="close" tag="pwin3">
            <a href="javascript:void(0)" onclick="cancelEvent(event);closeWin('pwin3');" style="cursor: pointer;">&nbsp;</a>
        </div>
    </div>
    <div class="black_overlay pwin3_black" style="z-index: 1006;"></div>

    <!--弹出窗口-->
    <div id="light" class="novice">
        <div class="step_one">
            <div class="next_step step_1"></div>
            <div class="close">
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">&nbsp;</a>
            </div>
        </div>

        <div class="step_two">
            <div class="next_step step_2"></div>
            <div class="close">
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">&nbsp;</a>
            </div>
        </div>

        <div class="step_three">
            <div class="next_step step_3"></div>
            <div class="close">
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">&nbsp;</a>
            </div>
        </div>

        <div class="step_four">
            <div class="next_step step_4"></div>
            <div class="close">
                <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">&nbsp;</a>
            </div>
        </div>

    </div>

    <div id="fade" class="black_overlay"></div>

 

    <!--加载弹出-->
    <div data-id="divCircles" style="position: absolute; left: 0px; top: 0px; bottom: 0px; right: 0px; z-index: 99999; text-align: center; display: none;">
        <div style="width: 100%; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.6; height: 100%; position: absolute; left: 0px; top: 0px; bottom: 0px; right: 0px; z-index: 1;"></div>
        <img src="spinning-circles.svg" alt="" style="position: absolute; left: 50%; margin-left: -30px; top: 50%; margin-top: -50px; z-index: 2; opacity: 0.8;" width="60">
        <p style="display: block; width: 100%; text-align: center; color: rgb(255, 255, 255); font-size: 14px; position: absolute; left: 0px; top: 50%; margin-top: 30px; z-index: 2; font-family: Microsoft YaHei; letter-spacing: 2px;">正在上传发票数据,请耐心等待...</p>
    </div>



    


   
    <!--左右移动
    <script type="text/javascript">
        function dis_width() {
            pwidth = $("#head").width();
            if (pwidth < 1500) {
                $("#btn_pre").css("display", "block");
                $("#btn_next").css("display", "block");
            }
            if (pwidth < 1500 && pwidth > 1200) {
                $(".mb_div").css("width", 650 + "px");
            }
            else if (pwidth < 1200) {
                $(".mb_div").css("width", 380 + "px");
            }

            simple_width = 80;
            show_all_num = 11;
            mb_table_width = simple_width * show_all_num * 2;
            s_left = 0;

            $("#btn_pre").bind("click", function () { move_go(1); });
            $("#btn_next").bind("click", function () { move_go(0); });
            function move_go(flax) {
                speed = 300;
                if (flax == 0) {
                    s_left = s_left - simple_width;
                    if (s_left < simple_width * show_all_num * (-1)) {
                        s_left = simple_width * (-1);
                        $("#mb_table").animate({ left: "0px" }, 2);
                    }
                }
                if (flax == 1) {
                    s_left = s_left + simple_width;
                    if (s_left > 0) {
                        s_left = show_all_num * simple_width * (-1);
                        s_left_s = s_left + "px";
                        $("#mb_table").animate({ left: s_left_s }, 2);
                        s_left = s_left + simple_width;
                    }
                }
                s_left_s = s_left + "px";
                $("#mb_table").animate({ left: s_left_s }, speed, function () { });
            }

        }
    </script>-->
    






<!--<div class="costs_1" style="position:fixed; top:50%; left:50%; margin-left:-400px;margin-top:-250px; display:none; z-index: 999999;">
    <div style="position:relative">
        <img width="800"  border="0" src="../images/login/to_5.png" alt="" />
        <div class="costs_3" style="position: absolute; top: -40px; right:10px; cursor: pointer; z-index: 999999;width:30px; height:30px; background:url(../images/login/to_4.png) 0px 0px no-repeat" ></div>
    </div>
</div>
<div class="costs_back" style="background: rgb(0, 0, 0) none repeat scroll 0% 0%; position: fixed; left: 0px; top: 0px; right: 0px; bottom: 0px; filter:alpha(opacity=70);-moz-opacity:0.7;opacity:0.7; display:none; z-index: 999998;"></div>
<script type="text/javascript">
    $(document).ready(function () {
        var IsLogin = $.cookie("IsLogin");
        if (IsLogin == "123") {
            $(".costs_1").show();
            $(".costs_back").show();
        }
        $(".costs_3").click(function () {
            $(".costs_1").hide();
            $(".costs_back").hide();
            $.cookie("IsLogin", "");
        });
    });
</script> -->



<!--房价牌左右摇摆-->

<div class="swing_div" style="display: none;">
    <a href="javascript:void(0);" title="摇摆展示" id="c_appmarket"><img class="swing" src="swing_01.png" alt=""></a>
    <a href="javascript:void(0);" class="swing_a">&nbsp;</a>
</div>



<!--去哪儿直连弹出框-->
<div class="swing_03div" style="position: fixed; top: 50%; left: 50%; margin-left: -440px; margin-top: -240px; z-index: 9999; display: none;">
    <img class="qunaershow" style="cursor: pointer;" src="swing_03.png" alt="">
    <a href="javascript:void(0);" class="swing_03a" style="position: absolute; top: 0px; right: 0px; display: block; width: 30px; height: 30px;">&nbsp;</a>
</div>
<div class="swing_03div_balck" style="position: fixed; left: 0px; top: 0px; bottom: 0px; right: 0px; background: rgb(0, 0, 0) none repeat scroll 0% 0%; opacity: 0.5; display: none;"></div>




<audio id="chatAudio"><source src="../Music/notify.mp3" type="audio/mpeg"><source src="../Music/notify.ogg" type="audio/ogg"></audio></body>
</html>
