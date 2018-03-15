package com.hotel.moneyrecord.controller;

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
import com.hotel.member.service.MemberService;
import com.hotel.memberhandle.dao.vo.MemberHandle;
import com.hotel.memberhandle.service.MemberHandleService;
import com.hotel.moneydetail.dao.vo.MoneyDetail;
import com.hotel.moneydetail.service.MoneyDetailService;
import com.hotel.moneyrecord.dao.vo.MoneyRecord;
import com.hotel.moneyrecord.service.MoneyRecordService;
import com.hotel.user.dao.vo.User;
import com.hotel.user.service.UserService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/MoneyRecordController")
public class MoneyRecordController {
	@Autowired
	private MoneyRecordService service;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private MoneyDetailService moneydetailservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private MemberHandleService memberhandleservice;
	
	@RequestMapping("/add")
	public String add(MoneyRecord mr){
		mr.setMr_date(new Date());
		service.add(mr);
		Member m = memberservice.queryById(mr.getM().getM_id());
		m.setM_money(m.getM_money()+mr.getMr_money());
		memberservice.update(m);
		
		//向收银明细辅助表插入信息
		MoneyDetail md = new MoneyDetail();
		md.setMd_money(mr.getMr_money());
		User u = userservice.queryById(m.getU().getU_id());
		md.setMd_name(u.getU_name());
		md.setMd_paytype(mr.getMr_paytype());
		//md.setMd_reward();
		//md.setMd_roomnum();
		md.setMd_starttime(mr.getMr_date());
		md.setMd_type("会员充值");
		moneydetailservice.add(md);
		//操作记录添加
		MemberHandle mh = new MemberHandle();
		mh.setM(m);
		mh.setMh_date(new Date());
		mh.setMh_handle("会员充值");
		mh.setU(u);
		memberhandleservice.add(mh);
		return "Member/member";
	}
	//统计查询
	@RequestMapping("/queryAll")
	public String queryAll(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<MoneyRecord> list = service.queryAllByReason(null, null, null, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAll";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(null, null, null);
		}
		PageBean<MoneyRecord> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		return "Reports/MoneyMemberAnalysis/index_3";
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
		List<MoneyRecord> list = service.queryAllByReason(startdate, enddate, typenum, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(startdate, enddate, typenum);
		}
		PageBean<MoneyRecord> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("typenum", typenum);
		return "Reports/MoneyMemberAnalysis/index_3";
	}
}
