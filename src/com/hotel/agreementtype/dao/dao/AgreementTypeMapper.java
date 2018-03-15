package com.hotel.agreementtype.dao.dao;

import java.util.List;

import com.hotel.agreementtype.dao.vo.AgreementType;

public interface AgreementTypeMapper {
	public List<AgreementType> queryAll();
	public AgreementType queryById(int at_id);
	public void add(AgreementType at);
	public void update(AgreementType at);
	public void delete(int at_id);
}
