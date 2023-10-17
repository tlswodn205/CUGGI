package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDetailProductResponseDto {
	
	String image;
	String productName;
	int categoryId;
	int quantity;
	int price;
	int orderId;
	String name;
	String address;
	String phoneNumber;
	String email;
	String secondCategoryName;
	String state;
	Timestamp createAt;

}
