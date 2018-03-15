package com.hotel.stockchange.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.returnpick.dao.vo.ReturnPick;
import com.hotel.stockchange.dao.dao.StockChangeMapper;
import com.hotel.stockchange.dao.vo.StockChange;

@Service
public class StockChangeService {
	@Autowired
	private StockChangeMapper mapper;
	
	@Transactional
	public void add(StockChange sc){
		mapper.add(sc);
	}
	
	@Transactional
	public List<StockChange> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional 
	public List<StockChange> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public StockChange queryById(int sc_id){
		return mapper.queryById(sc_id);
	}
	//条件查询  领料退货单界面
	@Transactional
	public List<StockChange> queryByReason(int sh_id,int u_id,Date startdate,Date enddate,int pageNo,int pageSize){
		return mapper.queryByReason(sh_id, u_id, startdate, enddate, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(int sh_id,int u_id,Date startdate,Date enddate){
		return mapper.countByReason(sh_id, u_id, startdate, enddate);
	}
}
