package com.hotel.returnpick.dao.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.hotel.dept.dao.vo.Dept;
import com.hotel.returnpickdetail.dao.vo.ReturnPickDetail;
import com.hotel.storehouse.dao.vo.StoreHouse;
import com.hotel.user.dao.vo.User;


public class ReturnPick {
	private int rp_id;		//ID		
	private Dept d;		//供应商		
	private StoreHouse sh;		//入库仓库	
	private User u;		//经手人		
	private String rp_remark;	//摘要		
	private String rp_instruction; //说明		
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date rp_date	;	//单据日期	
	private int rp_money;	//总账		
	private int rp_uid;		//操作员(user表中的ID)
	private List<ReturnPickDetail> rpdlist;
	/**
	 * @return the rp_id
	 */
	public int getRp_id() {
		return rp_id;
	}
	/**
	 * @param rp_id the rp_id to set
	 */
	public void setRp_id(int rp_id) {
		this.rp_id = rp_id;
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
	 * @return the rp_remark
	 */
	public String getRp_remark() {
		return rp_remark;
	}
	/**
	 * @param rp_remark the rp_remark to set
	 */
	public void setRp_remark(String rp_remark) {
		this.rp_remark = rp_remark;
	}
	/**
	 * @return the rp_instruction
	 */
	public String getRp_instruction() {
		return rp_instruction;
	}
	/**
	 * @param rp_instruction the rp_instruction to set
	 */
	public void setRp_instruction(String rp_instruction) {
		this.rp_instruction = rp_instruction;
	}
	/**
	 * @return the rp_date
	 */
	public Date getRp_date() {
		return rp_date;
	}
	/**
	 * @param rp_date the rp_date to set
	 */
	public void setRp_date(Date rp_date) {
		this.rp_date = rp_date;
	}
	/**
	 * @return the rp_money
	 */
	public int getRp_money() {
		return rp_money;
	}
	/**
	 * @param rp_money the rp_money to set
	 */
	public void setRp_money(int rp_money) {
		this.rp_money = rp_money;
	}
	/**
	 * @return the rp_uid
	 */
	public int getRp_uid() {
		return rp_uid;
	}
	/**
	 * @param rp_uid the rp_uid to set
	 */
	public void setRp_uid(int rp_uid) {
		this.rp_uid = rp_uid;
	}
	/**
	 * @return the rpdlist
	 */
	public List<ReturnPickDetail> getRpdlist() {
		return rpdlist;
	}
	/**
	 * @param rpdlist the rpdlist to set
	 */
	public void setRpdlist(List<ReturnPickDetail> rpdlist) {
		this.rpdlist = rpdlist;
	} 
	
}
