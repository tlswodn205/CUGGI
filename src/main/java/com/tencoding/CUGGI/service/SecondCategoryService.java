package com.tencoding.CUGGI.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.SecondCategoryRepository;
import com.tencoding.CUGGI.repository.model.SecondCategory;

@Service
public class SecondCategoryService {
	
	@Autowired
	SecondCategoryRepository secondCategoryRepository;

	public List<SecondCategory> selectMenu() {
		List<SecondCategory> secondCategoryList = secondCategoryRepository.findByAll();
		return secondCategoryList;
	}
}
