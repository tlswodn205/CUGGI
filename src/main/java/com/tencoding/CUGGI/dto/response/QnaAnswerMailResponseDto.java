package com.tencoding.CUGGI.dto.response;

import lombok.Data;

@Data
public class QnaAnswerMailResponseDto {
	private String email;
	private String title;
	private String content;
	private String qatContent;
}
