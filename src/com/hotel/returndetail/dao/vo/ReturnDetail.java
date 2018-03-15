package com.hotel.returndetail.dao.vo;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.returnlist.dao.vo.ReturnList;

public class ReturnDetail {
	private int rd_id;		//ID		
	private ReturnList rl;		//退货单ID	
	private Goods g;		//商品		
	private int rd_price;	//单价		
	private int rd_number;	//数量		
	private int rd_money;	//金额		
	private String rd_reward;	//备注		
	/**
	 * @return the rd_id
	 */
	public int getRd_id() {
		return rd_id;
	}
	/**
	 * @param rd_id the rd_id to set
	 */
	public void setRd_id(int rd_id) {
		this.rd_id = rd_id;
	}
	/**
	 * @return the rl
	 */
	public ReturnList getRl() {
		return rl;
	}
	/**
	 * @param rl the rl to set
	 */
	public void setRl(ReturnList rl) {
		this.rl = rl;
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
	 * @return the rd_price
	 */
	public int getRd_price() {
		return rd_price;
	}
	/**
	 * @param rd_price the rd_price to set
	 */
	public void setRd_price(int rd_price) {
		this.rd_price = rd_price;
	}
	/**
	 * @return the rd_number
	 */
	public int getRd_number() {
		return rd_number;
	}
	/**
	 * @param rd_number the rd_number to set
	 */
	public void setRd_number(int rd_number) {
		this.rd_number = rd_number;
	}
	/**
	 * @return the rd_money
	 */
	public int getRd_money() {
		return rd_money;
	}
	/**
	 * @param rd_money the rd_money to set
	 */
	public void setRd_money(int rd_money) {
		this.rd_money = rd_money;
	}
	/**
	 * @return the rd_reward
	 */
	public String getRd_reward() {
		return rd_reward;
	}
	/**
	 * @param rd_reward the rd_reward to set
	 */
	public void setRd_reward(String rd_reward) {
		this.rd_reward = rd_reward;
	}
	
}
