package com.hotel.picklist.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.dept.dao.vo.Dept;
import com.hotel.dept.service.DeptService;
import com.hotel.goods.dao.vo.Goods;
import com.hotel.goods.service.GoodsService;
import com.hotel.pickdetail.dao.vo.PickDetail;
import com.hotel.pickdetail.service.PickDetailService;
import com.hotel.picklist.dao.vo.PickList;
import com.hotel.picklist.service.PickListService;
import com.hotel.returndetail.dao.vo.ReturnDetail;
import com.hotel.returnlist.dao.vo.ReturnList;
import com.hotel.stockdetail.dao.vo.StockDetail;
import com.hotel.stocklist.dao.vo.StockList;
import com.hotel.stocklist.service.StockListService;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.storehouse.service.StoreHouseService;
import com.hotel.supplier.dao.vo.Supplier;
import com.hotel.supplier.service.SupplierService;
import com.hotel.user.dao.vo.User;
import com.hotel.user.service.UserService;
import com.hotel.util.Contacts;
import com.hotel.util.PageBean;

@Controller
@RequestMapping("/PickListController")
public class PickListController {
	@Autowired
	private PickListService service;
	@Autowired
	private StoreHouseService storehouseservice;
	@Autowired
	private SupplierService supplierservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private GoodsService goodsservice;
	@Autowired
	private DeptService deptservice;
	@Autowired
	private StockListService stocklistservice;
	@Autowired
	private PickDetailService pickdetailservice;
	//物品动态添加时用
	private List<Goods> goodslist = new ArrayList<>();
	
	@RequestMapping("/queryShS") //查询供应商和仓库
	public String queryShS(Model model){
		//清空goodslist
		goodslist.clear();
		List<StoreHouse> shlist = storehouseservice.queryAll();
		List<Dept> deptlist = deptservice.queryAll();
		List<User> ulist = queryUserList(deptlist.get(0).getD_id());
		List<Goods> glist = queryGoodsList(shlist.get(0).getSh_id());
		model.addAttribute("shlist", shlist);
		model.addAttribute("deptlist", deptlist);
		model.addAttribute("ulist", ulist);
		model.addAttribute("date", new Date());
		model.addAttribute("glist", glist);
		return "Stock/PickList/index_3";
	}
	
	@RequestMapping("/addGoods")  
	@ResponseBody
	public Goods addGoods(Goods g){
		goodslist.add(g);
		return g;
	}
	
	@RequestMapping("/deleteGoods")  
	@ResponseBody
	public void deleteGoods(String g_name){
		for(int i=0;i<goodslist.size();i++){
			if(goodslist.get(i).getG_name().equals(g_name)){
				goodslist.remove(i);
			}
		}
	}
	
	//根据仓库和供应商去查询商品函数
	public List<Goods> queryGoodsList(int sh_id){
		return goodsservice.queryAllBySH(sh_id);
	}
	//当前台界面仓库和供应商改变时，变动商品下拉框
	@RequestMapping("/queryGList")
	@ResponseBody
	public List<Goods> queryGList(int sh_id){
		return queryGoodsList(sh_id);
	}
	
	public List<User> queryUserList(int d_id){
		List<User> ulist = userservice.queryAll();
		List<User> userlist = new ArrayList<>();
		for(User u:ulist){
			if(u.getD().getD_id()==d_id){
				userlist.add(u);
			}
		}
		return userlist;
	}
	//当部门改变时，人员改变
	@RequestMapping("/queryUser")
	@ResponseBody
	public List<User> queryUser(int d_id){
		return queryUserList(d_id);
	}
	
	//添加领料单
	@RequestMapping("/add")
	public String addReturnList(PickList pl){
		service.add(pl);
		for(Goods g:goodslist){
			Goods goods=goodsservice.queryByNameSH(g.getG_name(),pl.getSh().getSh_id());
			if(goods!=null&&goods.getSh().getSh_id()==pl.getSh().getSh_id()){
				//值改变数量和金额
				goods.setG_number(goods.getG_number()-g.getG_number());
				goods.setG_money(goods.getG_money()-g.getG_money());
				goodsservice.update(goods);
				g.setG_id(goods.getG_id());
				
				//退货详情
				PickDetail pd = new PickDetail();
				pd.setPl(pl);
				pd.setG(g);
				pd.setPd_money(g.getG_money());
				pd.setPd_number(g.getG_number());
				pd.setPd_price(g.getG_unitprice());
				pickdetailservice.add(pd);
			}
		}
		return "Stock/PickList/picklist";
	}
	
	//领料单查询，单据查询时用
	@RequestMapping("queryAllByPage") //分页查询
	public String queryAllByPage(Model model,HttpServletRequest req){
	 	String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<PickList> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<PickList> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		List<StoreHouse> shlist = storehouseservice.queryAll();
		List<User> ulist = userservice.queryAll();
		model.addAttribute("pb", pb);
		model.addAttribute("shlist", shlist);
		model.addAttribute("ulist", ulist);
		model.addAttribute("sh_id", 0);
		model.addAttribute("u_id", 0);
		return "Stock/QueryPick/index_3";
	}
	//领料单查询，单据查询时用
	@RequestMapping("queryByReason") //分页查询
	public String queryByReason(int sh_id,int u_id,String starttime,String endtime,Model model,HttpServletRequest req) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = null,enddate = null;
		if(starttime!=null&&!"".equals(starttime)){
			startdate = sdf.parse(starttime);
		}
		if(endtime!=null&&!"".equals(endtime)){
			enddate = sdf.parse(endtime);
		}
		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<PickList> list = service.queryByReason(sh_id,u_id,startdate,enddate,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(sh_id, u_id, startdate, enddate);
		}
		PageBean<PickList> pb = new PageBean<>();
		pb.setCount(count);
		pb.setList(list);
		pb.setPageNo(Integer.parseInt(pageNo));
		pb.setUrl(url);
		pb.setPageSize(Contacts.PAGE_SIZE);
		model.addAttribute("pb", pb);
		List<StoreHouse> shlist = storehouseservice.queryAll();
		List<User> ulist = userservice.queryAll();
		model.addAttribute("pb", pb);
		model.addAttribute("shlist", shlist);
		model.addAttribute("ulist", ulist);
		model.addAttribute("sh_id", sh_id);
		model.addAttribute("u_id", u_id);
		model.addAttribute("startdate", startdate);
		model.addAttribute("enddate", enddate);
		return "Stock/QueryPick/index_3";
	}
	//查询信息信息
	@RequestMapping("/queryById")
	public String queryById(int pl_id,Model model){
		PickList pl = service.queryById(pl_id);
		model.addAttribute("pl", pl);
		return "Stock/QueryPick/pickdetail";
	}
}
