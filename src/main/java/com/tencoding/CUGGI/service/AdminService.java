package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.dto.response.AdminPageListDto;
import com.tencoding.CUGGI.dto.response.AdminProductResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
<<<<<<< HEAD
import com.tencoding.CUGGI.dto.response.PaymentResponseDto;
=======
import com.tencoding.CUGGI.dto.response.QnaAnswerMailResponseDto;
import com.tencoding.CUGGI.dto.response.PaymentResponseDto;
import com.tencoding.CUGGI.dto.response.ProductResponseDto;
>>>>>>> e7aef6afd88ff8a05a9a1009a375f5f76f79bd59
import com.tencoding.CUGGI.dto.response.QnaAnswerResponseDto;
import com.tencoding.CUGGI.dto.response.QnaListResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.interfaces.FirstCategoryRepository;
import com.tencoding.CUGGI.repository.interfaces.OfflineStoreRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderProductsRepository;
import com.tencoding.CUGGI.repository.interfaces.OrderRepository;
import com.tencoding.CUGGI.repository.interfaces.PaymentRepository;
import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.interfaces.ProductImageRepository;
import com.tencoding.CUGGI.repository.interfaces.ProductRepository;
import com.tencoding.CUGGI.repository.interfaces.QnaRepository;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.Payment;
import com.tencoding.CUGGI.repository.model.Qna;
import com.tencoding.CUGGI.util.Mail;

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
<<<<<<< HEAD

=======
  
	@Resource(name="mail")
	private Mail mail;
  
>>>>>>> e7aef6afd88ff8a05a9a1009a375f5f76f79bd59
	//offlineStore start

	@Transactional
	public AdminPageListDto<OfflineStoreListResponseDto> OfflineStoreList(String type,String kerword,Integer page){
		if(page <= 0) {
			page = 1;
		}
		PagingResponseDto PagingResponseDto = offlineStoreRepository.findPaging(type, kerword, page);
		int startNum = (page-1)*10;
		List<OfflineStore> offlineStoreList = offlineStoreRepository.findByKeywordAndCurrentPage(type, kerword, startNum);

		List<OfflineStoreListResponseDto> offlineStoreListResponseDto = new ArrayList<OfflineStoreListResponseDto>();
		for(int i = 0; i< offlineStoreList.size(); i++) {
			offlineStoreListResponseDto.add(OfflineStoreListResponseDto.fromEntity(
					offlineStoreList.get(i))); 
		}System.out.println("keyword : " + kerword);
		AdminPageListDto<OfflineStoreListResponseDto> adminPageListDto = new AdminPageListDto<OfflineStoreListResponseDto>(PagingResponseDto, kerword, type, null ,offlineStoreListResponseDto);
		return adminPageListDto; 
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
<<<<<<< HEAD


	//	//    주문 내역 
	//	public List<OrderListResponseDto> readOrderList() {
	//		List<OrderListResponseDto> orderList = orderRepository.findByListAdmin();
	//		return orderList;
	//	}
=======
	//    주문 내역 
	public List<OrderListResponseDto> readOrderList() {
		List<OrderListResponseDto> orderList = orderRepository.findByListAdmin();
		return orderList;
	}
  
>>>>>>> e7aef6afd88ff8a05a9a1009a375f5f76f79bd59
	@Transactional
	public AdminPageListDto<OrderListResponseDto> OrderList(String type,String kerword,Integer page,String status){
		if(page <= 0) {
			page = 1;
		}		
		if(status == null) {
			status = "";
		}
		PagingResponseDto PagingResponseDto = orderRepository.findPaging(type, kerword, page, status);
		int startNum = (page-1)*10;
		List<OrderListResponseDto> orderListResponseDto = orderRepository.findByKeywordAndCurrentPage(type, kerword, startNum, status);



		AdminPageListDto<OrderListResponseDto> adminPageListDto = new AdminPageListDto<OrderListResponseDto>(PagingResponseDto, kerword, type, status ,orderListResponseDto);
		return adminPageListDto; 
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

	@Transactional
	public PaymentResponseDto findPayment(int id) {
		Payment orderEntity = paymentRepository.findPayment(id);
		PaymentResponseDto paymentResponseDto = PaymentResponseDto.fromEntity(orderEntity);
		
		return paymentResponseDto;
	}


	//offlineStore end

	//qna start

	@Transactional
	public AdminPageListDto<QnaListResponseDto> qnaList(String type, String kerword,Integer page, String status) {
		if(page <= 0) {
			page = 1;
		}
		PagingResponseDto PagingResponseDto = qnaRepository.findPaging(type, kerword, page, status);
		int startNum = (page-1)*10;
		List<QnaListResponseDto> qnaList = qnaRepository.findByKeywordAndCurrentPage(type, kerword, startNum, status);
		AdminPageListDto<QnaListResponseDto> adminPageListDto = new AdminPageListDto<QnaListResponseDto>(PagingResponseDto, kerword, type, null ,qnaList);
		return adminPageListDto;
	}

	@Transactional
	public QnaAnswerResponseDto qnlDetail(int id) {
		QnaAnswerResponseDto qnaAnswerResponseDto = qnaRepository.findById(id);
		return qnaAnswerResponseDto;
	}

	@Transactional
	public int insertQnaAnswer(InsertQnaAnswerDto insertQnaAnswerDto) {
		qnaRepository.insertAnswer(insertQnaAnswerDto);
		QnaAnswerMailResponseDto qnaAnswerMailResponseDto = qnaRepository.findByQnaId(insertQnaAnswerDto.getQnaId());
		mail.sendAnswerEmail(qnaAnswerMailResponseDto);
		return qnaRepository.updateByQnaid(insertQnaAnswerDto.getQnaId());
	}

	public int updateOrder(UpdateOrderListRequestDto updateOrderRequestDto, int orderId) {
		Order orderEntity = updateOrderRequestDto.toEntity2(orderId);
		int result = orderRepository.orderAdminUpdate(orderEntity);
		
		return result;
	}



	//qna end
	
	// product start
	
	// 나중에 위로 올려주세요@ autowired
	@Autowired
	private ProductRepository productRepository; 
	
	@Transactional
	public AdminPageListDto<ProductResponseDto> adminProductList(String type, String kerword, Integer page) {
		if(page <= 0) page = 1;
		PagingResponseDto PagingResponseDto = productRepository.findPaging(type, kerword, page);
		int startNum = (page - 1) * 10;
		List<ProductResponseDto> productList = productRepository.findByKeywordAndCurrentPage(type, kerword, startNum);
		AdminPageListDto<ProductResponseDto> productPageList = new AdminPageListDto<ProductResponseDto>(PagingResponseDto, kerword, type, null ,productList);
		return productPageList;
	}
<<<<<<< HEAD

	public int updateOrder(UpdateOrderListRequestDto updateOrderRequestDto, int orderId) {
		Order orderEntity = updateOrderRequestDto.toEntity2(orderId);
		int result = orderRepository.orderAdminUpdate(orderEntity);
		
		return result;
	}



	//qna end
=======
	
	@Transactional
	public List<AdminProductResponseDto> findAdminProductResponseDtoByProductId(String productId) {
		return productRepository.findAdminProductByProductId(productId);
	}
	
	// product end
>>>>>>> e7aef6afd88ff8a05a9a1009a375f5f76f79bd59
}
