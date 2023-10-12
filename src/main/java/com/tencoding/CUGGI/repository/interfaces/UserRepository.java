package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
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
}
