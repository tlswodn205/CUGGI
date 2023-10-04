package com.tencoding.CUGGI.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tencoding.CUGGI.service.ProductService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	ProductService productService;

	@Autowired
	HttpSession session;
	
	@GetMapping("/qnaList")
	public String qnaList문의리스트() {
		return "qna/qnaList";
	}
	
	@GetMapping("/insertQna")
	public String insertQna문의등록() {
		return "qna/insertQna";
	}
}
