package com.hotel.grogshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.grogshop.dao.vo.GrogShop;
import com.hotel.grogshop.service.GrogShopService;

@Controller
@RequestMapping("/GrogShopController")
public class GrogShopContrller {
	@Autowired
	private GrogShopService gservice;
	
	@RequestMapping("/query")
	public String query(Model model,HttpServletRequest req){
		GrogShop gs = gservice.query();
		model.addAttribute("gs", gs);
		return "Set/SetGrogShop/index_3";
	}
	
	@RequestMapping("/update")
	public String update(GrogShop gs,HttpServletRequest req){
		gs.setGs_id(1);
		String province = req.getParameter("s_province");
		String city = req.getParameter("s_city");
		String county = req.getParameter("s_county");
		gs.setGs_address(province+city+county);
		gservice.update(gs);
		return "Set/SetGrogShop/set";
	}
}
