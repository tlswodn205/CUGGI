package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.service.OrderService;
import com.tencoding.CUGGI.service.UserService;


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
		
		return "/payment/orderDetail";
	}

}
