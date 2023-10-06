package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class PaymentDto {

	int orderId;
	int tid;
	int Id;
	int price;
	String buyerName;
	String buyerTel; 				// 구매자연락처
	String buyerEmail; 			// 구매자메일주소
	String moid; 			// 상품주문번호	
	
}
