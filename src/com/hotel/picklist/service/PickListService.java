package com.hotel.picklist.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.picklist.dao.dao.PickListMapper;
import com.hotel.picklist.dao.vo.PickList;
import com.hotel.stocklist.dao.vo.StockList;

@Service
public class PickListService {
	@Autowired
	private PickListMapper mapper;
	
	@Transactional
	public void add(PickList pl){
		mapper.add(pl);
	}
	
	@Transactional
	public List<PickList> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional 
	public List<PickList> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public PickList queryById(int pl_id){
		return mapper.queryById(pl_id);
	}
	//条件查询  领料单界面
	@Transactional
	public List<PickList> queryByReason(int sh_id,int u_id,Date startdate,Date enddate,int pageNo,int pageSize){
		return mapper.queryByReason(sh_id, u_id, startdate, enddate, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(int sh_id,int u_id,Date startdate,Date enddate){
		return mapper.countByReason(sh_id, u_id, startdate, enddate);
	}
}
