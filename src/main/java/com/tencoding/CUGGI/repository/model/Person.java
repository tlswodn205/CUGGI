package com.tencoding.CUGGI.repository.model;

import java.sql.Date;
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
public class Person {
	int id;
	String name;
	String address;
	String addressDetail;
	String email;
	String phoneNumber;
	Date birthday;
	int userId;
	Timestamp createdAt;
}
