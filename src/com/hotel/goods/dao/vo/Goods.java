package com.hotel.goods.dao.vo;

import com.hotel.storehouse.dao.vo.StoreHouse;

public class Goods {
	private int g_id;		//ID		
	private String g_name;		//名称		
	private String g_type;		//类别		
	private String g_unit;		//单位		
	private int g_unitprice; //单价		
	private int g_number;	//数量		
	private  int g_money;	//金额		
	private String g_reward;	//备注	
	private StoreHouse sh;
	/**
	 * @return the g_id
	 */
	public int getG_id() {
		return g_id;
	}
	/**
	 * @param g_id the g_id to set
	 */
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	/**
	 * @return the g_name
	 */
	public String getG_name() {
		return g_name;
	}
	/**
	 * @param g_name the g_name to set
	 */
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	/**
	 * @return the g_type
	 */
	public String getG_type() {
		return g_type;
	}
	/**
	 * @param g_type the g_type to set
	 */
	public void setG_type(String g_type) {
		this.g_type = g_type;
	}
	/**
	 * @return the g_unit
	 */
	public String getG_unit() {
		return g_unit;
	}
	/**
	 * @param g_unit the g_unit to set
	 */
	public void setG_unit(String g_unit) {
		this.g_unit = g_unit;
	}
	/**
	 * @return the g_unitprice
	 */
	public int getG_unitprice() {
		return g_unitprice;
	}
	/**
	 * @param g_unitprice the g_unitprice to set
	 */
	public void setG_unitprice(int g_unitprice) {
		this.g_unitprice = g_unitprice;
	}
	/**
	 * @return the g_number
	 */
	public int getG_number() {
		return g_number;
	}
	/**
	 * @param g_number the g_number to set
	 */
	public void setG_number(int g_number) {
		this.g_number = g_number;
	}
	/**
	 * @return the g_money
	 */
	public int getG_money() {
		return g_money;
	}
	/**
	 * @param g_money the g_money to set
	 */
	public void setG_money(int g_money) {
		this.g_money = g_money;
	}
	/**
	 * @return the g_reward
	 */
	public String getG_reward() {
		return g_reward;
	}
	/**
	 * @param g_reward the g_reward to set
	 */
	public void setG_reward(String g_reward) {
		this.g_reward = g_reward;
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
	
}
