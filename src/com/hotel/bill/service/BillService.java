package com.hotel.bill.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.bill.dao.dao.BillMapper;
import com.hotel.bill.dao.vo.Bill;

@Service
public class BillService {
	@Autowired
	private BillMapper mapper;
	@Transactional
	public void add(Bill b){
		mapper.add(b);
	}
	
	@Transactional
	public List<Bill> queryAllByReason(Date starttime,Date endtime,int roomnum,int pageNo,int pageSize){
		return mapper.queryAllByReason(starttime, endtime, roomnum, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(Date starttime,Date endtime,int roomnum){
		return mapper.countByReason(starttime, endtime, roomnum);
	}
	
	@Transactional
	public List<Bill> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<Bill> queryAll1(Date startdate,Date enddate,String typenum){
		return mapper.queryAll1(startdate, enddate, typenum);
	}
	
	@Transactional
	public List<Bill> queryAgreement(Date startdate,Date enddate,String typenum,int pageNo,int pageSize){
		return mapper.queryAgreement(startdate, enddate, typenum, pageNo, pageSize);
	}
	
	@Transactional
	public int queryCount(Date startdate,Date enddate,String typenum){
		return mapper.queryCount(startdate, enddate, typenum);
	}
	
	@Transactional
	public List<Bill> queryAllAgree(){
		return mapper.queryAllAgree();
	}
	
	@Transactional
	public Bill queryById(int b_id){
		return mapper.queryById(b_id);
	}
	
	@Transactional
	public void update(Bill b){
		mapper.update(b);
	}
	
	@Transactional
	public List<Bill> queryDetail(Date startdate,Date enddate,int state){
		return mapper.queryDetail(startdate, enddate, state);
	}
}
