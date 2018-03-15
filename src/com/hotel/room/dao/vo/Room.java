package com.hotel.room.dao.vo;

import com.hotel.floor.dao.vo.Floor;
import com.hotel.roomtype.dao.vo.RoomType;

public class Room {
	private int r_id;
	private int r_roomnum;   //房间号
	private Floor f;		//楼层
	private RoomType rt;  //房型
	private int r_state;
	/**
	 * @return the r_id
	 */
	public int getR_id() {
		return r_id;
	}
	/**
	 * @param r_id the r_id to set
	 */
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	/**
	 * @return the r_roomnum
	 */
	public int getR_roomnum() {
		return r_roomnum;
	}
	/**
	 * @param r_roomnum the r_roomnum to set
	 */
	public void setR_roomnum(int r_roomnum) {
		this.r_roomnum = r_roomnum;
	}
	/**
	 * @return the f
	 */
	public Floor getF() {
		return f;
	}
	/**
	 * @param f the f to set
	 */
	public void setF(Floor f) {
		this.f = f;
	}
	/**
	 * @return the rt
	 */
	public RoomType getRt() {
		return rt;
	}
	/**
	 * @param rt the rt to set
	 */
	public void setRt(RoomType rt) {
		this.rt = rt;
	}
	/**
	 * @return the r_state
	 */
	public int getR_state() {
		return r_state;
	}
	/**
	 * @param r_state the r_state to set
	 */
	public void setR_state(int r_state) {
		this.r_state = r_state;
	}
	
}
