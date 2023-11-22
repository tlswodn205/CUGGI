package com.tencoding.CUGGI.service;

import javax.annotation.Resource;

import com.tencoding.CUGGI.repository.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.response.QnaPersonResponseDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.interfaces.QnaRepository;
import com.tencoding.CUGGI.util.Mail;

@Service
public class QnaService {
	
	@Autowired
	QnaRepository qnaRepository;
	
	@Autowired
	PersonRepository personRepository;
	
	@Resource(name="mail")
	private Mail mail;

	public QnaPersonResponseDto readPerson(int id) {
		QnaPersonResponseDto qnaPersonResponseDto = new QnaPersonResponseDto(personRepository.findByUserId(id));
		return qnaPersonResponseDto;
	}

	public void qnaInsert(QnaFormRequestDto qnaFormRequestDto) {

		int result = qnaRepository.insert(qnaFormRequestDto);
		mail.sendSimpleEmail(qnaFormRequestDto);
		if(result != 1) {
			throw new CustomRestfulException("문의사항 기입이 되지 않았습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
}
