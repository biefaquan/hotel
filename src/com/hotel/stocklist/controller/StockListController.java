package com.hotel.stocklist.controller;

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

import com.hotel.goods.dao.vo.Goods;
import com.hotel.goods.service.GoodsService;
import com.hotel.member.dao.vo.Member;
import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.returndetail.dao.vo.ReturnDetail;
import com.hotel.returndetail.service.ReturnDetailService;
import com.hotel.returnlist.dao.vo.ReturnList;
import com.hotel.returnlist.service.ReturnListService;
import com.hotel.stockdetail.dao.vo.StockDetail;
import com.hotel.stockdetail.service.StockDetailService;
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
@RequestMapping("/StockListController")
public class StockListController {
	@Autowired
	private StockListService service;
	@Autowired
	private StoreHouseService storehouseservice;
	@Autowired
	private SupplierService supplierservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private GoodsService goodsservice;
	@Autowired
	private StockDetailService stockdetailservice;
	@Autowired
	private ReturnListService returnlistservice;
	@Autowired
	private ReturnDetailService returndetailservice;
	//物品动态添加时用
	private List<Goods> goodslist = new ArrayList<>();
	
	@RequestMapping("/queryShS") //查询供应商和仓库
	public String queryShS(Model model){
		//清空goodslist
		goodslist.clear();
		List<StoreHouse> shlist = storehouseservice.queryAll();
		List<Supplier> slist = supplierservice.queryAll();
		List<User> ulist = userservice.queryAll();
		List<String> gnamelist = goodsservice.selectName();
		model.addAttribute("shlist", shlist);
		model.addAttribute("slist", slist);
		model.addAttribute("ulist", ulist);
		model.addAttribute("date", new Date());
		model.addAttribute("gnamelist", gnamelist);
		return "Stock/PurchaseList/index_3";
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
	
	//添加进货单
	@RequestMapping("/add")
	public String add(StockList sl){
		service.add(sl);
		for(Goods g:goodslist){
			Goods goods=goodsservice.queryByNameSH(g.getG_name(),sl.getSh().getSh_id());
			if(goods!=null&&goods.getSh().getSh_id()==sl.getSh().getSh_id()){
				//值改变数量和金额
				goods.setG_number(goods.getG_number()+g.getG_number());
				goods.setG_money(goods.getG_money()+g.getG_money());
				goodsservice.update(goods);
				g.setG_id(goods.getG_id());
			}else{
				g.setSh(sl.getSh());
				goodsservice.add(g);
			}
			//添加明细
			StockDetail sd = new StockDetail();
			sd.setG(g);
			sd.setSl(sl);
			sd.setSd_price(g.getG_unitprice());
			sd.setSd_number(g.getG_number());
			sd.setSd_money(g.getG_money());
			stockdetailservice.add(sd);
		}
		return "Stock/PurchaseList/purchaselist";
	}
	
	
	//退货单前查询
	@RequestMapping("/queryShS1") //查询供应商和仓库
	public String queryShS1(Model model){
		//清空goodslist
		goodslist.clear();
		List<StoreHouse> shlist = storehouseservice.queryAll();
		List<Supplier> slist = supplierservice.queryAll();
		List<User> ulist = userservice.queryAll();
		//1仓库1,1供应商1
		List<Goods> glist = queryGoodsList(slist.get(0).getS_id(), shlist.get(0).getSh_id());
		model.addAttribute("shlist", shlist);
		model.addAttribute("slist", slist);
		model.addAttribute("ulist", ulist);
		model.addAttribute("date", new Date());
		model.addAttribute("glist", glist);
		return "Stock/ReturnList/index_3";
	}
	//根据仓库和供应商去查询商品函数
	public List<Goods> queryGoodsList(int s_id,int sh_id){
		boolean flag = true;
		List<StockList> sllist = service.queryAll();
		List<Goods> glist = new ArrayList<>();
		for(StockList sl:sllist){
			if(sl.getS().getS_id()==s_id&&sl.getSh().getSh_id()==sh_id){
				for(StockDetail sd:sl.getSdlist()){
					//判断名字是否重复（重复不添加）
					for(Goods g:glist){
						if(g.getG_name().equals(sd.getG().getG_name())){
							flag=false;
						}
					}
					if(flag){
						glist.add(sd.getG());
					}
				}
			}
		}
		return glist;
	}
	//当前台界面仓库和供应商改变时，变动商品下拉框
	@RequestMapping("/queryGList")
	@ResponseBody
	public List<Goods> queryGList(int s_id,int sh_id){
		return queryGoodsList(s_id,sh_id);
	}
	
	@RequestMapping("/queryGoods")  //根据商品名字查询详细信息
	@ResponseBody
	public Goods queryGoods(String g_name,int sh_id){
		Goods g = goodsservice.queryByNameSH(g_name,sh_id);
		return g;
	}
	//添加退货单及对库存操作
	@RequestMapping("/addReturnList")
	public String addReturnList(ReturnList rl){
		returnlistservice.add(rl);
		for(Goods g:goodslist){
			Goods goods=goodsservice.queryByNameSH(g.getG_name(),rl.getSh().getSh_id());
			if(goods!=null&&goods.getSh().getSh_id()==rl.getSh().getSh_id()){
				//值改变数量和金额
				goods.setG_number(goods.getG_number()-g.getG_number());
				goods.setG_money(goods.getG_money()-g.getG_money());
				goodsservice.update(goods);
				g.setG_id(goods.getG_id());
				
				//退货详情
				ReturnDetail rd = new ReturnDetail();
				rd.setG(g);
				rd.setRd_money(g.getG_money());
				rd.setRd_number(g.getG_number());
				rd.setRd_price(g.getG_unitprice());
				rd.setRd_reward(g.getG_reward());
				rd.setRl(rl);
				returndetailservice.add(rd);
			}
		}
		return "Stock/ReturnList/returnlist";
	}
	
	//进货单查询，单据查询时用
	@RequestMapping("queryAllByPage") //分页查询
	public String queryAllByPage(Model model,HttpServletRequest req){
 		String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<StockList> list = service.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage";
		int count = 1;
		if(list.size()!=0){
			count = service.count();
		}
		PageBean<StockList> pb = new PageBean<>();
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
		return "Stock/QueryPurchase/index_3";
	}
	//条件查询      进货单查询，单据查询时用
	@RequestMapping("queryByReason") 
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
		List<StockList> list = service.queryByReason(sh_id,u_id,startdate,enddate,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryByReason";
		int count = 1;
		if(list.size()!=0){
			count = service.countByReason(sh_id, u_id, startdate, enddate);
		}
		PageBean<StockList> pb = new PageBean<>();
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
		return "Stock/QueryPurchase/index_3";
	}	
	//进货单详细
	@RequestMapping("/queryById")
	public String queryById(int sl_id,Model model){
		StockList sl = service.queryById(sl_id);
		model.addAttribute("sl", sl);
		return "Stock/QueryPurchase/purchasedetail";
	}
	
	//退货单查询，单据查询时用
	@RequestMapping("queryAllByPage1") //分页查询
	public String queryAllByPage1(Model model,HttpServletRequest req){
	 	String pageNo = req.getParameter("pageNo");
		if(pageNo==null){
			pageNo = "1";
		}
		List<ReturnList> list = returnlistservice.queryAllByPage((Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryAllByPage1";
		int count = 1;
		if(list.size()!=0){
			count = returnlistservice.count();
		}
		PageBean<ReturnList> pb = new PageBean<>();
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
		return "Stock/QueryReturn/index_3";
	}
	//条件查询      退货单查询，单据查询时用
	@RequestMapping("queryReturnReason") //分页查询
	public String queryReturnReason(int sh_id,int u_id,String starttime,String endtime,Model model,HttpServletRequest req) throws ParseException{
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
		List<ReturnList> list = returnlistservice.queryByReason(sh_id,u_id,startdate,enddate,(Integer.parseInt(pageNo)-1)*Contacts.PAGE_SIZE, Contacts.PAGE_SIZE);
		String url = "queryReturnReason";
		int count = 1;
		if(list.size()!=0){
			count = returnlistservice.countByReason(sh_id, u_id, startdate, enddate);
		}
		PageBean<ReturnList> pb = new PageBean<>();
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
		return "Stock/QueryReturn/index_3";
	}
		//退货货单详细
		@RequestMapping("/queryById1")
		public String queryById1(int rl_id,Model model){
			ReturnList rl = returnlistservice.queryById(rl_id);
			model.addAttribute("rl", rl);
			return "Stock/QueryReturn/queryreturndetail";
		}
}
