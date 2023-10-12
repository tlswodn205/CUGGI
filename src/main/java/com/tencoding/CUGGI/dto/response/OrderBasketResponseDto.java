package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class OrderBasketResponseDto {

	
	String image;
	String productName;
	int quantity;
	int categoryId;
	int price;
}
