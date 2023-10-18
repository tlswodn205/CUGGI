package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.request.ImgRequestDto;
import com.tencoding.CUGGI.repository.model.ProductImage;

@Mapper
public interface ProductImageRepository {
	public int insert(List<ImgRequestDto> allImgList);
	public int updateById(List<ImgRequestDto> imgList);
	public int deleteById(int productImageId);
	public ProductImage findById(int productImageId);
	public List<ProductImage> findByAll();
	public ProductImage findByProductId(int productImageId);
	public int deleteByProductId(int productId);
}