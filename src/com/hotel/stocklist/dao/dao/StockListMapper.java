package com.hotel.stocklist.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.stocklist.dao.vo.StockList;

public interface StockListMapper {
	public void add(StockList sl);
	public List<StockList> queryAll();
	public List<StockList> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public StockList queryById(int sl_id);
	/**
	 * 条件查询  进货单查询
	 */
	public List<StockList> queryByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate);
}
