package com.tencoding.CUGGI.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaListResponseDto {
	private int id;
	private int userId;
	private String title;
	private String state;
	private Timestamp createdAt;
	private String name;
}
