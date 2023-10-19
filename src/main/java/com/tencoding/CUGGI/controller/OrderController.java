package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderRequestDto;
import com.tencoding.CUGGI.dto.response.OrderBasketResponseDto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tencoding.CUGGI.dto.request.InsertPaymentRequestDto;
import com.tencoding.CUGGI.dto.request.NicepayRequestDto;
import com.tencoding.CUGGI.dto.response.NicepayResponseDto;
import com.tencoding.CUGGI.dto.response.OrderDetailProductResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;
import com.tencoding.CUGGI.repository.model.Person;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.service.OrderService;
import com.tencoding.CUGGI.service.PersonService;
import com.tencoding.CUGGI.service.UserService;
import com.tencoding.CUGGI.util.DataEncrypt;
import com.tencoding.CUGGI.util.Define;


@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;

	@Autowired
	HttpSession session;
	
	@Autowired
	PersonService personService;

	@GetMapping("/orderList")
	public String orderList( Model model) {
		
		
		User user = (User) session.getAttribute(Define.PRINCIPAL);

		List<OrderListResponseDto> orderList = orderService.readOrderList(user.getId());
		if(orderList.isEmpty()) {
			model.addAttribute("orderList", null);
		} else {
			model.addAttribute("orderList",orderList);
		}

		return "/payment/orderList";
	}

	@GetMapping("/orderDetail/{id}")
	public String orderDetail(@PathVariable("id") int id,Model model) {
									
		
		// 상세보기 상품
		List<OrderDetailProductResponseDto> orderDetailList = orderService.readOrderDetailList(id);
		if(orderDetailList.isEmpty()) {
			model.addAttribute("orderDetailList", null);
		} else {
			model.addAttribute("orderDetailList",orderDetailList);
		}
		
//		// 상세보기 주문자
		OrderDetailProductResponseDto orderDetailPerson = orderService.readOrderDetaiPerson(id);
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPerson", null);
		} else {
			model.addAttribute("orderDetailPerson",orderDetailPerson);
		}
		
		// 결제 금액
		OrderDetailProductResponseDto orderDetailPayment = orderService.readOrderDetaiPayment(id);
		if(orderDetailPerson==null) {
			model.addAttribute("orderDetailPayment", null);
		} else {
			model.addAttribute("orderDetailPayment",orderDetailPayment);
		}

		Order order = orderService.findById(id);	
		if(order==null) {
			model.addAttribute("order", null);
		} else {
			model.addAttribute("order",order);
		}
		return "/payment/orderDetail";
	}
	
	@PostMapping("/orderDetail/{id}")
	public String orderDetailUpdate(@PathVariable("id") int id, UpdateOrderListRequestDto updateOrderListRequestDto) {
		
			
		int result = orderService.orderDetailUpdate(updateOrderListRequestDto);
		return "redirect:/order/orderDetail/" + id; 		
	}
	

	@PostMapping("insertpayment/{orderId}")
	public String insertPayment(@PathVariable("orderId") int orderId, InsertPaymentRequestDto insertPaymentRequestDto,UpdateOrderListRequestDto updateOrderRequestDto) {
		orderService.insertPayment(insertPaymentRequestDto,orderId);	
		orderService.updateOrder(updateOrderRequestDto, orderId);
		
		
		
		orderService.updateProducts(orderId);
		return "redirect:/order/orderDetail/"+orderId; 
	}
	
	@GetMapping("deleteBasket/{id}")
	@ResponseBody
	public Integer deleteOfflineStore(@PathVariable("id") int id) {
	
		int result = orderService.deleteBasket(id);
		return result; 
	}

	
	
	@GetMapping("/basket")
	public String basket(Model model) {
		
		User user = (User) session.getAttribute(Define.PRINCIPAL);
		
		Person person = personService.findByuserId(user.getId());
		model.addAttribute("person",person);
		
		List<OrderBasketResponseDto> orderBasketResponseDto = orderService.readOrderBasketList(user.getId());
		if(orderBasketResponseDto.isEmpty()) {
			model.addAttribute("orderBasketResponseDto", null);
		} else {
			model.addAttribute("orderBasketResponseDto",orderBasketResponseDto);
		}
		
		return "/payment/basket";
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
	
	@PostMapping("/paymentResult")
	public String paymentResult() {			 
		return"/payment/payResult_utf";
	} 
	
	@GetMapping("/addProduct/{productId}")
	@ResponseBody
	public int addProductAtBasket(@PathVariable() int productId) {
		
		User user = (User) session.getAttribute(Define.PRINCIPAL);
		
		orderService.addProductAtBasket(productId, user.getId());
		return 1;
	}
	
}
