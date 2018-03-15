package com.hotel.reserveroom.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.reserveroom.dao.dao.ReserveRoomMapper;
import com.hotel.reserveroom.dao.vo.ReserveRoom;

@Service
public class ReserveRoomService {
	@Autowired 
	private ReserveRoomMapper mapper;
	
	@Transactional
	public void add(ReserveRoom rr){
		mapper.add(rr);
	}
	
	@Transactional
	public List<ReserveRoom> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<ReserveRoom> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	//查询（是否入住）
	@Transactional
	public ReserveRoom queryById(int rr_id){
		return mapper.queryById(rr_id);
	}
	//查询是不判断房子（不管是否已经转入住）
	@Transactional
	public ReserveRoom queryById1(int rr_id){
		return mapper.queryById1(rr_id);
	}
	
	@Transactional
	public void update(ReserveRoom rr){
		mapper.update(rr);
	}
	
	@Transactional
	public void delete(int rr_id){
		mapper.delete(rr_id);
	}
	//条件查询 预订界面
	@Transactional
	public List<ReserveRoom> queryByReason(Date startdate,Date enddate,String rr_name,int rr_state,int pageNo,int pageSize){
		return mapper.queryByReason(startdate, enddate, rr_name, rr_state, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(Date startdate,Date enddate,String rr_name,int rr_state){
		return mapper.countByReason(startdate, enddate, rr_name, rr_state);
	}
}
