package com.tencoding.CUGGI.dto.request;

import java.sql.Timestamp;

import com.tencoding.CUGGI.repository.model.Order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateOrderListRequestDto {

	int id;
	int userId;	
	Timestamp purchaseDate;
	Timestamp cancelDate;
	Timestamp createdAt;
	
	String image;
	String productName;
	int price;
	
	
	


	public Order toEntity() {
		
		return new Order(this.id, this.userId, this.purchaseDate, this.cancelDate, this.createdAt, this.image, this.productName, this.price);
	}





}
