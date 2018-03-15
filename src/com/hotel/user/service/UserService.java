package com.hotel.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.user.dao.dao.UserMapper;
import com.hotel.user.dao.vo.User;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	@Transactional
	public User queryByName(String name){
		return mapper.queryByName(name);
	}
	
	@Transactional
	public void updatepassword(User u){
		mapper.updatepassword(u);
	}
	
	@Transactional
	public List<User> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public List<User> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo,pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public void add(User u){
		mapper.add(u);
	}
	
	@Transactional
	public User queryById(int u_id){
		return mapper.queryById(u_id);
	}
	
	@Transactional
	public void update(User u){
		mapper.update(u);
	}
	
	@Transactional
	public void delete(int u_id){
		mapper.delete(u_id);
	}
	@Transactional
	public List<User> queryByReason(int u_state,String u_name,int pageNo,int pageSize){
		return mapper.queryByReason(u_state, u_name, pageNo, pageSize);
	}
	public int countByReason(int u_state,String u_name){
		return mapper.countByReason(u_state, u_name);
	}
}
