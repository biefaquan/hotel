package com.hotel.stockchange.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.returnpick.dao.vo.ReturnPick;
import com.hotel.stockchange.dao.vo.StockChange;

public interface StockChangeMapper {
	public void add(StockChange sc);
	public List<StockChange> queryAll();
	public List<StockChange> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public StockChange queryById(int sc_id);
	/**
	 * 条件查询  库存调拨查询
	 */
	public List<StockChange> queryByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate);
}
