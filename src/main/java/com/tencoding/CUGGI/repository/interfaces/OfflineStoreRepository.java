package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.repository.model.OfflineStore;

@Mapper
public interface OfflineStoreRepository {
	public int insert(OfflineStore offlineStore);
	public int updateById(OfflineStore offlineStore);
	public int deleteById(int orderId);
	public OfflineStore findById(int offlineStoreId);
	public List<OfflineStore> findByAll();
	public PagingResponseDto findPaging(@Param("type")String type, @Param("keyword")String keyword, @Param("page")Integer page);
	public List<OfflineStore> findByKeywordAndCurrentPage(@Param("type")String type, @Param("keyword")String keyword, @Param("startNum")Integer startNum);
	public List<String> findLocator();
}
