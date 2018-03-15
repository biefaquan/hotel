package com.hotel.picklist.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.picklist.dao.vo.PickList;
import com.hotel.stocklist.dao.vo.StockList;

public interface PickListMapper {
	public void add(PickList pl);
	public List<PickList> queryAll();
	public List<PickList> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public PickList queryById(int pl_id);
	/**
	 * 条件查询  领料单查询
	 */
	public List<PickList> queryByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate);
}
