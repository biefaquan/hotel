package com.hotel.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.room.dao.dao.RoomMapper;
import com.hotel.room.dao.vo.Room;

@Service
public class RoomService {
	@Autowired
	private RoomMapper mapper;
	
	@Transactional
	public List<Room> queryByAll(int pageNo,int pageSize){
		return mapper.queryByAll(pageNo,pageSize);
	}
	
	@Transactional
	public List<Room> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<Room> queryAllByRt_id(int rt_id){
		return mapper.queryAllByRt_id(rt_id);
	}
	
	@Transactional
	public Room queryByID(int id){
		return mapper.queryByID(id);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional   //添加客房
	public void add(Room r){
		mapper.add(r);
	}
	
	@Transactional   //删除客房
	public void delete(int id){
		mapper.delete(id);
	}
	
	@Transactional
	public void update(Room r){
		mapper.update(r);
	}
	
	@Transactional
	public List<Room> queryAllByRt_id1(int rt_id){
		return mapper.queryAllByRt_id1(rt_id);
	}
	
	@Transactional
	public List<Room> queryAllByReason(int f_id,int rt_id,int r_state,String roomnum){
		return mapper.queryAllByReason(f_id, rt_id, r_state,roomnum);
	}
}
