package com.hotel.membertype.dao.dao;

import java.util.List;

import com.hotel.membertype.dao.vo.MemberType;

public interface MemberTypeMapper {
	public void add(MemberType mt);
	public List<MemberType> queryAll();
	public MemberType queryById(int mt_id);
	public void update(MemberType mt);
	public void delete(int mt_id);
}
