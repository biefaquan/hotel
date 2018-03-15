package com.hotel.storehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.storehouse.service.StoreHouseService;

@Controller
@RequestMapping("/StoreHouseController")
public class StoreHouseController {
	@Autowired
	private StoreHouseService service;
	
	@RequestMapping("/add")
	public String add(StoreHouse sh){
		service.add(sh);
		return "Stock/StockInfor/stockinfor";
	}
	
	@RequestMapping("/queryAll")
	public String queryAll(Model model){
		List<StoreHouse> list = service.queryAll();
		model.addAttribute("list", list);
		return "Stock/StockInfor/index_3";
	}
	
	@RequestMapping("/queryById")
	public String queryById(int sh_id,Model model){
		StoreHouse sh = service.queryById(sh_id);
		model.addAttribute("sh", sh);
		return "Stock/StockInfor/updatestock";
	}
	
	@RequestMapping("/update")
	public String update(StoreHouse sh){
		service.update(sh);
		return "Stock/StockInfor/stockinfor";
	}
}
