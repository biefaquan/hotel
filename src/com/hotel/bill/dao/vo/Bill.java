package com.hotel.bill.dao.vo;

import java.util.Date;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.room.dao.vo.Room;
import com.hotel.user.dao.vo.User;

public class Bill {
	private int b_id;
	private Room r;			//房间ID		
	private Customer c;		//住客		
	private String b_source;	//客人类型	（自入，会员，协议单位）
	private String b_typenum;	//会员卡号/协议	
	private String b_keyway;	//开房方式	
	private Date b_starttime;	//开始时间	
	private Date b_endtime;		//结束时间	
	private int b_allmoney;		//消费金额	
	private int b_receivedmoney;	//已收金额	
	private int b_paymoney;		//应收金额	
	private String b_remark;	//备注		
	private String b_paytype;	//支付方式	
	private int b_money;		//收款金额	
	private User u;				//操作员		
	private int b_days;			//天数
	private int b_state;		//挂账结算状态
	/**
	 * @return the b_id
	 */
	public int getB_id() {
		return b_id;
	}
	/**
	 * @param b_id the b_id to set
	 */
	public void setB_id(int b_id) {
		this.b_id = b_id;
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
	 * @return the b_source
	 */
	public String getB_source() {
		return b_source;
	}
	/**
	 * @param b_source the b_source to set
	 */
	public void setB_source(String b_source) {
		this.b_source = b_source;
	}
	/**
	 * @return the b_typenum
	 */
	public String getB_typenum() {
		return b_typenum;
	}
	/**
	 * @param b_typenum the b_typenum to set
	 */
	public void setB_typenum(String b_typenum) {
		this.b_typenum = b_typenum;
	}
	/**
	 * @return the b_keyway
	 */
	public String getB_keyway() {
		return b_keyway;
	}
	/**
	 * @param b_keyway the b_keyway to set
	 */
	public void setB_keyway(String b_keyway) {
		this.b_keyway = b_keyway;
	}
	/**
	 * @return the b_starttime
	 */
	public Date getB_starttime() {
		return b_starttime;
	}
	/**
	 * @param b_starttime the b_starttime to set
	 */
	public void setB_starttime(Date b_starttime) {
		this.b_starttime = b_starttime;
	}
	/**
	 * @return the b_endtime
	 */
	public Date getB_endtime() {
		return b_endtime;
	}
	/**
	 * @param b_endtime the b_endtime to set
	 */
	public void setB_endtime(Date b_endtime) {
		this.b_endtime = b_endtime;
	}
	/**
	 * @return the b_allmoney
	 */
	public int getB_allmoney() {
		return b_allmoney;
	}
	/**
	 * @param b_allmoney the b_allmoney to set
	 */
	public void setB_allmoney(int b_allmoney) {
		this.b_allmoney = b_allmoney;
	}
	/**
	 * @return the b_receivedmoney
	 */
	public int getB_receivedmoney() {
		return b_receivedmoney;
	}
	/**
	 * @param b_receivedmoney the b_receivedmoney to set
	 */
	public void setB_receivedmoney(int b_receivedmoney) {
		this.b_receivedmoney = b_receivedmoney;
	}
	/**
	 * @return the b_paymoney
	 */
	public int getB_paymoney() {
		return b_paymoney;
	}
	/**
	 * @param b_paymoney the b_paymoney to set
	 */
	public void setB_paymoney(int b_paymoney) {
		this.b_paymoney = b_paymoney;
	}
	/**
	 * @return the b_remark
	 */
	public String getB_remark() {
		return b_remark;
	}
	/**
	 * @param b_remark the b_remark to set
	 */
	public void setB_remark(String b_remark) {
		this.b_remark = b_remark;
	}
	/**
	 * @return the b_paytype
	 */
	public String getB_paytype() {
		return b_paytype;
	}
	/**
	 * @param b_paytype the b_paytype to set
	 */
	public void setB_paytype(String b_paytype) {
		this.b_paytype = b_paytype;
	}
	/**
	 * @return the b_money
	 */
	public int getB_money() {
		return b_money;
	}
	/**
	 * @param b_money the b_money to set
	 */
	public void setB_money(int b_money) {
		this.b_money = b_money;
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
	/**
	 * @return the b_days
	 */
	public int getB_days() {
		return b_days;
	}
	/**
	 * @param b_days the b_days to set
	 */
	public void setB_days(int b_days) {
		this.b_days = b_days;
	}
	/**
	 * @return the b_state
	 */
	public int getB_state() {
		return b_state;
	}
	/**
	 * @param b_state the b_state to set
	 */
	public void setB_state(int b_state) {
		this.b_state = b_state;
	}
	
}
