package com.tencoding.CUGGI.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tencoding.CUGGI.dto.response.ProductDto;
import com.tencoding.CUGGI.dto.response.ProductListDto;
import com.tencoding.CUGGI.repository.model.ProductImage;
import com.tencoding.CUGGI.service.ProductImageService;
import com.tencoding.CUGGI.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	ProductImageService productImageService;

	@Autowired
	HttpSession session;

	/**
	 * 제품목록 이동
	 * 필터시 매개변수 추가
	 * @return 제품목록 페이지
	 */
	@GetMapping("list")
	public String productList(Integer secondCategoryId, 
			@RequestParam(defaultValue = "createAt", required = true )String filter, 
			@RequestParam(required = false) String searchData, 
			Model model) {
		// 서비스 호출
		// 제품 목록 가져오기
		// 필터 설정시 매개변수 추가
		secondCategoryId = 1; // 임시 변수
//		log.info("filter : " + filter);
//		log.info("scCateId : " + secondCategoryId);
//		log.info("searchData : " + searchData);
//		log.info("list : " + productMap);
		
		Map<Integer , List<ProductListDto>> productMap = productService.productList(secondCategoryId, filter, searchData);
		model.addAttribute("productMap", productMap);
		
		return "product/list";
	}
	
	
	/**
	 * 제품상세정보 이동
	 * @param productId
	 * @return 상세페이지
	 */
	@GetMapping("detail")
	public String productDetail(int productId, Model model) {
		// 서비스 호출
		// 1. 제품정보 가져오기	
		// 2. 제품 이미지 가져오기
//		log.info("productId : " + productId);
		List<ProductDto> productDto = productService.productDetail(productId);
		model.addAttribute("productList", productDto);
		
		// 3. 하단 섬네일 가져오기
		ProductImage productImage = productImageService.getFirstThumbnail(productId);
		model.addAttribute("productImage", productImage);
		return "product/detail";
	}
}
