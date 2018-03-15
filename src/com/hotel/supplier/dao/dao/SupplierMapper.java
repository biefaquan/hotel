package com.hotel.supplier.dao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.supplier.dao.vo.Supplier;

public interface SupplierMapper {
	public void add(Supplier s);
	public List<Supplier> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public List<Supplier> queryAll();
	public int count();
	public Supplier queryById(int s_id);
	public void update(Supplier s);
	public void delete(int s_id);
	/**
	 * 条件查询  供应商界面
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Supplier> queryByReason(@Param("s_name")String s_name,@Param("s_state")int s_state,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("s_name")String s_name,@Param("s_state")int s_state);
}
