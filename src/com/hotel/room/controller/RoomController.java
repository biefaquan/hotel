package com.hotel.room.controller;

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
import com.hotel.floor.dao.vo.Floor;
import com.hotel.floor.service.FloorService;
import com.hotel.inaccount.dao.vo.SuppleClass;
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
import com.hotel.teaminfor.dao.vo.TeamInfor;
import com.hotel.teaminfor.service.TeamInforService;
import com.hotel.user.dao.vo.User;
import com.hotel.util.DateChange;

@Controller
@RequestMapping("/RoomController")
public class RoomController {
	@Autowired
	private RoomService service;
	@Autowired
	private FloorService floorservice;
	@Autowired
	private RoomTypeService roomtypeservice;
	@Autowired
	private RegistrationInforService registrationinforservice;
	@Autowired
	private TeamInforService teaminforservice;
	@Autowired
	private ReserveRoomService reserveroomservice;
	@Autowired
	private RegistrationCardService registrationcardservice;
	@Autowired
	private RoomService roomservice;
	
	@RequestMapping("/queryByAdd")    //添加的时候显示楼层
	public String queryByAdd(Model model){
		List<RoomType> roomtypelist = roomtypeservice.queryAll();  //房型list
		List<Floor> flist = floorservice.queryAll();     //楼层list
		model.addAttribute("roomtypelist", roomtypelist);
		model.addAttribute("flist", flist);
		return "Set/SetRoom/roomadd";
	}
	
