package com.tencoding.CUGGI.dto.response;

import com.tencoding.CUGGI.repository.model.Person;

import lombok.Data;

@Data
public class QnaPersonResponseDto {
	private int userId;
	private String name;
	private String email;
	private String phoneNumber;
	
	public QnaPersonResponseDto(Person person) {
		this.userId = person.getUserId();
		this.name = person.getName();
		this.email = person.getEmail();
		this.phoneNumber = person.getPhoneNumber();
	}
}
