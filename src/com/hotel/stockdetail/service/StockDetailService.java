package com.hotel.stockdetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.stockdetail.dao.dao.StockDetailMapper;
import com.hotel.stockdetail.dao.vo.StockDetail;

@Service
public class StockDetailService {
	@Autowired
	private StockDetailMapper mapper;
	
	@Transactional
	public void add(StockDetail sd){
		mapper.add(sd);
	}
}
