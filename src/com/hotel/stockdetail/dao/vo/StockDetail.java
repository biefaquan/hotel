package com.hotel.stockdetail.dao.vo;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.stocklist.dao.vo.StockList;

public class StockDetail {
	private int sd_id;		//ID		
	private StockList sl;		//进货单ID	
	private Goods g;		//商品		
	private int sd_price;	//单价		
	private int sd_number;	//数量		
	private int sd_money;	//金额	
	/**
	 * @return the sd_id
	 */
	public int getSd_id() {
		return sd_id;
	}
	/**
	 * @param sd_id the sd_id to set
	 */
	public void setSd_id(int sd_id) {
		this.sd_id = sd_id;
	}
	/**
	 * @return the sl
	 */
	public StockList getSl() {
		return sl;
	}
	/**
	 * @param sl the sl to set
	 */
	public void setSl(StockList sl) {
		this.sl = sl;
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
	 * @return the sd_price
	 */
	public int getSd_price() {
		return sd_price;
	}
	/**
	 * @param sd_price the sd_price to set
	 */
	public void setSd_price(int sd_price) {
		this.sd_price = sd_price;
	}
	/**
	 * @return the sd_number
	 */
	public int getSd_number() {
		return sd_number;
	}
	/**
	 * @param sd_number the sd_number to set
	 */
	public void setSd_number(int sd_number) {
		this.sd_number = sd_number;
	}
	/**
	 * @return the sd_money
	 */
	public int getSd_money() {
		return sd_money;
	}
	/**
	 * @param sd_money the sd_money to set
	 */
	public void setSd_money(int sd_money) {
		this.sd_money = sd_money;
	}
	
}
