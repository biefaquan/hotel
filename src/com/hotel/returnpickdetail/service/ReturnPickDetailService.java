package com.hotel.returnpickdetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.returnpickdetail.dao.dao.ReturnPickDetailMapper;
import com.hotel.returnpickdetail.dao.vo.ReturnPickDetail;

@Service
public class ReturnPickDetailService {
	@Autowired
	private ReturnPickDetailMapper mapper;
	
	@Transactional
	public void add(ReturnPickDetail rpd){
		mapper.add(rpd);
	}
}
