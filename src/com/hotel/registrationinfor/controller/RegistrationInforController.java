package com.hotel.registrationinfor.controller;

import java.io.UnsupportedEncodingException;
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
import com.hotel.bill.dao.vo.Bill;
import com.hotel.bill.service.BillService;
import com.hotel.changerecord.dao.vo.ChangeRecord;
import com.hotel.changerecord.service.ChangeRecordService;
import com.hotel.continuelive.dao.vo.ContinueLive;
import com.hotel.continuelive.service.ContinueLiveService;
import com.hotel.customer.dao.vo.Customer;
import com.hotel.customer.service.CustomerService;
import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.service.InAccountService;
import com.hotel.member.dao.vo.Member;
import com.hotel.member.service.MemberService;
import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.moneydetail.dao.vo.MoneyDetail;
import com.hotel.moneydetail.service.MoneyDetailService;
import com.hotel.registrationcard.dao.vo.RegistrationCard;
import com.hotel.registrationcard.service.RegistrationCardService;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;
import com.hotel.registrationinfor.service.RegistrationInforService;
import com.hotel.reservenum.dao.vo.ReserveNum;
import com.hotel.reserveroom.dao.vo.ReserveRoom;
import com.hotel.reserveroom.service.ReserveRoomService;
import com.hotel.room.dao.vo.Room;
import com.hotel.room.service.RoomService;
import com.hotel.roomtype.dao.vo.RoomType;
import com.hotel.roomtype.service.RoomTypeService;
import com.hotel.teamcard.dao.vo.TeamCard;
import com.hotel.teamcard.service.TeamCardService;
import com.hotel.teaminfor.dao.vo.TeamInfor;
import com.hotel.teaminfor.service.TeamInforService;
import com.hotel.user.dao.vo.User;
import com.hotel.user.service.UserService;
import com.hotel.util.Contacts;
import com.hotel.util.DateChange;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/RegistrationInforController")
public class RegistrationInforController {
	@Autowired
	private RegistrationInforService service;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private RegistrationCardService registrationcardservice;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private ReserveRoomService rrservice;
	@Autowired
	private AgreementService agreementservice;
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private TeamCardService teamcardservice;
	@Autowired
	private TeamInforService teaminforservice;
	@Autowired
	private BillService billservice;
	@Autowired
	private RoomTypeService roomtypeservice;
	@Autowired
	private ChangeRecordService changerecordservice;
	@Autowired
	private ContinueLiveService continueliveservice;
	@Autowired
	private MoneyDetailService moneydetailservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private InAccountService inaccountservice;
	//添加用户时使用
	private List<Customer> customerlist=new ArrayList<>();
	//修改客人信息时使用（用于添加删除客人信息）
	private List<Customer> customerupdatelist=new ArrayList<>();
	
	@RequestMapping("/addcustomer")
	@ResponseBody
	public Customer addcustomer(Customer c,Model model){
		customerlist.add(c);
		model.addAttribute("customerlist", customerlist);
		return c;
	}
	@RequestMapping("/deletecustomer")
	@ResponseBody
	public void deletecustomer(Customer c){
		if(c.getC_id()==0){
			for(int i=0;i<customerlist.size();i++){
				if(customerlist.get(i).getC_idcard().equals(c.getC_idcard())){
					customerlist.remove(i);
				}
			}
		}else{
			c = customerservice.queryById(c.getC_id());
			customerupdatelist.add(c);
		}
	}
	@RequestMapping("/deleteallcustomer")  //在开房的时候将customerlist置空
	public String deleteallcustomer(int r_id){
		customerlist.clear();
		return "redirect:../RoomController/queryByOpen?r_id="+r_id;
	}
	@RequestMapping("/deleteallcustomer1")  //点击关闭的时候将customerlist置空
	@ResponseBody
	public void deleteallcustomer1(){
		customerlist.clear();
	}
	@RequestMapping("/deleteallcustomer2")  //在预定界面，转入住的时候将customerlist置空
	public String deleteallcustomer2(int rr_id){
		customerlist.clear();
		return "redirect:../ReserveRoomController/queryRR?rr_id="+rr_id;
	}
	
