package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	OrderRepository orderRepository;
}
