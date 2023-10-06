package com.tencoding.CUGGI.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PagingResponseDto {
	int totalPage;
	int currentPage;
	boolean isFirst;
	boolean isLast;
}
