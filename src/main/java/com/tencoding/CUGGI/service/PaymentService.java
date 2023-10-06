package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.PaymentDto;
import com.tencoding.CUGGI.repository.interfaces.PaymentRepository;
import com.tencoding.CUGGI.repository.model.Payment;

@Service
public class PaymentService {
	
	@Autowired
	PaymentRepository paymentRepository;

	public void insertPayment(PaymentDto paymentDto) {
		Payment payment = new Payment();
		payment.setOrderId(paymentDto.getOrderId());
		payment.setId(paymentDto.getId());
		payment.setTid(paymentDto.getTid());
		// payment.setUserId(princiPalId);
		
		paymentRepository.insert(payment);
	}
}
