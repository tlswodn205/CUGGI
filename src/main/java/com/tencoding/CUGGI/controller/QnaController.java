package com.tencoding.CUGGI.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.response.QnaPersonResponseDto;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/qnaList")
	public String qnaList문의리스트() {
		return "qna/qnaList";
	}
	
	@GetMapping("/insertQna")
	public String insertQna문의등록(Model model) {
		User user = new User();
		user.setId(1);
		QnaPersonResponseDto qnaPersonResponseDto = qnaService.readPerson(user.getId());
		model.addAttribute("qnaPerson", qnaPersonResponseDto);
		return "qna/insertQna";
	}
	
	@PostMapping("/insertQna")
	public String insertQnaProc문의등록(QnaFormRequestDto qnaFormRequestDto) {
		qnaService.qnaInsert(qnaFormRequestDto);
		return "redirect:/";
	}
}
