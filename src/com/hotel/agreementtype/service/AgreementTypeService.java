package com.hotel.agreementtype.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.agreementtype.dao.dao.AgreementTypeMapper;
import com.hotel.agreementtype.dao.vo.AgreementType;

@Service
public class AgreementTypeService {
	@Autowired
	private AgreementTypeMapper mapper;
	
	@Transactional
	public List<AgreementType> queryAll(){
		return mapper.queryAll();
	}
	@Transactional
	public AgreementType queryById(int at_id){
		return mapper.queryById(at_id);
	}
	@Transactional
	public void add(AgreementType at){
		mapper.add(at);
	}
	@Transactional
	public void update(AgreementType at){
		mapper.update(at);
	}
	@Transactional
	public void delete(int at_id){
		mapper.delete(at_id);
	}
}
