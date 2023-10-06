package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.response.AdminPageListDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerResponseDto;
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
import com.tencoding.CUGGI.repository.model.Qna;

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
		}
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

	//offlineStore end
	
	//qna start
	
	@Transactional
	public List<Qna> qnaList() {
		List<Qna> qnaList = qnaRepository.findByAll();
		return qnaList;
	}
	
	@Transactional
	public QnaAnswerResponseDto qnlDetail(int id) {
		QnaAnswerResponseDto qnaAnswerResponseDto = qnaRepository.findById(id);
		return qnaAnswerResponseDto;
	}

	@Transactional
	public int insertQnaAnswer(InsertQnaAnswerDto insertQnaAnswerDto) {
		qnaRepository.updateByQnaid(insertQnaAnswerDto.getQnaId());
		return qnaRepository.insertAnswer(insertQnaAnswerDto);
	}
	
	//qna end
}
