package com.hotel.dept.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.dept.dao.dao.DeptMapper;
import com.hotel.dept.dao.vo.Dept;

@Service
public class DeptService {
	@Autowired
	private DeptMapper mapper;
	
	@Transactional
	public List<Dept> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public Dept queryById(int d_id){
		return mapper.queryById(d_id);
	}
	
	@Transactional
	public void update(Dept d){
		mapper.update(d);
	}
	
	@Transactional
	public void add(Dept d){
		mapper.add(d);
	}
	
	@Transactional
	public void delete(int d_id){
		mapper.delete(d_id);
	}
}