	//入住开房函数
	public void addroom(RegistrationInfor ri){
		//当根据会员开房时，会自动填写客户信息
		if(ri.getC().getC_id()==0){
			customerservice.add(ri.getC());
		}
		ri.setRi_state(1);
		//区分团队
		ri.setTi_id(0);
		service.add(ri);
		//添加随客信息
		for(Customer c:customerlist){
			customerservice.add(c);
			RegistrationCard rc = new RegistrationCard();
			rc.setC(c);
			rc.setRi(ri);
			registrationcardservice.add(rc);
		}
		//修改房间信息
		Room r = roomservice.queryByID(ri.getR().getR_id());
		r.setR_state(1);
		roomservice.update(r);
		//将随客信息置空
		customerlist.clear();
		
		//向收银明细辅助表插入信息
		MoneyDetail md = new MoneyDetail();
		md.setMd_money(ri.getRi_depositfee());
		User u = userservice.queryById(ri.getU().getU_id());
		md.setMd_name(u.getU_name());
		md.setMd_paytype(ri.getRi_paytype());
		md.setMd_reward(ri.getRi_reward());
		md.setMd_roomnum(r.getR_roomnum());
		md.setMd_starttime(ri.getRi_opentime());
		md.setMd_type("押金");
		moneydetailservice.add(md);
	}
	
	@RequestMapping("/add")    //入住开房
	public String add(RegistrationInfor ri){
		ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
		addroom(ri);
		return "RoomRack/roomrack";
	}
	@RequestMapping("/add1")    //预订转入住(预订界面)
	public String add1(RegistrationInfor ri,int rr_id){
		ReserveRoom rr = rrservice.queryById(rr_id);
		if(rr.getRnlist().size()<=1){
			rr.setRr_state(2);
			rrservice.update(rr);
			ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
			addroom(ri);
		}else{
			rr.setRr_state(3);//部分入住
			rrservice.update(rr);
			ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
			addroom(ri);
		}
		return "Reserve/reserve";
	}
	
	@RequestMapping("/querybyreserve")    //预订转入住前查询（房态图界面）
	public String query(int r_id,int rr_id,Model model){
		//清除随客信息
		customerlist.clear();
		
		ReserveRoom rr = rrservice.queryById(rr_id);
		Room room = roomservice.queryByID(r_id);
		if("会员".equals(rr.getRr_source())){
			Member m = memberservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("m", m);
		}else if("协议单位".equals(rr.getRr_source())){
			Agreement a = agreementservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("a", a);
		}
		model.addAttribute("rr", rr);
		model.addAttribute("room", room);
		model.addAttribute("nowdate", new Date());
		return "RoomRack/openbyreserve";
	}
	@RequestMapping("/add2")    //预订转入住（房态图界面）
	public String add2(RegistrationInfor ri,int rr_id){
		ReserveRoom rr = rrservice.queryById(rr_id);
		if(rr.getRnlist().size()<=1){
			rr.setRr_state(2);
			rrservice.update(rr);
			ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
			addroom(ri);
		}else{
			ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
			addroom(ri);
		}
		return "RoomRack/roomrack";
	}

//*****************************结账*******************************************************************
	@RequestMapping("/queryClose")    //结账前查询
	public String queryClose(int r_id,int ri_id,Model model){
		RegistrationInfor ri = service.queryById(ri_id);
		Room room = roomservice.queryByID(r_id);
		//实际住房天数
		long intervalMilli = new Date().getTime() - ri.getRi_opentime().getTime();
		int days = (int) (intervalMilli / (24 * 60 * 60 * 1000));
		//折扣率
		int debt = 100;
		//客人类型(0客人自入，1会员，2协议单位)
		String source = ri.getRi_source();
		//开房方式
		String keyway = ri.getRi_keyway();
		//会员卡号/协议
		String typenum = ri.getRi_typenum();
		if("会员".equals(source)){
			debt = memberservice.queryById(Integer.parseInt(ri.getRi_typenum())).getMt().getMt_discountrate();
		}else if("协议单位".equals(source)){
			debt = agreementservice.queryById(Integer.parseInt(ri.getRi_typenum())).getA_discountrate();
		}
		//根据折扣确定价格
		room.getRt().setRt_price(room.getRt().getRt_price()*debt/100);
		model.addAttribute("source", source);
		model.addAttribute("keyway", keyway);
		model.addAttribute("typenum", typenum);
		model.addAttribute("room", room);
		model.addAttribute("customer", ri.getC());
		model.addAttribute("date", ri.getRi_opentime());
		model.addAttribute("ri", ri);
		//实际天数
		model.addAttribute("days", days);
		//预订天数
		int reservedays = ri.getRi_days();
		if("月租房".equals(ri.getRi_keyway())){
			reservedays = 30*ri.getRi_days();
		}
		//预订天数
		model.addAttribute("reservedays", reservedays);
		//全部金额
		model.addAttribute("allmoney", room.getRt().getRt_price()*days);
		//已收金额
		model.addAttribute("receivedmoney", ri.getRi_allmoney());
		//应收金额
		model.addAttribute("paymoney", room.getRt().getRt_price()*days-ri.getRi_allmoney());
		//押金
		model.addAttribute("depositfee", ri.getRi_depositfee());
		//入住单（区别团队）
		model.addAttribute("selecttype", 0);
		model.addAttribute("selectid", ri.getRi_id());
		//确定好入账时间集合
		List<Date> datelist = new ArrayList<>();
		List<Date> datelist1 = new ArrayList<>();
		if(days<=reservedays){
			for(int i=0;i<days;i++){
				datelist.add(DateChange.addDate(ri.getRi_opentime(), i));
			}
		}else{
			for(int i=0;i<days;i++){
				if(i<reservedays){
					datelist.add(DateChange.addDate(ri.getRi_opentime(), i));
				}else{
					datelist1.add(DateChange.addDate(ri.getRi_opentime(), i));
				}
			}
		}
		model.addAttribute("datelist", datelist);
		model.addAttribute("datelist1", datelist1);
		return "RoomRack/closeaccount";
	}
	
