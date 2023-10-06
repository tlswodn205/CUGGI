package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.repository.model.OrderProducts;

@Mapper
public interface OrderProductsRepository {
	public int insert(OrderProducts orderProducts);
	public int updateById(OrderProducts orderProducts);
	public int deleteById(int orderProductsId);
	public OrderProducts findById(int orderProductsId);
	public List<OrderProducts> findByAll();
	public List<OrderDetailProductResponseDto> findByDetailList(int orderId);
	public OrderDetailProductResponseDto findByDetailPerson(int orderId);
	public OrderDetailProductResponseDto findByDetailPayment(int orderId);
}
