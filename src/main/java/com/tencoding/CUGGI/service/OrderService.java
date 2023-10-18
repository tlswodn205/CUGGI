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
import com.tencoding.CUGGI.repository.interfaces.ProductRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.OrderProducts;
import com.tencoding.CUGGI.repository.model.Payment;
import com.tencoding.CUGGI.repository.model.Product;


@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	OrderProductsRepository orderProductsRepository;
	
	@Autowired
	PaymentRepository paymentRepository;
	
	@Autowired
	ProductRepository productRepository;

	public List<OrderListResponseDto> readOrderList(int id) {
		List<OrderListResponseDto> list = orderRepository.findByList(id);
		
		String selection = "*,";
		if(list.size() > 0) {
			int i = 0;
			while(true) {
				int changeCount = 0;
				int j = 0;
				while(true) {
					if(list.get(i).getProductName().charAt(j) == selection.charAt(0)) {
						changeCount =1;
						System.out.println(changeCount);
					}
					if((list.get(i).getProductName().charAt(j) == ',')&&(changeCount ==1)) {
						String newProductName = ""; 
						newProductName = list.get(i).getProductName().substring(0, j) + "<br>" + 
											list.get(i).getProductName().substring(j+1, list.get(i).getProductName().length());
						list.get(i).setProductName(newProductName);
						changeCount=0;
					}
					j++;
					if(j>=list.get(i).getProductName().length()) {
						break;
					}
				}
				i++;
				if(i>=list.size()) {
					break;
				}
				
			}
			
		}

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
		System.out.println(basketList);
		if(basketList==null) {
			Order basket = new Order(0, id, null, null, null, null, null, null, 0, 0);
			orderRepository.insert(basket);
		}
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

	public void addProductAtBasket(int productId, int userId) {
		Order orderEntity = orderRepository.findByUserId(userId);
		if(orderEntity ==null) {
			Order basket = new Order(0, userId, null, null, null, null, null, null, 0, 0);
			int orderId = orderRepository.insert(basket);
			orderEntity = orderRepository.findById(orderId);
		}
		
		Product product = productRepository.findById(productId);
		OrderProducts orderProductsEntity = orderProductsRepository.findByOrderIdAndProductId(orderEntity.getId(), productId);
		if(orderProductsEntity != null) {
			throw new CustomRestfulException("이미 등록된 상품입니다.", HttpStatus.BAD_REQUEST);
		}
		OrderProducts orderProducts = new OrderProducts(orderEntity.getId(), product);
		orderProductsRepository.insert(orderProducts);
	  }
	
	public int deleteBasket(int id) {
		int result = orderRepository.deleteBasket(id);
		return result;
	}

	public int updateProducts(int orderId) {
		List<OrderProducts> list = orderProductsRepository.findByOrderId(orderId);
		int result =0;
		for(int i=0; i<list.size(); i++) {
			result = orderProductsRepository.updateByOrderId(list.get(i));
		}
		
		return result;
	}
	

}
