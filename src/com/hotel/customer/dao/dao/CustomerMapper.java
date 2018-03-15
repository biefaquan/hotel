package com.hotel.customer.dao.dao;

import com.hotel.customer.dao.vo.Customer;

public interface CustomerMapper {
	public void add(Customer c);
	public void update(Customer c);
	public void delete(int c_id);
	public Customer queryById(int c_id);
}
