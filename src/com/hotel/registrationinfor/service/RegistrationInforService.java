package com.hotel.registrationinfor.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.registrationinfor.dao.dao.RegistrationInforMapper;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;

@Service
public class RegistrationInforService {
	@Autowired
	private RegistrationInforMapper mapper;
	
	@Transactional
	public void add(RegistrationInfor ri){
		mapper.add(ri);
	}
	@Transactional
	public List<RegistrationInfor> queryAll(){
		return mapper.queryAll();
	}
	@Transactional
	public List<RegistrationInfor> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public RegistrationInfor queryById(int ri_id){
		return mapper.queryById(ri_id);
	}
	
	@Transactional
	public void updatestate(int ri_state,int ri_id){
		mapper.updatestate(ri_state, ri_id);
	}
	
	@Transactional
	public void update(RegistrationInfor ri){
		mapper.update(ri);
	}
	
	@Transactional
	public List<RegistrationInfor> queryAllByReason(Date starttime,Date endtime,int roomnum,int pageNo,int pageSize){
		return mapper.queryAllByReason(starttime, endtime, roomnum, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(Date starttime,Date endtime,int roomnum){
		return mapper.countByReason(starttime, endtime, roomnum);
	}
	
	@Transactional
	public List<RegistrationInfor> queryAllDetail(int state,int source,int pageNo,int pageSize){
		return mapper.queryAllDetail(state, source, pageNo, pageSize);
	}
	
	@Transactional
	public int countDetail(int state,int source){
		return mapper.countDetail(state, source);
	}

}
