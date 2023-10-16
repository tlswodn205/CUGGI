package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class ProductSearchListResponseDto {
	private int secondCategoryId;
	private int productId;
	private String productName;
	private String image;
}
