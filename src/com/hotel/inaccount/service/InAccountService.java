package com.hotel.inaccount.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.inaccount.dao.dao.InAccountMapper;
import com.hotel.inaccount.dao.vo.InAccount;
@Service
public class InAccountService {
	@Autowired
	private InAccountMapper mapper;
	
	@Transactional
	public void add(InAccount ia){
		mapper.add(ia);
	}
	
	@Transactional
	public InAccount queryByRoomAndDate(InAccount ia){
		return mapper.queryByRoomAndDate(ia);
	}
	
	@Transactional
	public List<InAccount> queryAll(){
		return mapper.queryAll();
	}
	@Transactional
	public List<InAccount> queryAllByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize)//查询所有，根据时间或者房号
	{
		return mapper.queryAllByReason(starttime, endtime, roomnum, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(@Param("starttime") Date starttime,@Param("endtime") Date endtime,@Param("roomnum") int roomnum){
		return mapper.countByReason(starttime, endtime, roomnum);
	}
	
	@Transactional
	public List<InAccount> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
}
