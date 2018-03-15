package com.hotel.continuelive.dao.vo;

import java.util.Date;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.room.dao.vo.Room;
import com.hotel.user.dao.vo.User;

/**
 * 续住记录
 * @author bfq
 *
 */
public class ContinueLive {
	private int cl_id;		//id		
	private Room r;		//房间id		
	private Customer c;		//客人信息	
	private String cl_typenum;	//会员/协议单位	
	private String cl_source;	//来源		
	private String cl_keyway;	//开房方式	
	private Date cl_opentime;	//入住时间	
	private Date cl_nowtime;	//续住时间	
	private int cl_days;		//续住天数	
	private String cl_paytype;	//支付方式	
	private int cl_money;	//续住金额	
	private String cl_reward;	//备注		
	private User u;		//操作员		
	/**
	 * @return the cl_id
	 */
	public int getCl_id() {
		return cl_id;
	}
	/**
	 * @param cl_id the cl_id to set
	 */
	public void setCl_id(int cl_id) {
		this.cl_id = cl_id;
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
	 * @return the cl_typenum
	 */
	public String getCl_typenum() {
		return cl_typenum;
	}
	/**
	 * @param cl_typenum the cl_typenum to set
	 */
	public void setCl_typenum(String cl_typenum) {
		this.cl_typenum = cl_typenum;
	}
	/**
	 * @return the cl_source
	 */
	public String getCl_source() {
		return cl_source;
	}
	/**
	 * @param cl_source the cl_source to set
	 */
	public void setCl_source(String cl_source) {
		this.cl_source = cl_source;
	}
	/**
	 * @return the cl_keyway
	 */
	public String getCl_keyway() {
		return cl_keyway;
	}
	/**
	 * @param cl_keyway the cl_keyway to set
	 */
	public void setCl_keyway(String cl_keyway) {
		this.cl_keyway = cl_keyway;
	}
	/**
	 * @return the cl_opentime
	 */
	public Date getCl_opentime() {
		return cl_opentime;
	}
	/**
	 * @param cl_opentime the cl_opentime to set
	 */
	public void setCl_opentime(Date cl_opentime) {
		this.cl_opentime = cl_opentime;
	}
	/**
	 * @return the cl_nowtime
	 */
	public Date getCl_nowtime() {
		return cl_nowtime;
	}
	/**
	 * @param cl_nowtime the cl_nowtime to set
	 */
	public void setCl_nowtime(Date cl_nowtime) {
		this.cl_nowtime = cl_nowtime;
	}
	/**
	 * @return the cl_days
	 */
	public int getCl_days() {
		return cl_days;
	}
	/**
	 * @param cl_days the cl_days to set
	 */
	public void setCl_days(int cl_days) {
		this.cl_days = cl_days;
	}
	/**
	 * @return the cl_paytype
	 */
	public String getCl_paytype() {
		return cl_paytype;
	}
	/**
	 * @param cl_paytype the cl_paytype to set
	 */
	public void setCl_paytype(String cl_paytype) {
		this.cl_paytype = cl_paytype;
	}
	/**
	 * @return the cl_money
	 */
	public int getCl_money() {
		return cl_money;
	}
	/**
	 * @param cl_money the cl_money to set
	 */
	public void setCl_money(int cl_money) {
		this.cl_money = cl_money;
	}
	/**
	 * @return the cl_reward
	 */
	public String getCl_reward() {
		return cl_reward;
	}
	/**
	 * @param cl_reward the cl_reward to set
	 */
	public void setCl_reward(String cl_reward) {
		this.cl_reward = cl_reward;
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
