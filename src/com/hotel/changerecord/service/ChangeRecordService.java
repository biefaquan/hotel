package com.hotel.changerecord.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.changerecord.dao.dao.ChangeRecordMapper;
import com.hotel.changerecord.dao.vo.ChangeRecord;

@Service
public class ChangeRecordService {
	@Autowired
	private ChangeRecordMapper mapper;
	@Transactional
	public void add(ChangeRecord cr){
		mapper.add(cr);
	}
}
