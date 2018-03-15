package com.hotel.teaminfor.dao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.teaminfor.dao.vo.TeamInfor;

public interface TeamInforMapper {
	public void add(TeamInfor ti);
	public List<TeamInfor> queryAll();
	public TeamInfor queryById(int ti_id);
	public void updatestate(@Param("ti_state")int ti_state,@Param("ti_id")int ti_id);
}
