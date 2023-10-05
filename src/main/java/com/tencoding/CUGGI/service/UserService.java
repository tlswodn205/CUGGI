package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	private User imsiLogin() {
		return userRepository.findById(1);
	}
	
	@Transactional
	public void signUp(SignUpDto signUpDto) {
		String rawPwd = signUpDto.getPassword();
		String hashPwd = passwordEncoder.encode(rawPwd);
		signUpDto.setPassword(hashPwd);
		if (signUpDto.getLevel() == null) {
			signUpDto.setLevel(0);
		}
		int result = userRepository.insert(signUpDto);
		if (result != 1) {
			throw new CustomRestfulException("회원가입 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public User signIn(SignInDto signInDto) {
		User userEntity = userRepository.findByUsername(signInDto.getUsername());
		if (userEntity == null || userEntity.getUsername().equals(signInDto.getUsername()) == false) {
			throw new CustomRestfulException("존재하지 않는 계정입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		boolean isPwdMatched = passwordEncoder.matches(signInDto.getPassword(), userEntity.getPassword());
		if (isPwdMatched == false) {
			throw new CustomRestfulException("잘못 입력하셨습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return userEntity;
	}

	public User searchUsername(String username) {
		return userRepository.findByUsername(username);
	}
}
