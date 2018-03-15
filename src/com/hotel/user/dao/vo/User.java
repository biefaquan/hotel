package com.hotel.user.dao.vo;

import java.util.Date;

import com.hotel.dept.dao.vo.Dept;

public class User {
	private int	u_id;
	private int u_jobnum;     //工号
	private String	u_name;  //姓名
	private String	u_sex; //性别
	private Dept d;        //部门
	private String	u_position;  //职位
	private String	u_idcard; //身份证
	private String u_school;  //学历
	private String	u_adress; //地址
	private String	u_phone; //电话
	private Date u_date; //入职日期
	private String  u_password; //密码
	private int u_state;    //状态
	/**
	 * @return the u_id
	 */
	public int getU_id() {
		return u_id;
	}
	/**
	 * @param u_id the u_id to set
	 */
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	/**
	 * @return the u_jobnum
	 */
	public int getU_jobnum() {
		return u_jobnum;
	}
	/**
	 * @param u_jobnum the u_jobnum to set
	 */
	public void setU_jobnum(int u_jobnum) {
		this.u_jobnum = u_jobnum;
	}
	/**
	 * @return the u_name
	 */
	public String getU_name() {
		return u_name;
	}
	/**
	 * @param u_name the u_name to set
	 */
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	/**
	 * @return the u_sex
	 */
	public String getU_sex() {
		return u_sex;
	}
	/**
	 * @param u_sex the u_sex to set
	 */
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	/**
	 * @return the d
	 */
	public Dept getD() {
		return d;
	}
	/**
	 * @param d the d to set
	 */
	public void setD(Dept d) {
		this.d = d;
	}
	/**
	 * @return the u_position
	 */
	public String getU_position() {
		return u_position;
	}
	/**
	 * @param u_position the u_position to set
	 */
	public void setU_position(String u_position) {
		this.u_position = u_position;
	}
	/**
	 * @return the u_idcard
	 */
	public String getU_idcard() {
		return u_idcard;
	}
	/**
	 * @param u_idcard the u_idcard to set
	 */
	public void setU_idcard(String u_idcard) {
		this.u_idcard = u_idcard;
	}
	/**
	 * @return the u_school
	 */
	public String getU_school() {
		return u_school;
	}
	/**
	 * @param u_school the u_school to set
	 */
	public void setU_school(String u_school) {
		this.u_school = u_school;
	}
	/**
	 * @return the u_adress
	 */
	public String getU_adress() {
		return u_adress;
	}
	/**
	 * @param u_adress the u_adress to set
	 */
	public void setU_adress(String u_adress) {
		this.u_adress = u_adress;
	}
	/**
	 * @return the u_phone
	 */
	public String getU_phone() {
		return u_phone;
	}
	/**
	 * @param u_phone the u_phone to set
	 */
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	/**
	 * @return the u_date
	 */
	public Date getU_date() {
		return u_date;
	}
	/**
	 * @param u_date the u_date to set
	 */
	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}
	/**
	 * @return the u_password
	 */
	public String getU_password() {
		return u_password;
	}
	/**
	 * @param u_password the u_password to set
	 */
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	/**
	 * @return the u_state
	 */
	public int getU_state() {
		return u_state;
	}
	/**
	 * @param u_state the u_state to set
	 */
	public void setU_state(int u_state) {
		this.u_state = u_state;
	}
	
}
