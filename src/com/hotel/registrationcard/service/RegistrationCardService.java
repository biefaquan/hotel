package com.hotel.registrationcard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.registrationcard.dao.dao.RegistrationCardMapper;
import com.hotel.registrationcard.dao.vo.RegistrationCard;

@Service
public class RegistrationCardService {
	@Autowired
	private RegistrationCardMapper mapper;
	
	@Transactional
	public void add(RegistrationCard rc){
		mapper.add(rc);
	}
	@Transactional
	public List<RegistrationCard> queryAll(){
		return mapper.queryAll();
	}
	@Transactional
	public List<RegistrationCard> queryByRi_id(int ri_id){
		return mapper.queryByRi_id(ri_id);
	}
	@Transactional
	public void delete(int rc_id){
		mapper.delete(rc_id);
	}
}
