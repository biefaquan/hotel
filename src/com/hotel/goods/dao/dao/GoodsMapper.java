package com.hotel.goods.dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hotel.goods.dao.vo.Goods;
import com.hotel.stockchange.dao.vo.StockChange;

public interface GoodsMapper {
	public void add(Goods s);
	public List<Goods> queryAll();
	public Goods queryByName(String g_name);
	public Goods queryByNameSH(@Param("g_name")String g_name,@Param("sh_id")int sh_id);
	public void update(Goods g);
	public List<String> selectName();
	public List<Goods> queryAllBySH(int sh_id);
	public List<Goods> queryAllByPage(@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int count();
	public Goods queryById(int g_id);
	public void delete(int g_id);
	/**
	 * 条件查询  当前库存查询
	 */
	public List<Goods> queryByReason(@Param("g_name")String g_name,@Param("sh_id")int sh_id,@Param("pageNo")int pageNo,@Param("pageSize")int pageSize);
	public int countByReason(@Param("g_name")String g_name,@Param("sh_id")int sh_id);
}
