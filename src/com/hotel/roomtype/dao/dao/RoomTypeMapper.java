package com.hotel.roomtype.dao.dao;

import java.util.List;

import com.hotel.roomtype.dao.vo.RoomType;

public interface RoomTypeMapper {
	public List<RoomType> queryAll();
	public RoomType queryById(int rt_id);
	public void add(RoomType rt);
	public void update(RoomType rt);
	public void delete(int rt_id);
}
