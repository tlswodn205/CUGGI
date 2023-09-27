package com.tencoding.CUGGI.repository.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class OrderProducts {
	int id;
	int quantity;
	int price;
	int productId;
	int orderId;
	String productName;
	Timestamp createdAt;
}
