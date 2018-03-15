package com.hotel.floor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.floor.dao.vo.Floor;
import com.hotel.floor.service.FloorService;

@Controller
@RequestMapping("/FloorController")
public class FloorController {
	@Autowired
	private FloorService service;
	
	@RequestMapping("/add")
	public String add(Floor f){
		service.add(f);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/queryById")
	public String queryById(Model model,HttpServletRequest req){
		int f_id = Integer.parseInt(req.getParameter("f_id"));
		Floor floor = service.queryById(f_id);
		model.addAttribute("floor", floor);
		return "Set/SetRoom/floorupdate";
	}
	
	@RequestMapping("/update")
	public String update(Floor f){
		service.update(f);
		return "Set/SetRoom/setroom";
	}
	
	@RequestMapping("/delete")
	public String delete(int f_id){
		service.delete(f_id);
		return "Set/SetRoom/setroom";
	}
}
