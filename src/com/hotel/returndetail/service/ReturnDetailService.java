package com.hotel.returndetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.returndetail.dao.dao.ReturnDetailMapper;
import com.hotel.returndetail.dao.vo.ReturnDetail;

@Service
public class ReturnDetailService {
	@Autowired
	private ReturnDetailMapper mapper;
	
	@Transactional
	public void add(ReturnDetail rd){
		mapper.add(rd);
	}
}
