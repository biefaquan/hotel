package com.hotel.dept.dao.dao;

import java.util.List;

import com.hotel.dept.dao.vo.Dept;

public interface DeptMapper {
	public List<Dept> queryAll();
	public void add(Dept d);
	public void update(Dept d);
	public void delete(int d_id);
	public Dept queryById(int d_id);
}
