package com.hotel.registrationinfor.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.registrationinfor.dao.vo.RegistrationInfor;

public interface RegistrationInforMapper {
	public void add(RegistrationInfor ri);
	public List<RegistrationInfor> queryAll();
	public List<RegistrationInfor> queryAllByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int countByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum);
	public List<RegistrationInfor> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public RegistrationInfor queryById(int ri_id);
	public void updatestate(@Param("ri_state")int ri_state,@Param("ri_id")int ri_id);
	public void update(RegistrationInfor ri);
	//客人界面条件查询
	public List<RegistrationInfor> queryAllDetail(@Param("state") int state,@Param("source") int source,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);//查询所有，根据时间或者房号
	public int countDetail(@Param("state") int state,@Param("source") int source);
	
}
