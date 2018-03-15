package com.hotel.roomtype.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.hotel.roomtype.dao.vo.RoomType;
import com.hotel.roomtype.service.RoomTypeService;

@Controller
@RequestMapping("/RoomTypeController")
public class RoomTypeController {
	@Autowired
	private RoomTypeService service;
	
	@RequestMapping("/add")
	public String add(RoomType rt){
		service.add(rt);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/queryById")
	public String queryById(Model model,HttpServletRequest req){
		int rt_id = Integer.parseInt(req.getParameter("rt_id"));
		RoomType roomtype = service.queryById(rt_id);
		model.addAttribute("roomtype", roomtype);
		return "Set/SetRoom/roomtypeupdate";
	}
	
	@RequestMapping("/update")
	public String update(RoomType rt){
		service.update(rt);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/delete")
	public String delete(int rt_id){
		service.delete(rt_id);
		return "Set/SetRoom/setroom";
	}
}
