package com.hotel.returnpick.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.picklist.dao.vo.PickList;
import com.hotel.returnpick.dao.vo.ReturnPick;

public interface ReturnPickMapper {
	public void add(ReturnPick rp);
	public List<ReturnPick> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public ReturnPick queryById(int rp_id);
	/**
	 * 条件查询  领料单查询
	 */
	public List<ReturnPick> queryByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("sh_id")int sh_id,@Param("u_id")int u_id,@Param("startdate")Date startdate,@Param("enddate")Date enddate);
}
