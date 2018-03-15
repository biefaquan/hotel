package com.hotel.goods.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.goods.service.GoodsService;
import com.hotel.returnpick.dao.vo.ReturnPick;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.storehouse.service.StoreHouseService;
import com.hotel.user.dao.vo.User;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/GoodsController")
public class GoodsController {
	@Autowired
	private GoodsService service;
	@Autowired
	private StoreHouseService storehouseservice;
	
	@RequestMapping("queryAllByPage") //分页查询
	public String queryAllByPage(Model model,HttpServletRequest req){
		 String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Goods> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<Goods> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		List<StoreHouse> shlist = storehouseservice.queryAll();
		model.addAttribute("pb", pb);
		model.addAttribute("shlist", shlist);
		model.addAttribute("sh_id", 0);
		return "Stock/QueryAllStock/index_3";
	}
	//条件查询  当前库存
	@RequestMapping("queryByReason") //分页查询
	public String queryByReason(String g_name,int sh_id,Model model,HttpServletRequest req){
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if("".equals(g_name)){
			g_name=null;
		}
		List<Goods> list = service.queryByReason(g_name,sh_id,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(g_name, sh_id);
		}
		PageBean<Goods> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		List<StoreHouse> shlist = storehouseservice.queryAll();
		model.addAttribute("pb", pb);
		model.addAttribute("shlist", shlist);
		model.addAttribute("g_name", g_name);
		model.addAttribute("sh_id", sh_id);
		return "Stock/QueryAllStock/index_3";
	}
	@RequestMapping("/queryById")
	public String queryById(int g_id,Model model){
		Goods g = service.queryById(g_id);
		model.addAttribute("g", g);
		return "Stock/QueryAllStock/goodsedit";
	}
	@RequestMapping("/update")
	public String update(Goods g){
		service.update(g);
		return "Stock/QueryAllStock/queryallstock";
	}
	@RequestMapping("/delete")
	public String delete(int g_id){
		service.delete(g_id);
		return "Stock/QueryAllStock/queryallstock";
	}
}
