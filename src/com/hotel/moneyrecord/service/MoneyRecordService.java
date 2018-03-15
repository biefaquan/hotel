package com.hotel.moneyrecord.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.moneyrecord.dao.dao.MoneyRecordMapper;
import com.hotel.moneyrecord.dao.vo.MoneyRecord;

@Service
public class MoneyRecordService {
	@Autowired
	private MoneyRecordMapper mapper;
	@Transactional
	public void add(MoneyRecord mr){
		mapper.add(mr);
	}
	@Transactional
	public List<MoneyRecord> queryAllByReason(Date startdate,Date enddate,String typenum,int pageNo,int pageSize){
		return mapper.queryAllByReason(startdate, enddate, typenum, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(Date startdate,Date enddate,String typenum){
		return mapper.countByReason(startdate, enddate, typenum);
	}
}
