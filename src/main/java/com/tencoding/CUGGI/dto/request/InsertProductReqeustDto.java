package com.tencoding.CUGGI.dto.request;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class InsertProductReqeustDto {

	private String id;
	private String productName;
	private int price;
	private String productFeature;
	private int quantity;
	private String fcName;
	private String scName;
	private List<MultipartFile> thumbnails;
	private List<MultipartFile> detailImgs;
	
}
