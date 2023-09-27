package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.FirstCategoryRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderProductsRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderRepository;
import com.tencoding.CUGGI.repository.interfaces.PaymentRepository;
import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.interfaces.ProductImageRepository;
import com.tencoding.CUGGI.repository.interfaces.QnaRepository;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;

@Service
public class AdminService {
	
	@Autowired
	FirstCategoryRepository firstCategoryRepository;
	
	@Autowired
	OrderRepository orderRepository;

	@Autowired
	OrderProductsRepository orderProductsRepository;
	
	@Autowired
	PaymentRepository paymentRepository;
	
	@Autowired
	PersonRepository personRepository;
	
	@Autowired
	ProductImageRepository productImageRepository;
	
	@Autowired
	QnaRepository qnaRepository;
	
	@Autowired
	SecondCategoryService secondCategoryService;
	
	@Autowired
	UserRepository userRepository;
	
	
}
