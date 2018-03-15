package com.hotel.registrationcard.dao.vo;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.registrationinfor.dao.vo.RegistrationInfor;

public class RegistrationCard {		//入住单
	private int rc_id;
	private Customer c;				//客人
	private RegistrationInfor ri;	//入住信息
	/**
	 * @return the rc_id
	 */
	public int getRc_id() {
		return rc_id;
	}
	/**
	 * @param rc_id the rc_id to set
	 */
	public void setRc_id(int rc_id) {
		this.rc_id = rc_id;
	}
	/**
	 * @return the c
	 */
	public Customer getC() {
		return c;
	}
	/**
	 * @param c the c to set
	 */
	public void setC(Customer c) {
		this.c = c;
	}
	/**
	 * @return the ri
	 */
	public RegistrationInfor getRi() {
		return ri;
	}
	/**
	 * @param ri the ri to set
	 */
	public void setRi(RegistrationInfor ri) {
		this.ri = ri;
	}
	
}
