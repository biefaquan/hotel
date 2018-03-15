package com.hotel.agreement.dao.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.agreementtype.dao.vo.AgreementType;
import com.hotel.user.dao.vo.User;

public class Agreement {
	private int a_id;
	private String a_cardnum;    //协议编号
	private String a_name;			 //单位名称	
	private AgreementType at;		//协议类别（外键）
	private String a_username;		//联系人		
	private String a_userphone;		//联系电话	
	private int a_accountstate;	//是否挂账（0不可挂账，1可挂账）
	private int a_deptmoney;	//欠账金额
	private int a_accountmoney;	//挂账限额	
	private String a_adress;		//地址		
	private User u;			//操作员（外键）	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date a_startdate;		//生效时间	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date a_enddate;		//失效时间	
	private String a_reward;    //备注
	private int a_discountrate;  //折扣率		
	private int a_state;			//状态（0停用，1启用） 
	/**
	 * @return the a_id
	 */
	public int getA_id() {
		return a_id;
	}
	/**
	 * @param a_id the a_id to set
	 */
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	/**
	 * @return the a_cardnum
	 */
	public String getA_cardnum() {
		return a_cardnum;
	}
	/**
	 * @param a_cardnum the a_cardnum to set
	 */
	public void setA_cardnum(String a_cardnum) {
		this.a_cardnum = a_cardnum;
	}
	/**
	 * @return the a_name
	 */
	public String getA_name() {
		return a_name;
	}
	/**
	 * @param a_name the a_name to set
	 */
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	/**
	 * @return the at
	 */
	public AgreementType getAt() {
		return at;
	}
	/**
	 * @param at the at to set
	 */
	public void setAt(AgreementType at) {
		this.at = at;
	}
	/**
	 * @return the a_username
	 */
	public String getA_username() {
		return a_username;
	}
	/**
	 * @param a_username the a_username to set
	 */
	public void setA_username(String a_username) {
		this.a_username = a_username;
	}
	/**
	 * @return the a_userphone
	 */
	public String getA_userphone() {
		return a_userphone;
	}
	/**
	 * @param a_userphone the a_userphone to set
	 */
	public void setA_userphone(String a_userphone) {
		this.a_userphone = a_userphone;
	}
	/**
	 * @return the a_accountstate
	 */
	public int getA_accountstate() {
		return a_accountstate;
	}
	/**
	 * @param a_accountstate the a_accountstate to set
	 */
	public void setA_accountstate(int a_accountstate) {
		this.a_accountstate = a_accountstate;
	}
	/**
	 * @return the a_deptmoney
	 */
	public int getA_deptmoney() {
		return a_deptmoney;
	}
	/**
	 * @param a_deptmoney the a_deptmoney to set
	 */
	public void setA_deptmoney(int a_deptmoney) {
		this.a_deptmoney = a_deptmoney;
	}
	/**
	 * @return the a_accountmoney
	 */
	public int getA_accountmoney() {
		return a_accountmoney;
	}
	/**
	 * @param a_accountmoney the a_accountmoney to set
	 */
	public void setA_accountmoney(int a_accountmoney) {
		this.a_accountmoney = a_accountmoney;
	}
	/**
	 * @return the a_adress
	 */
	public String getA_adress() {
		return a_adress;
	}
	/**
	 * @param a_adress the a_adress to set
	 */
	public void setA_adress(String a_adress) {
		this.a_adress = a_adress;
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
	 * @return the a_startdate
	 */
	public Date getA_startdate() {
		return a_startdate;
	}
	/**
	 * @param a_startdate the a_startdate to set
	 */
	public void setA_startdate(Date a_startdate) {
		this.a_startdate = a_startdate;
	}
	/**
	 * @return the a_enddate
	 */
	public Date getA_enddate() {
		return a_enddate;
	}
	/**
	 * @param a_enddate the a_enddate to set
	 */
	public void setA_enddate(Date a_enddate) {
		this.a_enddate = a_enddate;
	}
	/**
	 * @return the a_reward
	 */
	public String getA_reward() {
		return a_reward;
	}
	/**
	 * @param a_reward the a_reward to set
	 */
	public void setA_reward(String a_reward) {
		this.a_reward = a_reward;
	}
	/**
	 * @return the a_discountrate
	 */
	public int getA_discountrate() {
		return a_discountrate;
	}
	/**
	 * @param a_discountrate the a_discountrate to set
	 */
	public void setA_discountrate(int a_discountrate) {
		this.a_discountrate = a_discountrate;
	}
	/**
	 * @return the a_state
	 */
	public int getA_state() {
		return a_state;
	}
	/**
	 * @param a_state the a_state to set
	 */
	public void setA_state(int a_state) {
		this.a_state = a_state;
	}
	
}
