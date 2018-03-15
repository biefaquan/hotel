package com.hotel.moneyrecord.dao.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.member.dao.vo.Member;
import com.hotel.user.dao.vo.User;

public class MoneyRecord {
	private int mr_id;
	private Member m;			//会员
	private String mr_paytype;  //支付方式
	private int mr_money;		//充值金额
	private User u;			//操作人
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mr_date;		//充值时间
	/**
	 * @return the mr_id
	 */
	public int getMr_id() {
		return mr_id;
	}
	/**
	 * @param mr_id the mr_id to set
	 */
	public void setMr_id(int mr_id) {
		this.mr_id = mr_id;
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
	 * @return the mr_paytype
	 */
	public String getMr_paytype() {
		return mr_paytype;
	}
	/**
	 * @param mr_paytype the mr_paytype to set
	 */
	public void setMr_paytype(String mr_paytype) {
		this.mr_paytype = mr_paytype;
	}
	/**
	 * @return the mr_money
	 */
	public int getMr_money() {
		return mr_money;
	}
	/**
	 * @param mr_money the mr_money to set
	 */
	public void setMr_money(int mr_money) {
		this.mr_money = mr_money;
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
	 * @return the mr_date
	 */
	public Date getMr_date() {
		return mr_date;
	}
	/**
	 * @param mr_date the mr_date to set
	 */
	public void setMr_date(Date mr_date) {
		this.mr_date = mr_date;
	}
	
}
