package com.hotel.registrationinfor.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.customer.dao.vo.Customer;
import com.hotel.registrationcard.dao.vo.RegistrationCard;
import com.hotel.room.dao.vo.Room;
import com.hotel.teaminfor.dao.vo.TeamInfor;
import com.hotel.user.dao.vo.User;

public class RegistrationInfor {
	private int ri_id;
	private Room r;			//房间
	private Customer c;		//客人
	private String ri_typenum;	 //会员id/协议id	
	private String ri_source;	//来源		
	private String ri_keyway;	//开房方式	
	private int ri_days;		//预住天数（月/年）
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date ri_opentime;	//开房时间	
	private String ri_paytype;	//支付方式	
	private int ri_depositfee;//押金		
	private User u;		//业务员id	
	private int ri_allmoney;	//总房价		
	private String ri_reward;	//备注	
	private int ri_state;		//状态（1入住，0退房）
	private List<RegistrationCard> rclist; 
	private int ti_id;  //团队入住ID
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date ri_endtime;
	//备用字段
	private int spare; 
	private int spare2;
	private int spare3;
	private int spare4; 
	//辅助字段，数据库中不存在
	private List<Date> datelist;
	/**
	 * @return the ri_id
	 */
	public int getRi_id() {
		return ri_id;
	}
	/**
	 * @param ri_id the ri_id to set
	 */
	public void setRi_id(int ri_id) {
		this.ri_id = ri_id;
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
	 * @return the ri_typenum
	 */
	public String getRi_typenum() {
		return ri_typenum;
	}
	/**
	 * @param ri_typenum the ri_typenum to set
	 */
	public void setRi_typenum(String ri_typenum) {
		this.ri_typenum = ri_typenum;
	}
	/**
	 * @return the ri_source
	 */
	public String getRi_source() {
		return ri_source;
	}
	/**
	 * @param ri_source the ri_source to set
	 */
	public void setRi_source(String ri_source) {
		this.ri_source = ri_source;
	}
	/**
	 * @return the ri_keyway
	 */
	public String getRi_keyway() {
		return ri_keyway;
	}
	/**
	 * @param ri_keyway the ri_keyway to set
	 */
	public void setRi_keyway(String ri_keyway) {
		this.ri_keyway = ri_keyway;
	}
	/**
	 * @return the ri_days
	 */
	public int getRi_days() {
		return ri_days;
	}
	/**
	 * @param ri_days the ri_days to set
	 */
	public void setRi_days(int ri_days) {
		this.ri_days = ri_days;
	}
	/**
	 * @return the ri_opentime
	 */
	public Date getRi_opentime() {
		return ri_opentime;
	}
	/**
	 * @param ri_opentime the ri_opentime to set
	 */
	public void setRi_opentime(Date ri_opentime) {
		this.ri_opentime = ri_opentime;
	}
	/**
	 * @return the ri_paytype
	 */
	public String getRi_paytype() {
		return ri_paytype;
	}
	/**
	 * @param ri_paytype the ri_paytype to set
	 */
	public void setRi_paytype(String ri_paytype) {
		this.ri_paytype = ri_paytype;
	}
	/**
	 * @return the ri_depositfee
	 */
	public int getRi_depositfee() {
		return ri_depositfee;
	}
	/**
	 * @param ri_depositfee the ri_depositfee to set
	 */
	public void setRi_depositfee(int ri_depositfee) {
		this.ri_depositfee = ri_depositfee;
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
	 * @return the ri_allmoney
	 */
	public int getRi_allmoney() {
		return ri_allmoney;
	}
	/**
	 * @param ri_allmoney the ri_allmoney to set
	 */
	public void setRi_allmoney(int ri_allmoney) {
		this.ri_allmoney = ri_allmoney;
	}
	/**
	 * @return the ri_reward
	 */
	public String getRi_reward() {
		return ri_reward;
	}
	/**
	 * @param ri_reward the ri_reward to set
	 */
	public void setRi_reward(String ri_reward) {
		this.ri_reward = ri_reward;
	}
	/**
	 * @return the ri_state
	 */
	public int getRi_state() {
		return ri_state;
	}
	/**
	 * @param ri_state the ri_state to set
	 */
	public void setRi_state(int ri_state) {
		this.ri_state = ri_state;
	}
	/**
	 * @return the rclist
	 */
	public List<RegistrationCard> getRclist() {
		return rclist;
	}
	/**
	 * @param rclist the rclist to set
	 */
	public void setRclist(List<RegistrationCard> rclist) {
		this.rclist = rclist;
	}
	/**
	 * @return the ti_id
	 */
	public int getTi_id() {
		return ti_id;
	}
	/**
	 * @param ti_id the ti_id to set
	 */
	public void setTi_id(int ti_id) {
		this.ti_id = ti_id;
	}
	/**
	 * @return the ri_endtime
	 */
	public Date getRi_endtime() {
		return ri_endtime;
	}
	/**
	 * @param ri_endtime the ri_endtime to set
	 */
	public void setRi_endtime(Date ri_endtime) {
		this.ri_endtime = ri_endtime;
	}
	/**
	 * @return the datelist
	 */
	public List<Date> getDatelist() {
		return datelist;
	}
	/**
	 * @param datelist the datelist to set
	 */
	public void setDatelist(List<Date> datelist) {
		this.datelist = datelist;
	}
	/**
	 * @return the spare
	 */
	public int getSpare() {
		return spare;
	}
	/**
	 * @param spare the spare to set
	 */
	public void setSpare(int spare) {
		this.spare = spare;
	}
	/**
	 * @return the spare2
	 */
	public int getSpare2() {
		return spare2;
	}
	/**
	 * @param spare2 the spare2 to set
	 */
	public void setSpare2(int spare2) {
		this.spare2 = spare2;
	}
	/**
	 * @return the spare3
	 */
	public int getSpare3() {
		return spare3;
	}
	/**
	 * @param spare3 the spare3 to set
	 */
	public void setSpare3(int spare3) {
		this.spare3 = spare3;
	}
	/**
	 * @return the spare4
	 */
	public int getSpare4() {
		return spare4;
	}
	/**
	 * @param spare4 the spare4 to set
	 */
	public void setSpare4(int spare4) {
		this.spare4 = spare4;
	}
	
}
