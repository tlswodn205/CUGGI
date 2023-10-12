package com.tencoding.CUGGI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.CUGGI.dto.request.DeleteUserDto;
import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
import com.tencoding.CUGGI.dto.request.UpdateUserDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.handler.exception.UnSignUpException;
import com.tencoding.CUGGI.repository.interfaces.PersonRepository;
import com.tencoding.CUGGI.repository.interfaces.UserRepository;
import com.tencoding.CUGGI.repository.model.Person;
import com.tencoding.CUGGI.repository.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PersonRepository personRepository;
	
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
		
		User user = userRepository.findByUsername(signUpDto.getUsername());
		Person person = signUpDto.toPersonEntity(user.getId());
		int result2 = personRepository.insert(person);
		if (result != 1) {
			throw new CustomRestfulException("회원가입 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	public User signIn(SignInDto signInDto) {
		User userEntity = userRepository.findByUsername(signInDto.getUsername());
		
		if (userEntity == null || userEntity.getUsername().equals(signInDto.getUsername()) == false) {
			throw new UnSignUpException("존재하지 않는 계정입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
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
	
	public void updateUserForm(UpdateUserDto updateUserDto) {
		User user = userRepository.findById(updateUserDto.getUserId());
		
		if (updateUserDto == null || user.getUsername().contains("_kakao")) {
			updateUserDto.setPassword(user.getPassword());
		} else {
			String hashPwd = passwordEncoder.encode(updateUserDto.getPassword());
			updateUserDto.setPassword(hashPwd);			
		}
		
		User userEntity = updateUserDto.toUserEntity();
		Person personEntity = updateUserDto.toPersonEntity();
		userRepository.updateById(userEntity);
		personRepository.updateByUserId(personEntity);
		Person persons = personRepository.findByUserId(personEntity.getUserId());

		
	}

	public UpdateUserDto findUserandPerson(int id) {
		User userEntity = userRepository.findById(id);
		Person personEntity = personRepository.findByUserId(id);
		UpdateUserDto updateUserDto = new UpdateUserDto(userEntity, personEntity);
		return updateUserDto;
	}

	public void deleteUser(DeleteUserDto deleteUserDto, User user) {
		User userEntity = userRepository.findById(user.getId());
		
		if (!userEntity.getUsername().contains("_kakao")) {		
			boolean isPwdMatched = passwordEncoder.matches(deleteUserDto.getPassword(), userEntity.getPassword());
			if (isPwdMatched == false) {
				throw new CustomRestfulException("잘못 입력하셨습니다", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (isPwdMatched == true) {
				userRepository.deleteById(userEntity);
			}
		}
		else{
			userRepository.deleteById(userEntity);
		}
	}
}
