package com.hotel.changerecord.dao.vo;

import java.util.Date;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.room.dao.vo.Room;
import com.hotel.user.dao.vo.User;

public class ChangeRecord {
	private int cr_id;		//id		
	private int old_r_id;	//现居房间	
	private int new_r_id;	//调换房间	
	private Customer c;		//客人信息	
	private String cr_typenum;	//会员/协议单位	
	private String cr_source;	//来源		
	private String cr_keyway;	//开房方式	
	private Date cr_opentime;	//入住时间	
	private Date cr_nowtime;	//换房时间	
	private int cr_days;		//剩余天数	
	private String cr_reason;	//换房原因	
	private int cr_money;	//差价		
	private User u;		//操作人		
	/**
	 * @return the cr_id
	 */
	public int getCr_id() {
		return cr_id;
	}
	/**
	 * @param cr_id the cr_id to set
	 */
	public void setCr_id(int cr_id) {
		this.cr_id = cr_id;
	}

	/**
	 * @return the old_r_id
	 */
	public int getOld_r_id() {
		return old_r_id;
	}
	/**
	 * @param old_r_id the old_r_id to set
	 */
	public void setOld_r_id(int old_r_id) {
		this.old_r_id = old_r_id;
	}
	/**
	 * @return the new_r_id
	 */
	public int getNew_r_id() {
		return new_r_id;
	}
	/**
	 * @param new_r_id the new_r_id to set
	 */
	public void setNew_r_id(int new_r_id) {
		this.new_r_id = new_r_id;
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
	 * @return the cr_typenum
	 */
	public String getCr_typenum() {
		return cr_typenum;
	}
	/**
	 * @param cr_typenum the cr_typenum to set
	 */
	public void setCr_typenum(String cr_typenum) {
		this.cr_typenum = cr_typenum;
	}
	/**
	 * @return the cr_source
	 */
	public String getCr_source() {
		return cr_source;
	}
	/**
	 * @param cr_source the cr_source to set
	 */
	public void setCr_source(String cr_source) {
		this.cr_source = cr_source;
	}
	/**
	 * @return the cr_keyway
	 */
	public String getCr_keyway() {
		return cr_keyway;
	}
	/**
	 * @param cr_keyway the cr_keyway to set
	 */
	public void setCr_keyway(String cr_keyway) {
		this.cr_keyway = cr_keyway;
	}
	/**
	 * @return the cr_opentime
	 */
	public Date getCr_opentime() {
		return cr_opentime;
	}
	/**
	 * @param cr_opentime the cr_opentime to set
	 */
	public void setCr_opentime(Date cr_opentime) {
		this.cr_opentime = cr_opentime;
	}
	/**
	 * @return the cr_nowtime
	 */
	public Date getCr_nowtime() {
		return cr_nowtime;
	}
	/**
	 * @param cr_nowtime the cr_nowtime to set
	 */
	public void setCr_nowtime(Date cr_nowtime) {
		this.cr_nowtime = cr_nowtime;
	}
	/**
	 * @return the cr_days
	 */
	public int getCr_days() {
		return cr_days;
	}
	/**
	 * @param cr_days the cr_days to set
	 */
	public void setCr_days(int cr_days) {
		this.cr_days = cr_days;
	}
	/**
	 * @return the cr_reason
	 */
	public String getCr_reason() {
		return cr_reason;
	}
	/**
	 * @param cr_reason the cr_reason to set
	 */
	public void setCr_reason(String cr_reason) {
		this.cr_reason = cr_reason;
	}
	/**
	 * @return the cr_money
	 */
	public int getCr_money() {
		return cr_money;
	}
	/**
	 * @param cr_money the cr_money to set
	 */
	public void setCr_money(int cr_money) {
		this.cr_money = cr_money;
	}
	/**
	 * @return the u
	 */
	public User getU() {
		return u;
	}
	/**
	 * @param u the u to set
	 */
	public void setU(User u) {
		this.u = u;
	}
	
}
