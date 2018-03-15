package com.hotel.picklist.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.dept.dao.vo.Dept;
import com.hotel.pickdetail.dao.vo.PickDetail;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.supplier.dao.vo.Supplier;
import com.hotel.user.dao.vo.User;

public class PickList {
	private int pl_id;		//ID		
	private Dept d;		//供应商		
	private StoreHouse sh;		//入库仓库	
	private User u;		//经手人
	private String pl_remark;	//摘要		
	private String pl_instruction; //说明		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pl_date;	//单据日期	
	private int pl_money;	//总账		
	private int pl_uid;		//操作员	(user表中的ID)	
	private List<PickDetail> pdlist;
	/**
	 * @return the pl_id
	 */
	public int getPl_id() {
		return pl_id;
	}
	/**
	 * @param pl_id the pl_id to set
	 */
	public void setPl_id(int pl_id) {
		this.pl_id = pl_id;
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
	 * @return the pl_remark
	 */
	public String getPl_remark() {
		return pl_remark;
	}
	/**
	 * @param pl_remark the pl_remark to set
	 */
	public void setPl_remark(String pl_remark) {
		this.pl_remark = pl_remark;
	}
	/**
	 * @return the pl_instruction
	 */
	public String getPl_instruction() {
		return pl_instruction;
	}
	/**
	 * @param pl_instruction the pl_instruction to set
	 */
	public void setPl_instruction(String pl_instruction) {
		this.pl_instruction = pl_instruction;
	}
	/**
	 * @return the pl_date
	 */
	public Date getPl_date() {
		return pl_date;
	}
	/**
	 * @param pl_date the pl_date to set
	 */
	public void setPl_date(Date pl_date) {
		this.pl_date = pl_date;
	}
	/**
	 * @return the pl_money
	 */
	public int getPl_money() {
		return pl_money;
	}
	/**
	 * @param pl_money the pl_money to set
	 */
	public void setPl_money(int pl_money) {
		this.pl_money = pl_money;
	}
	/**
	 * @return the pl_uid
	 */
	public int getPl_uid() {
		return pl_uid;
	}
	/**
	 * @param pl_uid the pl_uid to set
	 */
	public void setPl_uid(int pl_uid) {
		this.pl_uid = pl_uid;
	}
	/**
	 * @return the pdlist
	 */
	public List<PickDetail> getPdlist() {
		return pdlist;
	}
	/**
	 * @param pdlist the pdlist to set
	 */
	public void setPdlist(List<PickDetail> pdlist) {
		this.pdlist = pdlist;
	}
	
}
