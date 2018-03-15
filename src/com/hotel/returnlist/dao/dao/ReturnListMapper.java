package com.hotel.returnlist.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.returnlist.dao.vo.ReturnList;

public interface ReturnListMapper {
	public void add(ReturnList rl);
	public List<ReturnList> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public ReturnList queryById(int rl_id);
	/**
	 * 条件查询     退货单查询
	 */
	public List<ReturnList> queryByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate);
}
