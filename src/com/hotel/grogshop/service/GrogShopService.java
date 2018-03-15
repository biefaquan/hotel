package com.hotel.grogshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.grogshop.dao.dao.GrogShopMapper;
import com.hotel.grogshop.dao.vo.GrogShop;

@Service
public class GrogShopService {
	@Autowired
	private GrogShopMapper mapper;
	
	@Transactional
	public GrogShop query(){
		return mapper.query();
	}
	
	@Transactional
	public void update(GrogShop gs){
		mapper.update(gs);
	}
}
