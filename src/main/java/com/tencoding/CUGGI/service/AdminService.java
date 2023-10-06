package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.interfaces.FirstCategoryRepository;
import com.tencoding.CUGGI.repository.interfaces.OfflineStoreRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderProductsRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderRepository;
import com.tencoding.CUGGI.repository.interfaces.PaymentRepository;
import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.interfaces.ProductImageRepository;
import com.tencoding.CUGGI.repository.interfaces.QnaRepository;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;

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
	
	@Autowired
	OfflineStoreRepository offlineStoreRepository;
	
	//offlineStore start

	@Transactional
	public List<OfflineStoreListResponseDto> OfflineStoreList(){
		List<OfflineStore> offlineStoreList = offlineStoreRepository.findByAll();
		
		List<OfflineStoreListResponseDto> offlineStoreResponseDtoList = new ArrayList<OfflineStoreListResponseDto>();
		for(int i = 0; i< offlineStoreList.size(); i++) {
			offlineStoreResponseDtoList.add(OfflineStoreListResponseDto.fromEntity(
					offlineStoreList.get(i))); 
		}
		return offlineStoreResponseDtoList; 
	}

	@Transactional
	public int insertOfflineStore(InsertOfflineStoreRequestDto insertOfflineStoreRequestDto) {
		OfflineStore offlineStoreEntity = insertOfflineStoreRequestDto.toEntity();
		
		return offlineStoreRepository.insert(offlineStoreEntity);
	}

	@Transactional
	public OfflineStoreResponseDto findOfflineStoreById(int id) {
		OfflineStore offlineStoreEntity = offlineStoreRepository.findById(id);
		if(offlineStoreEntity == null) {
			throw new CustomRestfulException("등록되지 않은 지점입니다.", HttpStatus.BAD_REQUEST);
		}
		OfflineStoreResponseDto offlineStoreResponseDto = OfflineStoreResponseDto.fromEntity(offlineStoreEntity);
		return offlineStoreResponseDto;
	}

	@Transactional
	public int updateOfflineStore(UpdateOfflineStoreRequestDto updateOfflineStoreRequestDto) {
		OfflineStore offlineStoreEntity = updateOfflineStoreRequestDto.toEntity();
		int result = offlineStoreRepository.updateById(offlineStoreEntity);
		return result;
	}
	
	public int deleteOfflineStore(int id) {
		int result = offlineStoreRepository.deleteById(id);
		return result;
	}
	
	
	//    주문 내역 
	public List<OrderListResponseDto> readOrderList() {
		List<OrderListResponseDto> orderList = orderRepository.findByListAdmin();
		return orderList;
	}

	@Transactional
	public OrderListResponseDto findOrderListById(int id) {
		Order orderEntity = orderRepository.findByDetailId(id);	
		
		if(orderEntity == null) {
			throw new CustomRestfulException("등록되지 않은 주문 내역입니다.", HttpStatus.BAD_REQUEST);
		}
		OrderListResponseDto orderListResponseDto = OrderListResponseDto.fromEntity(orderEntity);
		
		return orderListResponseDto;
	}

	@Transactional
	public int updateOrderList(UpdateOrderListRequestDto updateOrderListRequestDto) {
		Order orderEntity = updateOrderListRequestDto.toEntity();
		int result = orderRepository.updateById(orderEntity);
		return result;
	}
	
	

	//offlineStore end
}
