package com.hotel.membertype.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.membertype.dao.dao.MemberTypeMapper;
import com.hotel.membertype.dao.vo.MemberType;

@Service
public class MemberTypeService {
	@Autowired
	private MemberTypeMapper mapper;
	
	@Transactional
	public void add(MemberType mt){
		mapper.add(mt);
	}
	@Transactional
	public List<MemberType> queryAll(){
		return mapper.queryAll();
	}
	@Transactional
	public MemberType queryById(int mt_id){
		return mapper.queryById(mt_id);
	}
	@Transactional
	public void update(MemberType mt){
		mapper.update(mt);
	}
	@Transactional
	public void delete(int mt_id){
		mapper.delete(mt_id);
	}
}
