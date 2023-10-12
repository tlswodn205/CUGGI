package com.tencoding.CUGGI.dto.request;

import java.sql.Date;

import com.tencoding.CUGGI.repository.model.Person;
import com.tencoding.CUGGI.repository.model.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateUserDto {
	
	private int userId;
	private String username;
	private String password;
	private String name;
	private String address;
	private String addressDetail;
	private String email;
	private String phoneNumber;
	private Date birthday;
	
	public UpdateUserDto(User user, Person person) {
		this.userId = user.getId();
		this.username = user.getUsername();
		this.password = user.getPassword();
		this.name = person.getName();
		this.address = person.getAddress();
		this.addressDetail = person.getAddressDetail();
		this.email = person.getEmail();
		this.phoneNumber = person.getPhoneNumber();
		this.birthday = person.getBirthday();
	}
	
	public User toUserEntity() {
		User user = new User(this.userId, this.username, this.password, 0, null);
		return user;
	}
	
	public Person toPersonEntity() {
		Person person = new Person(0, this.name, this.address, this.addressDetail, this.email, this.phoneNumber, this.birthday, this.userId, null);
		return person;
	}
	
}
