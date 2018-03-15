package com.hotel.reserveroom.controller;

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
import com.hotel.member.dao.vo.Member;
import com.hotel.member.service.MemberService;
import com.hotel.moneydetail.dao.vo.MoneyDetail;
import com.hotel.moneydetail.service.MoneyDetailService;
import com.hotel.reservenum.dao.vo.ReserveNum;
import com.hotel.reservenum.service.ReserveNumService;
import com.hotel.reserveroom.dao.vo.ReserveRoom;
import com.hotel.reserveroom.service.ReserveRoomService;
import com.hotel.room.dao.vo.Room;
import com.hotel.room.service.RoomService;
import com.hotel.roomtype.dao.vo.RoomType;
import com.hotel.roomtype.service.RoomTypeService;
import com.hotel.user.dao.vo.User;
import com.hotel.user.service.UserService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/ReserveRoomController")
public class ReserveRoomController {
	@Autowired
	private ReserveRoomService service;
	@Autowired
	private ReserveNumService reservenumservice;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private AgreementService agreementservice;
	@Autowired
	private RoomTypeService roomtypeservice;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private MoneyDetailService moneydetailservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private ReserveRoomService reserveroomservice;
	private List<Room> roomlist=new ArrayList<>();
	private List<Room> roomupdatelist=new ArrayList<>();
	
