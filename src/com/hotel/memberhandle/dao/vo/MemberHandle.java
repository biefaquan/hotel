package com.hotel.memberhandle.dao.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.member.dao.vo.Member;
import com.hotel.user.dao.vo.User;

public class MemberHandle {
	private int mh_id;    //ID		
	private Member m;	//会员ID		
	private String mh_handle;  //操作	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mh_date;	//时间		
	private User u;			//操作员		
	private String mh_reward;	//备注	
	/**
	 * @return the mh_id
	 */
	public int getMh_id() {
		return mh_id;
	}
	/**
	 * @param mh_id the mh_id to set
	 */
	public void setMh_id(int mh_id) {
		this.mh_id = mh_id;
	}
	/**
	 * @return the m
	 */
	public Member getM() {
		return m;
	}
	/**
	 * @param m the m to set
	 */
	public void setM(Member m) {
		this.m = m;
	}
	/**
	 * @return the mh_handle
	 */
	public String getMh_handle() {
		return mh_handle;
	}
	/**
	 * @param mh_handle the mh_handle to set
	 */
	public void setMh_handle(String mh_handle) {
		this.mh_handle = mh_handle;
	}
	/**
	 * @return the mh_date
	 */
	public Date getMh_date() {
		return mh_date;
	}
	/**
	 * @param mh_date the mh_date to set
	 */
	public void setMh_date(Date mh_date) {
		this.mh_date = mh_date;
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
	 * @return the mh_reward
	 */
	public String getMh_reward() {
		return mh_reward;
	}
	/**
	 * @param mh_reward the mh_reward to set
	 */
	public void setMh_reward(String mh_reward) {
		this.mh_reward = mh_reward;
	}
	
}
