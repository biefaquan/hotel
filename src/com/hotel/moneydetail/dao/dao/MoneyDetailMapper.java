package com.hotel.moneydetail.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.moneydetail.dao.vo.MoneyDetail;

public interface MoneyDetailMapper {
	public void add(MoneyDetail md);
	public List<MoneyDetail> queryAllByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("type") String type,@Param("paytype")String paytype,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者类型和支付方式
	public int countByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("type") String type,@Param("paytype")String paytype);
	
}
