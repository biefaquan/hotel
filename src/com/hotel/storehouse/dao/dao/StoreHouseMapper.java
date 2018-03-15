package com.hotel.storehouse.dao.dao;

import java.util.List;

import com.hotel.storehouse.dao.vo.StoreHouse;

public interface StoreHouseMapper {
	public void add(StoreHouse sh);
	public List<StoreHouse> queryAll();
	public StoreHouse queryById(int sh_id);
	public void update(StoreHouse sh);
}
