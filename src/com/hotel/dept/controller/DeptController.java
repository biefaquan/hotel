package com.hotel.dept.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.dept.dao.vo.Dept;
import com.hotel.dept.service.DeptService;

@Controller
@RequestMapping("/DeptController")
public class DeptController {
	@Autowired
	private DeptService service;
	
	@RequestMapping("/add")
	public String add(Dept d){
		service.add(d);
		return "Set/SetEmployee/setemployee";
	}
	
	@RequestMapping("/queryById")
	public String queryById(Model model,HttpServletRequest req){
		int d_id = Integer.parseInt(req.getParameter("d_id"));
		Dept d = service.queryById(d_id);
		model.addAttribute("d", d);
		return "Set/SetEmployee/deptupdate";
	}
	
	@RequestMapping("/update")
	public String update(Dept d){
		service.update(d);
		return "Set/SetEmployee/setemployee";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req){
		int d_id = Integer.parseInt(req.getParameter("d_id"));
		service.delete(d_id);
		return "Set/SetEmployee/setemployee";
	}
}