	//查询所有预住信息
	@RequestMapping("/queryAllByPage")
	public String queryAllByPage(Model model,HttpServletRequest req) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<ReserveRoom> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		for(int i=0;i<list.size();i++){//确定已经开房的数量
			//确定rnlist
			list.get(i).setRnlist(reservenumservice.queryByRr_id(list.get(i).getRr_id()));
			ReserveRoom rr = reserveroomservice.queryById(list.get(i).getRr_id());
			if(rr!=null){
				list.get(i).setSpare(list.get(i).getRnlist().size()-rr.getRnlist().size());
			}else{
				list.get(i).setSpare(list.get(i).getRnlist().size());
			}
		}
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<ReserveRoom> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("rr_state", -1);
		model.addAttribute("date", sdf.parse(sdf.format(new Date())));
		return "Reserve/index_1";
	}
	//条件查询  预订界面查询
	//查询所有预住信息
		@RequestMapping("/queryByReason")
		public String queryByReason(String starttime,String endtime,String rr_name,int rr_state,Model model,HttpServletRequest req) throws ParseException{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = null,enddate = null;
			if(starttime!=null&&!"".equals(starttime)){
				startdate = sdf.parse(starttime);
			}
			if(endtime!=null&&!"".equals(endtime)){
				enddate = sdf.parse(endtime);
			}
			if("".equals(rr_name)){
				rr_name = null;
			}
			String pageNo = req.getParameter("pageNo");
			if(pageNo==null){
				pageNo = "1";
			}
			List<ReserveRoom> list = service.queryByReason(startdate,enddate,rr_name,rr_state,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
			for(int i=0;i<list.size();i++){//确定已经开房的数量
				//确定rnlist
				list.get(i).setRnlist(reservenumservice.queryByRr_id(list.get(i).getRr_id()));
				ReserveRoom rr = reserveroomservice.queryById(list.get(i).getRr_id());
				if(rr!=null){
					list.get(i).setSpare(list.get(i).getRnlist().size()-rr.getRnlist().size());
				}else{
					list.get(i).setSpare(list.get(i).getRnlist().size());
				}
			}
			String url = "queryByReason";
			int count = 1;
			if(list.size()!=0){
				count = service.countByReason(startdate, enddate, rr_name, rr_state);
			}
			PageBean<ReserveRoom> pb = new PageBean<>();
			pb.setCount(count);
			pb.setList(list);
			pb.setPageNo(Integer.parseInt(pageNo));
			pb.setUrl(url);
			pb.setPageSize(Contacts.PAGE_SIZE);
			model.addAttribute("pb", pb);
			model.addAttribute("startdate", startdate);
			model.addAttribute("enddate", enddate);
			model.addAttribute("rr_name", rr_name);
			model.addAttribute("rr_state", rr_state);
			model.addAttribute("date", sdf.parse(sdf.format(new Date())));
			return "Reserve/index_1";
		}
	//添加时显示房型
	@RequestMapping("/queryroomtype")
	public String queryroomtype(Model model){
		List<RoomType> rtlist = roomtypeservice.queryAll();
		roomlist.clear();
		model.addAttribute("rtlist", rtlist);
		return "Reserve/addreserve";
	}
	//添加房间
	@RequestMapping("/addroom")
	@ResponseBody
	public Room addroom(int r_id){
		Room r = roomservice.queryByID(r_id);
		roomlist.add(r);
		return r;
	}
	//删除房间
	@RequestMapping("/deleteroom")
	@ResponseBody
	public void deleteroom(int r_id){
		boolean flag = false;
		for(int i=0;i<roomlist.size();i++){
			if(roomlist.get(i).getR_id()==r_id){
				roomlist.remove(i);
				flag = true;
			}
		}
		//修改时删除，是把信息添加上去
		if(flag==false){
			Room r = roomservice.queryByID(r_id);
			roomupdatelist.add(r);
		}
	}
	//关闭页面时，删除所有房间
	@RequestMapping("/deleteallroom")
	@ResponseBody
	public void deleteallroom(){
		roomlist.clear();
		//清空编辑时，删除已存在的房间信息
		roomupdatelist.clear();
	}
	
	
	//添加预订信息
	@RequestMapping("/add")
	public String add(ReserveRoom rr){
		rr.setRr_nowdate(new Date());
		rr.setRr_state(1);
		service.add(rr);
		for(Room r:roomlist){
			ReserveNum rn = new ReserveNum();
			rn.setR(r);
			rn.setRr(rr);
			reservenumservice.add(rn);
			r.setR_state(2);
			roomservice.update(r);
			

			//向收银明细辅助表插入信息
			MoneyDetail md = new MoneyDetail();
			md.setMd_money(rr.getRr_depositfee());
			User u = userservice.queryById(rr.getU().getU_id());
			md.setMd_name(u.getU_name());
			md.setMd_paytype(rr.getRr_paytype());
			md.setMd_reward(rr.getRr_reward());
			md.setMd_roomnum(r.getR_roomnum());
			md.setMd_starttime(rr.getRr_startdate());
			md.setMd_type("定金");
			moneydetailservice.add(md);
		}
		return "Reserve/reserve";
	}
	//修改前，先查询其信息
	@RequestMapping("/queryById")
	public String queryById(int rr_id,Model model){
		ReserveRoom rr = service.queryById(rr_id);
		if(rr==null){
			rr = service.queryById1(rr_id);
		}
		if("会员".equals(rr.getRr_source())){
			System.out.println("dfadsf");
			Member m = memberservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("m", m);
		}else if("协议单位".equals(rr.getRr_source())){
			Agreement a = agreementservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("a", a);
		}
		List<RoomType> rtlist = roomtypeservice.queryAll();
		model.addAttribute("rr", rr);
		model.addAttribute("rtlist", rtlist);
		roomupdatelist.clear();
		return "Reserve/updatereserve";
	}
	
	//修改信息
	@RequestMapping("/update")
	public String update(ReserveRoom rr){
		service.update(rr);
		for(Room r:roomlist){
			ReserveNum rn = new ReserveNum();
			rn.setR(r);
			rn.setRr(rr);
			reservenumservice.add(rn);
			r.setR_state(2);
			roomservice.update(r);
		}
		//编辑时，删除已存在的房间信息
		for(Room r:roomupdatelist){
			reservenumservice.deleteByR_id(r.getR_id());
			r.setR_state(0);
			//修改房态
			roomservice.update(r);
		}
		return "Reserve/reserve";
	}
	
	@RequestMapping("/delete")
	public String delete(int rr_id){
		 System.out.println("是否为空了"+rr_id);
		//修改房态
		ReserveRoom rr = service.queryById1(rr_id);
		System.out.println("花椒粉"+rr);
		for (ReserveNum rn:rr.getRnlist()) {
			Room r = roomservice.queryByID(rn.getR().getR_id());
			r.setR_state(0);
			roomservice.update(r);
		}
		service.delete(rr_id);
		return "Reserve/reserve";
	}
	
	//入住转预订，先查询信息
	@RequestMapping("/queryRR")
	public String queryRR(int rr_id,Model model){
		ReserveRoom rr = service.queryById(rr_id);
		if("会员".equals(rr.getRr_source())){
			Member m = memberservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("m", m);
		}else if("协议单位".equals(rr.getRr_source())){
			Agreement a = agreementservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("a", a);
		}
		model.addAttribute("rr", rr);
		model.addAttribute("nowdate", new Date());
		return "Reserve/openroom";
	}
	
	//补打订单，先查询信息
	@RequestMapping("/queryRR1")
	public String queryRR1(int rr_id,Model model){
		ReserveRoom rr = service.queryById1(rr_id);
		if("会员".equals(rr.getRr_source())){
			Member m = memberservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("m", m);
		}else if("协议单位".equals(rr.getRr_source())){
			Agreement a = agreementservice.queryById(Integer.parseInt(rr.getRr_typenum()));
			model.addAttribute("a", a);
		}
		model.addAttribute("rr", rr);
		model.addAttribute("nowdate", new Date());
		return "Reserve/printcard";
	}
	//根据房间id查询
	@RequestMapping("/queryRoomById")    
	@ResponseBody
	public Room queryRoomById(int r_id){
		Room r = roomservice.queryByID(r_id);
		return r;
	}
	//根据rr_id查询信息（Ajax时用）
	@RequestMapping("/queryByRr_id")
	@ResponseBody
	public ReserveRoom queryByRr_id(int rr_id){
		ReserveRoom rr = service.queryById1(rr_id);
		return rr;
	}
	//根据时间判断该事假区域内是否有房间被预订。
	@RequestMapping("/queryAllByRt_id")
	@ResponseBody
	public List<Room> queryAllByRt_id(int rt_id,String starttime,String endtime) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = sdf.parse(starttime);
		Date end = sdf.parse(endtime);
		List<Room> list = roomservice.queryAllByRt_id1(rt_id);
		List<ReserveRoom> rrlist = reserveroomservice.queryAll();
		for(ReserveRoom rr:rrlist){
			if(rr.getRr_state()==1&&(rr.getRr_startdate().compareTo(end)>0||rr.getRr_enddate().compareTo(start)<0)){
				for(ReserveNum rn:rr.getRnlist()){
					if(rn.getR().getRt().getRt_id()==rt_id){
						for(int i=0;i < list.size();i++){
							if(list.get(i).getR_id()==rn.getR().getR_id()){
								list.remove(i);
							}
						}
						list.add(rn.getR());
					}
				}
			}else{//同一个房间被多个时间段预订的时候，的判断一下
				for(int i=0 ;i<rr.getRnlist().size();i++){
					for(int j=0;j<list.size();j++){
						if(list.get(j).getR_id()==rr.getRnlist().get(i).getR().getR_id()){
							list.remove(list.get(j));
						}
					}
				}
			}
		}
		return list;
	}
}
