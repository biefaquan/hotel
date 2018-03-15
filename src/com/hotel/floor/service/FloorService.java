package com.hotel.floor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.floor.dao.dao.FloorMapper;
import com.hotel.floor.dao.vo.Floor;

@Service
public class FloorService {
	@Autowired
	private FloorMapper mapper;
	
	@Transactional
	public List<Floor> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public Floor queryById(int f_id){
		return mapper.queryById(f_id);
	}
	
	@Transactional
	public void add(Floor f){
		mapper.add(f);
	}
	
	@Transactional
	public void update(Floor f){
		mapper.update(f);
	}
	
	@Transactional
	public void delete(int f_id){
		mapper.delete(f_id);
	}
}
