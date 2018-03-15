package com.hotel.returnpickdetail.dao.vo;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.returnpick.dao.vo.ReturnPick;

public class ReturnPickDetail {
	private int rpd_id;		//ID		
	private ReturnPick rp;		//退货单ID	
	private Goods g;		//商品		
	private int rpd_price;	//单价		
	private int rpd_number;	//数量		
	private int rpd_money;	//金额		
	private String rpd_reward;	//备注
	/**
	 * @return the rpd_id
	 */
	public int getRpd_id() {
		return rpd_id;
	}
	/**
	 * @param rpd_id the rpd_id to set
	 */
	public void setRpd_id(int rpd_id) {
		this.rpd_id = rpd_id;
	}
	/**
	 * @return the rp
	 */
	public ReturnPick getRp() {
		return rp;
	}
	/**
	 * @param rp the rp to set
	 */
	public void setRp(ReturnPick rp) {
		this.rp = rp;
	}
	/**
	 * @return the g
	 */
	public Goods getG() {
		return g;
	}
	/**
	 * @param g the g to set
	 */
	public void setG(Goods g) {
		this.g = g;
	}
	/**
	 * @return the rpd_price
	 */
	public int getRpd_price() {
		return rpd_price;
	}
	/**
	 * @param rpd_price the rpd_price to set
	 */
	public void setRpd_price(int rpd_price) {
		this.rpd_price = rpd_price;
	}
	/**
	 * @return the rpd_number
	 */
	public int getRpd_number() {
		return rpd_number;
	}
	/**
	 * @param rpd_number the rpd_number to set
	 */
	public void setRpd_number(int rpd_number) {
		this.rpd_number = rpd_number;
	}
	/**
	 * @return the rpd_money
	 */
	public int getRpd_money() {
		return rpd_money;
	}
	/**
	 * @param rpd_money the rpd_money to set
	 */
	public void setRpd_money(int rpd_money) {
		this.rpd_money = rpd_money;
	}
	/**
	 * @return the rpd_reward
	 */
	public String getRpd_reward() {
		return rpd_reward;
	}
	/**
	 * @param rpd_reward the rpd_reward to set
	 */
	public void setRpd_reward(String rpd_reward) {
		this.rpd_reward = rpd_reward;
	}
	
}
