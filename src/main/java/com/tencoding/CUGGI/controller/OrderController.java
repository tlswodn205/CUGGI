package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.response.OrderBasketResponseDto;
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
	public String orderList주문내역( Model model) {


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

	@GetMapping("/orderDetail/{id}")
	public String orderDetail주문상세내역(@PathVariable("id") int id,Model model) {
							
		
		// 상세보기 상품
		List<OrderDetailProductResponseDto> orderDetailList = orderService.readOrderDetailList(id);
		if(orderDetailList.isEmpty()) {
			model.addAttribute("orderDetailList", null);
		} else {
			model.addAttribute("orderDetailList",orderDetailList);
			System.out.println("List:" + orderDetailList);
		}
		
//		// 상세보기 주문자
		OrderDetailProductResponseDto orderDetailPerson = orderService.readOrderDetaiPerson(id);
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPerson", null);
		} else {
			model.addAttribute("orderDetailPerson",orderDetailPerson);
			
			System.out.println("여가 마지막으로타나");
			System.out.println("Person:" + orderDetailPerson);
			
		}
		
		// 결제 금액
		OrderDetailProductResponseDto orderDetailPayment = orderService.readOrderDetaiPayment(id);
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPayment", null);
		} else {
			model.addAttribute("orderDetailPayment",orderDetailPayment);
			
			System.out.println("여가 마지막으로타나");
			System.out.println("Payment:" + orderDetailPayment);
			
		}
		

		Order order = orderService.findById(id);	
		if(order==null) {
			model.addAttribute("order", null);
		} else {
			model.addAttribute("order",order);
			System.out.println("오더 아이디 여기서도 못 받아옴?");
			System.out.println("id:" + order.getId());
		}
		
		

		return "/payment/orderDetail";
	}
	

	@PostMapping("orderDetail/{id}")
	public String updateOrderListProc주문내역수정(@PathVariable("id") int id, UpdateOrderListRequestDto updateOrderListRequestDto) {
		int result = orderService.orderDetailUpdate(updateOrderListRequestDto);	
		
		return "redirect:/order/orderDetail/{id}"; 
	}
	
//	@GetMapping("/basket")
//	public String basket장바구니(Model model) {
//		
//		List<OrderBasketResponseDto> orderBasketResponseDto = orderService.readOrderBasketList();
//		if(orderBasketResponseDto.isEmpty()) {
//			model.addAttribute("orderBasketResponseDto", null);
//		} else {
//			model.addAttribute("orderBasketResponseDto",orderBasketResponseDto);
//			System.out.println("List:" + orderBasketResponseDto);
//		}
//	}
	

}
