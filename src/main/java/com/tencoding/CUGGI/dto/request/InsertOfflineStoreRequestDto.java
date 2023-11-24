package com.tencoding.CUGGI.dto.request;

import com.tencoding.CUGGI.repository.model.OfflineStore;

import lombok.Data;

@Data
public class InsertOfflineStoreRequestDto {
	String storeName;
	String storeNumber;
	String storeAddress;
	String storeAddressDetail;
	
	public OfflineStore toEntity() {
		return new OfflineStore(0 , this.storeName, this.storeNumber, this.storeAddress, this.storeAddressDetail, null);
	}
}
