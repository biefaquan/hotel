package com.hotel.reserveroom.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.reserveroom.dao.vo.ReserveRoom;

public interface ReserveRoomMapper {
	public void add(ReserveRoom rr);
	public List<ReserveRoom> queryAll();
	public List<ReserveRoom> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public ReserveRoom queryById(int rr_id);
	public ReserveRoom queryById1(int rr_id);
	public void update(ReserveRoom rr);
	public void delete(int rr_id);
	/**
	 * 条件查询 预订界面
	 */
	public List<ReserveRoom> queryByReason(@Param("startdate")Date startdate,@Param("enddate") Date enddate,@Param("rr_name")String rr_name,@Param("rr_state")int rr_state,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("startdate")Date startdate,@Param("enddate") Date enddate,@Param("rr_name")String rr_name,@Param("rr_state")int rr_state);
}
