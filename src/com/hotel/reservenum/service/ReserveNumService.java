package com.hotel.reservenum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.reservenum.dao.dao.ReserveNumMapper;
import com.hotel.reservenum.dao.vo.ReserveNum;

@Service
public class ReserveNumService {
	@Autowired
	private ReserveNumMapper mapper;
	
	@Transactional
	public void add(ReserveNum rn){
		mapper.add(rn);
	}
	
	//根据房间id删除信息
	@Transactional
	public void deleteByR_id(int r_id){
		mapper.deleteByR_id(r_id);
	}
	
	@Transactional
	public List<ReserveNum> queryByRr_id(int rr_id){
		return mapper.queryByRr_id(rr_id);
	}
}
