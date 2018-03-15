package com.hotel.supplier.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.supplier.dao.vo.Supplier;
import com.hotel.supplier.service.SupplierService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/SupplierController")
public class SupplierController {
	@Autowired
	private SupplierService service;
	
	@RequestMapping("/add")
	public String add(Supplier s){
		service.add(s);
		return "Stock/Supplier/supplier";
	}
	
	@RequestMapping("/queryAllByPage")
	public String queryAllByPage(Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<Supplier> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<Supplier> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("s_state", -1);
		return "Stock/Supplier/index_3";
	}
	//条件查询    供应商界面
	@RequestMapping("/queryByReason")
	public String queryByReason(String s_name,int s_state,Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		if("".equals(s_name)){
			s_name=null;
		}
		List<Supplier> list = service.queryByReason(s_name,s_state,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(s_name, s_state);
		}
		PageBean<Supplier> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		model.addAttribute("s_name", s_name);
		model.addAttribute("s_state", s_state);
		return "Stock/Supplier/index_3";
	}
	@RequestMapping("/queryById")
	public String queryById(int s_id,Model model){
		Supplier s = service.queryById(s_id);
		model.addAttribute("s", s);
		return "Stock/Supplier/updatesupplier";
	}
	@RequestMapping("/update")
	public String update(Supplier s){
		service.update(s);
		return "Stock/Supplier/supplier";
	}
	@RequestMapping("/delete")
	public String delete(int s_id){
		service.delete(s_id);
		return "Stock/Supplier/supplier";
	}
}
