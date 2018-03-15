package com.hotel.util;

import java.util.Date;
import com.hotel.user.dao.vo.User;
/**
 * 收银明细辅助表
 * @author bfq
 *
 */
public class Supple {
	private int id;
	private int roomnum;
	private String type;
	private String paytype;
	private int money;
	private User u;
	private Date starttime;
	private String reward;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the roomnum
	 */
	public int getRoomnum() {
		return roomnum;
	}
	/**
	 * @param roomnum the roomnum to set
	 */
	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the paytype
	 */
	public String getPaytype() {
		return paytype;
	}
	/**
	 * @param paytype the paytype to set
	 */
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	/**
	 * @return the money
	 */
	public int getMoney() {
		return money;
	}
	/**
	 * @param money the money to set
	 */
	public void setMoney(int money) {
		this.money = money;
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
	 * @return the starttime
	 */
	public Date getStarttime() {
		return starttime;
	}
	/**
	 * @param starttime the starttime to set
	 */
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	/**
	 * @return the reward
	 */
	public String getReward() {
		return reward;
	}
	/**
	 * @param reward the reward to set
	 */
	public void setReward(String reward) {
		this.reward = reward;
	}
	
}
