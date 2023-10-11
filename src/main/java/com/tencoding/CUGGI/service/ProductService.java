package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.ProductDto;
import com.tencoding.CUGGI.dto.response.ProductListDto;
import com.tencoding.CUGGI.repository.interfaces.ProductRepository;

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
	public Map<Integer , List<ProductListDto>> productList(Integer secondCategoryId, String filter, String searchData) {
		
		List<ProductListDto> productList = productRepository.findByAllForCateOrderByDesc(secondCategoryId, filter, searchData); // sql 결과
		
		// 맵 변환, 상품아이디 별로 이미지를 묶어야함
		Map<Integer , List<ProductListDto>> resultMap = new LinkedHashMap<>(); // . LinkedHashMap 맵을 만드는 순서대로 저장해주려면
		for(ProductListDto dto : productList) {
			Integer productId = dto.getProductId();
			resultMap.computeIfAbsent(productId, ArrayList::new).add(dto); // productId를 기준으로 없으면 추가
		}
		return resultMap;
	}
	
	
	public List<ProductDto> productDetail(int productId) {
		List<ProductDto> productDto = productRepository.findByIdForCate(productId); // sql
		return productDto;
	}
}
