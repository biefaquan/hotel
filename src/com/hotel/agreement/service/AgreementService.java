package com.hotel.agreement.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.agreement.dao.dao.AgreementMapper;
import com.hotel.agreement.dao.vo.Agreement;

@Service
public class AgreementService {
	@Autowired
	private AgreementMapper mapper;
	
	@Transactional
	public List<Agreement> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<Agreement> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	@Transactional
	public int count(){
		return mapper.count();
	}
	@Transactional
	public Agreement queryById(int a_id){
		return mapper.queryById(a_id);
	}
	@Transactional
	public Agreement queryByCardnum(String a_cardnum){
		return mapper.queryByCardnum(a_cardnum);
	}
	@Transactional
	public void add(Agreement a){
		mapper.add(a);
	}
	@Transactional
	public void update(Agreement a){
		mapper.update(a);
	}
	@Transactional
	public void delete(int a_id){
		mapper.delete(a_id);
	}
	
	@Transactional
	public List<Agreement> queryByReason(String a_name,String a_username,int a_state,int pageNo,int pageSize){
		return mapper.queryByReason(a_name, a_username, a_state, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(String a_name,String a_username,int a_state){
		return mapper.countByReason(a_name, a_username, a_state);
	}
}
