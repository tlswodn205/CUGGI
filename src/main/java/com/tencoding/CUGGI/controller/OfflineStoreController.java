package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.service.OfflineStoreService;

@Controller
@RequestMapping("/offlineStore")
public class OfflineStoreController {

	@Autowired
	OfflineStoreService offlineStoreService;

	@Autowired
	HttpSession session;
	
	@GetMapping("")
	public String offLineStore(Model model) {
		List<OfflineStoreListResponseDto> offlineStoreResponseDtoList = offlineStoreService.OfflineStoreList();
		List<String> locator = offlineStoreService.OfflineStoreLocator();
		model.addAttribute("offlineStoreList", offlineStoreResponseDtoList);
		model.addAttribute("locator", locator);
		return "offlineStore/offlineStoreList";
	}
	
	@PostMapping("/location")
	@ResponseBody
	public List<OfflineStoreListResponseDto> offLineStore(Model model, @RequestBody String location) {
		List<OfflineStoreListResponseDto> offlineStoreResponseDtoList = offlineStoreService.OfflineStoreList(location);
		return offlineStoreResponseDtoList;
	}
}
