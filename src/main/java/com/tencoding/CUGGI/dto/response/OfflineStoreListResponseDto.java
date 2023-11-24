package com.tencoding.CUGGI.dto.response;

import com.tencoding.CUGGI.repository.model.OfflineStore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OfflineStoreListResponseDto {
	int id;
	String storeName;
	String storeNumber;
	String storeAddress;
	String storeAddressDetail;
	

	public static OfflineStoreListResponseDto fromEntity(OfflineStore offlineStore) {
		return new OfflineStoreListResponseDto(offlineStore.getId(),
				offlineStore.getStoreName(), 
				offlineStore.getStoreNumber(), 
				offlineStore.getStoreAddress(),
				offlineStore.getStoreAddressDetail());
	}
}
