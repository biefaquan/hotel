package com.hotel.agreementtype.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.agreementtype.dao.vo.AgreementType;
import com.hotel.agreementtype.service.AgreementTypeService;

@Controller
@RequestMapping("/AgreementTypeController")
public class AgreementTypeController {
	@Autowired
	private AgreementTypeService service;
	
	@RequestMapping("/add")
	public String add(AgreementType at){
		service.add(at);
		return "Agreement/agreement";
	}
	@RequestMapping("/queryById")
	public String queryById(int at_id,Model model){
		AgreementType at = service.queryById(at_id);
		model.addAttribute("at", at);
		return "Agreement/agreementtypeupdate";
		
	}
	@RequestMapping("/update")
	public String update(AgreementType at){
		service.update(at);
		return "Agreement/agreement";
	}
	@RequestMapping("/delete")
	public String delete(int at_id){
		service.delete(at_id);
		return "Agreement/agreement";
	}
}
