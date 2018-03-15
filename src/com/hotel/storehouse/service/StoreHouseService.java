package com.hotel.storehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.storehouse.dao.dao.StoreHouseMapper;
import com.hotel.storehouse.dao.vo.StoreHouse;

@Service
public class StoreHouseService {
	@Autowired
	private StoreHouseMapper mapper;
	
	@Transactional
	public void add(StoreHouse sh){
		mapper.add(sh);
	}
	
	@Transactional
	public List<StoreHouse> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public StoreHouse queryById(int sh_id){
		return mapper.queryById(sh_id);
	}
	
	@Transactional
	public void update(StoreHouse sh){
		mapper.update(sh);
	}
}
