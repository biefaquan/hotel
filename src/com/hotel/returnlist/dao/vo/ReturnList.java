package com.hotel.returnlist.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.returndetail.dao.vo.ReturnDetail;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.supplier.dao.vo.Supplier;
import com.hotel.user.dao.vo.User;

public class ReturnList {
	private int rl_id;		//ID		
	private Supplier s;		//供应商		
	private StoreHouse sh;		//入库仓库	
	private User u;		//经手人		
	private String rl_remark;	//摘要		
	private String rl_instruction; //说明		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rl_date	;	//单据日期	
	private int rl_money;	//总账		
	private int rl_uid;		//操作员(user表中的ID)
	private List<ReturnDetail> rdlist; 
	/**
	 * @return the rl_id
	 */
	public int getRl_id() {
		return rl_id;
	}
	/**
	 * @param rl_id the rl_id to set
	 */
	public void setRl_id(int rl_id) {
		this.rl_id = rl_id;
	}
	/**
	 * @return the s
	 */
	public Supplier getS() {
		return s;
	}
	/**
	 * @param s the s to set
	 */
	public void setS(Supplier s) {
		this.s = s;
	}
	/**
	 * @return the sh
	 */
	public StoreHouse getSh() {
		return sh;
	}
	/**
	 * @param sh the sh to set
	 */
	public void setSh(StoreHouse sh) {
		this.sh = sh;
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
	 * @return the rl_remark
	 */
	public String getRl_remark() {
		return rl_remark;
	}
	/**
	 * @param rl_remark the rl_remark to set
	 */
	public void setRl_remark(String rl_remark) {
		this.rl_remark = rl_remark;
	}
	/**
	 * @return the rl_instruction
	 */
	public String getRl_instruction() {
		return rl_instruction;
	}
	/**
	 * @param rl_instruction the rl_instruction to set
	 */
	public void setRl_instruction(String rl_instruction) {
		this.rl_instruction = rl_instruction;
	}
	/**
	 * @return the rl_date
	 */
	public Date getRl_date() {
		return rl_date;
	}
	/**
	 * @param rl_date the rl_date to set
	 */
	public void setRl_date(Date rl_date) {
		this.rl_date = rl_date;
	}
	/**
	 * @return the rl_money
	 */
	public int getRl_money() {
		return rl_money;
	}
	/**
	 * @param rl_money the rl_money to set
	 */
	public void setRl_money(int rl_money) {
		this.rl_money = rl_money;
	}
	/**
	 * @return the rl_uid
	 */
	public int getRl_uid() {
		return rl_uid;
	}
	/**
	 * @param rl_uid the rl_uid to set
	 */
	public void setRl_uid(int rl_uid) {
		this.rl_uid = rl_uid;
	}
	/**
	 * @return the rdlist
	 */
	public List<ReturnDetail> getRdlist() {
		return rdlist;
	}
	/**
	 * @param rdlist the rdlist to set
	 */
	public void setRdlist(List<ReturnDetail> rdlist) {
		this.rdlist = rdlist;
	}
	
}
