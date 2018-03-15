package com.hotel.member.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.bill.dao.vo.Bill;
import com.hotel.bill.service.BillService;
import com.hotel.customer.service.CustomerService;
import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.dao.vo.SuppleClass;
import com.hotel.member.dao.vo.Member;
import com.hotel.member.service.MemberService;
import com.hotel.memberhandle.dao.vo.MemberHandle;
import com.hotel.memberhandle.service.MemberHandleService;
import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.membertype.service.MemberTypeService;
import com.hotel.roomtype.dao.vo.RoomType;
import com.hotel.user.dao.vo.User;
import com.hotel.util.Contacts;
import com.hotel.util.DateChange;
import com.hotel.util.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/MemberController")
public class MemberController {
	@Autowired
	private MemberTypeService membertypeservice;
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private MemberService service;
	@Autowired
	private BillService billservice;
	@Autowired
	private MemberHandleService memberhandleservice;
	
	@RequestMapping("queryMt")     //先查询会员类型(添加会员)
	public String queryMt(Model model){
		List<MemberType> mtlist = membertypeservice.queryAll();
		model.addAttribute("mtlist", mtlist);
		return "Member/openmembercard";
	}
	
	@RequestMapping("queryMt1")     //先查询会员类型（会员升级）
	public String queryMt1(Model model){
		List<MemberType> mtlist = membertypeservice.queryAll();
		model.addAttribute("mtlist", mtlist);
		return "Member/memberpremium";
	}
	
	@RequestMapping("/add")
	public String add(Member m,HttpServletRequest req){
		m.setM_state(1);
		m.setM_date(new Date());
		customerservice.add(m.getC());   //添加客户信息
		service.add(m);					//添加会员信息
		addHandle(m,"会员添加",req);
		return "Member/member";
	}
	
	@RequestMapping("queryAllByPage") //分页查询
	public String queryAllByPage(Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Member> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<Member> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		List<MemberType> mtlist = membertypeservice.queryAll();
		model.addAttribute("mtlist", mtlist);
		model.addAttribute("m_state", -1);
		return "Member/index_1";
	}
	//会员界面条件查询
	@RequestMapping("queryByReason") //分页查询
	public String queryByReason(String m_name,int m_state,Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if("".equals(m_name)){
			m_name=null;
		}
		List<Member> list = service.queryByReason(m_name,m_state,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(m_name, m_state);
		}
		PageBean<Member> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		List<MemberType> mtlist = membertypeservice.queryAll();
		model.addAttribute("mtlist", mtlist);
		model.addAttribute("m_name", m_name);
		model.addAttribute("m_state", m_state);
		return "Member/index_1";
	}
	@RequestMapping("/queryById")
	public String queryById(String m_id,Model model){
		Member m = service.queryById(Integer.parseInt(m_id));
		model.addAttribute("m", m);
		return "Member/memberupdate";
	}
	@RequestMapping("/update")
	public String update(Member m){
		customerservice.update(m.getC());
		service.update(m);
		return "Member/member";
	}
	@RequestMapping("/delete")
	public String delete(String m_id,HttpServletRequest req){
		service.delete(Integer.parseInt(m_id));
		Member m = service.queryById(Integer.parseInt(m_id));
		addHandle(m, "会员退卡", req);
		return "Member/member";
	}
	
	@RequestMapping("/queryByCardnum")    //根据会员编号查询信息
	@ResponseBody
	public Member setName(String m_cardnum,HttpServletResponse resp){
		Member m = new Member();
		if(m_cardnum!=null){
			m =	service.queryByCardnum(m_cardnum);
		}
		return m;	
	}
	
	@RequestMapping("/updatetype")       //会员升级
	public String updatetype(Member m,HttpServletRequest req){
		Member member = service.queryById(m.getM_id());
		member.setMt(m.getMt());
		service.update(member);
		addHandle(m, "会员升级", req);
		return "Member/member";
	}
	
	@RequestMapping("/updatestate")		//会员挂失
	public String updatestate(Member m,HttpServletRequest req){
		Member member = service.queryById(m.getM_id());
		member.setM_state(0);
		service.update(member);
		addHandle(m, "会员挂失", req);
		return "Member/member";
	}
	
