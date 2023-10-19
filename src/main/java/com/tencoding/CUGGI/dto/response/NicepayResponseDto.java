package com.tencoding.CUGGI.dto.response;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.tencoding.CUGGI.dto.request.NicepayRequestDto;
import com.tencoding.CUGGI.util.DataEncrypt;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NicepayResponseDto {
	String ediDate;	
	String hashString;
	final String returnURL = "/order/paymentResult"; // 결과페이지(절대경로) - 모바일 결제창 전용
	
	public NicepayResponseDto(NicepayRequestDto nicepayRequestDto){	
		DataEncrypt sha256Enc = new DataEncrypt();
		this.ediDate = getyyyyMMddHHmmss();	
		this.hashString = sha256Enc.encrypt(this.ediDate + nicepayRequestDto.getMerchantID() + nicepayRequestDto.getPrice() + nicepayRequestDto.getMerchantKey());
	}

	public final synchronized String getyyyyMMddHHmmss(){
		SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
		return yyyyMMddHHmmss.format(new Date());
	}
}
