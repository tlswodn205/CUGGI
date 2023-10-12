package com.tencoding.CUGGI.dto.request;

import java.sql.Date;
import java.sql.Timestamp;

import com.tencoding.CUGGI.repository.model.Person;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SignUpDto {
	private String username;
	private String password;
	private String passwordCheck;
	private String name;
	private String address;
	private String address_detail;
	private String email;
	private String phone_number;
	private Date birthday;
	private Integer level;
	
	public Person toPersonEntity(int userId) { 
		
		return new Person(0, name, address, address_detail, email, phone_number, birthday, userId, null);
	}
}
