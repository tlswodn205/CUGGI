package com.tencoding.CUGGI.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tencoding.CUGGI.service.SecondCategoryService;

@Controller
@RequestMapping("/secondCategory")
public class SecondCategoryController {

	@Autowired
	SecondCategoryService secondCategoryService;

	@Autowired
	HttpSession session;
}
