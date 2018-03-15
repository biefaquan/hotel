package com.hotel.agreement.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.agreement.dao.vo.Agreement;
import com.hotel.agreement.service.AgreementService;
import com.hotel.agreementtype.dao.vo.AgreementType;
import com.hotel.agreementtype.service.AgreementTypeService;
import com.hotel.bill.dao.vo.Bill;
import com.hotel.bill.service.BillService;
import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.service.InAccountService;
import com.hotel.moneydetail.dao.vo.MoneyDetail;
import com.hotel.moneyrecord.dao.vo.MoneyRecord;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/AgreementController")
public class AgreementController {
	@Autowired
	private AgreementService service;
	@Autowired
	private AgreementTypeService agreementtypeservice;
	@Autowired
	private BillService billservice;
	@Autowired
	private InAccountService inaccountservice;
	
	@RequestMapping("/queryAt")   //添加时，先查询协议类别
	public String queryAt(Model model){
		List<AgreementType> atlist = agreementtypeservice.queryAll();
		model.addAttribute("atlist", atlist);
		return "Agreement/agreementadd";
	}
	@RequestMapping("/add")
	public String add(Agreement a,HttpServletRequest req){
		String province = req.getParameter("s_province");
		String city = req.getParameter("s_city");
		String county = req.getParameter("s_county");
		a.setA_adress(province+city+county+a.getA_adress());
		service.add(a);
		return "Agreement/agreement";
	}
	@RequestMapping("/queryAll")//协议单位界面
	public String queryAll(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Agreement> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAll";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<Agreement> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		//显示协议类别
		List<AgreementType> atlist = agreementtypeservice.queryAll();
		model.addAttribute("atlist", atlist);
		model.addAttribute("a_state", -1);
		return "Agreement/index_1";
	}
	@RequestMapping("/queryByReason")//条件查询 协议单位界面
	public String queryByReason(String a_name,String a_username,int a_state,Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if("".equals(a_name)){
			a_name=null;
		}
		if("".equals(a_username)){
			a_username=null;
		}
		List<Agreement> list = service.queryByReason(a_name,a_username,a_state,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(a_name, a_username, a_state);
		}
		PageBean<Agreement> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		//显示协议类别
		List<AgreementType> atlist = agreementtypeservice.queryAll();
		model.addAttribute("atlist", atlist);
		model.addAttribute("a_name", a_name);
		model.addAttribute("a_username", a_username);
		model.addAttribute("a_state", a_state);
		return "Agreement/index_1";
	}
	//根据协议编号查询信息
	@RequestMapping("queryByCardnum")
	@ResponseBody
	public Agreement queryByCardnum(String a_cardnum){
		Agreement a = new Agreement();
		if(a_cardnum!=null){
			a = service.queryByCardnum(a_cardnum);
		}
		return a;
	}
	
	@RequestMapping("/queryById")
	public String queryById(int a_id,Model model){
		Agreement a = service.queryById(a_id);
		model.addAttribute("a", a);
		//显示协议类别
		List<AgreementType> atlist = agreementtypeservice.queryAll();
		model.addAttribute("atlist", atlist);
		return "Agreement/agreementupdate";
	}
	@RequestMapping("/update")
	public String update(Agreement a,HttpServletRequest req){
		String province = req.getParameter("s_province");
		String city = req.getParameter("s_city");
		String county = req.getParameter("s_county");
		a.setA_adress(province+city+county+a.getA_adress());
		service.update(a);
		return "Agreement/agreement";
	}
	@RequestMapping("delete")
	public String delete(int a_id){
		service.delete(a_id);
		return "Agreement/agreement";
	}
	//结算明细报表
	@RequestMapping("/queryAgreement")
	public String queryAgreement(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Bill> list = billservice.queryAgreement(null, null, null, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAgreement";
		int count = 1;
		if(list.size()!=0){
			count = billservice.queryCount(null, null, null);
		}
		PageBean<Bill> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		List<Agreement> alist = service.queryAll();
		model.addAttribute("alist", alist);
		return "Reports/AgreementCredit/index_3";
	}
	//条件查询
	@RequestMapping("/queryAgreementByReason")
	public String queryAgreementByReason(String starttime,String endtime,String typenum,Model model,HttpServletRequest req) throws ParseException{
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
		List<Bill> list = billservice.queryAgreement(startdate, enddate, typenum, (Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAgreementByReason";
		int count = 1;
		if(list.size()!=0){
			count = billservice.queryCount(startdate, enddate, typenum);
		}
		PageBean<Bill> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("typenum", typenum);
		List<Agreement> alist = service.queryAll();
		model.addAttribute("alist", alist);
		return "Reports/AgreementCredit/index_3";
	}
	//协议单位界面，传递id
	@RequestMapping("/payId")
	public String payId(int a_id,Model model){
		model.addAttribute("a_id", a_id);
		return "Agreement/CloseAccount/closeaccount";
	}
	//协议单位界面，挂账结算查询
	@RequestMapping("/payCredit")
	public String payCredit(int a_id,Model model){
		List<Bill> blist = new ArrayList<>();
		Agreement a = service.queryById(a_id);
		model.addAttribute("a", a);
		//此方法只查询协议单位
		List<Bill> list = billservice.queryAllAgree();
		for(Bill b:list){
			if(String.valueOf(a.getA_id()).equals(b.getB_typenum())&&"挂账".equals(b.getB_paytype())){
				blist.add(b);
			}
		}
		model.addAttribute("blist", blist);
		model.addAttribute("state", -1);
		return "Agreement/CloseAccount/index_1";
	}
	//协议单位界面，挂账结算查询
	@RequestMapping("/payCreditDetail")
	public String payCreditDetail(String starttime,String endtime,int state,int a_id,Model model) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = null,end = null;
		if(starttime!=null&&!"".equals(starttime)){
			start = sdf.parse(starttime);
		}
		if(endtime!=null&&!"".equals(endtime)){
			end = sdf.parse(endtime);
		}
		List<Bill> blist = new ArrayList<>();
		Agreement a = service.queryById(a_id);
		model.addAttribute("a", a);
		//此方法只查询协议单位
		List<Bill> list = billservice.queryDetail(start, end, state);
		for(Bill b:list){
			if(String.valueOf(a_id).equals(b.getB_typenum())&&"挂账".equals(b.getB_paytype())){
				blist.add(b);
			}
		}
		model.addAttribute("blist", blist);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("state", state);
		return "Agreement/CloseAccount/index_1";
	}
	//挂账结算
	@RequestMapping("/payBill")
	public String payBill(int b_id,int a_id){
		Bill b =billservice.queryById(b_id);
		b.setB_state(1);
		billservice.update(b);
		//入账
		InAccount ia = new InAccount();
		ia.setIa_intime(new Date());
		ia.setIa_keyway(b.getB_keyway());
		ia.setIa_money(b.getB_allmoney());
		ia.setIa_name(b.getU().getU_name());
		ia.setIa_paytype(b.getB_paytype());
		ia.setIa_source(b.getB_source());
		ia.setR(b.getR());
		inaccountservice.add(ia);
		//辅助明细表
		MoneyDetail md = new MoneyDetail();
		md.setMd_money(b.getB_allmoney());
		md.setMd_name(b.getU().getU_name());
		md.setMd_paytype(b.getB_paytype());
		md.setMd_reward(b.getB_remark());
		md.setMd_roomnum(b.getR().getR_roomnum());
		md.setMd_starttime(new Date());
		md.setMd_type("挂账");
		return "redirect:payId?a_id="+a_id;
	}
}
