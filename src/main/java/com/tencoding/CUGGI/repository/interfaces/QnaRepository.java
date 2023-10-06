package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.request.QnaFormRequestDto;
import com.tencoding.CUGGI.repository.model.Qna;

@Mapper
public interface QnaRepository {
	public int insert(QnaFormRequestDto qnaFormRequestDto);
	public int updateById(Qna qna);
	public int deleteById(int qnaId);
	public Qna findById(int qnaId);
	public List<Qna> findByAll();
}
