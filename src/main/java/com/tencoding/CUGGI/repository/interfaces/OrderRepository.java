package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;

@Mapper
public interface OrderRepository {
	public int insert(Order order);
	public int updateById(Order order);
	public int deleteById(int orderId);
	public Order findById(int orderId);
	public List<Order> findByAll();
	public List<OrderListResponseDto> findByList(int id);
	
	
	
}
