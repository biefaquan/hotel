package com.hotel.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.dept.dao.vo.Dept;
import com.hotel.dept.service.DeptService;
import com.hotel.inaccount.dao.vo.InAccount;
import com.hotel.inaccount.service.InAccountService;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;
import com.hotel.registrationinfor.service.RegistrationInforService;
import com.hotel.user.dao.vo.User;
import com.hotel.user.service.UserService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;


@Controller
@RequestMapping("/UserController")
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private DeptService deptservice;
	@Autowired
	private RegistrationInforService registrationinforservice;
	@Autowired
	private InAccountService inaccountservice;
	private boolean flag = true;
	
	@RequestMapping("/queryByName")    //登录验证
	@ResponseBody
	public User setName(User u,HttpServletRequest req){
		User user = service.queryByName(u.getU_name());
		System.out.println(u.getU_name());
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("today", new Date());
		//每天入账，开启定时器
		if(flag){
			showTimer();
		}
		return user;	
	}
	
	@RequestMapping("queryByAdd")    //添加之前，查询部门名称
	public String queryByAdd(Model model){
		List<Dept> deptlist =  deptservice.queryAll();
		model.addAttribute("deptlist", deptlist);
		return "Set/SetEmployee/useradd";
	}
	
	@RequestMapping("/add")
	public String add(User u,HttpServletRequest req) throws Exception{
		String date = req.getParameter("startdate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		u.setU_date(sdf.parse(date));
		u.setU_password("123");
		service.add(u);
		return "Set/SetEmployee/setemployee";
	}
	
	@RequestMapping("/queryById")    //修改之前根据id查询
	public String queryByUpdate(Model model,HttpServletRequest req){
		int u_id = Integer.parseInt(req.getParameter("u_id"));
		User u = service.queryById(u_id);
		List<Dept> deptlist =  deptservice.queryAll();
		model.addAttribute("deptlist", deptlist);
		model.addAttribute("u", u);
		return "Set/SetEmployee/userupdate";
	}
	
	@RequestMapping("/update")
	public String update(User u,HttpServletRequest req) throws Exception{
		String date = req.getParameter("startdate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		u.setU_date(sdf.parse(date));
		service.update(u);
		return "Set/SetEmployee/setemployee";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req){
		int u_id = Integer.parseInt(req.getParameter("u_id"));
		service.delete(u_id);
		return "Set/SetEmployee/setemployee";
	}
	
	@RequestMapping("/updatepassword")   //修改密码
	public String updatepassword(HttpServletRequest req){
		String u_password = req.getParameter("u_password");
		User u = (User) req.getSession().getAttribute("user");
		u.setU_password(u_password);
		service.updatepassword(u);
		return "Set/SetPwd/setpwd";
	}
	
	@RequestMapping("/setpassword")   //密码重置
	public String setpassword(String u_id){
		User u = service.queryById(Integer.parseInt(u_id));
		u.setU_password("123");
		service.updatepassword(u);
		return "Set/SetAccount/setaccount";
	}
	
	@RequestMapping("/queryAllByPage")    //查询所有用户（分页）
	public String queryAllByPage(Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<User> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<User> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		List<Dept> dlist = deptservice.queryAll();
		model.addAttribute("dlist", dlist);
		model.addAttribute("pb", pb);
		model.addAttribute("u_state", -1);
		return "Set/SetEmployee/index_3";
	}
	//条件查询   员工查询
	@RequestMapping("/queryByReason")    //查询所有用户（分页）
	public String queryByReason(int u_state,String u_name,Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if("".equals(u_name)){
			u_name=null;
		}
		List<User> list = service.queryByReason(u_state,u_name,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(u_state, u_name);
		}
		PageBean<User> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		List<Dept> dlist = deptservice.queryAll();
		model.addAttribute("dlist", dlist);
		model.addAttribute("pb", pb);
		model.addAttribute("u_state", u_state);
		model.addAttribute("u_name", u_name);
		return "Set/SetEmployee/index_3";
	}
	
	//*******设置定时器，每天定时入账系统********************************
	public void showTimer() {
		flag = false;
	       TimerTask task = new TimerTask() {
	          @Override
	           public void run() {
	        	  InToAccount();
	           }
	       };
	       //设置执行时间
	       Calendar calendar =Calendar.getInstance();
	       int year = calendar.get(Calendar.YEAR);
	       int month = calendar.get(Calendar.MONTH);
	       int day =calendar.get(Calendar.DAY_OF_MONTH);//每天
	       //定制每天的下午3点执行，
	       calendar.set(year, month, day, Contacts.HOUR, Contacts.MIN, Contacts.SECOND);
	       Date date = calendar.getTime();
	       Timer timer = new Timer();
	       System.out.println(date);
	       
	       //int period = 2 * 1000;
	       //每天的date时刻执行task，每隔2秒重复执行
	       //timer.schedule(task, date, period);
	       //每天的date时刻执行task, 仅执行一次
	       timer.schedule(task, date);
	    }
	/**
     * 每天入账系统
     */
    private void InToAccount(){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date intime = null;
		try {
			intime = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	List<RegistrationInfor> list = new ArrayList<>();
    	list = registrationinforservice.queryAll();
    	for(RegistrationInfor ri:list){
    		if(ri.getRi_state()==1&&ri.getRi_endtime().compareTo(new Date())>=0){
    			//判断是否协议挂账
    			if(!"挂账".equals(ri.getRi_paytype())){
    				//开始入账
        			InAccount ia = new InAccount();
        			ia.setIa_intime(intime);
        			ia.setIa_money(ri.getRi_allmoney()/ri.getRi_days());
        			ia.setIa_name("系统");
        			ia.setIa_paytype(ri.getRi_paytype());
        			ia.setIa_source(ri.getRi_source());
        			ia.setIa_keyway(ri.getRi_keyway());	//开放方式（天房，月租房等等）
        			ia.setR(ri.getR());
        			//判断是否重复添加(由于没有查询到的时候，返回的是空，不能用int去接受)
        			InAccount inaccount = inaccountservice.queryByRoomAndDate(ia);
        			if(inaccount==null){
        				inaccountservice.add(ia);
        			}
    			}
    		}
    	}
    }
}
