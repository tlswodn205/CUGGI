package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.ProductListDto;
import com.tencoding.CUGGI.repository.interfaces.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	public Map<Integer , List<ProductListDto>> productList(Integer secondCategoryId, String filter) {
		
		List<ProductListDto> productList = productRepository.findByAllForCateOrderByDesc(secondCategoryId, filter); // sql 결과
		
		Map<Integer , List<ProductListDto>> resultMap = new LinkedHashMap<>(); // 맵 생성
		for(ProductListDto dto : productList) {
			Integer productId = dto.getProductId();
			resultMap.computeIfAbsent(productId, ArrayList::new).add(dto);
		}
		
		return resultMap;
	}
}
