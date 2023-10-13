package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;
import java.text.DecimalFormat;

import lombok.Data;

@Data
public class ProductResponseDto {

	private Integer id;
	private Integer secondCategoryId;
	private String productName;
	protected String price;
	private String productFeature;
	private int quantity;
	private Timestamp createdAt;
	private String image;
	private String secondCategoryName;
	
	public void setPrice(Integer price) {
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		this.price = decimalFormat.format(price);
	}
}