	//结账
	@RequestMapping("/closeAccount")
	public String closeAccount(Bill b,int selecttype,int selectid){
		b.setB_endtime(new Date());
		//更新房间状态为打扫状态
		Room r = roomservice.queryByID(b.getR().getR_id());
		r.setR_state(-1);
		roomservice.update(r);
		//更新0入住信息状态（或者1团队入住单状态）
		if(selecttype==0){
			service.updatestate(0, selectid);
		}
		//修改离店时间
		RegistrationInfor ri = service.queryById(selectid);
		ri.setRi_days(DateChange.differentDaysByMillisecond(ri.getRi_endtime(), new Date()));
		ri.setRi_endtime(new Date());
		service.update(ri);
		
		int days = DateChange.differentDaysByMillisecond(b.getB_starttime(), b.getB_endtime());
		b.setB_days(days==0?1:days);
		b.setB_state(0);
		billservice.add(b);
		
		//向收银明细辅助表插入信息
		MoneyDetail md = new MoneyDetail();
		md.setMd_money(b.getB_paymoney());
		User u = userservice.queryById(b.getU().getU_id());
		md.setMd_name(u.getU_name());
		md.setMd_paytype(b.getB_paytype());
		md.setMd_reward(b.getB_remark());
		md.setMd_roomnum(r.getR_roomnum());
		md.setMd_starttime(b.getB_starttime());
		md.setMd_type("结账");
		moneydetailservice.add(md);
		//系统入账,如果是协议挂账则不能入账系统
		if(!"挂账".equals(ri.getRi_paytype())){
			inAccount(b);
		}
		return "RoomRack/roomrack";
	}
	//入账函数
	private void inAccount(Bill b){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date intime = null;
		try {
			intime = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//开始入账
		InAccount ia = new InAccount();
		ia.setIa_intime(intime);
		ia.setIa_money(b.getB_allmoney()/b.getB_days());
		User u = userservice.queryById(b.getU().getU_id());
		ia.setIa_name(u.getU_name());
		ia.setIa_paytype(b.getB_paytype());
		ia.setIa_source(b.getB_source());
		ia.setIa_keyway(b.getB_keyway());	//开放方式（天房，月租房等等）
		ia.setR(b.getR());
		//判断是否重复添加(由于没有查询到的时候，返回的是空，不能用int去接受)
		InAccount inaccount = inaccountservice.queryByRoomAndDate(ia);
		if(inaccount==null){
			inaccountservice.add(ia);
		}
	}
	
//******************换房************************************************************
	//换房前查询(个人，区分团队开房)
	@RequestMapping("/queryChangeRoom")
	public String queryChangeRoom(int id,int ri_id,Model model){
		Room room = roomservice.queryByID(id);
		List<RoomType> rtlist = roomtypeservice.queryAll();
		RegistrationInfor ri = service.queryById(ri_id);
		//客人信息
		Customer customer = ri.getC();
		//入住时间
		Date opentime = ri.getRi_opentime();
		//来源
		String source = ri.getRi_source();
		//开房方式
		String keyway = ri.getRi_keyway();
		//实际预住天数（剩余天数）
		int days = ri.getRi_days();
		if("月租房".equals(ri.getRi_keyway())){
			days = 30*days;
		}
		days = days - (int)((new Date().getTime() - ri.getRi_opentime().getTime())/86400000);
		//会员卡号或者 协议单位
		String typenum = ri.getRi_typenum();
		int dept=100;
		if(typenum!=null&&!"".equals(typenum)){
			dept = memberservice.queryById(Integer.parseInt(typenum)).getMt().getMt_discountrate();
		}
		
		model.addAttribute("room", room);
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("customer", customer);
		model.addAttribute("opentime", opentime);
		model.addAttribute("source", source);
		model.addAttribute("keyway", keyway);
		model.addAttribute("days", days);
		model.addAttribute("dept", dept);
		model.addAttribute("typenum", typenum);
		//入住单（区别个人）
		model.addAttribute("selecttype", 0);
		model.addAttribute("selectid", ri.getRi_id());
		return "RoomRack/changeroom";
	}
	

	//换房操作
	@RequestMapping("/changeRoom")
	public String changeRoom(ChangeRecord cr,int selecttype,int selectid){
		Room r = roomservice.queryByID(cr.getOld_r_id());
		Room newroom = roomservice.queryByID(cr.getNew_r_id());
		r.setR_state(-1);
		newroom.setR_state(1);
		roomservice.update(r);
		roomservice.update(newroom);
		//更新0入住信息状态（或者1团队入住单状态）
		if(selecttype==0){
			//将以前房间结账
			service.updatestate(0, selectid);
			//将新房间插入
			RegistrationInfor ri = service.queryById(selectid);
			Room room = new Room();
			room.setR_id(cr.getNew_r_id());
			ri.setR(room);
			ri.setRi_opentime(new Date());
			ri.setRi_days(cr.getCr_days());
			ri.setRi_allmoney(cr.getCr_money());
			ri.setU(cr.getU());
			//由于月租房被计算为天数（则换为天房）
			ri.setRi_keyway("天房");
			ri.setRi_state(1);
			service.add(ri);
		}
		cr.setCr_nowtime(new Date());
		changerecordservice.add(cr);
		return "RoomRack/roomrack";
	}
	

//******************续住************************************************************
	//续住前查询(个人)
	@RequestMapping("/queryContinueLive")
	public String queryContinueLive(int id,int ri_id,Model model){
		Room room = roomservice.queryByID(id);
		RegistrationInfor ri = service.queryById(ri_id);
		//客人信息
		Customer customer = ri.getC();
		//入住时间
		Date opentime = ri.getRi_opentime();
		//来源
		String source = ri.getRi_source();
		//开房方式
		String keyway = ri.getRi_keyway();
		//押金
		int depositfee = ri.getRi_depositfee();
		//原定离期
		Date date = DateChange.addDate(opentime, ri.getRi_days());
		//实际预住天数（剩余天数）
		int days = ri.getRi_days();
		if("月租房".equals(ri.getRi_keyway())){
			days = 30*days;
		}
		days = days - (int)((new Date().getTime() - ri.getRi_opentime().getTime())/86400000);
		//会员卡号或者 协议单位
		String typenum = ri.getRi_typenum();
		int dept=100;
		if(typenum!=null&&!"".equals(typenum)){
			dept = memberservice.queryById(Integer.parseInt(typenum)).getMt().getMt_discountrate();
		}
		model.addAttribute("ri", ri);
		model.addAttribute("room", room);
		model.addAttribute("customer", customer);
		model.addAttribute("opentime", opentime);
		model.addAttribute("source", source);
		model.addAttribute("keyway", keyway);
		model.addAttribute("depositfee", depositfee);
		model.addAttribute("date", date);
		model.addAttribute("days", days);
		model.addAttribute("dept", dept);
		model.addAttribute("typenum", typenum);
		//入住单（区别个人）
		model.addAttribute("selecttype", 0);
		model.addAttribute("selectid", ri.getRi_id());
		//查询是否有预订该房间的信息
		ReserveRoom rr =new ReserveRoom();
		List<ReserveRoom> rrlist = rrservice.queryAll();
		for(ReserveRoom reserve:rrlist){
			for(ReserveNum rn:reserve.getRnlist()){
				if(rn.getR().getR_id()==id&&(reserve.getRr_state()==1||reserve.getRr_state()==3)){
					rr = reserve;
				}
			}
		}
		model.addAttribute("rr", rr);
		return "RoomRack/continuelive";
	}

	//续住
	@RequestMapping("/continueLive")
	public String continueLive(ContinueLive cl,int selecttype, int selectid){
		if(selecttype==0){
			RegistrationInfor ri = service.queryById(selectid);
			ri.setRi_days(ri.getRi_days()+cl.getCl_days());
			ri.setRi_allmoney(ri.getRi_allmoney()+cl.getCl_money());
			ri.setRi_endtime(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()));
			service.update(ri);
		}
		cl.setCl_nowtime(new Date());
		continueliveservice.add(cl);
		return "RoomRack/roomrack";
	}
//**********修改客人信息*****************************************************************************
	@RequestMapping("queryUpateCustomer")	//	修改客人信息前查询
	public String queryUpateCustomer(int r_id,int ri_id ,int ti_id ,Model model){
		//将删除客人信息清除
		customerlist.clear();
		customerupdatelist.clear();
		
		Customer customer = new Customer();
		List<Customer> list = new ArrayList<>();
		int selecttype = -1;
		int selectid = -1;
		String keyway = null;
		Date opentime = null;
		int days = 0;
		int money = 0;
		if(ri_id>0){
			RegistrationInfor ri = service.queryById(ri_id);
			customer = ri.getC();
			List<RegistrationCard> rclist = registrationcardservice.queryByRi_id(ri_id);
			for(RegistrationCard rc:rclist){
				list.add(rc.getC());
			}
			selecttype = 0;
			selectid = ri_id;
			keyway = ri.getRi_keyway();
			opentime = ri.getRi_opentime();
			days = ri.getRi_days();
			money = ri.getRi_allmoney();
		}
		model.addAttribute("customer", customer);
		model.addAttribute("list", list);
		model.addAttribute("selecttype", selecttype);
		model.addAttribute("selectid", selectid);
		model.addAttribute("r_id", r_id);
		model.addAttribute("keyway", keyway);
		model.addAttribute("opentime", opentime);
		model.addAttribute("days", days);
		model.addAttribute("money", money);
		return "RoomRack/updatecustomer";
	}
	//修改客人信息
	@RequestMapping("/updateCustomer")	//其中ri只是用来接收Customer，其他不做任何用处
	public String updateCustomer(RegistrationInfor registrationinfor,int r_id, int selecttype, int selectid,String keyway, Date opentime, int days, int money){
		//修改住客信息
		Customer customer = registrationinfor.getC();
		customerservice.update(customer);
		if(selecttype==0){   //个人
			RegistrationInfor ri = service.queryById(selectid);
			List<RegistrationCard> rclist = registrationcardservice.queryByRi_id(selectid);
			for(Customer c:customerupdatelist){
				for(RegistrationCard rc:rclist){
					if(rc.getC().getC_id()==c.getC_id()){
						registrationcardservice.delete(rc.getRc_id());
					}
				}
			}
			for(Customer c1:customerlist){
				customerservice.add(c1);
				RegistrationCard r = new RegistrationCard();
				r.setC(c1);
				r.setRi(ri);
				registrationcardservice.add(r);
			}
		}
		
		return "RoomRack/roomrack";
	}
	
//**************撤销入住************************************************************************
	@RequestMapping("/checkIn")
	public String CheckIn(int id,int ri_id,int ti_id){
		//修改房间状态
		Room r = roomservice.queryByID(id);
		r.setR_state(-1);
		roomservice.update(r);
		//判断是个人，还是团体
		if(ri_id>0){
			RegistrationInfor ri = service.queryById(ri_id);
			ri.setRi_endtime(new Date());
			ri.setRi_state(-1);
			service.update(ri);
		}
		return "RoomRack/roomrack";
	}

