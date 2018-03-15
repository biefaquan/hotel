package com.hotel.inaccount.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.dao.vo.SuppleClass;
import com.hotel.inaccount.service.InAccountService;
import com.hotel.room.service.RoomService;
import com.hotel.roomtype.dao.vo.RoomType;
import com.hotel.roomtype.service.RoomTypeService;
import com.hotel.util.Contacts;
import com.hotel.util.DateChange;
import com.hotel.util.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/InAccountController")
public class InAccountController {
	@Autowired
	private InAccountService service;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private RoomTypeService roomtypeservice;
	//营业情况分析表
	@RequestMapping("queryInAccount")
	public String queryInAccount(Model model){
		double rent1 = 0,rent2=0,rent3=0,rent4=0;
		double cash1=0,cash2=0,cash3=0,cash4=0;
		double bank1=0,bank2=0,bank3=0,bank4=0;
		double wechat1=0,wechat2=0,wechat3=0,wechat4=0;
		double alipay1=0,alipay2=0,alipay3=0,alipay4=0;
		double agree1=0,agree2=0,agree3=0,agree4=0;
		double kezr1=0,kezr2=0,kezr3=0,kezr4=0,kezr5=0,kezr6=0,kezr7=0,kezr8=0,kezr9=0,kezr10=0,kezr11=0,kezr12=0;
		double mem1=0,mem2=0,mem3=0,mem4=0,mem5=0,mem6=0,mem7=0,mem8=0,mem9=0,mem10=0,mem11=0,mem12=0;
		double xydw1=0,xydw2=0,xydw3=0,xydw4=0,xydw5=0,xydw6=0,xydw7=0,xydw8=0,xydw9=0,xydw10=0,xydw11=0,xydw12=0;
		double fjlx1=0,fjlx2=0,fjlx3=0,fjlx4=0,fjlx5=0,fjlx6=0,fjlx7=0,fjlx8=0,fjlx9=0,fjlx10=0,fjlx11=0,fjlx12=0;
		//开放方式
		SuppleClass kf1 = new SuppleClass();
		SuppleClass kf2 = new SuppleClass();
		SuppleClass kf3 = new SuppleClass();
		SuppleClass kf4 = new SuppleClass();
		
		List<InAccount> list = service.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		List<SuppleClass> supplelist = new ArrayList<>();
		//以当天为例
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date intime = null;
		try {
			intime = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for (InAccount ia : list) {
			if (ia.getIa_intime().getYear() == intime.getYear()) {
				// 收入分析
				if (ia.getIa_intime().compareTo(intime) == 0) {
					rent1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() + 1 == intime.getMonth() + 1) {
					rent2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1) {
					rent3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear()) {
					rent4 += ia.getIa_money();
				}
				// 收款分析--现金
				if (ia.getIa_intime().compareTo(intime) == 0 && "现金".equals(ia.getIa_paytype())) {
					cash1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "现金".equals(ia.getIa_paytype())) {
					cash2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "现金".equals(ia.getIa_paytype())) {
					cash3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "现金".equals(ia.getIa_paytype())) {
					cash4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "银行卡".equals(ia.getIa_paytype())) {
					bank1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "银行卡".equals(ia.getIa_paytype())) {
					bank2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "银行卡".equals(ia.getIa_paytype())) {
					bank3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "银行卡".equals(ia.getIa_paytype())) {
					bank4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "微信支付".equals(ia.getIa_paytype())) {
					wechat1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "微信支付".equals(ia.getIa_paytype())) {
					wechat2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "微信支付".equals(ia.getIa_paytype())) {
					wechat3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "微信支付".equals(ia.getIa_paytype())) {
					wechat4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "挂账".equals(ia.getIa_paytype())) {
					agree1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "挂账".equals(ia.getIa_paytype())) {
					agree2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "挂账".equals(ia.getIa_paytype())) {
					agree3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "挂账".equals(ia.getIa_paytype())) {
					agree4 += ia.getIa_money();
				}
				// 客源分析
				if (ia.getIa_intime().compareTo(intime) == 0 && "客人自入".equals(ia.getIa_source())) {
					kezr1 += 1;
					kezr2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "客人自入".equals(ia.getIa_source())) {
					kezr4 += 1;
					kezr5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "客人自入".equals(ia.getIa_source())) {
					kezr7 += 1;
					kezr8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "客人自入".equals(ia.getIa_source())) {
					kezr10 += 1;
					kezr11 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "会员".equals(ia.getIa_source())) {
					mem1 += 1;
					mem2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "会员".equals(ia.getIa_source())) {
					mem4 += 1;
					mem5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "会员".equals(ia.getIa_source())) {
					mem7 += 1;
					mem8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "会员".equals(ia.getIa_source())) {
					mem10 += 1;
					mem11 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "协议单位".equals(ia.getIa_source())) {
					xydw1 += 1;
					xydw2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "协议单位".equals(ia.getIa_source())) {
					xydw4 += 1;
					xydw5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "协议单位".equals(ia.getIa_source())) {
					xydw7 += 1;
					xydw8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "协议单位".equals(ia.getIa_source())) {
					xydw10 += 1;
					xydw11 += ia.getIa_money();
				}
				// 开房方式
				if (ia.getIa_intime().compareTo(intime) == 0 && "天房".equals(ia.getIa_keyway())) {
					kf1.setName("天房");
					kf1.setS1(kf1.getS1() + 1);
					kf1.setS2(kf1.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "天房".equals(ia.getIa_keyway())) {
					kf1.setS4(kf1.getS3() + 1);
					kf1.setS5(kf1.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "天房".equals(ia.getIa_keyway())) {
					kf1.setS7(kf1.getS7() + 1);
					kf1.setS8(kf1.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "天房".equals(ia.getIa_keyway())) {
					kf1.setS10(kf1.getS10() + 1);
					kf1.setS11(kf1.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setName("午夜房");
					kf2.setS1(kf2.getS1() + 1);
					kf2.setS2(kf2.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS4(kf2.getS3() + 1);
					kf2.setS5(kf2.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS7(kf2.getS7() + 1);
					kf2.setS8(kf2.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS10(kf2.getS10() + 1);
					kf2.setS11(kf2.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setName("钟点房");
					kf3.setS1(kf3.getS1() + 1);
					kf3.setS2(kf3.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS4(kf3.getS3() + 1);
					kf3.setS5(kf3.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS7(kf3.getS7() + 1);
					kf3.setS8(kf3.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS10(kf3.getS10() + 1);
					kf3.setS11(kf3.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "月租房".equals(ia.getIa_keyway())) {
					kf4.setName("月租房");
					kf4.setS1(kf4.getS1() + 1);
					kf4.setS2(kf4.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS4(kf4.getS3() + 1);
					kf4.setS5(kf4.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS7(kf4.getS7() + 1);
					kf4.setS8(kf4.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS10(kf4.getS10() + 1);
					kf4.setS11(kf4.getS11() + ia.getIa_money());
				}
			}
		}
		//房型分析
		for (RoomType rt : rtlist) {
			SuppleClass s = new SuppleClass();
			s.setName(rt.getRt_name());
			for (InAccount ia : list) {
				if (ia.getIa_intime().getYear() == intime.getYear()) {
					if (ia.getIa_intime().compareTo(intime) == 0
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS1(s.getS1() + 1);
						s.setS2(s.getS2() + ia.getIa_money());
						fjlx1 += 1;
						fjlx2 += ia.getIa_money();
					}
					if (ia.getIa_intime().getMonth() == intime.getMonth()
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS4(s.getS4() + 1);
						s.setS5(s.getS5() + ia.getIa_money());
						fjlx4 += 1;
						fjlx5 += ia.getIa_money();
					}
					if (ia.getIa_intime().getMonth() == intime.getMonth() - 1
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS7(s.getS7() + 1);
						;
						s.setS8(s.getS8() + ia.getIa_money());
						fjlx7 += 1;
						fjlx8 += ia.getIa_money();
					}
					if (ia.getIa_intime().getYear() == intime.getYear()
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS10(s.getS10() + 1);
						s.setS11(s.getS11() + ia.getIa_money());
						fjlx10 += 1;
						fjlx11 += ia.getIa_money();
					}
				}
			}
			supplelist.add(s);
		}
		int num = roomservice.count();
		kezr3 = Double.parseDouble(String.format("%.2f",kezr1/num*100));
		kezr6 = Double.parseDouble(String.format("%.2f",kezr4/num*100/30));
		kezr9 = Double.parseDouble(String.format("%.2f",kezr7/num*100/30));
		kezr12 = Double.parseDouble(String.format("%.2f",kezr10/num*100/30/12));
		mem3 = Double.parseDouble(String.format("%.2f",mem1/num*100));
		mem6 = Double.parseDouble(String.format("%.2f",mem4/num*100/30));
		mem9 = Double.parseDouble(String.format("%.2f",mem7/num*100/30));
		mem12 = Double.parseDouble(String.format("%.2f",mem10/num*100/30/12));
		xydw3 = Double.parseDouble(String.format("%.2f",xydw1/num*100));
		xydw6 = Double.parseDouble(String.format("%.2f",xydw4/num*100/30));
		xydw9 = Double.parseDouble(String.format("%.2f",xydw7/num*100/30));
		xydw12 = Double.parseDouble(String.format("%.2f",xydw10/num*100/30/12));
		for(SuppleClass sc:supplelist){
			sc.setS3(Double.parseDouble(String.format("%.2f",sc.getS1()/num*100)));
			sc.setS6(Double.parseDouble(String.format("%.2f",sc.getS4()/num*100/30)));
			sc.setS9(Double.parseDouble(String.format("%.2f",sc.getS7()/num*100/30)));
			sc.setS12(Double.parseDouble(String.format("%.2f",sc.getS10()/num*100/30/12)));
			fjlx3 += sc.getS3();
			fjlx6 += sc.getS6();
			fjlx9 += sc.getS9();
			fjlx12 += sc.getS12();
		}
		fjlx3 = Double.parseDouble(String.format("%.2f",fjlx3));
		fjlx6 = Double.parseDouble(String.format("%.2f",fjlx6));
		fjlx9 = Double.parseDouble(String.format("%.2f",fjlx9));
		fjlx12 = Double.parseDouble(String.format("%.2f",fjlx12));
		//开房方式分析
		kf1.setS3(Double.parseDouble(String.format("%.2f",kf1.getS1()/num*100)));
		kf1.setS6(Double.parseDouble(String.format("%.2f",kf1.getS4()/num*100/30)));
		kf1.setS9(Double.parseDouble(String.format("%.2f",kf1.getS7()/num*100/30)));
		kf1.setS12(Double.parseDouble(String.format("%.2f",kf1.getS10()/num*100/30/12)));
		kf2.setS3(Double.parseDouble(String.format("%.2f",kf2.getS1()/num*100)));
		kf2.setS6(Double.parseDouble(String.format("%.2f",kf2.getS4()/num*100/30)));
		kf2.setS9(Double.parseDouble(String.format("%.2f",kf2.getS7()/num*100/30)));
		kf2.setS12(Double.parseDouble(String.format("%.2f",kf2.getS10()/num*100/30/12)));
		kf3.setS3(Double.parseDouble(String.format("%.2f",kf3.getS1()/num*100)));
		kf3.setS6(Double.parseDouble(String.format("%.2f",kf3.getS4()/num*100/30)));
		kf3.setS9(Double.parseDouble(String.format("%.2f",kf3.getS7()/num*100/30)));
		kf3.setS12(Double.parseDouble(String.format("%.2f",kf3.getS10()/num*100/30/12)));
		kf4.setS3(Double.parseDouble(String.format("%.2f",kf4.getS1()/num*100)));
		kf4.setS6(Double.parseDouble(String.format("%.2f",kf4.getS4()/num*100/30)));
		kf4.setS9(Double.parseDouble(String.format("%.2f",kf4.getS7()/num*100/30)));
		kf4.setS12(Double.parseDouble(String.format("%.2f",kf4.getS10()/num*100/30/12)));
		//收入分析
		model.addAttribute("rent1",rent1);
		model.addAttribute("rent2",rent2);
		model.addAttribute("rent3",rent3);
		model.addAttribute("rent4",rent4);
		
		//收款分析
		model.addAttribute("cash1",cash1);
		model.addAttribute("cash2",cash2);
		model.addAttribute("cash3",cash3);
		model.addAttribute("cash4",cash4);
		model.addAttribute("bank1",bank1);
		model.addAttribute("bank2",bank2);
		model.addAttribute("bank3",bank3);
		model.addAttribute("bank4",bank4);
		model.addAttribute("wechat1",wechat1);
		model.addAttribute("wechat2",wechat2);
		model.addAttribute("wechat3",wechat3);
		model.addAttribute("wechat4",wechat4);
		model.addAttribute("alipay1",alipay1);
		model.addAttribute("alipay2",alipay2);
		model.addAttribute("alipay3",alipay3);
		model.addAttribute("alipay4",alipay4);
		model.addAttribute("agree1",agree1);
		model.addAttribute("agree2",agree2);
		model.addAttribute("agree3",agree3);
		model.addAttribute("agree4",agree4);
		//来源分析
		model.addAttribute("kezr1", kezr1);
		model.addAttribute("kezr2", kezr2);
		model.addAttribute("kezr3", kezr3);
		model.addAttribute("kezr4", kezr4);
		model.addAttribute("kezr5", kezr5);
		model.addAttribute("kezr6", kezr6);
		model.addAttribute("kezr7", kezr7);
		model.addAttribute("kezr8", kezr8);
		model.addAttribute("kezr9", kezr9);
		model.addAttribute("kezr10", kezr10);
		model.addAttribute("kezr11", kezr11);
		model.addAttribute("kezr12", kezr12);
		model.addAttribute("mem1", mem1);
		model.addAttribute("mem2", mem2);
		model.addAttribute("mem3", mem3);
		model.addAttribute("mem4", mem4);
		model.addAttribute("mem5", mem5);
		model.addAttribute("mem6", mem6);
		model.addAttribute("mem7", mem7);
		model.addAttribute("mem8", mem8);
		model.addAttribute("mem9", mem9);
		model.addAttribute("mem10", mem10);
		model.addAttribute("mem11", mem11);
		model.addAttribute("mem12", mem12);
		model.addAttribute("xydw1", xydw1);
		model.addAttribute("xydw2", xydw2);
		model.addAttribute("xydw3", xydw3);
		model.addAttribute("xydw4", xydw4);
		model.addAttribute("xydw5", xydw5);
		model.addAttribute("xydw6", xydw6);
		model.addAttribute("xydw7", xydw7);
		model.addAttribute("xydw8", xydw8);
		model.addAttribute("xydw9", xydw9);
		model.addAttribute("xydw10", xydw10);
		model.addAttribute("xydw11", xydw11);
		model.addAttribute("xydw12", xydw12);
		//房源分析和合计
		model.addAttribute("supplelist", supplelist);
		model.addAttribute("fjlx1",fjlx1);
		model.addAttribute("fjlx2",fjlx2);
		model.addAttribute("fjlx3",fjlx3);
		model.addAttribute("fjlx4",fjlx4);
		model.addAttribute("fjlx5",fjlx5);
		model.addAttribute("fjlx6",fjlx6);
		model.addAttribute("fjlx7",fjlx7);
		model.addAttribute("fjlx8",fjlx8);
		model.addAttribute("fjlx9",fjlx9);
		model.addAttribute("fjlx10",fjlx10);
		model.addAttribute("fjlx11",fjlx11);
		model.addAttribute("fjlx12",fjlx12);
		//开房方式分析
		model.addAttribute("kf1", kf1);
		model.addAttribute("kf2", kf2);
		model.addAttribute("kf3", kf3);
		model.addAttribute("kf4", kf4);
		model.addAttribute("date", intime);
		//有个数据有问题，特意放到此处
		model.addAttribute("allsource", Double.parseDouble(String.format("%.2f",kezr12+mem12+xydw12)));
		return "Reports/BusinessAnalysis/index_3";
	}
	
	
	
	
	//营业情况分析表条件查询
	@RequestMapping("queryInAccount1")
	public String queryInAccount1(String date,Model model){
		double rent1 = 0,rent2=0,rent3=0,rent4=0;
		double cash1=0,cash2=0,cash3=0,cash4=0;
		double bank1=0,bank2=0,bank3=0,bank4=0;
		double wechat1=0,wechat2=0,wechat3=0,wechat4=0;
		double alipay1=0,alipay2=0,alipay3=0,alipay4=0;
		double agree1=0,agree2=0,agree3=0,agree4=0;
		double kezr1=0,kezr2=0,kezr3=0,kezr4=0,kezr5=0,kezr6=0,kezr7=0,kezr8=0,kezr9=0,kezr10=0,kezr11=0,kezr12=0;
		double mem1=0,mem2=0,mem3=0,mem4=0,mem5=0,mem6=0,mem7=0,mem8=0,mem9=0,mem10=0,mem11=0,mem12=0;
		double xydw1=0,xydw2=0,xydw3=0,xydw4=0,xydw5=0,xydw6=0,xydw7=0,xydw8=0,xydw9=0,xydw10=0,xydw11=0,xydw12=0;
		double fjlx1=0,fjlx2=0,fjlx3=0,fjlx4=0,fjlx5=0,fjlx6=0,fjlx7=0,fjlx8=0,fjlx9=0,fjlx10=0,fjlx11=0,fjlx12=0;
		//开放方式
		SuppleClass kf1 = new SuppleClass();
		SuppleClass kf2 = new SuppleClass();
		SuppleClass kf3 = new SuppleClass();
		SuppleClass kf4 = new SuppleClass();
		
		List<InAccount> list = service.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		List<SuppleClass> supplelist = new ArrayList<>();
		//以当天为例
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date intime = null;
		try {
			intime = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		for (InAccount ia : list) {
			if (ia.getIa_intime().getYear() == intime.getYear()) {
				// 收入分析
				if (ia.getIa_intime().compareTo(intime) == 0) {
					rent1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() + 1 == intime.getMonth() + 1) {
					rent2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1) {
					rent3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear()) {
					rent4 += ia.getIa_money();
				}
				// 收款分析--现金
				if (ia.getIa_intime().compareTo(intime) == 0 && "现金".equals(ia.getIa_paytype())) {
					cash1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "现金".equals(ia.getIa_paytype())) {
					cash2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "现金".equals(ia.getIa_paytype())) {
					cash3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "现金".equals(ia.getIa_paytype())) {
					cash4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "银行卡".equals(ia.getIa_paytype())) {
					bank1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "银行卡".equals(ia.getIa_paytype())) {
					bank2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "银行卡".equals(ia.getIa_paytype())) {
					bank3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "银行卡".equals(ia.getIa_paytype())) {
					bank4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "微信支付".equals(ia.getIa_paytype())) {
					wechat1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "微信支付".equals(ia.getIa_paytype())) {
					wechat2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "微信支付".equals(ia.getIa_paytype())) {
					wechat3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "微信支付".equals(ia.getIa_paytype())) {
					wechat4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "支付宝支付".equals(ia.getIa_paytype())) {
					alipay4 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "挂账".equals(ia.getIa_paytype())) {
					agree1 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "挂账".equals(ia.getIa_paytype())) {
					agree2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "挂账".equals(ia.getIa_paytype())) {
					agree3 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "挂账".equals(ia.getIa_paytype())) {
					agree4 += ia.getIa_money();
				}
				// 客源分析
				if (ia.getIa_intime().compareTo(intime) == 0 && "客人自入".equals(ia.getIa_source())) {
					kezr1 += 1;
					kezr2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "客人自入".equals(ia.getIa_source())) {
					kezr4 += 1;
					kezr5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "客人自入".equals(ia.getIa_source())) {
					kezr7 += 1;
					kezr8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "客人自入".equals(ia.getIa_source())) {
					kezr10 += 1;
					kezr11 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "会员".equals(ia.getIa_source())) {
					mem1 += 1;
					mem2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "会员".equals(ia.getIa_source())) {
					mem4 += 1;
					mem5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "会员".equals(ia.getIa_source())) {
					mem7 += 1;
					mem8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "会员".equals(ia.getIa_source())) {
					mem10 += 1;
					mem11 += ia.getIa_money();
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "协议单位".equals(ia.getIa_source())) {
					xydw1 += 1;
					xydw2 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "协议单位".equals(ia.getIa_source())) {
					xydw4 += 1;
					xydw5 += ia.getIa_money();
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "协议单位".equals(ia.getIa_source())) {
					xydw7 += 1;
					xydw8 += ia.getIa_money();
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "协议单位".equals(ia.getIa_source())) {
					xydw10 += 1;
					xydw11 += ia.getIa_money();
				}
				// 开房方式
				if (ia.getIa_intime().compareTo(intime) == 0 && "天房".equals(ia.getIa_keyway())) {
					kf1.setName("天房");
					kf1.setS1(kf1.getS1() + 1);
					kf1.setS2(kf1.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "天房".equals(ia.getIa_keyway())) {
					kf1.setS4(kf1.getS3() + 1);
					kf1.setS5(kf1.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "天房".equals(ia.getIa_keyway())) {
					kf1.setS7(kf1.getS7() + 1);
					kf1.setS8(kf1.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "天房".equals(ia.getIa_keyway())) {
					kf1.setS10(kf1.getS10() + 1);
					kf1.setS11(kf1.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setName("午夜房");
					kf2.setS1(kf2.getS1() + 1);
					kf2.setS2(kf2.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS4(kf2.getS3() + 1);
					kf2.setS5(kf2.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS7(kf2.getS7() + 1);
					kf2.setS8(kf2.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "午夜房".equals(ia.getIa_keyway())) {
					kf2.setS10(kf2.getS10() + 1);
					kf2.setS11(kf2.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setName("钟点房");
					kf3.setS1(kf3.getS1() + 1);
					kf3.setS2(kf3.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS4(kf3.getS3() + 1);
					kf3.setS5(kf3.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS7(kf3.getS7() + 1);
					kf3.setS8(kf3.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "钟点房".equals(ia.getIa_keyway())) {
					kf3.setS10(kf3.getS10() + 1);
					kf3.setS11(kf3.getS11() + ia.getIa_money());
				}
				if (ia.getIa_intime().compareTo(intime) == 0 && "月租房".equals(ia.getIa_keyway())) {
					kf4.setName("月租房");
					kf4.setS1(kf4.getS1() + 1);
					kf4.setS2(kf4.getS2() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS4(kf4.getS3() + 1);
					kf4.setS5(kf4.getS5() + ia.getIa_money());
				}
				if (ia.getIa_intime().getMonth() == intime.getMonth() - 1 && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS7(kf4.getS7() + 1);
					kf4.setS8(kf4.getS8() + ia.getIa_money());
				}
				if (ia.getIa_intime().getYear() == intime.getYear() && "月租房".equals(ia.getIa_keyway())) {
					kf4.setS10(kf4.getS10() + 1);
					kf4.setS11(kf4.getS11() + ia.getIa_money());
				}
			}
		}
		//房型分析
		for (RoomType rt : rtlist) {
			SuppleClass s = new SuppleClass();
			s.setName(rt.getRt_name());
			for (InAccount ia : list) {
				if (ia.getIa_intime().getYear() == intime.getYear()) {
					if (ia.getIa_intime().compareTo(intime) == 0
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS1(s.getS1() + 1);
						s.setS2(s.getS2() + ia.getIa_money());
						fjlx1 += 1;
						fjlx2 += ia.getIa_money();
					}
					if (ia.getIa_intime().getMonth() == intime.getMonth()
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS4(s.getS4() + 1);
						s.setS5(s.getS5() + ia.getIa_money());
						fjlx4 += 1;
						fjlx5 += ia.getIa_money();
					}
					if (ia.getIa_intime().getMonth() == intime.getMonth() - 1
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS7(s.getS7() + 1);
						;
						s.setS8(s.getS8() + ia.getIa_money());
						fjlx7 += 1;
						fjlx8 += ia.getIa_money();
					}
					if (ia.getIa_intime().getYear() == intime.getYear()
							&& rt.getRt_name().equals(ia.getR().getRt().getRt_name())) {
						s.setS10(s.getS10() + 1);
						s.setS11(s.getS11() + ia.getIa_money());
						fjlx10 += 1;
						fjlx11 += ia.getIa_money();
					}
				}
			}
			supplelist.add(s);
		}
		int num = roomservice.count();
		kezr3 = Double.parseDouble(String.format("%.2f",kezr1/num*100));
		kezr6 = Double.parseDouble(String.format("%.2f",kezr4/num*100/30));
		kezr9 = Double.parseDouble(String.format("%.2f",kezr7/num*100/30));
		kezr12 = Double.parseDouble(String.format("%.2f",kezr10/num*100/30/12));
		mem3 = Double.parseDouble(String.format("%.2f",mem1/num*100));
		mem6 = Double.parseDouble(String.format("%.2f",mem4/num*100/30));
		mem9 = Double.parseDouble(String.format("%.2f",mem7/num*100/30));
		mem12 = Double.parseDouble(String.format("%.2f",mem10/num*100/30/12));
		xydw3 = Double.parseDouble(String.format("%.2f",xydw1/num*100));
		xydw6 = Double.parseDouble(String.format("%.2f",xydw4/num*100/30));
		xydw9 = Double.parseDouble(String.format("%.2f",xydw7/num*100/30));
		xydw12 = Double.parseDouble(String.format("%.2f",xydw10/num*100/30/12));
		for(SuppleClass sc:supplelist){
			sc.setS3(Double.parseDouble(String.format("%.2f",sc.getS1()/num*100)));
			sc.setS6(Double.parseDouble(String.format("%.2f",sc.getS4()/num*100/30)));
			sc.setS9(Double.parseDouble(String.format("%.2f",sc.getS7()/num*100/30)));
			sc.setS12(Double.parseDouble(String.format("%.2f",sc.getS10()/num*100/30/12)));
			fjlx3 += sc.getS3();
			fjlx6 += sc.getS6();
			fjlx9 += sc.getS9();
			fjlx12 += sc.getS12();
		}
		fjlx3 = Double.parseDouble(String.format("%.2f",fjlx3));
		fjlx6 = Double.parseDouble(String.format("%.2f",fjlx6));
		fjlx9 = Double.parseDouble(String.format("%.2f",fjlx9));
		fjlx12 = Double.parseDouble(String.format("%.2f",fjlx12));
		//开房方式分析
		kf1.setS3(Double.parseDouble(String.format("%.2f",kf1.getS1()/num*100)));
		kf1.setS6(Double.parseDouble(String.format("%.2f",kf1.getS4()/num*100/30)));
		kf1.setS9(Double.parseDouble(String.format("%.2f",kf1.getS7()/num*100/30)));
		kf1.setS12(Double.parseDouble(String.format("%.2f",kf1.getS10()/num*100/30/12)));
		kf2.setS3(Double.parseDouble(String.format("%.2f",kf2.getS1()/num*100)));
		kf2.setS6(Double.parseDouble(String.format("%.2f",kf2.getS4()/num*100/30)));
		kf2.setS9(Double.parseDouble(String.format("%.2f",kf2.getS7()/num*100/30)));
		kf2.setS12(Double.parseDouble(String.format("%.2f",kf2.getS10()/num*100/30/12)));
		kf3.setS3(Double.parseDouble(String.format("%.2f",kf3.getS1()/num*100)));
		kf3.setS6(Double.parseDouble(String.format("%.2f",kf3.getS4()/num*100/30)));
		kf3.setS9(Double.parseDouble(String.format("%.2f",kf3.getS7()/num*100/30)));
		kf3.setS12(Double.parseDouble(String.format("%.2f",kf3.getS10()/num*100/30/12)));
		kf4.setS3(Double.parseDouble(String.format("%.2f",kf4.getS1()/num*100)));
		kf4.setS6(Double.parseDouble(String.format("%.2f",kf4.getS4()/num*100/30)));
		kf4.setS9(Double.parseDouble(String.format("%.2f",kf4.getS7()/num*100/30)));
		kf4.setS12(Double.parseDouble(String.format("%.2f",kf4.getS10()/num*100/30/12)));
		//收入分析
		model.addAttribute("rent1",rent1);
		model.addAttribute("rent2",rent2);
		model.addAttribute("rent3",rent3);
		model.addAttribute("rent4",rent4);
		
		//收款分析
		model.addAttribute("cash1",cash1);
		model.addAttribute("cash2",cash2);
		model.addAttribute("cash3",cash3);
		model.addAttribute("cash4",cash4);
		model.addAttribute("bank1",bank1);
		model.addAttribute("bank2",bank2);
		model.addAttribute("bank3",bank3);
		model.addAttribute("bank4",bank4);
		model.addAttribute("wechat1",wechat1);
		model.addAttribute("wechat2",wechat2);
		model.addAttribute("wechat3",wechat3);
		model.addAttribute("wechat4",wechat4);
		model.addAttribute("alipay1",alipay1);
		model.addAttribute("alipay2",alipay2);
		model.addAttribute("alipay3",alipay3);
		model.addAttribute("alipay4",alipay4);
		model.addAttribute("agree1",agree1);
		model.addAttribute("agree2",agree2);
		model.addAttribute("agree3",agree3);
		model.addAttribute("agree4",agree4);
		//来源分析
		model.addAttribute("kezr1", kezr1);
		model.addAttribute("kezr2", kezr2);
		model.addAttribute("kezr3", kezr3);
		model.addAttribute("kezr4", kezr4);
		model.addAttribute("kezr5", kezr5);
		model.addAttribute("kezr6", kezr6);
		model.addAttribute("kezr7", kezr7);
		model.addAttribute("kezr8", kezr8);
		model.addAttribute("kezr9", kezr9);
		model.addAttribute("kezr10", kezr10);
		model.addAttribute("kezr11", kezr11);
		model.addAttribute("kezr12", kezr12);
		model.addAttribute("mem1", mem1);
		model.addAttribute("mem2", mem2);
		model.addAttribute("mem3", mem3);
		model.addAttribute("mem4", mem4);
		model.addAttribute("mem5", mem5);
		model.addAttribute("mem6", mem6);
		model.addAttribute("mem7", mem7);
		model.addAttribute("mem8", mem8);
		model.addAttribute("mem9", mem9);
		model.addAttribute("mem10", mem10);
		model.addAttribute("mem11", mem11);
		model.addAttribute("mem12", mem12);
		model.addAttribute("xydw1", xydw1);
		model.addAttribute("xydw2", xydw2);
		model.addAttribute("xydw3", xydw3);
		model.addAttribute("xydw4", xydw4);
		model.addAttribute("xydw5", xydw5);
		model.addAttribute("xydw6", xydw6);
		model.addAttribute("xydw7", xydw7);
		model.addAttribute("xydw8", xydw8);
		model.addAttribute("xydw9", xydw9);
		model.addAttribute("xydw10", xydw10);
		model.addAttribute("xydw11", xydw11);
		model.addAttribute("xydw12", xydw12);
		//房源分析和合计
		model.addAttribute("supplelist", supplelist);
		model.addAttribute("fjlx1",fjlx1);
		model.addAttribute("fjlx2",fjlx2);
		model.addAttribute("fjlx3",fjlx3);
		model.addAttribute("fjlx4",fjlx4);
		model.addAttribute("fjlx5",fjlx5);
		model.addAttribute("fjlx6",fjlx6);
		model.addAttribute("fjlx7",fjlx7);
		model.addAttribute("fjlx8",fjlx8);
		model.addAttribute("fjlx9",fjlx9);
		model.addAttribute("fjlx10",fjlx10);
		model.addAttribute("fjlx11",fjlx11);
		model.addAttribute("fjlx12",fjlx12);
		//开房方式分析
		model.addAttribute("kf1", kf1);
		model.addAttribute("kf2", kf2);
		model.addAttribute("kf3", kf3);
		model.addAttribute("kf4", kf4);
		model.addAttribute("date", intime);
		//有个数据有问题，特意放到此处
		model.addAttribute("allsource", Double.parseDouble(String.format("%.2f",kezr12+mem12+xydw12)));
		return "Reports/BusinessAnalysis/index_3";
	}
	
	
//***************入住率分析************************************************************
	@RequestMapping("/queryOccupancy")
	public String queryOccupancy(Model model){
		double num = 0,occupancy = 0,money = 0,avgmoney = 0;
		double allnum = roomservice.count();
		//以当天为例
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		try {
			for(int i=0;i<DateChange.differentDaysByMillisecond(new Date(), new Date())+1;i++){
				Date date = DateChange.addDate(new Date(), i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						num += 1;
						money += ia.getIa_money();
						sc.setS1(sc.getS1()+1);
						sc.setS4(sc.getS4()+ia.getIa_money());
					}
				}
				sc.setS2(allnum);
				sc.setS3(Double.parseDouble(String.format("%.2f",sc.getS1()/allnum*100)));
				if(sc.getS1()!=0){
					sc.setS5(Double.parseDouble(String.format("%.2f",sc.getS4()/sc.getS1())));
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		occupancy = Double.parseDouble(String.format("%.2f",num/allnum*100));
		if(num!=0){
			avgmoney = Double.parseDouble(String.format("%.2f",money/num));
		}
		model.addAttribute("num", num);
		model.addAttribute("allnum", allnum);
		model.addAttribute("occupancy", occupancy);
		model.addAttribute("money", money);
		model.addAttribute("avgmoney", avgmoney);
		model.addAttribute("startdate", new Date());
		model.addAttribute("enddate", new Date());
		model.addAttribute("sclist", sclist);
		//JSON数据转换
		JSONObject occ = new JSONObject();
		for(SuppleClass sc:sclist){
			occ.put(sc.getName(), sc.getS3());
		}
		model.addAttribute("occ", occ);
		return "Reports/Occupancy/index_3";
	}
	//入住率分析条件查询
	@RequestMapping("/queryOccupancy1")
	public String queryOccupancy1(String start,String end,Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		double num = 0,occupancy = 0,money = 0,avgmoney = 0;
		double allnum = roomservice.count();
		List<InAccount> list = service.queryAll();
		Date startdate = null,enddate = null;
		List<SuppleClass> sclist = new ArrayList<>();
		try {
			startdate = sdf.parse(start);
			enddate = sdf.parse(end);
			for(int i=0;i<DateChange.differentDaysByMillisecond(startdate, enddate)+1;i++){
				Date date = DateChange.addDate(startdate, i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						num += 1;
						money += ia.getIa_money();
						sc.setS1(sc.getS1()+1);
						sc.setS4(sc.getS4()+ia.getIa_money());
					}
				}
				sc.setS2(allnum);
				sc.setS3(Double.parseDouble(String.format("%.2f",sc.getS1()/allnum*100)));
				if(sc.getS1()!=0){
					sc.setS5(Double.parseDouble(String.format("%.2f",sc.getS4()/sc.getS1())));
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		occupancy = Double.parseDouble(String.format("%.2f",num/allnum/DateChange.differentDaysByMillisecond(startdate, enddate)*100));
		if(num!=0){
			avgmoney = Double.parseDouble(String.format("%.2f",money/num));
		}
		model.addAttribute("num", num);
		model.addAttribute("allnum", allnum);
		model.addAttribute("occupancy", occupancy);
		model.addAttribute("money", money);
		model.addAttribute("avgmoney", avgmoney);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("sclist", sclist);
		//JSON数据转换
		JSONObject occ = new JSONObject();
		for(SuppleClass sc:sclist){
			occ.put(sc.getName(), sc.getS3());
		}
		model.addAttribute("occ", occ);
		return "Reports/Occupancy/index_3";
	}
	
	
	
//************来源分析*************************************************************************************
	@RequestMapping("/querySource")
	public String querySource(Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		SuppleClass supple = new SuppleClass();
		try {
			for(int i=0;i<DateChange.differentDaysByMillisecond(new Date(), new Date())+1;i++){
				Date date = DateChange.addDate(new Date(), i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						if("客人自入".equals(ia.getIa_source())){
							sc.setS1(sc.getS1()+1);
							supple.setS1(supple.getS1()+1);
						}
						if("会员".equals(ia.getIa_source())){
							sc.setS2(sc.getS2()+1);
							supple.setS2(supple.getS2()+1);
						}
						if("协议单位".equals(ia.getIa_source())){
							sc.setS3(sc.getS3()+1);
							supple.setS3(supple.getS3()+1);
						}
					}
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("startdate", new Date());
		model.addAttribute("enddate", new Date());
		model.addAttribute("supple", supple);
		return "Reports/SourceAnalysis/index_3";
	}
	//来源分析条件查询
	@RequestMapping("/querySource1")
	public String querySource1(String start,String end,Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		Date startdate = null,enddate = null;
		SuppleClass supple = new SuppleClass();
		try {
			startdate = sdf.parse(start);
			enddate = sdf.parse(end);
			for(int i=0;i<DateChange.differentDaysByMillisecond(startdate, enddate)+1;i++){
				Date date = DateChange.addDate(startdate, i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						if("客人自入".equals(ia.getIa_source())){
							sc.setS1(sc.getS1()+1);
							supple.setS1(supple.getS1()+1);
						}
						if("会员".equals(ia.getIa_source())){
							sc.setS2(sc.getS2()+1);
							supple.setS2(supple.getS2()+1);
						}
						if("协议单位".equals(ia.getIa_source())){
							sc.setS3(sc.getS3()+1);
							supple.setS3(supple.getS3()+1);
						}
					}
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("supple", supple);
		return "Reports/SourceAnalysis/index_3";
	}
	
//***********房型分析*****************************************************************************************
	@RequestMapping("/queryRoomType")
	public String queryRoomType(Model model){
		boolean flag = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		List<Map<String,Double>> maplist = new ArrayList<>();
		Map<String,Double> supplemap = new HashedMap();
		double allnum = 0;
		try {
			for(int i=0;i<DateChange.differentDaysByMillisecond(new Date(), new Date())+1;i++){
				Date date = DateChange.addDate(new Date(), i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				Map<String,Double> map = new HashedMap();
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						for(RoomType rt:rtlist){
							if(rt.getRt_name().equals(ia.getR().getRt().getRt_name())){
								sc.setS1(sc.getS1()+1);
								allnum += 1;
								if(map.get(rt.getRt_name())!=null){
									double temp = map.get(rt.getRt_name());
									map.remove(rt.getRt_name());
									map.put(rt.getRt_name(),temp+1);
								}else{
									map.put(rt.getRt_name(),(double) 1);
								}
							}
						}
					}
				}
				sc.setMap(map);
				sclist.add(sc);
				boolean isadd = true;
				for(Map.Entry<String, Double> entry:map.entrySet()){
					for(Map.Entry<String, Double> s:supplemap.entrySet()){
						if(entry.getKey().equals(s.getKey())){
							supplemap.put(s.getKey(), s.getValue()+entry.getValue());
							isadd = false;
						}
					}
					if(isadd){
						supplemap.put(entry.getKey(), entry.getValue());
					}
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("size", rtlist.size());
		model.addAttribute("startdate", new Date());
		model.addAttribute("enddate", new Date());
		model.addAttribute("supplemap", supplemap);
		model.addAttribute("allnum", allnum);
		//JSON数据转换
		JSONObject roomname = JSONObject.fromObject(supplemap);
		JSONArray roomtype = new JSONArray();
		for(RoomType rt:rtlist){
			JSONObject json = new JSONObject();
			boolean isrt = true;
			for(Map.Entry<String, Double> s:supplemap.entrySet()){
				if(s.getKey().equals(rt.getRt_name())){
					isrt = false;
					json.put("value", s.getValue());
					json.put("name", s.getKey());
				}
			}
			if(isrt){
				json.put("value", 0.0);
				json.put("name", rt.getRt_name());
				roomname.put(rt.getRt_name(), 0.0);
			}
			roomtype.add(json);
		}
				
		model.addAttribute("roomtype", roomtype);
		model.addAttribute("roomname", roomname);
		return "Reports/RoomTypeAnalysis/index_3";
	}
//房型分析条件查询
	@RequestMapping("/queryRoomType1")
	public String queryRoomType1(String start,String end,Model model){
		boolean flag = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		List<Map<String,Double>> maplist = new ArrayList<>();
		Map<String,Double> supplemap = new HashedMap();
		Date startdate = null,enddate = null;
		double allnum = 0;
		try {
			startdate = sdf.parse(start);
			enddate = sdf.parse(end);
			for(int i=0;i<DateChange.differentDaysByMillisecond(startdate, enddate)+1;i++){
				Date date = DateChange.addDate(startdate, i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				Map<String,Double> map = new HashedMap();
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						for(RoomType rt:rtlist){
							if(rt.getRt_name().equals(ia.getR().getRt().getRt_name())){
								sc.setS1(sc.getS1()+1);
								allnum += 1;
								if(map.get(rt.getRt_name())!=null){
									double temp = map.get(rt.getRt_name());
									map.remove(rt.getRt_name());
									map.put(rt.getRt_name(),temp+1);
								}else{
									map.put(rt.getRt_name(),(double) 1);
								}
							}
						}
					}
				}
				sc.setMap(map);
				sclist.add(sc);
				boolean isadd = true;
				for(Map.Entry<String, Double> entry:map.entrySet()){
					for(Map.Entry<String, Double> s:supplemap.entrySet()){
						if(entry.getKey().equals(s.getKey())){
							supplemap.put(s.getKey(), s.getValue()+entry.getValue());
							isadd = false;
						}
					}
					if(isadd){
						supplemap.put(entry.getKey(), entry.getValue());
					}
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("size", rtlist.size());
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("supplemap", supplemap);
		model.addAttribute("allnum", allnum);
		//JSON数据转换
		JSONObject roomname = JSONObject.fromObject(supplemap);
		JSONArray roomtype = new JSONArray();
		for(RoomType rt:rtlist){
			JSONObject json = new JSONObject();
			boolean isrt = true;
			for(Map.Entry<String, Double> s:supplemap.entrySet()){
				if(s.getKey().equals(rt.getRt_name())){
					isrt = false;
					json.put("value", s.getValue());
					json.put("name", s.getKey());
				}
			}
			if(isrt){
				json.put("value", 0.0);
				json.put("name", rt.getRt_name());
				roomname.put(rt.getRt_name(), 0.0);
			}
			roomtype.add(json);
		}
		model.addAttribute("roomtype", roomtype);
		model.addAttribute("roomname", roomname);
		return "Reports/RoomTypeAnalysis/index_3";
	}
//********开房方式分析****************************************************************************************
	@RequestMapping("/queryOpenType")
	public String queryOpenType(Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		SuppleClass supple = new SuppleClass();
		try {
			for(int i=0;i<DateChange.differentDaysByMillisecond(new Date(), new Date())+1;i++){
				Date date = DateChange.addDate(new Date(), i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						if("天房".equals(ia.getIa_keyway())){
							sc.setS1(sc.getS1()+1);
							supple.setS1(supple.getS1()+1);
						}
						if("午夜房".equals(ia.getIa_keyway())){
							sc.setS2(sc.getS2()+1);
							supple.setS2(supple.getS2()+1);
						}
						if("钟点房".equals(ia.getIa_keyway())){
							sc.setS3(sc.getS3()+1);
							supple.setS3(supple.getS3()+1);
						}
						if("月租房".equals(ia.getIa_keyway())){
							sc.setS4(sc.getS4()+1);
							supple.setS4(supple.getS4()+1);
						}
					}
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("startdate", new Date());
		model.addAttribute("enddate", new Date());
		model.addAttribute("supple", supple);
		return "Reports/OpenRoomAnalysis/index_3";
	}
	//开房方式条件查询
	@RequestMapping("/queryOpenType1")
	public String queryOpenType1(String start,String end,Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<InAccount> list = service.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		SuppleClass supple = new SuppleClass();
		Date startdate = null,enddate = null;
		try {
			startdate = sdf.parse(start);
			enddate = sdf.parse(end);
			for(int i=0;i<DateChange.differentDaysByMillisecond(startdate, enddate)+1;i++){
				Date date = DateChange.addDate(startdate, i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				sc.setName(sdf.format(intime));
				for(InAccount ia:list){
					if(ia.getIa_intime().compareTo(intime)==0){
						if("天房".equals(ia.getIa_keyway())){
							sc.setS1(sc.getS1()+1);
							supple.setS1(supple.getS1()+1);
						}
						if("午夜房".equals(ia.getIa_keyway())){
							sc.setS2(sc.getS2()+1);
							supple.setS2(supple.getS2()+1);
						}
						if("钟点房".equals(ia.getIa_keyway())){
							sc.setS3(sc.getS3()+1);
							supple.setS3(supple.getS3()+1);
						}
						if("月租房".equals(ia.getIa_keyway())){
							sc.setS4(sc.getS4()+1);
							supple.setS4(supple.getS4()+1);
						}
					}
				}
				sclist.add(sc);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sclist", sclist);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("supple", supple);
		return "Reports/OpenRoomAnalysis/index_3";
	}
//**********营业明细**********************************************************************************
	@RequestMapping("/queryBusinessDetail")
	public String queyrBusinessDetail(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<InAccount> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryBusinessDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<InAccount> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		//当前合计和总合计
		int money = 0;
		for(InAccount ia:list){
			money += ia.getIa_money();
		}
		model.addAttribute("money", money);
		return "Reports/BusinessDetail/index_3";
	}
	//
	@RequestMapping("/queryDetail")
	public String queyrDetail(String startdate,String enddate,String roomnum,Model model,HttpServletRequest req) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date starttime = null;
		Date endtime = null;
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if(startdate!=null&&!"".equals(startdate)){
			starttime = sdf.parse(startdate);
		}
		if(enddate!=null&&!"".equals(enddate)){
			endtime = sdf.parse(enddate);
		}
		if(roomnum==null||"".equals(roomnum)){
			roomnum = "0";
		}
		List<InAccount> list = service.queryAllByReason(starttime, endtime,Integer.parseInt(roomnum), (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Integer.parseInt(pageNo)*Contacts.PAGE_SIZE);
		String url = "queryDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(starttime, endtime, Integer.parseInt(roomnum));
		}
		PageBean<InAccount> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("starttime", starttime);
		model.addAttribute("endtime", endtime);
		model.addAttribute("roomnum", roomnum);
		//当前合计和总合计
		int money = 0;
		for(InAccount ia:list){
			money += ia.getIa_money();
		}
		model.addAttribute("money", money);
		return "Reports/BusinessDetail/index_3";
	}
}
