package com.hotel.bill.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.bill.dao.vo.Bill;

public interface BillMapper {
	public void add(Bill b);
	public List<Bill> queryAllByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int countByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum);
	public Bill queryById(int b_id);
	/**
	 * 
	 * 查询会员消费
	 * @return
	 */
	public List<Bill> queryAll();
	public List<Bill> queryAll1(@Param("startdate") Date startdate,@Param("enddate") Date enddate,@Param("typenum") String typenum);
	/**
	 * 协议单位结账明细
	 * @param startdate
	 * @param endtime
	 * @param typenum
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Bill> queryAgreement(@Param("startdate") Date startdate,@Param("enddate") Date endtime,@Param("typenum") String typenum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int queryCount(@Param("startdate") Date startdate,@Param("enddate") Date enddate,@Param("typenum") String typenum);
	
	public List<Bill> queryAllAgree();
	public void update(Bill b);
	//协议单位，挂账结算条件查询
	public List<Bill> queryDetail(@Param("startdate") Date startdate,@Param("enddate") Date enddate,@Param("state") int state);
}
