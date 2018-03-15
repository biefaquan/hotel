package com.hotel.continuelive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.continuelive.dao.dao.ContinueLiveMapper;
import com.hotel.continuelive.dao.vo.ContinueLive;

@Service
public class ContinueLiveService {
	@Autowired
	private ContinueLiveMapper mapper;
	
	@Transactional
	public void add(ContinueLive cl){
		mapper.add(cl);
	}
}
