package com.hotel.teaminfor.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.teamcard.dao.vo.TeamCard;
import com.hotel.user.dao.vo.User;

public class TeamInfor {
	private int ti_id;
	private String ti_name;		//团名
	private String ti_leadername;     //领队姓名  
	private String ti_leaderphone;		//领队电话	
	private String ti_source;			//来源	
	private String ti_typenum;			//会员卡号/协议
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ti_opentime;			//入住时间
	private int ti_days;				//预住天数	
	private String ti_paytype;		//支付方式	
	private int ti_depositfee;	//押金		
	private User u;			//业务员id	
	private int ti_allmoney;		//总房价		
	private int ti_allroom;		//总房数		
	private int ti_state;       //状态（1入住，0退房）
	private List<TeamCard> tclist;
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
	 * @return the ti_name
	 */
	public String getTi_name() {
		return ti_name;
	}
	/**
	 * @param ti_name the ti_name to set
	 */
	public void setTi_name(String ti_name) {
		this.ti_name = ti_name;
	}
	/**
	 * @return the ti_leadername
	 */
	public String getTi_leadername() {
		return ti_leadername;
	}
	/**
	 * @param ti_leadername the ti_leadername to set
	 */
	public void setTi_leadername(String ti_leadername) {
		this.ti_leadername = ti_leadername;
	}
	/**
	 * @return the ti_leaderphone
	 */
	public String getTi_leaderphone() {
		return ti_leaderphone;
	}
	/**
	 * @param ti_leaderphone the ti_leaderphone to set
	 */
	public void setTi_leaderphone(String ti_leaderphone) {
		this.ti_leaderphone = ti_leaderphone;
	}
	/**
	 * @return the ti_source
	 */
	public String getTi_source() {
		return ti_source;
	}
	/**
	 * @param ti_source the ti_source to set
	 */
	public void setTi_source(String ti_source) {
		this.ti_source = ti_source;
	}
	/**
	 * @return the ti_typenum
	 */
	public String getTi_typenum() {
		return ti_typenum;
	}
	/**
	 * @param ti_typenum the ti_typenum to set
	 */
	public void setTi_typenum(String ti_typenum) {
		this.ti_typenum = ti_typenum;
	}
	/**
	 * @return the ti_opentime
	 */
	public Date getTi_opentime() {
		return ti_opentime;
	}
	/**
	 * @param ti_opentime the ti_opentime to set
	 */
	public void setTi_opentime(Date ti_opentime) {
		this.ti_opentime = ti_opentime;
	}
	/**
	 * @return the ti_days
	 */
	public int getTi_days() {
		return ti_days;
	}
	/**
	 * @param ti_days the ti_days to set
	 */
	public void setTi_days(int ti_days) {
		this.ti_days = ti_days;
	}
	/**
	 * @return the ti_paytype
	 */
	public String getTi_paytype() {
		return ti_paytype;
	}
	/**
	 * @param ti_paytype the ti_paytype to set
	 */
	public void setTi_paytype(String ti_paytype) {
		this.ti_paytype = ti_paytype;
	}
	/**
	 * @return the ti_depositfee
	 */
	public int getTi_depositfee() {
		return ti_depositfee;
	}
	/**
	 * @param ti_depositfee the ti_depositfee to set
	 */
	public void setTi_depositfee(int ti_depositfee) {
		this.ti_depositfee = ti_depositfee;
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
	 * @return the ti_allmoney
	 */
	public int getTi_allmoney() {
		return ti_allmoney;
	}
	/**
	 * @param ti_allmoney the ti_allmoney to set
	 */
	public void setTi_allmoney(int ti_allmoney) {
		this.ti_allmoney = ti_allmoney;
	}
	/**
	 * @return the ti_allroom
	 */
	public int getTi_allroom() {
		return ti_allroom;
	}
	/**
	 * @param ti_allroom the ti_allroom to set
	 */
	public void setTi_allroom(int ti_allroom) {
		this.ti_allroom = ti_allroom;
	}
	/**
	 * @return the ti_state
	 */
	public int getTi_state() {
		return ti_state;
	}
	/**
	 * @param ti_state the ti_state to set
	 */
	public void setTi_state(int ti_state) {
		this.ti_state = ti_state;
	}
	/**
	 * @return the tclist
	 */
	public List<TeamCard> getTclist() {
		return tclist;
	}
	/**
	 * @param tclist the tclist to set
	 */
	public void setTclist(List<TeamCard> tclist) {
		this.tclist = tclist;
	}

}
