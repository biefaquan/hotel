package com.hotel.reservenum.dao.vo;

import com.hotel.reserveroom.dao.vo.ReserveRoom;
import com.hotel.room.dao.vo.Room;

public class ReserveNum {
	private int rn_id;		//id		
	private Room r;		//房间id		
	private ReserveRoom rr;		//预订信息表id	
	/**
	 * @return the rn_id
	 */
	public int getRn_id() {
		return rn_id;
	}
	/**
	 * @param rn_id the rn_id to set
	 */
	public void setRn_id(int rn_id) {
		this.rn_id = rn_id;
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
	 * @return the rr
	 */
	public ReserveRoom getRr() {
		return rr;
	}
	/**
	 * @param rr the rr to set
	 */
	public void setRr(ReserveRoom rr) {
		this.rr = rr;
	}
	
}