	@RequestMapping("/updatecardnum")
	public String updatecardnum(Member m,HttpServletRequest req){
		Member member = service.queryById(m.getM_id());
		member.setM_money(member.getM_money()+m.getM_money());
		member.setM_cardnum(m.getM_cardnum());
		service.update(member);
		addHandle(m, "会员换卡", req);
		return "Member/member";
	}
	
//*********会员报表****************************************************************
	//会员开卡统计
	@RequestMapping("/queryOpenDetail")
	public String queryOpenDetail(Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Member> mlist = service.queryAll();
		List<MemberType> mtlist = membertypeservice.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		Map<String,Double> supplemap = new HashedMap();
		double allnum = 0;
		try {
			for(int i=0;i<DateChange.differentDaysByMillisecond(new Date(), new Date())+1;i++){
				Date date = DateChange.addDate(new Date(), i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				SuppleClass sc = new SuppleClass();
				Map<String,Double> map = new HashedMap();
				for(Member m:mlist){
					if(m.getM_date().compareTo(intime)==0){
						sc.setName(m.getU().getU_name());
						for(MemberType mt:mtlist){
							if(mt.getMt_name().equals(m.getMt().getMt_name())){
								sc.setS1(sc.getS1()+1);
								allnum += 1;
								if(map.get(mt.getMt_name())!=null){
									double temp = map.get(mt.getMt_name());
									map.remove(mt.getMt_name());
									map.put(mt.getMt_name(),temp+1);
								}else{
									map.put(mt.getMt_name(),(double) 1);
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
		model.addAttribute("mtlist", mtlist);
		model.addAttribute("size", mtlist.size());
		model.addAttribute("startdate", new Date());
		model.addAttribute("enddate", new Date());
		model.addAttribute("supplemap", supplemap);
		model.addAttribute("allnum", allnum);
		return "Reports/AddMemberAnalysis/index_3";
	}
	//会员开卡条件查询
	@RequestMapping("/queryOpenDetail1")
	public String queryOpenDetail1(String starttime,String endtime,Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Member> mlist = service.queryAll();
		List<MemberType> mtlist = membertypeservice.queryAll();
		List<SuppleClass> sclist = new ArrayList<>();
		Map<String,Double> supplemap = new HashedMap();
		double allnum = 0;
		Date startdate = null;
		Date enddate = null;
		try {
			startdate = sdf.parse(starttime);
			enddate = sdf.parse(endtime);
			for(int i=0;i<DateChange.differentDaysByMillisecond(startdate, enddate)+1;i++){
				Date date = DateChange.addDate(startdate, i);
				Date intime = null;
				intime = sdf.parse(sdf.format(date));
				Map<String,Double> map = new HashedMap();
				for(Member m:mlist){
					if(m.getM_date().compareTo(intime)==0){
						SuppleClass sc = new SuppleClass();
						sc.setName(m.getU().getU_name());
						for(MemberType mt:mtlist){
							if(mt.getMt_name().equals(m.getMt().getMt_name())){
								sc.setS1(sc.getS1()+1);
								allnum += 1;
								if(map.get(mt.getMt_name())!=null){
									double temp = map.get(mt.getMt_name());
									map.remove(mt.getMt_name());
									map.put(mt.getMt_name(),temp+1);
								}else{
									map.put(mt.getMt_name(),(double) 1);
								}
							}
						}
						sc.setMap(map);
						sclist.add(sc);
					}
				}
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
		model.addAttribute("mtlist", mtlist);
		model.addAttribute("size", mtlist.size());
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("supplemap", supplemap);
		model.addAttribute("allnum", allnum);
		return "Reports/AddMemberAnalysis/index_3";
	}
	//会员消费报表
	@RequestMapping("/queryConsumeDetail")
	public String queryConsumeDetail(Model model){
		SuppleClass sc = new SuppleClass();
		List<Bill> blist = billservice.queryAll();
		List<Member> mlist = service.queryAll();
		//合计
		for(Bill b:blist){
			sc.setS1(sc.getS1()+b.getB_days());
			sc.setS2(sc.getS2()+b.getR().getRt().getRt_price());
			sc.setS3(sc.getS3()+b.getB_allmoney()/b.getB_days());
			sc.setS4(sc.getS4()+b.getB_allmoney());
		}
		model.addAttribute("blist", blist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("sc", sc);
		return "Reports/ConsumeMemberAnalysis/index_3";
	}
	//会员消费报表
	@RequestMapping("/queryConsumeDetail1")
	public String queryConsumeDetail1(String starttime,String endtime,String typenum,Model model){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = null,enddate=null;
		try {
			if(!"".equals(starttime)){
				startdate = sdf.parse(starttime);
			}
			if(!"".equals(endtime)){
				enddate = sdf.parse(endtime);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if("".equals(typenum)){
			typenum=null;
		}
		SuppleClass sc = new SuppleClass();
		List<Bill> blist = billservice.queryAll1(startdate, enddate, typenum);
		List<Member> mlist = service.queryAll();
		//合计
		for(Bill b:blist){
			sc.setS1(sc.getS1()+b.getB_days());
			sc.setS2(sc.getS2()+b.getR().getRt().getRt_price());
			sc.setS3(sc.getS3()+b.getB_allmoney()/b.getB_days());
			sc.setS4(sc.getS4()+b.getB_allmoney());
		}
		model.addAttribute("blist", blist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("sc", sc);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("typenum", typenum);
		return "Reports/ConsumeMemberAnalysis/index_3";
	}
	
	//添加会员操作记录函数
	public void addHandle(Member m,String handle,HttpServletRequest req){
		MemberHandle mh = new MemberHandle();
		mh.setM(m);
		mh.setMh_date(new Date());
		mh.setMh_handle(handle);
		User u =  (User) req.getSession().getAttribute("user");
		mh.setU(u);
		memberhandleservice.add(mh);
	}
}
