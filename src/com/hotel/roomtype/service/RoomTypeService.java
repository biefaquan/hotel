package com.hotel.roomtype.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.roomtype.dao.dao.RoomTypeMapper;
import com.hotel.roomtype.dao.vo.RoomType;

@Service
public class RoomTypeService {
	@Autowired
	private RoomTypeMapper mapper;
	
	@Transactional
	public List<RoomType> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public RoomType queryById(int rt_id){
		return mapper.queryById(rt_id);
	}
	
	@Transactional
	public void add(RoomType rt){
		mapper.add(rt);
	} 
	
	@Transactional
	public void update(RoomType rt){
		mapper.update(rt);
	}
	
	@Transactional
	public void delete(int rt_id){
		mapper.delete(rt_id);
	}
}