	@RequestMapping("/add")    //添加客房
	public String add(Room r){
		r.setR_state(0);
		//System.out.println("id是"+r.getF().getF_id()+r.getRt().getRt_id());
		service.add(r);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/update")    //修改客房
	public String update(Room r){
		service.update(r);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/queryById")    //根据id查询信息
	public String queryById(Model model,HttpServletRequest req){
		int r_id = Integer.parseInt(req.getParameter("r_id")); 
		Room room = service.queryByID(r_id);
		model.addAttribute("room", room);
		List<RoomType> roomtypelist = roomtypeservice.queryAll();  //房型list
		List<Floor> flist = floorservice.queryAll();     //楼层list
		model.addAttribute("roomtypelist", roomtypelist);
		model.addAttribute("flist", flist);
		return "Set/SetRoom/roomupdate";
	}
	
	@RequestMapping("/queryByOpen")    //根据id查询信息(开房时使用)
	public String queryByOpen(Model model,HttpServletRequest req){
		int r_id = Integer.parseInt(req.getParameter("r_id")); 
		Date nowdate = new Date();
		Room room = service.queryByID(r_id);
		//查看是否有预订的信息
		ReserveRoom rr = new ReserveRoom();
		List<ReserveRoom> rrlist = reserveroomservice.queryAll();
		for(ReserveRoom rr1:rrlist){
			for(ReserveNum rc:rr1.getRnlist()){
				if(rc.getR().getR_id()==r_id&&rr1.getRr_state()!=2){
					rr = rr1;
				}
			}
		}
		model.addAttribute("room", room);
		model.addAttribute("nowdate", nowdate);
		model.addAttribute("rr", rr);
		return "RoomRack/open";
	}
	
	@RequestMapping("/delete")    //删除客房
	public String delete(HttpServletRequest req){
		int r_id = Integer.parseInt(req.getParameter("r_id"));
		service.delete(r_id);
		return "Set/SetRoom/setroom";
	}
	
//	@RequestMapping("/queryByAll")    //查询所有房间(房态表)
//	public String queryAll(Model model,HttpServletRequest req){
// 		String pageNo = req.getParameter("pageNo");
//		if(pageNo==null){
//			pageNo = "0";
//		}
//		List<Room> list = service.queryByAll(Integer.parseInt(pageNo), Contacts.PAGE_SIZE);
//		String url = "queryAll";
//		int count = 1;
//		if(list.size()!=0){
//			count = service.count();
//		}
//		PageBean<Room> pb = new PageBean<>();
//		pb.setCount(count);
//		pb.setList(list);
//		pb.setPageNo(Integer.parseInt(pageNo));
//		pb.setUrl(url);
//		pb.setPageSize(Contacts.PAGE_SIZE);
//		model.addAttribute("pb", pb);
//		return "Node/index";
//	}
	//预订房间逾期处理
	public void updateRR() throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ReserveRoom> rrlist = reserveroomservice.queryAll();
		Date date = sdf.parse(sdf.format(new Date()));
		for(ReserveRoom rr:rrlist){
			if(rr.getRr_startdate().compareTo(date)<0&&(rr.getRr_state()==1||rr.getRr_state()==3)){
				//修改房态
				for(ReserveNum rn:rr.getRnlist()){
					Room r = roomservice.queryByID(rn.getR().getR_id());
					r.setR_state(0);
					roomservice.update(r);
				}
				//修改预订单状态
				rr.setRr_state(4);
				reserveroomservice.update(rr);
			}
		}
	}
	//拖欠房租两天以上，给出提示
	public List<RegistrationInfor> queryBehindRent() throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<RegistrationInfor> list = registrationinforservice.queryAll();
		List<RegistrationInfor> rilist = new ArrayList<>();
		Date date = sdf.parse(sdf.format(new Date()));
		for(RegistrationInfor ri:list){
			if(ri.getRi_endtime().compareTo(date)<=0){
				if(DateChange.differentDaysByMillisecond(ri.getRi_endtime(), date)>=2){
					rilist.add(ri);
				}
			}
		}
		return rilist;
	}
	@RequestMapping("/queryAll")    //查询所有房间（房态图）
	public String queryAll1(Model model) throws ParseException{
		//修改预订单状态
		updateRR();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Room> list = service.queryAll();
		List<Floor> flist = floorservice.queryAll();
		List<RegistrationInfor> rilist = registrationinforservice.queryAll();
		List<TeamInfor> tilist = teaminforservice.queryAll();
		List<ReserveRoom> rrlist = reserveroomservice.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		model.addAttribute("list", list);
		model.addAttribute("flist", flist);
		model.addAttribute("rilist", rilist);
		model.addAttribute("tilist", tilist);
		model.addAttribute("rrlist", rrlist);
		model.addAttribute("rtlist", rtlist);
		//统计房间状态
		SuppleClass sc = new SuppleClass();
		for(Room r:list){
			if(r.getR_state()==0){
				sc.setI1(sc.getI1()+1);
			}else if(r.getR_state()==1){
				sc.setI2(sc.getI2()+1);
			}else if(r.getR_state()==-1){
				sc.setI3(sc.getI3()+1);
			}else if(r.getR_state()==-3){
				sc.setI4(sc.getI4()+1);
			}else if(r.getR_state()==2){
				sc.setI5(sc.getI5()+1);
			}
		}
		if(list.size()!=0){
			sc.setI6(sc.getI1()*100/list.size());
			sc.setI7(sc.getI2()*100/list.size());
			sc.setI8(sc.getI3()*100/list.size());
			sc.setI9(sc.getI4()*100/list.size());
			sc.setI10(sc.getI5()*100/list.size());
		}
		model.addAttribute("sc", sc);
		model.addAttribute("f_id", -10);
		model.addAttribute("rt_id", -10);
		model.addAttribute("r_state", -10);
		model.addAttribute("nowdate", sdf.parse(sdf.format(new Date())));
		//拖欠房租两天以上，给出提示
		List<RegistrationInfor> rentlist = queryBehindRent();
		model.addAttribute("rentlist", rentlist);
		return "RoomRack/index_1";
	}
	//条件查询（房态图）
	@RequestMapping("/queryAllByReason")    //查询所有房间（房态图）
	public String queryAllByReason(int f_id,int rt_id,int r_state,String r_roomnum,Model model) throws ParseException{
		//修改预订单状态
		updateRR();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if("".equals(r_roomnum)){
			r_roomnum=null;
		}
		List<Room> list = service.queryAllByReason(f_id, rt_id, r_state,r_roomnum);
		List<Floor> flist = floorservice.queryAll();
		List<RegistrationInfor> rilist = registrationinforservice.queryAll();
		List<TeamInfor> tilist = teaminforservice.queryAll();
		List<ReserveRoom> rrlist = reserveroomservice.queryAll();
		List<RoomType> rtlist = roomtypeservice.queryAll();
		model.addAttribute("list", list);
		model.addAttribute("flist", flist);
		model.addAttribute("rilist", rilist);
		model.addAttribute("tilist", tilist);
		model.addAttribute("rrlist", rrlist);
		model.addAttribute("rtlist", rtlist);
		//统计房间状态
		SuppleClass sc = new SuppleClass();
		for(Room r:list){
			if(r.getR_state()==0){
				sc.setI1(sc.getI1()+1);
			}else if(r.getR_state()==1){
				sc.setI2(sc.getI2()+1);
			}else if(r.getR_state()==-1){
				sc.setI3(sc.getI3()+1);
			}else if(r.getR_state()==-3){
				sc.setI4(sc.getI4()+1);
			}else if(r.getR_state()==2){
				sc.setI5(sc.getI5()+1);
			}
		}
		if(list.size()!=0){
			sc.setI6(sc.getI1()*100/list.size());
			sc.setI7(sc.getI2()*100/list.size());
			sc.setI8(sc.getI3()*100/list.size());
			sc.setI9(sc.getI4()*100/list.size());
			sc.setI10(sc.getI5()*100/list.size());
		}
		model.addAttribute("sc", sc);
		model.addAttribute("f_id", f_id);
		model.addAttribute("rt_id", rt_id);
		model.addAttribute("r_state", r_state);
		model.addAttribute("r_roomnum", r_roomnum);
		model.addAttribute("nowdate", sdf.parse(sdf.format(new Date())));
		//拖欠房租两天以上，给出提示
//		List<RegistrationInfor> rentlist = queryBehindRent();
//		model.addAttribute("rentlist", rentlist);
		return "RoomRack/index_1";
	}
	
	@RequestMapping("/queryFRT")    //查询楼层和房型
	public String queryFRT(Model model,HttpServletRequest req){
		List<Room> list = service.queryAll();   //房间list
		List<RoomType> roomtypelist = roomtypeservice.queryAll();  //房型list
		List<Floor> flist = floorservice.queryAll();     //楼层list
		model.addAttribute("list", list);
		model.addAttribute("roomtypelist", roomtypelist);
		model.addAttribute("flist", flist);
		return "Set/SetRoom/index_3";
	}
	//根据鼠标悬浮在那个div就显示那个div的信息
	@RequestMapping("/queryRI")   
	@ResponseBody
	public RegistrationInfor queryRI(int ri_id,HttpServletRequest req){
		RegistrationInfor ri = registrationinforservice.queryById(ri_id);
		return ri;	
	}
	@RequestMapping("/queryRR")   
	@ResponseBody
	public ReserveRoom queryRR(int rr_id,HttpServletRequest req){
		ReserveRoom rr = reserveroomservice.queryById(rr_id);
		return rr;	
	}
}
