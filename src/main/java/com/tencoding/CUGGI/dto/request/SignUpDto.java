package com.tencoding.CUGGI.dto.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SignUpDto {
	private String username;
	private String password;
	private String name;
	private String address;
	private String email;
	private String phone_number;
	private String birthday;
	private Integer level;
}
