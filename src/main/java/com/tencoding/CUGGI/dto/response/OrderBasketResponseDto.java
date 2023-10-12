package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class OrderBasketResponseDto {

	
	String image;
	String productName;
	String secondCategoryName;
	int quantity;
	int price;
	int orderId;
}
