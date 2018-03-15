package com.hotel.stocklist.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.stocklist.dao.dao.StockListMapper;
import com.hotel.stocklist.dao.vo.StockList;

@Service
public class StockListService {
	@Autowired
	private StockListMapper mapper;
	
	@Transactional
	public void add(StockList sl){
		mapper.add(sl);
	}
	
	@Transactional 
	public List<StockList> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional 
	public List<StockList> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public StockList queryById(int sl_id){
		return mapper.queryById(sl_id);
	}
	//条件查询  进货单界面
	@Transactional
	public List<StockList> queryByReason(int sh_id,int u_id,Date startdate,Date enddate,int pageNo,int pageSize){
		return mapper.queryByReason(sh_id, u_id, startdate, enddate, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(int sh_id,int u_id,Date startdate,Date enddate){
		return mapper.countByReason(sh_id, u_id, startdate, enddate);
	}
}
