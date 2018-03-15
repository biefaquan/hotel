package com.hotel.agreement.dao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.agreement.dao.vo.Agreement;

public interface AgreementMapper {
	public List<Agreement> queryAll();
	public List<Agreement> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public Agreement queryById(int a_id);
	public Agreement queryByCardnum(String a_cardnum);
	public void add(Agreement a);
	public void update(Agreement a);
	public void delete(int a_id);
	public int count();
	public List<Agreement> queryByReason(@Param("a_name")String a_name,@Param("a_username")String a_username,@Param("a_state")int a_state,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("a_name")String a_name,@Param("a_username")String a_username,@Param("a_state")int a_state);
}
