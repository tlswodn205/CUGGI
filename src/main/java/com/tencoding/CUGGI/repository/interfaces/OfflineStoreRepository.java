package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.repository.model.OfflineStore;

@Mapper
public interface OfflineStoreRepository {
	public int insert(OfflineStore offlineStore);
	public int updateById(OfflineStore offlineStore);
	public int deleteById(int orderId);
	public OfflineStore findById(int offlineStoreId);
	public List<OfflineStore> findByAll();
}
