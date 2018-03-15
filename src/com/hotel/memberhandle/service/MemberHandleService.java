package com.hotel.memberhandle.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.memberhandle.dao.dao.MemberHandleMapper;
import com.hotel.memberhandle.dao.vo.MemberHandle;

@Service
public class MemberHandleService {
	@Autowired
	private MemberHandleMapper mapper;
	
	@Transactional
	public void add(MemberHandle mh){
		mapper.add(mh);
	}
	
	@Transactional
	public List<MemberHandle> queryAllByReason(Date startdate,Date enddate,String typenum,int pageNo,int pageSize){
		return mapper.queryAllByReason(startdate, enddate, typenum, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(Date startdate,Date enddate,String typenum){
		return mapper.countByReason(startdate, enddate, typenum);
	}
}
