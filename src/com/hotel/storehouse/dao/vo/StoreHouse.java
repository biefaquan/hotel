package com.hotel.storehouse.dao.vo;

public class StoreHouse {
	private int sh_id;
	private String sh_num;		//仓库编号
	private String sh_name;		//仓库名称	
	private String sh_reward;		//备注		
	private int sh_state;		//状态	（1启用，0停用）
	/**
	 * @return the sh_id
	 */
	public int getSh_id() {
		return sh_id;
	}
	/**
	 * @param sh_id the sh_id to set
	 */
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	/**
	 * @return the sh_num
	 */
	public String getSh_num() {
		return sh_num;
	}
	/**
	 * @param sh_num the sh_num to set
	 */
	public void setSh_num(String sh_num) {
		this.sh_num = sh_num;
	}
	/**
	 * @return the sh_name
	 */
	public String getSh_name() {
		return sh_name;
	}
	/**
	 * @param sh_name the sh_name to set
	 */
	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	/**
	 * @return the sh_reward
	 */
	public String getSh_reward() {
		return sh_reward;
	}
	/**
	 * @param sh_reward the sh_reward to set
	 */
	public void setSh_reward(String sh_reward) {
		this.sh_reward = sh_reward;
	}
	/**
	 * @return the sh_state
	 */
	public int getSh_state() {
		return sh_state;
	}
	/**
	 * @param sh_state the sh_state to set
	 */
	public void setSh_state(int sh_state) {
		this.sh_state = sh_state;
	}
	
}