	//修改房态
	@RequestMapping("/changeState")
	public String changeState(int id,int state){
		Room r = roomservice.queryByID(id);
		r.setR_state(state);
		//可能存在预订和订房是同一间，但是时间范围不同的情况，需要再次进行恢复。
		if(state==0){
			//查看是否有预订的信息
			List<ReserveRoom> rrlist = rrservice.queryAll();
			for(ReserveRoom rr:rrlist){
				for(ReserveNum rc:rr.getRnlist()){
					if(rc.getR().getR_id()==id&&rr.getRr_state()!=2&&rr.getRr_state()!=4){
						r.setR_state(2);
						roomservice.update(r);
						return "RoomRack/roomrack";
					}
				}
			}
			
		}
		roomservice.update(r);
		return "RoomRack/roomrack";
	}
//***************补交房租*****************************************
	@RequestMapping("/queryPayRent") //查询
	public String payRent(int ri_id,Model model){
		RegistrationInfor ri = service.queryById(ri_id);
		//实际住房天数
		long intervalMilli = new Date().getTime() - ri.getRi_opentime().getTime();
		int days = (int) (intervalMilli / (24 * 60 * 60 * 1000));
		//折扣率
		int debt = 100;
		//会员卡号/协议
		String typenum = ri.getRi_typenum();
		if("会员".equals(ri.getRi_source())){
			debt = memberservice.queryById(Integer.parseInt(ri.getRi_typenum())).getMt().getMt_discountrate();
		}else if("协议单位".equals(ri.getRi_source())){
			debt = agreementservice.queryById(Integer.parseInt(ri.getRi_typenum())).getA_discountrate();
		}
		//根据折扣确定价格
		ri.getR().getRt().setRt_price(ri.getR().getRt().getRt_price()*debt/100);
		//预订天数
		int reservedays = ri.getRi_days();
		if("月租房".equals(ri.getRi_keyway())){
			reservedays = 30*ri.getRi_days();
		}
		//应收金额
		model.addAttribute("paymoney", ri.getR().getRt().getRt_price()*days-ri.getRi_allmoney());
		//确定好入账时间集合
		List<Date> datelist1 = new ArrayList<>();
		for(int i=0;i<days;i++){
			if(i>=reservedays){
				datelist1.add(DateChange.addDate(ri.getRi_opentime(), i));
			}
		}
		model.addAttribute("datelist1", datelist1);
		model.addAttribute("ri", ri);
		return "RoomRack/payrent";
	}
	//补交房租
	@RequestMapping("/payRent")
	public String payRent(int ri_id,int money,String remark,String paytype,int u_id){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date date = null,time = null;
		try {
			date = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//修改入住信息
		RegistrationInfor ri = service.queryById(ri_id);
		int days = DateChange.differentDaysByMillisecond(ri.getRi_opentime(),date);
		time = ri.getRi_endtime();
		ri.setRi_endtime(date);
		ri.setRi_allmoney(ri.getRi_allmoney()/ri.getRi_days()*days);
		ri.setRi_days(days);
		service.update(ri);
		//系统入账,如果是协议挂账则不入系统
		int realdays = DateChange.differentDaysByMillisecond(time,date);
		if(!"挂账".equals(ri.getRi_paytype())){
			for(int i=0;i<realdays;i++){
				Date intime = DateChange.addDate(time, i);
				InAccount ia = new InAccount();
				ia.setIa_intime(intime);
				ia.setIa_money(ri.getRi_allmoney()/ri.getRi_days());
				User u = userservice.queryById(u_id);
				ia.setIa_name(u.getU_name());
				ia.setIa_paytype(paytype);
				ia.setIa_source(ri.getRi_source());
				ia.setIa_keyway(ri.getRi_keyway());	//开放方式（天房，月租房等等）
				ia.setR(ri.getR());
				//判断是否重复添加(由于没有查询到的时候，返回的是空，不能用int去接受)
				InAccount inaccount = inaccountservice.queryByRoomAndDate(ia);
				if(inaccount==null){
					inaccountservice.add(ia);
				}
			}
			//收银明细表
			MoneyDetail md = new MoneyDetail();
			md.setMd_money(money);
			User user = userservice.queryById(u_id);
			md.setMd_name(user.getU_name());
			md.setMd_paytype(paytype);
			md.setMd_reward(remark);
			md.setMd_roomnum(ri.getR().getR_roomnum());
			md.setMd_starttime(date);
			md.setMd_type("补交房租");
			moneydetailservice.add(md);
		}
		return "RoomRack/roomrack";
	}
//***********************客人信息************************************************************//
	@RequestMapping("/queryAllByPage")   //客人信息界面查询
	public String queryAllByPage(Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<RegistrationInfor> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		//给rilist中的rclist赋值
		for(int i=0;i<list.size();i++){
			list.get(i).setRclist(registrationcardservice.queryByRi_id(list.get(i).getRi_id()));
			if(list.get(i).getRi_state()==1){
				list.get(i).setSpare(DateChange.differentDaysByMillisecond(list.get(i).getRi_opentime(), new Date()));
				if(list.get(i).getRi_days()!=0){
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/list.get(i).getRi_days()*list.get(i).getSpare());
				}else{
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/1*list.get(i).getSpare());
				}
				list.get(i).setSpare3(list.get(i).getRi_allmoney()-list.get(i).getSpare2());
			}else{
				list.get(i).setSpare(DateChange.differentDaysByMillisecond(list.get(i).getRi_opentime(), list.get(i).getRi_endtime()));
				if(list.get(i).getRi_days()!=0){
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/list.get(i).getRi_days()*list.get(i).getSpare());
				}else{
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/1*list.get(i).getSpare());
				}
				list.get(i).setSpare3(list.get(i).getRi_allmoney()-list.get(i).getSpare2());
			}
		}
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<RegistrationInfor> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		//团队信息
		model.addAttribute("tilist", teaminforservice.queryAll());
		model.addAttribute("rtlist", roomtypeservice.queryAll());
		model.addAttribute("state", -1);
		model.addAttribute("source", -1);
		return "Customer/index_1";
	}
	//客人界面条件查询
	@RequestMapping("/queryAllDetail")   //客人信息界面查询
	public String queryAllDetail(int state,int source,Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<RegistrationInfor> list = service.queryAllDetail(state,source,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		//给rilist中的rclist赋值
		for(int i=0;i<list.size();i++){
			list.get(i).setRclist(registrationcardservice.queryByRi_id(list.get(i).getRi_id()));
			if(list.get(i).getRi_state()==1){
				list.get(i).setSpare(DateChange.differentDaysByMillisecond(list.get(i).getRi_opentime(), new Date()));
				if(list.get(i).getRi_days()!=0){
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/list.get(i).getRi_days()*list.get(i).getSpare());
				}else{
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/1*list.get(i).getSpare());
				}
				list.get(i).setSpare3(list.get(i).getRi_allmoney()-list.get(i).getSpare2());
			}else{
				list.get(i).setSpare(DateChange.differentDaysByMillisecond(list.get(i).getRi_opentime(), list.get(i).getRi_endtime()));
				if(list.get(i).getRi_days()!=0){
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/list.get(i).getRi_days()*list.get(i).getSpare());
				}else{
					list.get(i).setSpare2(list.get(i).getRi_allmoney()/1*list.get(i).getSpare());
				}
				list.get(i).setSpare3(list.get(i).getRi_allmoney()-list.get(i).getSpare2());
			}
		}
		String url = "queryAllDetail";
		int count = 1;
		if(list.size()!=0){
			count = service.countDetail(state, source);
		}
		PageBean<RegistrationInfor> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		//团队信息
		model.addAttribute("tilist", teaminforservice.queryAll());
		model.addAttribute("rtlist", roomtypeservice.queryAll());
		model.addAttribute("state", state);
		model.addAttribute("source", source);
		return "Customer/index_1";
	}
	
	
	@RequestMapping("/queryRI")    //补打入住单
	public String queryRI(int ri_id,Model model){
		RegistrationInfor ri = service.queryById(ri_id);
		ri.setRclist(registrationcardservice.queryByRi_id(ri.getRi_id()));
		model.addAttribute("ri", ri);
		model.addAttribute("nowdate", new Date());
		return "Customer/customerprintcard";
	}
	@RequestMapping("/queryRI1")    //入住单详细信息
	public String queryRI1(int ri_id,int spare2,Model model){
		RegistrationInfor ri = service.queryById(ri_id);
		ri.setSpare2(spare2);
		ri.setRclist(registrationcardservice.queryByRi_id(ri.getRi_id()));
		model.addAttribute("ri", ri);
		return "Customer/detail";
	}
