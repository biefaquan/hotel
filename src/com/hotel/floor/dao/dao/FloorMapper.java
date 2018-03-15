package com.hotel.floor.dao.dao;

import java.util.List;

import com.hotel.floor.dao.vo.Floor;

public interface FloorMapper {
	public List<Floor> queryAll();
	public Floor queryById(int f_id);
	public void add(Floor f);
	public void update(Floor f);
	public void delete(int f_id);
}
