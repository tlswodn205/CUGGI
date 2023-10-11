package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.response.ProductDto;
import com.tencoding.CUGGI.dto.response.ProductListDto;
import com.tencoding.CUGGI.repository.model.Product;

@Mapper
public interface ProductRepository {
	public int insert(Product product);
	public int updateById(Product product);
	public int deleteById(int productId);
	public Product findById(int productId);
	public List<Product> findByAll();
	public List<ProductListDto>findByAllForCateOrderByDesc(@Param("secondCategoryId") Integer secondCategoryId, @Param("filter") String filter, @Param("searchData") String searchData);
	public List<ProductDto> findByIdForCate(int productId);
}
