package com.hotel.returnpick.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.picklist.dao.vo.PickList;
import com.hotel.returnpick.dao.dao.ReturnPickMapper;
import com.hotel.returnpick.dao.vo.ReturnPick;

@Service
public class ReturnPickService {
	@Autowired
	private ReturnPickMapper mapper;
	
	@Transactional
	public void add(ReturnPick rp){
		mapper.add(rp);
	}
	
	@Transactional 
	public List<ReturnPick> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public ReturnPick queryById(int rp_id){
		return mapper.queryById(rp_id);
	}
	//条件查询  领料退货单界面
	@Transactional
	public List<ReturnPick> queryByReason(int sh_id,int u_id,Date startdate,Date enddate,int pageNo,int pageSize){
		return mapper.queryByReason(sh_id, u_id, startdate, enddate, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(int sh_id,int u_id,Date startdate,Date enddate){
		return mapper.countByReason(sh_id, u_id, startdate, enddate);
	}
}
