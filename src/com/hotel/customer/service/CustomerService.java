package com.hotel.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hotel.customer.dao.dao.CustomerMapper;
import com.hotel.customer.dao.vo.Customer;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper mapper;
	
	@Transactional
	public void add(Customer c){
		mapper.add(c);
	}
	@Transactional
	public void update(Customer c){
		mapper.update(c);
	}
	@Transactional
	public void delete(int c_id){
		mapper.delete(c_id);
	}
	@Transactional
	public Customer queryById(int c_id){
		return mapper.queryById(c_id);
	}
}
