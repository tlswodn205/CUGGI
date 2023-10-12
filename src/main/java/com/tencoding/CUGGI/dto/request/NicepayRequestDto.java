package com.tencoding.CUGGI.dto.request;

import lombok.Data;

@Data
public class NicepayRequestDto {
	final String merchantKey = "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
	final String merchantID = "nicepay00m"; 				// 상점아이디
	String goodsName; 					// 결제상품명
	String price;
	int orderId;
	
}
