package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.tencoding.CUGGI.repository.model.ProductImage;

@Mapper
public interface ProductImageRepository {
	public int insert(ProductImage productImage);
	public int updateById(ProductImage productImage);
	public int deleteById(int productImageId);
	public ProductImage findById(int productImageId);
	public List<ProductImage> findByAll();
	public ProductImage findByProductId(int productImageId);
}
