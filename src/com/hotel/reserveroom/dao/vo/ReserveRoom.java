package com.hotel.reserveroom.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.reservenum.dao.vo.ReserveNum;
import com.hotel.user.dao.vo.User;

public class ReserveRoom {
	private int rr_id;			//id  		
	private String rr_name;		//预订人		
	private String rr_phone;		//预订电话	
	private String rr_source;		//客人来源	
	private String rr_typenum;		//会员卡号/协议	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rr_startdate;	//来店时间	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rr_enddate;		//离店时间	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rr_nowdate;		//留店时间	
	private String rr_keyway;		//开房方式	
	private String rr_guarantystyle;	//担保方式	
	private String rr_paytype;			//支付方式	
	private int rr_depositfee;		//定金		
	private String rr_reward;			//备注	
	private User u;					//业务员
	private int rr_state;			//状态(0取消预住，1预住，2转入住)
	private List<ReserveNum> rnlist;			//预住房间列表
	private int spare;				//备用字段
	/**
	 * @return the rr_id
	 */
	public int getRr_id() {
		return rr_id;
	}
	/**
	 * @param rr_id the rr_id to set
	 */
	public void setRr_id(int rr_id) {
		this.rr_id = rr_id;
	}
	/**
	 * @return the rr_name
	 */
	public String getRr_name() {
		return rr_name;
	}
	/**
	 * @param rr_name the rr_name to set
	 */
	public void setRr_name(String rr_name) {
		this.rr_name = rr_name;
	}
	/**
	 * @return the rr_phone
	 */
	public String getRr_phone() {
		return rr_phone;
	}
	/**
	 * @param rr_phone the rr_phone to set
	 */
	public void setRr_phone(String rr_phone) {
		this.rr_phone = rr_phone;
	}
	/**
	 * @return the rr_source
	 */
	public String getRr_source() {
		return rr_source;
	}
	/**
	 * @param rr_source the rr_source to set
	 */
	public void setRr_source(String rr_source) {
		this.rr_source = rr_source;
	}
	/**
	 * @return the rr_typenum
	 */
	public String getRr_typenum() {
		return rr_typenum;
	}
	/**
	 * @param rr_typenum the rr_typenum to set
	 */
	public void setRr_typenum(String rr_typenum) {
		this.rr_typenum = rr_typenum;
	}
	/**
	 * @return the rr_startdate
	 */
	public Date getRr_startdate() {
		return rr_startdate;
	}
	/**
	 * @param rr_startdate the rr_startdate to set
	 */
	public void setRr_startdate(Date rr_startdate) {
		this.rr_startdate = rr_startdate;
	}
	/**
	 * @return the rr_enddate
	 */
	public Date getRr_enddate() {
		return rr_enddate;
	}
	/**
	 * @param rr_enddate the rr_enddate to set
	 */
	public void setRr_enddate(Date rr_enddate) {
		this.rr_enddate = rr_enddate;
	}
	/**
	 * @return the rr_nowdate
	 */
	public Date getRr_nowdate() {
		return rr_nowdate;
	}
	/**
	 * @param rr_nowdate the rr_nowdate to set
	 */
	public void setRr_nowdate(Date rr_nowdate) {
		this.rr_nowdate = rr_nowdate;
	}
	/**
	 * @return the rr_keyway
	 */
	public String getRr_keyway() {
		return rr_keyway;
	}
	/**
	 * @param rr_keyway the rr_keyway to set
	 */
	public void setRr_keyway(String rr_keyway) {
		this.rr_keyway = rr_keyway;
	}
	/**
	 * @return the rr_guarantystyle
	 */
	public String getRr_guarantystyle() {
		return rr_guarantystyle;
	}
	/**
	 * @param rr_guarantystyle the rr_guarantystyle to set
	 */
	public void setRr_guarantystyle(String rr_guarantystyle) {
		this.rr_guarantystyle = rr_guarantystyle;
	}
	/**
	 * @return the rr_paytype
	 */
	public String getRr_paytype() {
		return rr_paytype;
	}
	/**
	 * @param rr_paytype the rr_paytype to set
	 */
	public void setRr_paytype(String rr_paytype) {
		this.rr_paytype = rr_paytype;
	}
	/**
	 * @return the rr_depositfee
	 */
	public int getRr_depositfee() {
		return rr_depositfee;
	}
	/**
	 * @param rr_depositfee the rr_depositfee to set
	 */
	public void setRr_depositfee(int rr_depositfee) {
		this.rr_depositfee = rr_depositfee;
	}
	/**
	 * @return the rr_reward
	 */
	public String getRr_reward() {
		return rr_reward;
	}
	/**
	 * @param rr_reward the rr_reward to set
	 */
	public void setRr_reward(String rr_reward) {
		this.rr_reward = rr_reward;
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
	 * @return the rr_state
	 */
	public int getRr_state() {
		return rr_state;
	}
	/**
	 * @param rr_state the rr_state to set
	 */
	public void setRr_state(int rr_state) {
		this.rr_state = rr_state;
	}
	/**
	 * @return the rnlist
	 */
	public List<ReserveNum> getRnlist() {
		return rnlist;
	}
	/**
	 * @param rnlist the rnlist to set
	 */
	public void setRnlist(List<ReserveNum> rnlist) {
		this.rnlist = rnlist;
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
	
}
