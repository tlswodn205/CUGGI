package com.tencoding.CUGGI.dto.request;


import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ImgRequestDto {

	private String id;
	private MultipartFile file;
	private String image;
	private int isThumbnail;
	private int productId;
	
	public ImgRequestDto(MultipartFile file) {
		this.file = file;
	}
}
