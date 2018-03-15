package com.hotel.inaccount.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.inaccount.dao.vo.InAccount;

public interface InAccountMapper {
	public void add(InAccount ia);
	/**
	 * 根据房间和日期查出数据
	 * @param ia
	 * @return
	 */
	public InAccount queryByRoomAndDate(InAccount ia);
	
	public List<InAccount> queryAll();
	
	public List<InAccount> queryAllByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int countByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum);
	public List<InAccount> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
}
