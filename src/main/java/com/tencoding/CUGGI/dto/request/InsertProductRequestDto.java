package com.tencoding.CUGGI.dto.request;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

import com.tencoding.CUGGI.repository.model.Product;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class InsertProductRequestDto extends Product{

	private List<MultipartFile> thumbImg;
	private List<MultipartFile> detailImg;
	
	public List<ImgRequestDto> toImgReqDtoList(){
		return thumbImg
				.stream()
				.map(ImgRequestDto::new)
				.collect(Collectors.toList());
	}
	
}
