package com.hotel.pickdetail.dao.vo;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.picklist.dao.vo.PickList;

public class PickDetail {
	private int pd_id;		//ID		
	private PickList pl;		//进货单ID	
	private Goods g;		//商品		
	private int pd_price;	//单价		
	private int pd_number;	//数量		
	private int pd_money;	//金额	
	/**
	 * @return the pd_id
	 */
	public int getPd_id() {
		return pd_id;
	}
	/**
	 * @param pd_id the pd_id to set
	 */
	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}
	/**
	 * @return the pl
	 */
	public PickList getPl() {
		return pl;
	}
	/**
	 * @param pl the pl to set
	 */
	public void setPl(PickList pl) {
		this.pl = pl;
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
	 * @return the pd_price
	 */
	public int getPd_price() {
		return pd_price;
	}
	/**
	 * @param pd_price the pd_price to set
	 */
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	/**
	 * @return the pd_number
	 */
	public int getPd_number() {
		return pd_number;
	}
	/**
	 * @param pd_number the pd_number to set
	 */
	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}
	/**
	 * @return the pd_money
	 */
	public int getPd_money() {
		return pd_money;
	}
	/**
	 * @param pd_money the pd_money to set
	 */
	public void setPd_money(int pd_money) {
		this.pd_money = pd_money;
	}
	
}
