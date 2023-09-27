package com.tencoding.CUGGI.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tencoding.CUGGI.repository.model.User;

@Mapper
public interface UserRepository {
	public int insert(User user);
	public int updateById(User user);
	public int deleteById(int userId);
	public User findById(int userId);
	public List<User> findByAll();
}
