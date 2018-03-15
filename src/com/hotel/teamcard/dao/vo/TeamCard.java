package com.hotel.teamcard.dao.vo;

import java.util.Date;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.room.dao.vo.Room;
import com.hotel.teaminfor.dao.vo.TeamInfor;

public class TeamCard {
	private int tc_id;
	private Customer c;		//客人信息	
	private Room r;		//房间id		
	private String tc_keyway;	//开房方式	
	private Date tc_opentime;	//开房方式
	private int tc_days;		//预住天数
	private TeamInfor ti;		//团队信息
	private int tc_money;		//总房钱
	private int tc_state;		//状态
	/**
	 * @return the tc_id
	 */
	public int getTc_id() {
		return tc_id;
	}
	/**
	 * @param tc_id the tc_id to set
	 */
	public void setTc_id(int tc_id) {
		this.tc_id = tc_id;
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
	 * @return the tc_keyway
	 */
	public String getTc_keyway() {
		return tc_keyway;
	}
	/**
	 * @param tc_keyway the tc_keyway to set
	 */
	public void setTc_keyway(String tc_keyway) {
		this.tc_keyway = tc_keyway;
	}
	
	/**
	 * @return the tc_opentime
	 */
	public Date getTc_opentime() {
		return tc_opentime;
	}
	/**
	 * @param tc_opentime the tc_opentime to set
	 */
	public void setTc_opentime(Date tc_opentime) {
		this.tc_opentime = tc_opentime;
	}
	/**
	 * @return the tc_days
	 */
	public int getTc_days() {
		return tc_days;
	}
	/**
	 * @param tc_days the tc_days to set
	 */
	public void setTc_days(int tc_days) {
		this.tc_days = tc_days;
	}
	/**
	 * @return the ti
	 */
	public TeamInfor getTi() {
		return ti;
	}
	/**
	 * @param ti the ti to set
	 */
	public void setTi(TeamInfor ti) {
		this.ti = ti;
	}
	
	/**
	 * @return the tc_money
	 */
	public int getTc_money() {
		return tc_money;
	}
	/**
	 * @param tc_money the tc_money to set
	 */
	public void setTc_money(int tc_money) {
		this.tc_money = tc_money;
	}
	/**
	 * @return the tc_state
	 */
	public int getTc_state() {
		return tc_state;
	}
	/**
	 * @param tc_state the tc_state to set
	 */
	public void setTc_state(int tc_state) {
		this.tc_state = tc_state;
	}
	
}
