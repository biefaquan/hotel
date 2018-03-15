package com.hotel.agreementtype.dao.vo;

public class AgreementType {  //协议类别
	private int at_id;
	private String at_name;  //协议名称
	/**
	 * @return the at_id
	 */
	public int getAt_id() {
		return at_id;
	}
	/**
	 * @param at_id the at_id to set
	 */
	public void setAt_id(int at_id) {
		this.at_id = at_id;
	}
	/**
	 * @return the at_name
	 */
	public String getAt_name() {
		return at_name;
	}
	/**
	 * @param at_name the at_name to set
	 */
	public void setAt_name(String at_name) {
		this.at_name = at_name;
	}
	
}
