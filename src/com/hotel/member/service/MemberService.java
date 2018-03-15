package com.hotel.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.member.dao.dao.MemberMapper;
import com.hotel.member.dao.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Transactional
	public void add(Member m){
		mapper.add(m);
	}
	@Transactional
	public List<Member> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	@Transactional
	public int count(){
		return mapper.count();
	}
	@Transactional
	public Member queryById(int m_id){
		return mapper.queryById(m_id);
	}
	@Transactional
	public Member queryByC_Id(int c_id){
		return mapper.queryByC_Id(c_id);
	}
	@Transactional
	public void update(Member m){
		mapper.update(m);
	}
	@Transactional
	public void delete(int m_id){
		mapper.delete(m_id);
	}
	@Transactional
	public Member queryByCardnum(String m_cardnum){
		return mapper.queryByCardnum(m_cardnum);
	}
	@Transactional
	public List<Member> queryAll(){
		return mapper.queryAll();
	}
	//条件查询
	@Transactional
	public List<Member> queryByReason(String m_name,int m_state,int pageNo,int pageSize){
		return mapper.queryByReason(m_name, m_state, pageNo, pageSize);
	}
	
	@Transactional
	public int countByReason(String m_name,int m_state){
		return mapper.countByReason(m_name, m_state);
	}
}
