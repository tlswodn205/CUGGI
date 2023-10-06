package com.tencoding.CUGGI.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tencoding.CUGGI.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	HttpSession session;

	/**
	 * 제품목록 이동
	 * 필터시 매개변수 추가
	 * @return 제품목록 페이지
	 */
	@GetMapping("list")
	public String productList() {
		// 서비스 호출
		// 제품 목록 가져오기
		// 필터 설정시 매개변수 추가
		
		return "product/list";
	}
	
	
	/**
	 * 제품상세정보 이동
	 * @param productId
	 * @return 상세페이지
	 */
	@GetMapping("detail")
	public String productDetail(String productId) {
		// 서비스 호출
		// 1. 제품정보 가져오기	
		// 2. 제품 이미지 가져오기
		log.info("productId : " + productId);
		return "product/detail";
	}
}
