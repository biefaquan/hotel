package com.hotel.teaminfor.controller;

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

import com.hotel.customer.dao.vo.Customer;
import com.hotel.customer.service.CustomerService;
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
import com.hotel.util.DateChange;

@Controller
@RequestMapping("/TeamInforController")
public class TeamInforController {
	@Autowired
	private TeamInforService service;
	@Autowired
	private TeamCardService teamcardservice;
	@Autowired
	private RoomTypeService roomtypeservice;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private RegistrationInforService registrationinforservice;
	@Autowired
	private RegistrationCardService registrationcardservice;
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private ReserveRoomService reserveroomservice;
	private List<Integer> listR_id=new ArrayList<>();
	private List<Customer> customerlist=new ArrayList<>();
	
	//查询所有房型
	@RequestMapping("/queryAllRoomType")   
	public String queryAllRoomType(Model model){
		List<RoomType> rtlist = roomtypeservice.queryAll();
		model.addAttribute("rtlist", rtlist);
		return "RoomRack/openteam/index_1";
	}
	
	//根据房型查询出所有未住的房间
	@RequestMapping("/queryAllByRt_id")
	@ResponseBody
	public List<Room> queryAllByRt_id(int rt_id) throws ParseException{
		return roomservice.queryAllByRt_id(rt_id);
	}
	//添加房间号
	@RequestMapping("/addR_id")
	public void addR_id(Integer r_id){
		listR_id.add(r_id);
	}
	//删除房间号
	@RequestMapping("/deleteR_id")
	public void deleteR_id(Integer r_id){
		for (int i = 0; i < listR_id.size(); i++) {
			if(listR_id.get(i)==r_id){
				listR_id.remove(i);
			}
		}
	}
	//清空房间号
	@RequestMapping("/deleteAllR_id")
	public void deleteAllR_id(){
		listR_id.clear();
	}
	//清空房间号
	@RequestMapping("/deleteAllR_id1")
	public String deleteAllR_id1(){
		listR_id.clear();
		customerlist.clear();
		return "RoomRack/openteam/openteam";
	}
	//添加房间
	@RequestMapping("/queryAllRoom")
	@ResponseBody
	public List<Room> queryAllRoom(){
		List<Room> rlist = new ArrayList<>();
		for(Integer r_id:listR_id){
			rlist.add(roomservice.queryByID(r_id));
		}
		return rlist;
	}
	
	//对客户信息的处理
	@RequestMapping("/addcustomer")
	@ResponseBody
	public Customer addcustomer(Customer c){
		customerlist.add(c);
		return c;
	}
	@RequestMapping("/deletecustomer")
	@ResponseBody
	public void deletecustomer(Customer c){
		for(int i=0;i<customerlist.size();i++){
			if(customerlist.get(i).getC_idcard().equals(c.getC_idcard())){
				customerlist.remove(i);
			}
		}
	}
	@RequestMapping("/deleteallcustomer")  //点击关闭的时候将customerlist置空
	@ResponseBody
	public void deleteallcustomer(){
		customerlist.clear();
	}
	
	//添加团队入住信息
	@RequestMapping("/add")
	public String add(TeamInfor ti,String tc_keyway,String discountrate){
		//主要用来判断是否住在同一件房间的客户
		List<Room> rlist = new ArrayList<>();
		List<RegistrationInfor> rilist = new ArrayList<>();
		ti.setTi_state(1);
		service.add(ti);
		int dept = 100;
		if(!"".equals(discountrate)&&discountrate!=null){
			dept = Integer.parseInt(discountrate);
		}
		for(Customer c:customerlist){
			boolean flag = true;
			customerservice.add(c);
			for(Room r:rlist){
				if(r.getR_id()==c.getR_id()){
					flag = false;
				}
			}
			if(flag){
				RegistrationInfor ri = new RegistrationInfor();
				ri.setC(c);
				Room r = roomservice.queryByID(c.getR_id());
				ri.setR(r);
				ri.setRi_allmoney(r.getRt().getRt_price()*ti.getTi_days()*dept/100);
				ri.setRi_days(ti.getTi_days());
				ri.setRi_depositfee(ti.getTi_depositfee()/ti.getTi_allroom());
				ri.setRi_keyway("天房");
				ri.setRi_opentime(ti.getTi_opentime());
				ri.setRi_paytype(ti.getTi_paytype());
				ri.setRi_source(ti.getTi_source());
				ri.setRi_state(1);
				ri.setRi_typenum(ti.getTi_typenum());
				ri.setTi_id(ti.getTi_id());
				ri.setU(ti.getU());
				ri.setRi_endtime(DateChange.addDate(ti.getTi_opentime(), ti.getTi_days()));
				registrationinforservice.add(ri);
				rilist.add(ri);
				//修改房态
				r.setR_state(1);
				roomservice.update(r);
				rlist.add(r);
			}else{
				RegistrationCard rc = new RegistrationCard();
				RegistrationInfor ri = new RegistrationInfor();
				for(RegistrationInfor ri1:rilist){
					if(ri1.getR().getR_id()==c.getR_id()){
						ri=ri1;
					}
				}
				rc.setC(c);
				rc.setRi(ri);
				registrationcardservice.add(rc);
			}
			
//			TeamCard tc = new TeamCard();
//			tc.setTi(ti);
//			tc.setC(c);
//			
//			tc.setR(r);
//			tc.setTc_keyway(tc_keyway);
//			tc.setTc_opentime(ti.getTi_opentime());
//			tc.setTc_days(ti.getTi_days());
//			tc.setTc_money(r.getRt().getRt_price()*ti.getTi_days()*dept/100);
//			tc.setTc_state(1);
//			teamcardservice.add(tc);
		}
		return "RoomRack/roomrack";
	}
}
