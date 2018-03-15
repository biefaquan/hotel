package com.hotel.memberhandle.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.member.dao.vo.Member;
import com.hotel.memberhandle.dao.vo.MemberHandle;
import com.hotel.memberhandle.service.MemberHandleService;
import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/MemberHandleController")
public class MemberHandleController {
	@Autowired
	private MemberHandleService service;
	
	@RequestMapping("/queryAll")
	public String queryAll(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<MemberHandle> list = service.queryAllByReason(null, null, null, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAll";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(null, null, null);
		}
		PageBean<MemberHandle> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		return "Reports/HandleMemberAnalysis/index_3";
	}
	//条件查询
	@RequestMapping("/queryAllByReason")
	public String queryAllByReason(String starttime,String endtime,String typenum,Model model,HttpServletRequest req) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = null,enddate = null;
		if(starttime!=null&&!"".equals(starttime)){
			startdate = sdf.parse(starttime);
		}
		if(endtime!=null&&!"".equals(endtime)){
			enddate = sdf.parse(endtime);
		}
		if("".equals(typenum)){
			typenum = null;
		}
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<MemberHandle> list = service.queryAllByReason(startdate, enddate, typenum, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(startdate, enddate, typenum);
		}
		PageBean<MemberHandle> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("typenum", typenum);
		return "Reports/HandleMemberAnalysis/index_3";
	}
}
