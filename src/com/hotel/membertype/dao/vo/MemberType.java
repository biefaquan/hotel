package com.hotel.membertype.dao.vo;

public class MemberType {
	private int mt_id;
	private String mt_name;  			//会员类型名称
	private int mt_discountrate;		//会员折扣率
	/**
	 * @return the mt_id
	 */
	public int getMt_id() {
		return mt_id;
	}
	/**
	 * @param mt_id the mt_id to set
	 */
	public void setMt_id(int mt_id) {
		this.mt_id = mt_id;
	}
	/**
	 * @return the mt_name
	 */
	public String getMt_name() {
		return mt_name;
	}
	/**
	 * @param mt_name the mt_name to set
	 */
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	/**
	 * @return the mt_discountrate
	 */
	public int getMt_discountrate() {
		return mt_discountrate;
	}
	/**
	 * @param mt_discountrate the mt_discountrate to set
	 */
	public void setMt_discountrate(int mt_discountrate) {
		this.mt_discountrate = mt_discountrate;
	}
	
}
