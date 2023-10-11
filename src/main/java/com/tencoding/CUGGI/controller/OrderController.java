package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tencoding.CUGGI.dto.request.NicepayRequestDto;
import com.tencoding.CUGGI.dto.response.NicepayResponseDto;
import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.service.OrderService;
import com.tencoding.CUGGI.service.UserService;
import com.tencoding.CUGGI.util.DataEncrypt;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	HttpSession session;

	@GetMapping("/orderList")
	public String orderList주문내역(Model model) {


		User user = new User();

		user.setId(1);

		List<OrderListResponseDto> orderList = orderService.readOrderList(user.getId());
		if(orderList.isEmpty()) {
			model.addAttribute("orderList", null);
		} else {
			model.addAttribute("orderList",orderList);
			System.out.println("여기");
		}
		System.out.println(orderList);
		System.out.println("컨트롤러");
		System.out.println(user.getId());

		return "/payment/orderList";
	}

	@GetMapping("/orderDetail")
	public String orderDetail주문상세내역(Model model) {
		
		
		
		
		
		Order order = new Order();
		
		order.setId(1);
		
		// 상세보기 상품
		List<OrderDetailProductResponseDto> orderDetailList = orderService.readOrderDetailList(order.getId());
		if(orderDetailList.isEmpty()) {
			model.addAttribute("orderDetailList", null);
		} else {
			model.addAttribute("orderDetailList",orderDetailList);
			System.out.println("List:" + orderDetailList);
		}
		
//		// 상세보기 주문자
		OrderDetailProductResponseDto orderDetailPerson = orderService.readOrderDetaiPerson(order.getId());
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPerson", null);
		} else {
			model.addAttribute("orderDetailPerson",orderDetailPerson);
			
			System.out.println("여가 마지막으로타나");
			System.out.println("Person:" + orderDetailPerson);
			
		}
		
		// 결제 금액
		OrderDetailProductResponseDto orderDetailPayment = orderService.readOrderDetaiPayment(order.getId());
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPayment", null);
		} else {
			model.addAttribute("orderDetailPayment",orderDetailPayment);
			
			System.out.println("여가 마지막으로타나");
			System.out.println("Payment:" + orderDetailPayment);
			
		}
		
		return "/payment/orderDetail";
	}
	@GetMapping("/payment")
	public String payment() {
		return "/payment/payRequest_utf2";
	}
	
	
	@PostMapping("/nicepayInfo")
	@ResponseBody
	public NicepayResponseDto nicepayAjax(@RequestBody NicepayRequestDto nicepayRequestDto) {
		NicepayResponseDto nicepayResponseDto = new NicepayResponseDto(nicepayRequestDto); 
		return  nicepayResponseDto;
	}
}
