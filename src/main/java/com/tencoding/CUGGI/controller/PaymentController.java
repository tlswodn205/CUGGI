package com.tencoding.CUGGI.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tencoding.CUGGI.dto.response.PaymentDto;
import com.tencoding.CUGGI.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	PaymentService paymentService;

	@Autowired
	HttpSession session;
	
	@GetMapping("/payRequest")
	public String payREquest(PaymentDto paymentDto, Model model) {
		
        model.addAttribute("paymentDto", paymentDto);
        
                
    	
		return "payment/payRequest_utf";
	}
	
	@PostMapping("/payResult")
	public String payResult(PaymentDto paymentDto) {
		
		paymentService.insertPayment(paymentDto);
		
		return "account/payResult_utf";
	}
	
	
}
