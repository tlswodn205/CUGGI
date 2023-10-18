package com.tencoding.CUGGI.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tencoding.CUGGI.handler.exception.CustomRestfulException;
import com.tencoding.CUGGI.handler.exception.UnAuthorizedException;
import com.tencoding.CUGGI.repository.model.User;
import com.tencoding.CUGGI.util.Define;

@Component
public class AdminInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle() 메서드 호출");
		HttpSession session = request.getSession(); 
				        
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if(principal == null || principal.getLevel() < 5) {
			throw new CustomRestfulException("관리자만 접근가능합니다.",
					HttpStatus.UNAUTHORIZED);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
