package com.hotel.user.dao.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.user.dao.vo.User;

public interface UserMapper {
	public User queryByName(String name);
	public void updatepassword(User u);
	public List<User> queryAll();
	public List<User> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public void add(User u);
	public User queryById(int u_id);
	public void update(User u);
	public void delete(int u_id);
	/**
	 * 条件查询   员工管理
	 */
	public List<User> queryByReason(@Param("u_state") int u_state,@Param("u_name") String u_name,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("u_state") int u_state,@Param("u_name") String u_name);
}
