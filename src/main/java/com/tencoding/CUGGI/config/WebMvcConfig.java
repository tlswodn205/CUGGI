package com.tencoding.CUGGI.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component // IoC 대상 - 2개 이상의 빈을 등록해야 할 때 사용 
public class WebMvcConfig implements WebMvcConfigurer {
	
	// DI 처리 
	@Autowired
	private AuthInterceptor authInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
		.addPathPatterns("/auth/**");
	}
}