package com.hotel.pickdetail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.pickdetail.dao.dao.PickDetailMapper;
import com.hotel.pickdetail.dao.vo.PickDetail;

@Service
public class PickDetailService {
	@Autowired
	private PickDetailMapper mapper;
	
	@Transactional
	public void add(PickDetail pd){
		mapper.add(pd);
	}
}
