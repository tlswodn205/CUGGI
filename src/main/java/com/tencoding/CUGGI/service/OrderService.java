package com.tencoding.CUGGI.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.InsertPaymentRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.response.OrderBasketResponseDto;
import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.interfaces.OrderProductsRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderRepository;
import com.tencoding.CUGGI.repository.interfaces.PaymentRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.Payment;


@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	OrderProductsRepository orderProductsRepository;
	
	@Autowired
	PaymentRepository paymentRepository;

	@Transactional
	public List<OrderListResponseDto> readOrderList(int id) {
		List<OrderListResponseDto> list = orderRepository.findByList(id);
		System.out.println(list.toString());
		return list;

	}

	@Transactional
	public List<OrderDetailProductResponseDto> readOrderDetailList(int orderId) {
		List<OrderDetailProductResponseDto> detailList = orderProductsRepository.findByDetailList(orderId);
		
		System.out.println(detailList.get(0).toString());
		System.out.println("서비스 : " +detailList.toString());
		
		return detailList;
	}

	@Transactional
	public OrderDetailProductResponseDto readOrderDetaiPerson(int orderId) {
		OrderDetailProductResponseDto detailPerson = orderProductsRepository.findByDetailPerson(orderId);
		System.out.println(detailPerson.toString());
		return detailPerson;
	}

	@Transactional
	public OrderDetailProductResponseDto readOrderDetaiPayment(int orderId) {
		OrderDetailProductResponseDto detailPayment = orderProductsRepository.findByDetailPayment(orderId);
		System.out.println(detailPayment.toString());
		return detailPayment;
	}

	@Transactional
	public int orderDetailUpdate(UpdateOrderListRequestDto updateOrderListRequestDto) {
		Order orderEntity = updateOrderListRequestDto.toEntity();
		int result = orderRepository.orderDetailUpdate(orderEntity);
		return result;
	}

	@Transactional
	public Order findById(int id) {
		Order order = orderRepository.findById(id);
		return order;
	}

	public List<OrderBasketResponseDto> readOrderBasketList(int id) {
		List<OrderBasketResponseDto> basketList = orderRepository.findByBasketList(id);
		return basketList;
	}

	

	@Transactional
	public int insertPayment(InsertPaymentRequestDto insertPaymentRequestDto,int orderId) {
		Payment paymentEntity = insertPaymentRequestDto.toEntity(orderId);

		System.out.println(" 서비스 : " + paymentEntity);
		return paymentRepository.insert(paymentEntity);
	}

	public int updateOrder(UpdateOrderListRequestDto updateOrderListRequestDto, int orderId) {
		
		Order orderEntity = updateOrderListRequestDto.toEntity2(orderId);
		System.out.println(orderEntity.getState());
		int result = orderRepository.orderUpdate(orderEntity);
		return result;
		
	}

	


}
