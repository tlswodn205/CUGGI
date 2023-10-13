package com.tencoding.CUGGI.dto.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateProductReqeustDto {

	private String id;
	private String productName;
	private int price;
	private String productFeature;
	private int quantity;
	private String fcName;
	private String scName;
	
	private int secondCategoryId;
}
