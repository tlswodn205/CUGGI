package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.response.CategoryResponseDto;
import com.tencoding.CUGGI.repository.model.SecondCategory;

@Mapper
public interface SecondCategoryRepository {
	public int insert(SecondCategory secondCategory);
	public int updateById(SecondCategory secondCategory);
	public int deleteById(int secondCategoryId);
	public SecondCategory findById(int secondCategoryId);
	public List<SecondCategory> findByAll();
	public List<SecondCategory> findByFirstCategoryId(int firstCategoryId);
	public List<CategoryResponseDto> findByMenu();
}
