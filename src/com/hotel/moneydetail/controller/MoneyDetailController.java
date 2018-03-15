package com.hotel.moneydetail.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.bill.dao.vo.Bill;
import com.hotel.moneydetail.dao.vo.MoneyDetail;
import com.hotel.moneydetail.service.MoneyDetailService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/MoneyDetailController")
public class MoneyDetailController {
	@Autowired
	private MoneyDetailService service;
	
	//收银明细查询
	@RequestMapping("/queryMoneyDetail")   
	public String queryBusinessDetail(Model model,HttpServletRequest req) throws ParseException{
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<MoneyDetail> list = service.queryAllByReason(null,null,"全部","全部",(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryMoneyDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(null, null, "全部","全部");
		}
		PageBean<MoneyDetail> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("type", "全部");
		model.addAttribute("paytype", "全部");
		return "Reports/CashierDetail/index_3";
	}
	//点击查询时获取数据(更具条件去获取数据)
	@RequestMapping("/queryDetail")
	public String queryDetail(String startdate,String enddate,String type,String paytype,Model model,HttpServletRequest req) throws NumberFormatException, ParseException{
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
		List<MoneyDetail> list = service.queryAllByReason(starttime,endtime,type,paytype,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(starttime, endtime, type,paytype);
		}
		PageBean<MoneyDetail> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("starttime", starttime);
		model.addAttribute("endtime", endtime);
		model.addAttribute("type", type);
		model.addAttribute("paytype", paytype);
		return "Reports/CashierDetail/index_3";
	}
}
