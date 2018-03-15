package com.hotel.member.dao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.member.dao.vo.Member;

public interface MemberMapper {
	public void add(Member m);
	public List<Member> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public Member queryById(int m_id);
	public Member queryByC_Id(int c_id);
	public Member queryByCardnum(String m_cardnum);
	public void update(Member m);
	public void delete(int m_id);
	public List<Member> queryAll();
	/**
	 * 条件查询
	 */
	public List<Member> queryByReason(@Param("m_name")String m_name,@Param("m_state")int m_state,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("m_name")String m_name,@Param("m_state")int m_state);
}
