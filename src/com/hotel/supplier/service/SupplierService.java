package com.hotel.supplier.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.supplier.dao.dao.SupplierMapper;
import com.hotel.supplier.dao.vo.Supplier;

@Service
public class SupplierService {
	@Autowired
	private SupplierMapper mapper;
	
	@Transactional
	public void add(Supplier s){
		mapper.add(s);
	}
	
	@Transactional
	public List<Supplier> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<Supplier> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public Supplier queryById(int s_id){
		return mapper.queryById(s_id);
	}
	
	@Transactional
	public void update(Supplier s){
		mapper.update(s);
	}
	
	@Transactional
	public void delete(int s_id){
		mapper.delete(s_id);
	}
	@Transactional
	public List<Supplier> queryByReason(String s_name,int s_state,int pageNo,int pageSize){
		return mapper.queryByReason(s_name, s_state, pageNo, pageSize);
	}
	@Transactional
	public int countByReason(String s_name,int s_state){
		return mapper.countByReason(s_name, s_state);
	}
}
