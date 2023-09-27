package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.core.annotation.Order;

@Mapper
public interface OrderRepository {
	public int insert(Order order);
	public int updateById(Order order);
	public int deleteById(int orderId);
	public Order findById(int orderId);
	public List<Order> findByAll();
	
}
