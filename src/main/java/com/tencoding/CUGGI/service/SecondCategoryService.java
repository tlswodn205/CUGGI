package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.SecondCategoryRepository;

@Service
public class SecondCategoryService {
	
	@Autowired
	SecondCategoryRepository secondCategoryRepository;
}
