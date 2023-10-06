package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
import com.tencoding.CUGGI.repository.model.User;

@Mapper
public interface UserRepository {
	public int insert(SignUpDto user);
	public int updateById(User user);
	public int deleteById(int userId);
	public User findById(int userId);
	public List<User> findByAll();
	public User findByUsernameAndPassword(SignInDto signInDto);
	public User findByUsername(String username);
}
