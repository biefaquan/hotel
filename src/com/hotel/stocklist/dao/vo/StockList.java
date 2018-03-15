package com.hotel.stocklist.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.stockdetail.dao.vo.StockDetail;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.supplier.dao.vo.Supplier;
import com.hotel.user.dao.vo.User;

public class StockList {
	private int sl_id;		//ID		
	private Supplier s;		//供应商		
	private StoreHouse sh;		//入库仓库	
	private User u;		//经手人
	private String sl_remark;	//摘要		
	private String sl_instruction; //说明		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date sl_date;	//单据日期	
	private int sl_money;	//总账		
	private int sl_uid;		//操作员	(user表中的ID)	
	private List<StockDetail> sdlist;
	/**
	 * @return the sl_id
	 */
	public int getSl_id() {
		return sl_id;
	}
	/**
	 * @param sl_id the sl_id to set
	 */
	public void setSl_id(int sl_id) {
		this.sl_id = sl_id;
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
	 * @return the sl_remark
	 */
	public String getSl_remark() {
		return sl_remark;
	}
	/**
	 * @param sl_remark the sl_remark to set
	 */
	public void setSl_remark(String sl_remark) {
		this.sl_remark = sl_remark;
	}
	/**
	 * @return the sl_instruction
	 */
	public String getSl_instruction() {
		return sl_instruction;
	}
	/**
	 * @param sl_instruction the sl_instruction to set
	 */
	public void setSl_instruction(String sl_instruction) {
		this.sl_instruction = sl_instruction;
	}
	/**
	 * @return the sl_date
	 */
	public Date getSl_date() {
		return sl_date;
	}
	/**
	 * @param sl_date the sl_date to set
	 */
	public void setSl_date(Date sl_date) {
		this.sl_date = sl_date;
	}
	/**
	 * @return the sl_money
	 */
	public int getSl_money() {
		return sl_money;
	}
	/**
	 * @param sl_money the sl_money to set
	 */
	public void setSl_money(int sl_money) {
		this.sl_money = sl_money;
	}
	/**
	 * @return the sl_uid
	 */
	public int getSl_uid() {
		return sl_uid;
	}
	/**
	 * @param sl_uid the sl_uid to set
	 */
	public void setSl_uid(int sl_uid) {
		this.sl_uid = sl_uid;
	}
	/**
	 * @return the sdlist
	 */
	public List<StockDetail> getSdlist() {
		return sdlist;
	}
	/**
	 * @param sdlist the sdlist to set
	 */
	public void setSdlist(List<StockDetail> sdlist) {
		this.sdlist = sdlist;
	}
	
}