/*******报表****************************************************************************/
//	//根据到店和离店时间确定房间收入
//	public List<RegistrationInfor> queryDetail(List<RegistrationInfor> rilist,Date starttime,Date leavetime){
//		List<RegistrationInfor> list = new ArrayList<>();
//		for(RegistrationInfor ri:rilist){
//			if(ri.getRi_opentime().compareTo(starttime)>=0&&ri.getRi_opentime().compareTo(leavetime)<=0){
//				list.add(ri);
//			}else if(DateChange.addDate(ri.getRi_opentime(),ri.getRi_days()).compareTo(starttime)>=0){
//				list.add(ri);
//			}
//		}
//		return list;
//	}
//
//	//营业明细查询
//	@RequestMapping("/queryBusinessDetail")   
//	public String queryBusinessDetail(Model model,HttpServletRequest req){
//		String pageNo = req.getParameter("pageNo");
//		if(pageNo==null){
//			pageNo = "1";
//		}
//		List<RegistrationInfor> list = service.queryAllByReason(new Date(),new Date(),0,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Integer.parseInt(pageNo)*Contacts.PAGE_SIZE);
//		for(int i=0;i<list.size();i++){
//			list.get(i).setDatelist(queryDateList(new Date(),new Date(),list.get(i)));
//		}
//		String url = "queryBusinessDetail";
//		int count = 1;
//		if(list.size()!=0){
//			count = service.countByReason(new Date(), new Date(), 0);
//		}
//		PageBean<RegistrationInfor> pb = new PageBean<>();
//		pb.setCount(count);
//		pb.setList(list);
//		pb.setPageNo(Integer.parseInt(pageNo));
//		pb.setUrl(url);
//		pb.setPageSize(Contacts.PAGE_SIZE);
//		model.addAttribute("pb", pb);
//		model.addAttribute("starttime", new Date());
//		model.addAttribute("endtime", new Date());
//		return "Reports/BusinessDetail/index_3";
//	}
//	//点击查询时获取数据(更具条件去获取数据)
//	@RequestMapping("/queryDetail")
//	public String queryDetail(String startdate,String enddate,String roomnum,Model model,HttpServletRequest req) throws NumberFormatException, ParseException{
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date starttime = null;
//		Date endtime = null;
//		String pageNo = req.getParameter("pageNo");
//		if(pageNo==null){
//			pageNo = "1";
//		}
//		if(startdate!=null&&!"".equals(startdate)){
//			starttime = sdf.parse(startdate);
//		}
//		if(enddate!=null&&!"".equals(enddate)){
//			endtime = sdf.parse(enddate);
//		}
//		if(roomnum==null||"".equals(roomnum)){
//			roomnum = "0";
//		}
//		List<RegistrationInfor> list = service.queryAllByReason(starttime,endtime,Integer.parseInt(roomnum),(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Integer.parseInt(pageNo)*Contacts.PAGE_SIZE);
//		for(int i=0;i<list.size();i++){
//			list.get(i).setDatelist(queryDateList(starttime,endtime,list.get(i)));
//		}
//		String url = "queryDetail";
//		int count = 1;
//		if(list.size()!=0){
//			count = service.countByReason(starttime, endtime, Integer.parseInt(roomnum));
//		}
//		PageBean<RegistrationInfor> pb = new PageBean<>();
//		pb.setCount(count);
//		pb.setList(list);
//		pb.setPageNo(Integer.parseInt(pageNo));
//		pb.setUrl(url);
//		pb.setPageSize(Contacts.PAGE_SIZE);
//		model.addAttribute("pb", pb);
//		model.addAttribute("starttime", starttime);
//		model.addAttribute("endtime", endtime);
//		model.addAttribute("roomnum", roomnum);
//		return "Reports/BusinessDetail/index_3";
//	}
//	//确定循环日期
//	public List<Date> queryDateList(Date starttime,Date endtime,RegistrationInfor ri){
//		List<Date> datelist = new ArrayList<>();
//		if(starttime!=null&&endtime!=null){
//			if(starttime.compareTo(ri.getRi_opentime())>0){
//				if(endtime.compareTo(ri.getRi_endtime())>0){
//					datelist = DateChange.dateList(starttime, DateChange.differentDaysByMillisecond(starttime, ri.getRi_endtime()));
//				}else{
//					datelist = DateChange.dateList(starttime, DateChange.differentDaysByMillisecond(starttime, endtime));
//				}
//			}else{
//				if(endtime.compareTo(ri.getRi_endtime())>0){
//					datelist = DateChange.dateList(ri.getRi_opentime(), DateChange.differentDaysByMillisecond(ri.getRi_opentime(), ri.getRi_endtime()));
//				}else{
//					datelist = DateChange.dateList(ri.getRi_opentime(), DateChange.differentDaysByMillisecond(ri.getRi_opentime(), endtime));
//				}
//			}
//		}
//		if(starttime!=null&&endtime==null){
//			if(starttime.compareTo(ri.getRi_opentime())>0){
//				if(ri.getRi_endtime().compareTo(starttime)>=0){
//					datelist = DateChange.dateList(starttime, DateChange.differentDaysByMillisecond(starttime, ri.getRi_endtime()));
//				}
//			}else{
//				datelist = DateChange.dateList(ri.getRi_opentime(), DateChange.differentDaysByMillisecond(ri.getRi_opentime(), ri.getRi_endtime()));
//			}
//		}
//		if(starttime==null&&endtime!=null){
//			if(endtime.compareTo(ri.getRi_endtime())>0){
//				datelist = DateChange.dateList(ri.getRi_opentime(), DateChange.differentDaysByMillisecond(ri.getRi_opentime(), ri.getRi_endtime()));
//			}else{
//				if(ri.getRi_opentime().compareTo(endtime)<=0){
//					datelist = DateChange.dateList(ri.getRi_opentime(), DateChange.differentDaysByMillisecond(ri.getRi_opentime(), endtime));
//				}
//			}
//		}
//		if(starttime==null&&endtime==null){
//			datelist = DateChange.dateList(ri.getRi_opentime(), ri.getRi_days());
//		}
//		return datelist;
//	}
}
