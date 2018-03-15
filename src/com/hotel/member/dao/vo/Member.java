package com.hotel.member.dao.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.membertype.dao.vo.MemberType;
import com.hotel.user.dao.vo.User;

public class Member {	//会员信息
	private int m_id;
	private String m_cardnum;		//会员卡号
	private MemberType mt;	//会员类型
	private Customer c;				//客人信息
	private int m_money;			//收款金额
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date m_date;			//发卡时间
	private User u;					//操作员信息
	private int m_state;			//状态
	/**
	 * @return the m_id
	 */
	public int getM_id() {
		return m_id;
	}
	/**
	 * @param m_id the m_id to set
	 */
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	/**
	 * @return the m_cardnum
	 */
	public String getM_cardnum() {
		return m_cardnum;
	}
	/**
	 * @param m_cardnum the m_cardnum to set
	 */
	public void setM_cardnum(String m_cardnum) {
		this.m_cardnum = m_cardnum;
	}
	
	/**
	 * @return the mt
	 */
	public MemberType getMt() {
		return mt;
	}
	/**
	 * @param mt the mt to set
	 */
	public void setMt(MemberType mt) {
		this.mt = mt;
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
	 * @return the m_money
	 */
	public int getM_money() {
		return m_money;
	}
	/**
	 * @param m_money the m_money to set
	 */
	public void setM_money(int m_money) {
		this.m_money = m_money;
	}
	/**
	 * @return the m_date
	 */
	public Date getM_date() {
		return m_date;
	}
	/**
	 * @param m_date the m_date to set
	 */
	public void setM_date(Date m_date) {
		this.m_date = m_date;
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
	 * @return the m_state
	 */
	public int getM_state() {
		return m_state;
	}
	/**
	 * @param m_state the m_state to set
	 */
	public void setM_state(int m_state) {
		this.m_state = m_state;
	}
	
}
