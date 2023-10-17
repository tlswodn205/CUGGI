package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminOrderDetailListResponseDto{
	 int id;   // orderId
     Timestamp purchaseDate;
     int userId;
     String productName;
     int price;
     String tid;
     String state;
     int quantity;

}
