package com.hotel.moneydetail.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.bill.dao.vo.Bill;
import com.hotel.moneydetail.dao.dao.MoneyDetailMapper;
import com.hotel.moneydetail.dao.vo.MoneyDetail;

@Service
public class MoneyDetailService {
	@Autowired
	private MoneyDetailMapper mapper;
	
	@Transactional
	public void add(MoneyDetail md){
		mapper.add(md);
	}
	
	@Transactional
	public List<MoneyDetail> queryAllByReason(Date starttime,Date endtime,String type,String paytype,int pageNo,int pageSize){
		return mapper.queryAllByReason(starttime, endtime, type,paytype, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(Date starttime,Date endtime,String type,String paytype){
		return mapper.countByReason(starttime, endtime, type,paytype);
	}
}
