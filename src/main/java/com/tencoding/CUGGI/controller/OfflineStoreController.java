package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String offLineStore오프라인(Model model) {
		List<OfflineStoreListResponseDto> offlineStoreResponseDtoList = offlineStoreService.OfflineStoreList();
		model.addAttribute("offlineStoreList", offlineStoreResponseDtoList);
		return "offlineStore/offlineStoreList";
	}
}
