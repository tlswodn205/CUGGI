package com.tencoding.CUGGI.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tencoding.CUGGI.dto.request.ImgRequestDto;
import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.InsertProductRequestDto;
import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateProductReqeustDto;
import com.tencoding.CUGGI.dto.request.UpdateUserDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.dto.response.AdminOrderDetailListResponseDto;
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
import com.tencoding.CUGGI.dto.response.UserInfoDetailDto;
import com.tencoding.CUGGI.dto.response.UserInfoListDto;
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
import com.tencoding.CUGGI.repository.interfaces.SecondCategoryRepository;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;
import com.tencoding.CUGGI.repository.model.Order;
import com.tencoding.CUGGI.repository.model.Payment;
import com.tencoding.CUGGI.repository.model.Person;
import com.tencoding.CUGGI.repository.model.Product;
import com.tencoding.CUGGI.repository.model.Qna;
import com.tencoding.CUGGI.repository.model.SecondCategory;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.util.Mail;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class AdminService {

	@Autowired
	FirstCategoryRepository firstCategoryRepository;

	@Autowired
	SecondCategoryRepository secondCategoryRepository;
	
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
	UserRepository userRepository;

	@Autowired
	OfflineStoreRepository offlineStoreRepository;
  
	@Resource(name="mail")
	private Mail mail;
  
	@Autowired
	private ProductRepository productRepository;
	
	@Value("${file.path}")
	private String filePath;
	
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
		
		
		String selection = "*,";
		
		int i = 0;
		while(true) {
			int changeCount = 0;
			int j = 0;
			while(true) {
				if(orderListResponseDto.get(i).getProductName().charAt(j) == selection.charAt(0)) {
					changeCount =1;
					System.out.println(changeCount);
				}
				if((orderListResponseDto.get(i).getProductName().charAt(j) == ',')&&(changeCount ==1)) {
					String newProductName = ""; 
					newProductName = orderListResponseDto.get(i).getProductName().substring(0, j) + "<br>" + 
							orderListResponseDto.get(i).getProductName().substring(j+1, orderListResponseDto.get(i).getProductName().length());
					orderListResponseDto.get(i).setProductName(newProductName);
					changeCount=0;
				}
				j++;
				if(j>=orderListResponseDto.get(i).getProductName().length()) {
					break;
				}
			}
			i++;
			if(i>=orderListResponseDto.size()) {
				break;
			}
			
		}
		
		return adminPageListDto; 
	}
	

	public List<AdminOrderDetailListResponseDto> findAdminOrderDetailList(int id) {
		List<AdminOrderDetailListResponseDto> orderAdminDetailList = orderRepository.findAdminOrderDetailId(id);
		return orderAdminDetailList;
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
		
		if(orderEntity == null) {
			throw new CustomRestfulException("결제 정보가 없습니다.", HttpStatus.BAD_REQUEST);
		}
		
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
	@Transactional
	public int updateProduct(UpdateProductReqeustDto updateProductReqeustDto) {
		return productRepository.updateById(updateProductReqeustDto);
	}
	/**
	 *  관리자 상품 정보 업데이트 (이미지)
	 * @param Map files
	 */
	@Transactional
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
		List<ImgRequestDto> newlist = uploadFile(list);
		
		// DB img(url) 수정 이미지 변경사항이 있다면
		if(!newlist.isEmpty()) {
			productImageRepository.updateById(newlist);	
		}
		
	}

	/**
	 * 파일 업로드 기능
	 * @param imgRequestDtosList
	 * @return 새로운 파일 이름을 담은 list
	 */
	@Transactional
	public List<ImgRequestDto> uploadFile(List<ImgRequestDto> imgRequestDtosList) {
		for(ImgRequestDto dto : imgRequestDtosList) { // 리스트 순회
			// 파일 가져오기
			MultipartFile file = dto.getFile(); // list 파일 인스턴스 선언
			// 중복 파일 이름 방지
			String oriFileName = file.getOriginalFilename(); // 파일 원본 이름 가져오기
			String uuidStr = UUID.randomUUID().toString(); // 랜덤문자 가져오기
			LocalDate now = LocalDate.now(); // 현재시간 가져오기
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd"); // 시간 포맷 지정
			String formatedNow = now.format(dateTimeFormatter); // 시간 포맷 변환
			String newFileName = uuidStr;
			if(oriFileName != null) {
				int extIndex = oriFileName.indexOf("."); // . 인덱스 가져오기
				String ext = oriFileName.substring(extIndex); // .확장자 가져오기
				newFileName += ext; // 시간_UUID.확장자
			}
			String newDatefolderPath = filePath + formatedNow + File.separator; // 기존 폴더/연월일/
			// 폴더 확인 없으면 업로드 날짜(yyyyMMdd)로 폴더 생성
			File folder = new File(newDatefolderPath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			Path path = Paths.get(newDatefolderPath, newFileName); // 파일 생성(경로 + 파일)
			// 파일 업로드!
			try {
				Files.write(path, file.getBytes());
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			// 새로 만든 파일 이름 list로 set
			String image = formatedNow + File.separator + newFileName;
			dto.setImage(image);
		}
		return imgRequestDtosList;
	}
	
	// 1차 카테고리로 검색
	@Transactional
	public List<SecondCategory> getSecondCategoryListByFirstCategoryId(int firstCategoryId){
		return secondCategoryRepository.findByFirstCategoryId(firstCategoryId);
	}
	// 상품 일반 정보 입력
	@Transactional
	public void insertProduct(InsertProductRequestDto insertProductRequestDto) {
		// 상품 일반
		// retrun 자동증가된 상품의 ID
		productRepository.insert(insertProductRequestDto.getProduct());
		int autoIncreProductId = insertProductRequestDto.getProduct().getId();
		System.out.println(autoIncreProductId);
		// 상품 이미지
		// 썸네일 구분하기
		List<ImgRequestDto> thumbImgList = insertProductRequestDto.toImgReqDtoList(insertProductRequestDto.getThumbImg(), 1, autoIncreProductId);
		List<ImgRequestDto> detailImgList = insertProductRequestDto.toImgReqDtoList(insertProductRequestDto.getDetailImg(), 0, autoIncreProductId);
		// 파일 업로드 하고 바뀐 파일이름 받아오기
		thumbImgList = uploadFile(thumbImgList);
		detailImgList = uploadFile(detailImgList);
		// 새로운 리스토로 합치기
		List<ImgRequestDto> allImgList = new ArrayList<>();
		allImgList.addAll(thumbImgList);
		allImgList.addAll(detailImgList);
		// 상품 이미지 정보 입력
		productImageRepository.insert(allImgList);
	}
	// 상품 삭제
	@Transactional
	public void deleteProduct(Integer productId) {
		// 일반 정보 삭제
		productRepository.deleteById(productId);
		
		// 이미지 정보 삭제
		productImageRepository.deleteById(productId);
		
		
	}
	
	// product end
	
	// user start
	@Transactional
	public AdminPageListDto<UserInfoListDto> userList(String type, String kerword,Integer page, String status) {
		if(page <= 0) {
			page = 1;
		}
		PagingResponseDto PagingResponseDto = qnaRepository.findPaging(type, kerword, page, status);
		int startNum = (page-1)*10;
		List<UserInfoListDto> userList = userRepository.findByKeywordAndCurrentPage(type, kerword, startNum, status);
		System.out.println(userList.get(0).getBirthday());
		AdminPageListDto<UserInfoListDto> adminPageListDto = new AdminPageListDto<UserInfoListDto>(PagingResponseDto, kerword, type, null ,userList);
		return adminPageListDto;
	}

	public UserInfoDetailDto userInfoDetail(int id) {
		UserInfoDetailDto userInfoDetailDto = userRepository.findByIdAtAdmin(id);
		return userInfoDetailDto;
	}

	public int userInfoDetail(UpdateUserDto updateUserDto) {
		User userEntity = updateUserDto.toUserEntity();
		Person personEntity = updateUserDto.toPersonEntity();
		int result = userRepository.updateById(userEntity);
		personRepository.updateByUserId(personEntity);
		return result;
	}


	public int deleteUserInfo(int id) {
		int result = userRepository.deleteById(id);
		personRepository.deleteByUserId(id);
		return result;
	}
}
