package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class AdminProductResponseDto extends ProductResponseDto{
	
	private Integer imgId;
	private Integer isThumbnail;
	private Integer scId;
	private String secondCategoryName;
	private Integer fcId;
	private String firstCategoryName;
	
	@Override
	public void setPrice(Integer price) {
		this.price = String.valueOf(price);
		
	}
	
}
