package com.tencoding.CUGGI.dto.response;

import java.sql.Date;

import lombok.Data;
@Data
public class UserInfoListDto {
	private int id;
	private String username;
	private String name;
	private String address;
	private String addressDetail;
	private String email;
	private String phoneNumber;
	private Date birthday;
	private int level;

}
