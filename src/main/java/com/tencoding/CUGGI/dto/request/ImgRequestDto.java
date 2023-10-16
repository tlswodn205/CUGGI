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
}
