package com.hotel.returnlist.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.returnlist.dao.dao.ReturnListMapper;
import com.hotel.returnlist.dao.vo.ReturnList;
import com.hotel.stocklist.dao.vo.StockList;

@Service
public class ReturnListService {
	@Autowired
	private ReturnListMapper mapper;
	
	@Transactional
	public void add(ReturnList rl){
		mapper.add(rl);
	}
	
	@Transactional
	public List<ReturnList> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public ReturnList queryById(int rl_id){
		return mapper.queryById(rl_id);
	}
	//条件查询  t退货单界面
	@Transactional
	public List<ReturnList> queryByReason(int sh_id,int u_id,Date startdate,Date enddate,int pageNo,int pageSize){
		return mapper.queryByReason(sh_id, u_id, startdate, enddate, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(int sh_id,int u_id,Date startdate,Date enddate){
		return mapper.countByReason(sh_id, u_id, startdate, enddate);
	}
}
