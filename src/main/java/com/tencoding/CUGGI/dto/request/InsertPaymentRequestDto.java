package com.tencoding.CUGGI.dto.request;

import java.sql.Timestamp;

import com.tencoding.CUGGI.repository.model.Payment;

import lombok.Data;

@Data
public class InsertPaymentRequestDto {

	int id;
	String tid;
	int orderId;
	Timestamp createdAt;
	
	public Payment toEntity(int orderId) {	
		return new Payment(this.id, this.tid, orderId, this.createdAt);
	}
	
	
}
