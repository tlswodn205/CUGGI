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
public class Product {
	int id;
	int secondCategoryId;
	String productName ;
	int price;
	int quantity;
	String productFeature ;
	Timestamp createdAt;
}
