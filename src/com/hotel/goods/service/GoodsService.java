package com.hotel.goods.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.goods.dao.dao.GoodsMapper;
import com.hotel.goods.dao.vo.Goods;

@Service
public class GoodsService {
	@Autowired
	private GoodsMapper mapper;
	
	@Transactional
	public void add(Goods g){
		mapper.add(g);
	}
	
	@Transactional
	public List<Goods> queryAll(){
		return mapper.queryAll();
	}
	
	@Transactional
	public Goods queryByName(String g_name){
		return mapper.queryByName(g_name);
	}
	
	@Transactional
	public void update(Goods g){
		mapper.update(g);
	}
	
	@Transactional
	public Goods queryByNameSH(String g_name,int sh_id){
		return mapper.queryByNameSH(g_name, sh_id);
	}
	
	@Transactional
	public List<String> selectName(){
		return mapper.selectName();
	}
	
	@Transactional
	public List<Goods> queryAllBySH(int sh_id){
		return mapper.queryAllBySH(sh_id);
	}
	
	@Transactional
	public List<Goods> queryAllByPage(int pageNo,int pageSize){
		return mapper.queryAllByPage(pageNo, pageSize);
	}
	
	@Transactional
	public int count(){
		return mapper.count();
	}
	
	@Transactional
	public Goods queryById(int g_id){
		return mapper.queryById(g_id);
	}
	
	@Transactional
	public void delete(int g_id){
		mapper.delete(g_id);
	}
	@Transactional
	public List<Goods> queryByReason(String g_name,int sh_id,int pageNo,int pageSize){
		return mapper.queryByReason(g_name, sh_id, pageNo, pageSize);
	}
	public int countByReason(String g_name,int sh_id){
		return mapper.countByReason(g_name, sh_id);
	}
}
