package com.hotel.room.dao.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.room.dao.vo.Room;


public interface RoomMapper {
	public List<Room> queryByAll(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public List<Room> queryAll();
	public List<Room> queryAllByRt_id(int rt_id);
	/**
	 * 根据房型查询所有空房
	 * @param rt_id
	 * @return
	 */
	public List<Room> queryAllByRt_id1(int rt_id);
	public Room queryByID(int id);
	public int count();
	public void add(Room r);
	public void delete(int id);
	public void update(Room r);
	public List<Room> queryAllByReason(@Param("f_id")int f_id,@Param("rt_id")int rt_id,@Param("r_state")int r_state,@Param("r_roomnum")String r_roomnum);
}
