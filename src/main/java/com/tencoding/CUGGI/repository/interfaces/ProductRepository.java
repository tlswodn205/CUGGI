package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.response.AdminProductResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.dto.response.ProductResponseDto;
import com.tencoding.CUGGI.dto.response.ProductListResponseDto;
import com.tencoding.CUGGI.repository.model.Product;

@Mapper
public interface ProductRepository {
	public int insert(Product product);
	public int updateById(Product product);
	public int deleteById(String productId);
	public Product findById(String productId);
	public Product findById(int productId);
	public List<Product> findByAll();
	public List<ProductListResponseDto>findByAllForCateOrderByDesc(@Param("secondCategoryId") Integer secondCategoryId, @Param("filter") String filter, @Param("searchData") String searchData);
	public List<ProductResponseDto> findByIdForCate(int productId);
	public PagingResponseDto findPaging(@Param("type")String type, @Param("keyword")String keyword, @Param("page")Integer page);
	public List<ProductResponseDto> findByKeywordAndCurrentPage(@Param("type")String type, @Param("keyword")String keyword, @Param("startNum")Integer startNum);
	public List<AdminProductResponseDto> findAdminProductByProductId(String productId);
}
