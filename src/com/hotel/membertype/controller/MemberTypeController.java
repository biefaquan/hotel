package com.hotel.membertype.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.membertype.service.MemberTypeService;

@Controller
@RequestMapping("/MemberTypeController")
public class MemberTypeController {
	@Autowired
	private MemberTypeService service;
	
	@RequestMapping("/add")
	public String add(MemberType mt){
		service.add(mt);
		return "Member/member";
	}
	
	@RequestMapping("queryById")		//修改前根据id查新信息
	public String queryById(int mt_id,Model model){
		MemberType mt = service.queryById(mt_id);
		model.addAttribute("mt", mt);
		return "Member/membertypeupdate";
	}
	
	@RequestMapping("update")
	public String update(MemberType mt){
		service.update(mt);
		return "Member/member";
	}
	
	@RequestMapping("/delete")
	public String delete(int mt_id){
		service.delete(mt_id);
		return "Member/member";
	}
}
