package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderListResponseDto {

	Timestamp createdAt;
	String image;
	String productName;
	int price;
}
