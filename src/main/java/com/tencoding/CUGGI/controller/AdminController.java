package com.tencoding.CUGGI.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tencoding.CUGGI.dto.request.InsertOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.UpdateOfflineStoreRequestDto;
import com.tencoding.CUGGI.dto.request.UpdateOrderListRequestDto;
import com.tencoding.CUGGI.dto.response.OrderListResponseDto;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.dto.response.AdminPageListDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreListResponseDto;
import com.tencoding.CUGGI.dto.response.OfflineStoreResponseDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerResponseDto;
import com.tencoding.CUGGI.dto.response.QnaListResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.model.Qna;
import com.tencoding.CUGGI.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	HttpSession session;
	
	
	//offlinestore start
	
	@GetMapping(""+"offlineStoreManagement")
	public String offlineStoreManagement(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,@RequestParam(defaultValue = "1") Integer page, Model model) {
		AdminPageListDto<OfflineStoreListResponseDto> adminPageListDto = adminService.OfflineStoreList(type, keyword, page);
		model.addAttribute("adminPageListDto", adminPageListDto);
System.out.println(adminPageListDto.getKeyword());
		return "admin/offlineStore/offlineStoreManagement"; 
	}	
	
	
	@GetMapping("insertOfflineStore")
	public String insertOfflineStore오프라인스토어추가(Model model) {
		return "admin/offlineStore/offlineStoreInsert"; 
	}
	
	@PostMapping("insertOfflineStore")
	public String insertOfflineStore_proc오프라인스토어추가(InsertOfflineStoreRequestDto insertOfflineStoreRequestDto) {
		if(insertOfflineStoreRequestDto.getStoreName() == null || insertOfflineStoreRequestDto.getStoreName().isEmpty()) {
			throw new CustomRestfulException("지점 이름을 입력해주세요", HttpStatus.BAD_REQUEST);
		}

		if(insertOfflineStoreRequestDto.getStoreNumber() == null) {
			throw new CustomRestfulException("지점 전화 번호를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		
		
		if(insertOfflineStoreRequestDto.getStoreAddress() == null || insertOfflineStoreRequestDto.getStoreAddress().isEmpty()) {
			throw new CustomRestfulException("지점 주소를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		
		if(insertOfflineStoreRequestDto.getStoreAddressDetail() == null || insertOfflineStoreRequestDto.getStoreAddressDetail().isEmpty()) {
			throw new CustomRestfulException("지점 상세주소를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		
		adminService.insertOfflineStore(insertOfflineStoreRequestDto);
		

		return "redirect:offlineStoreManagement"; 
	}
	
	@GetMapping("updateOfflineStore/{id}")
	public String updateOfflineStore오프라인스토어수정(@PathVariable("id") int id, Model model) {
		OfflineStoreResponseDto offlineStoreResponseDto = adminService.findOfflineStoreById(id);
		model.addAttribute("offlineStoreResponseDto", offlineStoreResponseDto);
		return "admin/offlineStore/offlineStoreUpdate";
	}

	@PutMapping("updateOfflineStore")
	public String updateOfflineStore_proc오프라인스토어수정(UpdateOfflineStoreRequestDto updateOfflineStoreRequestDto) {
		int result = adminService.updateOfflineStore(updateOfflineStoreRequestDto);
		return "redirect:offlineStoreManagement"; 
	}
	
	@GetMapping("deleteOfflineStore/{id}")
	public String deleteOfflineStore오프라인스토어삭제(@PathVariable("id") int id) {
		int result = adminService.deleteOfflineStore(id);
		return "redirect:admin	/offlineStoreManagement"; 
	}

	//offlinestore end
	
	// order start
	@GetMapping("orderListManagement")
	public String orderListManagent관리자주문내역(Model model) {

		

		List<OrderListResponseDto> orderList = adminService.readOrderList();
		if(orderList.isEmpty()) {
			model.addAttribute("orderList", null);
		} else {
			model.addAttribute("orderList",orderList);
			System.out.println("여기");
		}
		System.out.println(orderList);
		System.out.println("컨트롤러");
		
		

		return "admin/order/orderManagement";
	}
	
	
	
	
	@GetMapping("updateOrderList/{id}")
	public String updateOrderList주문내역수정(@PathVariable("id") int id, Model model) {
		OrderListResponseDto orderListResponseDto = adminService.findOrderListById(id);
		model.addAttribute("orderListResponseDto", orderListResponseDto);
		System.out.println(orderListResponseDto);
		

		
		return "admin/order/orderListUpdate";
	}
	
	@PutMapping("updateOrderList/{id}")
	public String updateOrderListProc주문내역수정(UpdateOrderListRequestDto updateOrderListRequestDto) {
		int result = adminService.updateOrderList(updateOrderListRequestDto);		
		return "redirect: orderManagement"; 
	}
	
	
	// order end
  
	//qna start
	
	@GetMapping("/qnaList")
	public String qnaList문의사항리스트(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,@RequestParam(defaultValue = "1") Integer page,@RequestParam(required = false) String status, Model model) {
		AdminPageListDto<QnaListResponseDto> adminPageListDto = adminService.qnaList(type, keyword, page, status);
		model.addAttribute("adminPageListDto", adminPageListDto);
		return "admin/qna/qnaList";
	}
	
	@GetMapping("/qnaDetail/{id}")
	public String qnaDetail문의사항상세보기(@PathVariable int id, Model model) {
		QnaAnswerResponseDto qnaDetail = adminService.qnlDetail(id);
		model.addAttribute("qnaDetail", qnaDetail);
		return "admin/qna/qnaDetail";
	}
	
	@PostMapping("/qnaAnswer")
	public String qnaAswer문의사항답변(InsertQnaAnswerDto insertQnaAnswerDto) {
		int result = adminService.insertQnaAnswer(insertQnaAnswerDto);
		return "redirect:/admin/qnaList";
	}
	
	//qna end
}
