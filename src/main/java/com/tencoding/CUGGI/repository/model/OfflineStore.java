package com.tencoding.CUGGI.repository.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class OfflineStore {
	int id;
	String storeName;
	int storeNumber;
	String storeAddress;
	String storeAddressDetail;
	Timestamp createdAt;
}
