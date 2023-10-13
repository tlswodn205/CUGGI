package com.tencoding.CUGGI.AOP;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.tencoding.CUGGI.repository.model.SecondCategory;
import com.tencoding.CUGGI.service.SecondCategoryService;
import java.util.List;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;


@Aspect
@Component
public class AopParameter {
	
	 @Autowired
	 private SecondCategoryService secondCategoryService;
	
    // 포인트 컷 (대표적인 부분 확인)
    // role 설정 ( 하위에 있는 부분에 모든 메소드를 다 aop로 보겠다
	// @GetMapping을 전부 포함하고 AdminController는 제외한다  
	@Pointcut("@annotation(org.springframework.web.bind.annotation.GetMapping) && !target(com.tencoding.CUGGI.controller.AdminController)")
    private void cut() {
    }

    // cut() 메서드가 실행 되는 지점 이전에 before() 메서드 실행
    @Before("cut()")
    public void before(JoinPoint joinPoint) {
        // 특정 패키지 내의 컨트롤러 메서드가 실행되기 전에 실행할 로직
        List<SecondCategory> secondCategoryList = secondCategoryService.selectMenu();
        
        // 메뉴 데이터 추가
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        attributes.getRequest().setAttribute("secondCategoryList", secondCategoryList);
    }

}
