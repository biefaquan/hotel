package com.hotel.teamcard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.teamcard.dao.dao.TeamCardMapper;
import com.hotel.teamcard.dao.vo.TeamCard;

@Service
public class TeamCardService {
	@Autowired
	private TeamCardMapper mapper;
	
	@Transactional
	public void add(TeamCard tc){
		mapper.add(tc);
	}
	
	@Transactional
	public List<TeamCard> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public TeamCard queryById(int tc_id){
		return mapper.queryById(tc_id);
	}
	
	@Transactional
	public List<TeamCard> queryByTi_id(int ti_id){
		return mapper.queryByTi_id(ti_id);
	}
	
	@Transactional
	public void update(TeamCard tc){
		mapper.update(tc);
	}
	
	@Transactional
	public int statecount(int ti_id){
		return mapper.statecount(ti_id);
	}
	
	@Transactional
	public void delete(int tc_id){
		mapper.delete(tc_id);
	}
}
