package com.hotel.moneydetail.dao.vo;

import java.util.Date;

import com.hotel.user.dao.vo.User;

public class MoneyDetail {
	private int md_id;
	private int md_roomnum;
	private String md_type;
	private String md_paytype;
	private int md_money;
	private String md_name;
	private Date md_starttime;
	private String md_reward;
	/**
	 * @return the md_id
	 */
	public int getMd_id() {
		return md_id;
	}
	/**
	 * @param md_id the md_id to set
	 */
	public void setMd_id(int md_id) {
		this.md_id = md_id;
	}
	/**
	 * @return the md_roomnum
	 */
	public int getMd_roomnum() {
		return md_roomnum;
	}
	/**
	 * @param md_roomnum the md_roomnum to set
	 */
	public void setMd_roomnum(int md_roomnum) {
		this.md_roomnum = md_roomnum;
	}
	/**
	 * @return the md_type
	 */
	public String getMd_type() {
		return md_type;
	}
	/**
	 * @param md_type the md_type to set
	 */
	public void setMd_type(String md_type) {
		this.md_type = md_type;
	}
	/**
	 * @return the md_paytype
	 */
	public String getMd_paytype() {
		return md_paytype;
	}
	/**
	 * @param md_paytype the md_paytype to set
	 */
	public void setMd_paytype(String md_paytype) {
		this.md_paytype = md_paytype;
	}
	/**
	 * @return the md_money
	 */
	public int getMd_money() {
		return md_money;
	}
	/**
	 * @param md_money the md_money to set
	 */
	public void setMd_money(int md_money) {
		this.md_money = md_money;
	}
	/**
	 * @return the md_name
	 */
	public String getMd_name() {
		return md_name;
	}
	/**
	 * @param md_name the md_name to set
	 */
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	/**
	 * @return the md_starttime
	 */
	public Date getMd_starttime() {
		return md_starttime;
	}
	/**
	 * @param md_starttime the md_starttime to set
	 */
	public void setMd_starttime(Date md_starttime) {
		this.md_starttime = md_starttime;
	}
	/**
	 * @return the md_reward
	 */
	public String getMd_reward() {
		return md_reward;
	}
	/**
	 * @param md_reward the md_reward to set
	 */
	public void setMd_reward(String md_reward) {
		this.md_reward = md_reward;
	}
	
}
