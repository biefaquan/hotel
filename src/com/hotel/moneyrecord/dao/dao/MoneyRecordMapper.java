package com.hotel.moneyrecord.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.moneyrecord.dao.vo.MoneyRecord;

public interface MoneyRecordMapper {
	public void add(MoneyRecord mr);
	public List<MoneyRecord> queryAllByReason(@Param("startdate") Date startdate,@Param("enddate") Date enddate,@Param("typenum") String typenum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int countByReason(@Param("startdate") Date startdate,@Param("enddate") Date enddate,@Param("typenum") String typenum);
}
