package com.hotel.stockchangedetail.dao.vo;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.stockchange.dao.vo.StockChange;

public class StockChangeDetail {
	private int scd_id;		//ID		
	private StockChange sc;		//进货单ID	
	private Goods g;		//商品		
	private int scd_price;	//单价		
	private int scd_number;	//数量		
	private int scd_money;	//金额	
	private String scd_reward;  //备注
	/**
	 * @return the scd_id
	 */
	public int getScd_id() {
		return scd_id;
	}
	/**
	 * @param scd_id the scd_id to set
	 */
	public void setScd_id(int scd_id) {
		this.scd_id = scd_id;
	}
	/**
	 * @return the sc
	 */
	public StockChange getSc() {
		return sc;
	}
	/**
	 * @param sc the sc to set
	 */
	public void setSc(StockChange sc) {
		this.sc = sc;
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
	 * @return the scd_price
	 */
	public int getScd_price() {
		return scd_price;
	}
	/**
	 * @param scd_price the scd_price to set
	 */
	public void setScd_price(int scd_price) {
		this.scd_price = scd_price;
	}
	/**
	 * @return the scd_number
	 */
	public int getScd_number() {
		return scd_number;
	}
	/**
	 * @param scd_number the scd_number to set
	 */
	public void setScd_number(int scd_number) {
		this.scd_number = scd_number;
	}
	/**
	 * @return the scd_money
	 */
	public int getScd_money() {
		return scd_money;
	}
	/**
	 * @param scd_money the scd_money to set
	 */
	public void setScd_money(int scd_money) {
		this.scd_money = scd_money;
	}
	/**
	 * @return the scd_reward
	 */
	public String getScd_reward() {
		return scd_reward;
	}
	/**
	 * @param scd_reward the scd_reward to set
	 */
	public void setScd_reward(String scd_reward) {
		this.scd_reward = scd_reward;
	}
	
}
