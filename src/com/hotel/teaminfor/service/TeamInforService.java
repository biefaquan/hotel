package com.hotel.teaminfor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.teaminfor.dao.dao.TeamInforMapper;
import com.hotel.teaminfor.dao.vo.TeamInfor;

@Service
public class TeamInforService {
	@Autowired
	private TeamInforMapper mapper;
	
	@Transactional
	public void add(TeamInfor ti){
		mapper.add(ti);
	}
	
	@Transactional
	public List<TeamInfor> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public TeamInfor queryById(int ti_id){
		return mapper.queryById(ti_id);
	}
	
	@Transactional
	public void updatestate(int ti_state,int ti_id){
		mapper.updatestate(ti_state, ti_id);
	}
}
