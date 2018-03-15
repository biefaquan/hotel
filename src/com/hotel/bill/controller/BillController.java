package com.hotel.bill.controller;

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
import com.hotel.bill.service.BillService;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/BillController")
public class BillController {
	@Autowired
	private BillService service;
	
	//营业明细查询
	@RequestMapping("/queryCloseDetail")   
	public String queryBusinessDetail(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Bill> list = service.queryAllByReason(null,null,0,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryCloseDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(null, null, 0);
		}
		PageBean<Bill> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		return "Reports/CloseDetail/index_3";
	}
	//点击查询时获取数据(更具条件去获取数据)
	@RequestMapping("/queryDetail")
	public String queryDetail(String startdate,String enddate,String roomnum,Model model,HttpServletRequest req) throws NumberFormatException, ParseException{
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
		List<Bill> list = service.queryAllByReason(starttime,endtime,Integer.parseInt(roomnum),(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(starttime, endtime, Integer.parseInt(roomnum));
		}
		PageBean<Bill> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("starttime", starttime);
		model.addAttribute("endtime", endtime);
		model.addAttribute("roomnum", roomnum);
		return "Reports/CloseDetail/index_3";
	}
	
}
