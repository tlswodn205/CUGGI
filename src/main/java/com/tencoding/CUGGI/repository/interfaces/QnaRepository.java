package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.request.InsertQnaAnswerDto;
import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.dto.response.PagingResponseDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerMailResponseDto;
import com.tencoding.CUGGI.dto.response.QnaAnswerResponseDto;
import com.tencoding.CUGGI.dto.response.QnaListResponseDto;
import com.tencoding.CUGGI.repository.model.Qna;

@Mapper
public interface QnaRepository {
	public int insert(QnaFormRequestDto qnaFormRequestDto);
	public int updateById(Qna qna);
	public int deleteById(int qnaId);
	public QnaAnswerResponseDto findById(int qnaId);
	public List<Qna> findByAll();
	public int insertAnswer(InsertQnaAnswerDto insertQnaAnswerDto);
	public int updateByQnaid(int qnaId);
	public PagingResponseDto findPaging(@Param("type")String type, @Param("keyword")String keyword, @Param("page")Integer page, @Param("status")String status);
	public List<QnaListResponseDto> findByKeywordAndCurrentPage(@Param("type")String type, @Param("keyword")String keyword, @Param("startNum")Integer startNum, @Param("status")String status);
	public QnaAnswerMailResponseDto findByQnaId(int qnaId);
}
