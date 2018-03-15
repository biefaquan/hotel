package com.hotel.reservenum.dao.dao;

import java.util.List;

import com.hotel.reservenum.dao.vo.ReserveNum;

public interface ReserveNumMapper {
	public void add(ReserveNum rn);
	public void deleteByR_id(int r_id);
	public List<ReserveNum> queryByRr_id(int rr_id);
}
