package com.tencoding.CUGGI.dto.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Data
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdminPageListDto<T>{
	
	int totalPage;
	int currentPage;
	int startPageNum;
	int lastPageNum;
	boolean isFirst;
	boolean isLast;
	String keyword;
	String type;
	String status;
	List<T> list;
	
	public AdminPageListDto(PagingResponseDto pagingResponseDto, String keyword, String type, String status, List<T> list){
		this.totalPage = pagingResponseDto.totalPage;
		this.currentPage = pagingResponseDto.currentPage;
		this.isFirst = pagingResponseDto.isFirst;
		this.isLast = pagingResponseDto.isLast;
		this.keyword = keyword;
		this.type = type;
		this.status = status;
		this.list = list;
		
		int blockCount = 10;

		int currentBlock = this.currentPage / blockCount;
		this.startPageNum = 1 + blockCount * currentBlock;
		this.lastPageNum = 10 + blockCount * currentBlock;

		if (totalPage < lastPageNum) {
			this.lastPageNum = totalPage;
		}
	}
}