package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;

import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;

@Mapper
public interface OrderRepository {
	public int insert(Order order);
	public int updateById(Order order);
	public int deleteById(int orderId);
	public Order findById(int id);
	public List<Order> findByAll();
	public List<OrderListResponseDto> findByList(int id);
	public List<OrderListResponseDto> findByListAdmin();
	public Order findByDetailId(int id);
	public PagingResponseDto findPaging(@Param("type")String type, @Param("keyword")String keyword, @Param("page")Integer page);
	public List<OrderListResponseDto> findByKeywordAndCurrentPage(@Param("type")String type, @Param("keyword")String keyword, @Param("startNum")Integer startNum);
	public int orderDetailUpdate(Order order);
	

	
}
