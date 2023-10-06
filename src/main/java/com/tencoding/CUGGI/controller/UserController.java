package com.tencoding.CUGGI.controller;

import org.springframework.http.HttpHeaders;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.tencoding.CUGGI.dto.request.KakaoProfile;
import com.tencoding.CUGGI.dto.request.OAuthToken;
import com.tencoding.CUGGI.dto.request.SignInDto;
import com.tencoding.CUGGI.dto.request.SignUpDto;
import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.service.UserService;
import com.tencoding.CUGGI.util.Define;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpSession session;
	
	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("signIn")
	public String signIn() {
		return "user/signIn";
	}
	
	@PostMapping("/signUp")
	public String signUpProc(SignUpDto signUpDto) {
		if (signUpDto.getUsername() == null || signUpDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("아이디를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getPassword() == null || signUpDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getName() == null || signUpDto.getName().isEmpty()) {
			throw new CustomRestfulException("이름을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getAddress() == null || signUpDto.getAddress().isEmpty()) {
			throw new CustomRestfulException("주소를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getEmail() == null || signUpDto.getEmail().isEmpty()) {
			throw new CustomRestfulException("이메일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getPhone_number() == null || signUpDto.getPhone_number().isEmpty()) {
			throw new CustomRestfulException("연락처를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signUpDto.getBirthday() == null || signUpDto.getBirthday().isEmpty()) {
			throw new CustomRestfulException("생년월일을 입력하세요", HttpStatus.BAD_REQUEST);
		}
		userService.signUp(signUpDto);
		return "redirect:/user/signIn";
	}
	
	@PostMapping("/signIn")
	public String signInProc(SignInDto signInDto) {

		if (signInDto.getUsername() == null || signInDto.getUsername().isEmpty()) {
			throw new CustomRestfulException("아이디를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		if (signInDto.getPassword() == null || signInDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력하세요", HttpStatus.BAD_REQUEST);
		}
		
		User principal = userService.signIn(signInDto);
		principal.setPassword(null);
		session.setAttribute(Define.PRINCIPAL, principal);
		
		return "redirect:/main";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/user/signIn";
	}
	
	@GetMapping("/kakao/callback")
	public String kakaoCallback(@RequestParam String code, Model model) {
		System.out.println("메서드 동작");
		
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "01b88ff29390c24b3527959d05fbc8ae");
		params.add("redirect_uri", "http://localhost:90/user/kakao/callback");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> reqMes = 
				new HttpEntity<>(params, headers);
		
		ResponseEntity<OAuthToken> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, reqMes, OAuthToken.class);
		System.out.println("액세스 토큰 확인" + response.getBody().toString());
		
		RestTemplate ret2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + response.getBody().getAccessToken());
		headers2.add("Content-type", "Content-type: application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<MultiValueMap<String, String>> kakaoInfo = new HttpEntity<>(headers2);
		
		ResponseEntity<KakaoProfile> response2 = ret2.exchange
				("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoInfo, KakaoProfile.class);
		System.out.println("------------------------------------------------");
		System.out.println(response2.getBody().getKakaoAccount().getEmail());
		
		System.out.println("-------카카오 서버에 정보 받기 완료-------");
		
		KakaoProfile kakaoProfile = response2.getBody();
		
		SignUpDto signUpDto = SignUpDto
				.builder()
				.username(kakaoProfile.getKakaoAccount().getEmail()+"_"+kakaoProfile.getId())
				.password("tencoKey")
				.build();

		User oldUser = userService.searchUsername(signUpDto.getUsername());
		if (oldUser == null) {
			//userService.signUp(signUpDto);
			oldUser.setUsername(signUpDto.getUsername());
		}
		//oldUser.setPassword(null);
		
		//session.setAttribute(Define.PRINCIPAL, oldUser);
		model.addAttribute("user", oldUser);
		model.addAttribute("password", oldUser);
		return "/user/signUp";
		
	}
}
