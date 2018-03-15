package com.hotel.stockchangedetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.stockchangedetail.dao.dao.StockChangeDetailMapper;
import com.hotel.stockchangedetail.dao.vo.StockChangeDetail;

@Service
public class StockChangeDetailService {
	@Autowired
	private StockChangeDetailMapper mapper;
	
	@Transactional
	public void add(StockChangeDetail scd){
		mapper.add(scd);
	}
}
