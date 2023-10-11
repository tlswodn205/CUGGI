package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.repository.interfaces.ProductImageRepository;
import com.tencoding.CUGGI.repository.model.ProductImage;

@Service
public class ProductImageService {
	
	@Autowired
	ProductImageRepository productImageRepository;
	

	/**
	 * 상품 detail 섬네일 가져오기
	 * @param productImageId
	 * @return ProductImage
	 */
	public ProductImage getFirstThumbnail(int productImageId) {
		return productImageRepository.findByProductId(productImageId);
	}
}
