package com.tencoding.CUGGI.dto.response;

import com.tencoding.CUGGI.repository.model.OfflineStore;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OfflineStoreResponseDto {
	int id;
	String storeName;
	String storeNumber;
	String storeAddress;
	String storeAddressDetail;
	
	public static OfflineStoreResponseDto fromEntity(OfflineStore offlineStore){
		return new OfflineStoreResponseDto(
				offlineStore.getId(), 
				offlineStore.getStoreName(), 
				offlineStore.getStoreNumber(), 
				offlineStore.getStoreAddress(), 
				offlineStore.getStoreAddressDetail()
				);
	}
}
