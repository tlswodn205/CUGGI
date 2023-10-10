package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductListDto {
	private Integer productId;
	private Integer secondCategoryId;
	private String productName;
	private Integer price;
	private Timestamp createdAt;
	private String image;
	private String secondCategoryName;
	
}
