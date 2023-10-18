package com.tencoding.CUGGI.dto.request;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.web.multipart.MultipartFile;
import com.tencoding.CUGGI.repository.model.Product;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class InsertProductRequestDto {

	private Product product;
	
	private List<MultipartFile> thumbImg;
	private List<MultipartFile> detailImg;
	
	public List<ImgRequestDto> toImgReqDtoList(List<MultipartFile> imgList, int isThumbnail, int productId){
		List<ImgRequestDto> newList = imgList.stream()
											 .map(ImgRequestDto::new)
											 .collect(Collectors.toList());
		
		for(ImgRequestDto dto: newList) {
			dto.setIsThumbnail(isThumbnail);
			dto.setProductId(productId);
		}
		
		return newList;
	}
}
