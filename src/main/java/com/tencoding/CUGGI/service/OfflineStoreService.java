package com.tencoding.CUGGI.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.response.AdminPageListDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.repository.interfaces.OfflineStoreRepository;
import com.tencoding.CUGGI.repository.model.OfflineStore;

@Service
public class OfflineStoreService {
	
	@Autowired
	OfflineStoreRepository offlineStoreRepository;
	
	public List<OfflineStoreListResponseDto> OfflineStoreList(){
		List<OfflineStore> offlineStoreList = offlineStoreRepository.findByAll();
		
		List<OfflineStoreListResponseDto> offlineStoreResponseDtoList = new ArrayList<OfflineStoreListResponseDto>();
		for(int i = 0; i< offlineStoreList.size(); i++) {
			offlineStoreResponseDtoList.add(OfflineStoreListResponseDto.fromEntity(
					offlineStoreList.get(i))); 
		}
		return offlineStoreResponseDtoList; 
	}
	

	public List<String> OfflineStoreLocator(){

		List<String> locator = offlineStoreRepository.findLocator();
		
		return locator;
	}
	
	public List<OfflineStoreListResponseDto> OfflineStoreList(String location){
		location = location.replaceAll("\"", "");
		List<OfflineStore> offlineStoreList = offlineStoreRepository.findByAddress(location);

		System.out.println(offlineStoreList.toString());
		List<OfflineStoreListResponseDto> offlineStoreListResponseDto = new ArrayList<OfflineStoreListResponseDto>();
		for(int i = 0; i< offlineStoreList.size(); i++) {
			offlineStoreListResponseDto.add(OfflineStoreListResponseDto.fromEntity(
					offlineStoreList.get(i))); 
		}
		return offlineStoreListResponseDto; 
	}

}