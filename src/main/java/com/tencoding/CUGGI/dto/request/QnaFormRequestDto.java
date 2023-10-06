package com.tencoding.CUGGI.dto.request;

import lombok.Data;

@Data
public class QnaFormRequestDto {
	private String username;
	private String phoneNumber;
	private String title;
	private String email;
	private String content;
	private int userId;
}
