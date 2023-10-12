package com.tencoding.CUGGI.dto.request;

import java.sql.Timestamp;

public class UpdateOrderRequestDto {
	int id;
	int user_id;
	Timestamp purchaseDate;
	Timestamp cancelDate;
	Timestamp createdAt;
	String state;

}
