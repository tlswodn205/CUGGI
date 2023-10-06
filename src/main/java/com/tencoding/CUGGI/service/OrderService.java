package com.tencoding.CUGGI.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.repository.interfaces.OrderProductsRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderRepository;


@Service
public class OrderService {
	
	@Autowired
	OrderRepository orderRepository;

	@Autowired
	OrderProductsRepository orderProductsRepository;
	
	public List<OrderListResponseDto> readOrderList(int id) {
		List<OrderListResponseDto> list = orderRepository.findByList(id);
		System.out.println(list.toString());
		return list;

	}


	public List<OrderDetailProductResponseDto> readOrderDetailList(int orderId) {
		List<OrderDetailProductResponseDto> detailList = orderProductsRepository.findByDetailList(orderId);
		System.out.println(detailList.toString());
		return detailList;
	}


	public OrderDetailProductResponseDto readOrderDetaiPerson(int orderId) {
		OrderDetailProductResponseDto detailPerson = orderProductsRepository.findByDetailPerson(orderId);
		System.out.println(detailPerson.toString());
		return detailPerson;
	}


	public OrderDetailProductResponseDto readOrderDetaiPayment(int orderId) {
		OrderDetailProductResponseDto detailPayment = orderProductsRepository.findByDetailPayment(orderId);
		System.out.println(detailPayment.toString());
		return detailPayment;
	}
}
