package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
import com.tencoding.CUGGI.dto.response.QnaListResponseDto;
import com.tencoding.CUGGI.dto.response.UserInfoDetailDto;
import com.tencoding.CUGGI.dto.response.UserInfoListDto;
import com.tencoding.CUGGI.repository.model.User;

@Mapper
public interface UserRepository {
	public int insert(SignUpDto user);
	public int updateById(@Param("user") User user);
	public int deleteById(User user);
	public User findById(int id);
	public List<User> findByAll();
	public User findByUsernameAndPassword(SignInDto signInDto);
	public User findByUsername(String username);
	public User findByEmail(String email);
	public User findByUsernameAndEmail(@Param("username") String username, @Param("email") String email);
	public List<UserInfoListDto> findByKeywordAndCurrentPage(@Param("type")String type, @Param("keyword")String keyword, @Param("startNum")Integer startNum, @Param("status")String status);
	public UserInfoDetailDto findByIdAtAdmin(int id);
}