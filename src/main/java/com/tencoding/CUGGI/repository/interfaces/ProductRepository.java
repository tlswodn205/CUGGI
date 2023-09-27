package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.tencoding.CUGGI.repository.model.Product;

@Mapper
public interface ProductRepository {
	public int insert(Product product);
	public int updateById(Product product);
	public int deleteById(int productId);
	public Product findById(int productId);
	public List<Product> findByAll();
	
}
