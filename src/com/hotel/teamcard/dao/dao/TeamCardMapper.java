package com.hotel.teamcard.dao.dao;

import java.util.List;

import com.hotel.teamcard.dao.vo.TeamCard;

public interface TeamCardMapper {
	public void add(TeamCard tc);
	public List<TeamCard> queryAll();
	public List<TeamCard> queryByTi_id(int ti_id);
	public TeamCard queryById(int tc_id);
	public void update(TeamCard tc);
	public int statecount(int ti_id);
	public void delete(int tc_id);
}
