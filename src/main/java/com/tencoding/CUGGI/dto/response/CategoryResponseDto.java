package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class CategoryResponseDto {
	int id;
	String secondCategoryName;
	int firstCategoryId;
	String firstCategoryName;
}
