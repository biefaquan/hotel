package com.hotel.registrationcard.dao.dao;

import java.util.List;

import com.hotel.registrationcard.dao.vo.RegistrationCard;

public interface RegistrationCardMapper {
	public void add(RegistrationCard rc);
	public List<RegistrationCard> queryAll();
	public List<RegistrationCard> queryByRi_id(int ri_id);
	public void delete(int rc_id);
}
