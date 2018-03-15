package com.hotel.stockchange.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.stockchangedetail.dao.vo.StockChangeDetail;
import com.hotel.user.dao.vo.User;


public class StockChange {
	private int sc_id;		//ID		
	private int sc_insh;		//供应商		
	private int sc_outsh;		//入库仓库	
	private User u;		//经手人
	private String sc_remark;	//摘要		
	private String sc_instruction; //说明		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sc_date;	//单据日期	
	private int sc_money;	//总账		
	private int sc_uid;		//操作员	(user表中的ID)	
	private List<StockChangeDetail> scdlist;
	/**
	 * @return the sc_id
	 */
	public int getSc_id() {
		return sc_id;
	}
	/**
	 * @param sc_id the sc_id to set
	 */
	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}
	/**
	 * @return the sc_insh
	 */
	public int getSc_insh() {
		return sc_insh;
	}
	/**
	 * @param sc_insh the sc_insh to set
	 */
	public void setSc_insh(int sc_insh) {
		this.sc_insh = sc_insh;
	}
	/**
	 * @return the sc_outsh
	 */
	public int getSc_outsh() {
		return sc_outsh;
	}
	/**
	 * @param sc_outsh the sc_outsh to set
	 */
	public void setSc_outsh(int sc_outsh) {
		this.sc_outsh = sc_outsh;
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
	 * @return the sc_remark
	 */
	public String getSc_remark() {
		return sc_remark;
	}
	/**
	 * @param sc_remark the sc_remark to set
	 */
	public void setSc_remark(String sc_remark) {
		this.sc_remark = sc_remark;
	}
	/**
	 * @return the sc_instruction
	 */
	public String getSc_instruction() {
		return sc_instruction;
	}
	/**
	 * @param sc_instruction the sc_instruction to set
	 */
	public void setSc_instruction(String sc_instruction) {
		this.sc_instruction = sc_instruction;
	}
	/**
	 * @return the sc_date
	 */
	public Date getSc_date() {
		return sc_date;
	}
	/**
	 * @param sc_date the sc_date to set
	 */
	public void setSc_date(Date sc_date) {
		this.sc_date = sc_date;
	}
	/**
	 * @return the sc_money
	 */
	public int getSc_money() {
		return sc_money;
	}
	/**
	 * @param sc_money the sc_money to set
	 */
	public void setSc_money(int sc_money) {
		this.sc_money = sc_money;
	}
	/**
	 * @return the sc_uid
	 */
	public int getSc_uid() {
		return sc_uid;
	}
	/**
	 * @param sc_uid the sc_uid to set
	 */
	public void setSc_uid(int sc_uid) {
		this.sc_uid = sc_uid;
	}
	/**
	 * @return the scdlist
	 */
	public List<StockChangeDetail> getScdlist() {
		return scdlist;
	}
	/**
	 * @param scdlist the scdlist to set
	 */
	public void setScdlist(List<StockChangeDetail> scdlist) {
		this.scdlist = scdlist;
	}
	
}
