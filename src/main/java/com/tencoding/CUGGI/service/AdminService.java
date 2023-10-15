package com.tencoding.CUGGI.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tencoding.CUGGI.dto.request.ImgRequestDto;
import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateProductReqeustDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.dto.response.AdminPageListDto;
import com.tencoding.CUGGI.dto.response.AdminProductResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.dto.response.PaymentResponseDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerMailResponseDto;
import com.tencoding.CUGGI.dto.response.ProductResponseDto;
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
import com.tencoding.CUGGI.repository.model.SecondCategory;
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
  
	@Resource(name="mail")
	private Mail mail;
  
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
	
	//    주문 내역 
	public List<OrderListResponseDto> readOrderList() {
		List<OrderListResponseDto> orderList = orderRepository.findByListAdmin();
		return orderList;
	}
  
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
	
	// 관리자 상품 목록
	@Transactional
	public AdminPageListDto<ProductResponseDto> adminProductList(String type, String kerword, Integer page) {
		if(page <= 0) page = 1;
		PagingResponseDto PagingResponseDto = productRepository.findPaging(type, kerword, page);
		int startNum = (page - 1) * 10;
		List<ProductResponseDto> productList = productRepository.findByKeywordAndCurrentPage(type, kerword, startNum);
		AdminPageListDto<ProductResponseDto> productPageList = new AdminPageListDto<ProductResponseDto>(PagingResponseDto, kerword, type, null ,productList);
		return productPageList;
	}
	// 관리자 상품 상세
	@Transactional
	public List<AdminProductResponseDto> findAdminProductResponseDtoByProductId(String productId) {
		return productRepository.findAdminProductByProductId(productId);
	}
	// 관리자 상품 정보 업데이트 (이미지 제외) 
	public int updateProduct(UpdateProductReqeustDto updateProductReqeustDto) {
		// 2차 카테고리 이름을 가져오므로 DB에서 조회한 2차 카테고리 이름과 비교하여 카테고리아이디를 Set한다.
		List<SecondCategory> cateScList = secondCategoryService.getSecondCategoryList();
		for(SecondCategory category : cateScList) {
			if(updateProductReqeustDto.getScName().equals(category.getSecondCategoryName())) {
				updateProductReqeustDto.setSecondCategoryId(category.getId());
			}
		}
		
		return productRepository.updateById(updateProductReqeustDto);
	}
	// 관리자 상품 정보 업데이트 (이미지)
	public void updateProductImage(Map<String, MultipartFile> files) {
		// List 선언
		List<ImgRequestDto> list = new ArrayList<>();
		// 키값을 Set으로 가져오기
		Set<String> keys = files.keySet();
		for (String key : keys) {		// Set 순회
			if(files.get(key).getSize() != 0) { // 키값으로 찾은 multifile의 사이즈가 0이 아니라면(파일이 존재한다면)
				ImgRequestDto dto = ImgRequestDto.builder() // 객체 생성
												.id(key)
												.file(files.get(key))
												.build();
				list.add(dto); // 리스트로 추가
			}
		}
		// 파일 업로드 기능
		uploadFile(list);
		
		
		// DB img(url) 수정
		// productImageRepository.updateById(list);
	}
	
	// TODO 파일 업로드 
	public boolean uploadFile(List<ImgRequestDto> list) {
		
		for(ImgRequestDto dto : list) { // 리스트 순회
			
			MultipartFile file = dto.getFile(); // list 파일 인스턴스 선언
			String oriFileName = file.getOriginalFilename(); // 파일 원본 이름 가져오기
			String uuidStr = UUID.randomUUID().toString(); // 랜덤문자 가져오기
			int extIndex = oriFileName.indexOf("."); // . 인덱스 가져오기
			String ext = oriFileName.substring(extIndex); // .확장자 가져오기
			LocalDateTime now = LocalDateTime.now(); // 현재시간 가져오기
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss"); // 시간 포맷 지정
			String formatedNow = now.format(dateTimeFormatter); // 시간 포맷 변환
			String newFileName = formatedNow + "_" + uuidStr + ext; // 시간_UUID.확장자 
			
			
		}
		
		
		
		return false;
	}
	
	
	
	// product end
}
