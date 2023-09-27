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
public class Order {
	int id;
	int userId;
	String state;
	String productFeature ;
	Timestamp purchaseDate;
	Timestamp cancelDate;
	Timestamp createdAt;
}
