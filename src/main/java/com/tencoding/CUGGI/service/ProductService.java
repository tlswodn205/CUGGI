package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.ProductResponseDto;
import com.tencoding.CUGGI.dto.response.ProductSearchListResponseDto;
import com.tencoding.CUGGI.dto.response.ProductListResponseDto;
import com.tencoding.CUGGI.repository.interfaces.ProductRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductService {
	

	@Autowired
	ProductRepository productRepository;
	
	/**
	 * 상품 목록 
	 * @param secondCategoryId
	 * @param filter
	 * @return 상품아이디별로 묶인 map
	 */
	public Map<Integer , List<ProductListResponseDto>> productList(Integer secondCategoryId, String filter, String searchData) {
		
		List<ProductListResponseDto> productList = productRepository.findByAllForCateOrderByDesc(secondCategoryId, filter, searchData); // sql 결과
		
		// 개수 20개 리스트로 바꾸고 맵 변환 or 바로 맵 변환
		Map<Integer , List<ProductListResponseDto>> resultMap = new LinkedHashMap<>();
		int listSize = productList.size();
		if(listSize >= 20) {
			List<ProductListResponseDto> newList = limitListTo20(productList, listSize, 0);
			resultMap = listToMap(newList);
		}else {
			resultMap = listToMap(productList);
		}

		return resultMap;
	}
	
	public Map<Integer , List<ProductListResponseDto>> reloadProductList(Integer secondCategoryId, String filter, String searchData, int startNum) {
		
		List<ProductListResponseDto> productList = productRepository.findByAllForCateOrderByDesc(secondCategoryId, filter, searchData); // sql 결과
		
		// 개수 20개 리스트로 바꾸고 맵 변환 or 바로 맵 변환
		Map<Integer , List<ProductListResponseDto>> resultMap = new LinkedHashMap<>();
		int listSize = productList.size();
		if(listSize >= 20) {
			List<ProductListResponseDto> newList = limitListTo20(productList, listSize, startNum);
			resultMap = listToMap(newList);
		}else {
			resultMap = listToMap(productList);
		}

		return resultMap;
	}
	/**
	 * 상품 목록 개수 체크
	 * @param productList
	 * @return 상품 목록 리스트 사이즈
	 */
	public Integer countProductListSize(Integer secondCategoryId, String filter, String searchData) {
		List<ProductListResponseDto> productList = productRepository.findByAllForCateOrderByDesc(secondCategoryId, filter, searchData);
		return productList.size();
	}
	/**
	 * 상품 상세
	 * @param productId
	 * @return 상품 하나의 정보(이미지 여러개여서 list)
	 */
	public List<ProductResponseDto> productDetail(int productId) {
		return productRepository.findByIdForCate(productId);
	}
	
	
	
	
	
	/**
	 * 화면에 20개만 보여주기위해 list의 개수를 20개로 바꾸는 함수
	 * @param productList
	 * @return newList
	 */
	// 개수 20개 리스트로 바꾸는 함수
	private List<ProductListResponseDto> limitListTo20(List<ProductListResponseDto> productList, int size, int startNum){
		int listSize = productList.size(); // sql 리스트 사이즈
		List<ProductListResponseDto> newList = new ArrayList<>(); // 새로운 리스트 생성
		int count = 0; // 개수제한 변수
		
		for(int i = startNum; i < listSize; i++) {
			if(i+1 > listSize) break; // 최대 인덱스 벗어나는 경우 반복문 중단
			
			// 현재 인덱스의 productId와 다음 인덱스의 productId가 다른 경우 count++
			if(!productList.get(i).getProductId().equals(productList.get(i+1).getProductId())) {
				count++;
			}
			if(count > 19) break; // 0~19 서로다른 productId가 20개 이상이면 반복문 중단
			newList.add(productList.get(i)); // 새로운 리스트에 현재 리스트 아이템 추가
		}
		return newList;
	}
	
	/**
	 * list map 변환 함수
	 * @param listResponseDtos
	 * @return productId를 키값으로 가지는 Map
	 * 맵 변환, 상품아이디 별로 이미지를 묶어야함
	 * LinkedHashMap 맵을 만드는 순서대로 저장해주려면 사용 
	 */
	private Map<Integer, List<ProductListResponseDto>> listToMap(List<ProductListResponseDto> listResponseDtos) {
		Map<Integer , List<ProductListResponseDto>> resultMap = new LinkedHashMap<>();

		for(ProductListResponseDto dto : listResponseDtos) {
			Integer productId = dto.getProductId();
			resultMap.computeIfAbsent(productId, t -> new ArrayList<>()).add(dto); // productId를 기준으로 없으면 추가
		}
		return resultMap;
	}

	/**
	 * 
	 * @param searchData
	 * @return searchList
	 * 헤더 검색
	 */
	public List<ProductSearchListResponseDto> searchProductList(String searchData) {
		List<ProductSearchListResponseDto> searchList = productRepository.findBySearchProductAll(searchData);
		return searchList;
	}	
}
