package com.hotel.customer.dao.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Customer {  //客人信息
	private int c_id;
	private String c_name;	
	private String c_sex;
	private String c_idtype;	//证件类型
	private String c_idcard;	//证件号码
	private String c_phone;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date c_birthday;
	private String c_like;		//爱好
	private String c_adress;	
	private String c_reward;	//备注
	private String c_nation;	//民族
	//在团队开房时，附上选择的房间ID
	private int r_id;
	/**
	 * @return the c_id
	 */
	public int getC_id() {
		return c_id;
	}
	/**
	 * @param c_id the c_id to set
	 */
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	/**
	 * @return the c_name
	 */
	public String getC_name() {
		return c_name;
	}
	/**
	 * @param c_name the c_name to set
	 */
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	/**
	 * @return the c_sex
	 */
	public String getC_sex() {
		return c_sex;
	}
	/**
	 * @param c_sex the c_sex to set
	 */
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	/**
	 * @return the c_idtype
	 */
	public String getC_idtype() {
		return c_idtype;
	}
	/**
	 * @param c_idtype the c_idtype to set
	 */
	public void setC_idtype(String c_idtype) {
		this.c_idtype = c_idtype;
	}
	/**
	 * @return the c_idcard
	 */
	public String getC_idcard() {
		return c_idcard;
	}
	/**
	 * @param c_idcard the c_idcard to set
	 */
	public void setC_idcard(String c_idcard) {
		this.c_idcard = c_idcard;
	}
	/**
	 * @return the c_phone
	 */
	public String getC_phone() {
		return c_phone;
	}
	/**
	 * @param c_phone the c_phone to set
	 */
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	/**
	 * @return the c_birthday
	 */
	public Date getC_birthday() {
		return c_birthday;
	}
	/**
	 * @param c_birthday the c_birthday to set
	 */
	public void setC_birthday(Date c_birthday) {
		this.c_birthday = c_birthday;
	}
	/**
	 * @return the c_like
	 */
	public String getC_like() {
		return c_like;
	}
	/**
	 * @param c_like the c_like to set
	 */
	public void setC_like(String c_like) {
		this.c_like = c_like;
	}
	/**
	 * @return the c_adress
	 */
	public String getC_adress() {
		return c_adress;
	}
	/**
	 * @param c_adress the c_adress to set
	 */
	public void setC_adress(String c_adress) {
		this.c_adress = c_adress;
	}
	/**
	 * @return the c_reward
	 */
	public String getC_reward() {
		return c_reward;
	}
	/**
	 * @param c_reward the c_reward to set
	 */
	public void setC_reward(String c_reward) {
		this.c_reward = c_reward;
	}
	/**
	 * @return the c_nation
	 */
	public String getC_nation() {
		return c_nation;
	}
	/**
	 * @param c_nation the c_nation to set
	 */
	public void setC_nation(String c_nation) {
		this.c_nation = c_nation;
	}
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
	
	
}
