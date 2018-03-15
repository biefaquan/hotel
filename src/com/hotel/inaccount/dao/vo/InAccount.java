package com.hotel.inaccount.dao.vo;

import java.util.Date;

import com.hotel.room.dao.vo.Room;

public class InAccount {
	private int ia_id;		//ID		
	private Room r;		//房间		
	private String ia_paytype;	//支付方式	
	private String ia_source;	//客源类型	
	private String ia_keyway;	//开房方式	
	private int ia_money;	//入账金额			
	private Date ia_intime;	//入账时间	
	private String ia_name;	//操作员	（系统和操作人员）
	/**
	 * @return the ia_id
	 */
	public int getIa_id() {
		return ia_id;
	}
	/**
	 * @param ia_id the ia_id to set
	 */
	public void setIa_id(int ia_id) {
		this.ia_id = ia_id;
	}
	/**
	 * @return the r
	 */
	public Room getR() {
		return r;
	}
	/**
	 * @param r the r to set
	 */
	public void setR(Room r) {
		this.r = r;
	}
	/**
	 * @return the ia_paytype
	 */
	public String getIa_paytype() {
		return ia_paytype;
	}
	/**
	 * @param ia_paytype the ia_paytype to set
	 */
	public void setIa_paytype(String ia_paytype) {
		this.ia_paytype = ia_paytype;
	}
	/**
	 * @return the ia_source
	 */
	public String getIa_source() {
		return ia_source;
	}
	/**
	 * @param ia_source the ia_source to set
	 */
	public void setIa_source(String ia_source) {
		this.ia_source = ia_source;
	}
	/**
	 * @return the ia_keyway
	 */
	public String getIa_keyway() {
		return ia_keyway;
	}
	/**
	 * @param ia_keyway the ia_keyway to set
	 */
	public void setIa_keyway(String ia_keyway) {
		this.ia_keyway = ia_keyway;
	}
	/**
	 * @return the ia_money
	 */
	public int getIa_money() {
		return ia_money;
	}
	/**
	 * @param ia_money the ia_money to set
	 */
	public void setIa_money(int ia_money) {
		this.ia_money = ia_money;
	}
	/**
	 * @return the ia_intime
	 */
	public Date getIa_intime() {
		return ia_intime;
	}
	/**
	 * @param ia_intime the ia_intime to set
	 */
	public void setIa_intime(Date ia_intime) {
		this.ia_intime = ia_intime;
	}
	/**
	 * @return the ia_name
	 */
	public String getIa_name() {
		return ia_name;
	}
	/**
	 * @param ia_name the ia_name to set
	 */
	public void setIa_name(String ia_name) {
		this.ia_name = ia_name;
	}
	
}
