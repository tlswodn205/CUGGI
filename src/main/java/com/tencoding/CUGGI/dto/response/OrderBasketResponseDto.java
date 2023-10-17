package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class OrderBasketResponseDto {

	int id;
	String image;
	String productName;
	String secondCategoryName;
	int quantity;
	int price;
	int orderId;
	int productId;
	int isThumbnail;
}
