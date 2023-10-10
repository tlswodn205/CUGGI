package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDto {

	private Integer id;
	private Integer secondCategoryId;
	private String productName;
	private Integer price;
	private Timestamp createdAt;
	private String image;
	private String secondCategoryName;
	private boolean isThimbnail;
	private int quantity;
	private String productFeature;
	private Integer categoryId;
	
}
