package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.User;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Transactional
	private User imsiLogin() {
		return userRepository.findById(1);
	}
}
