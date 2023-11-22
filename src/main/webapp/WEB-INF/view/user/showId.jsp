<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<c:if test="${iskakaoUser == false}">
			<div>
				<div id="title">아이디 확인</div>
				<div id="userId" name="userId">${username }</div>
				<br><br>
				<div><button onclick="location.href='signIn'">로그인</button></div>
				<div></div><button onclick="location.href='findPassword'">비밀번호 찾기</button></div>
			</div>
		</c:if>
		<c:if test="${iskakaoUser == true}">
			<div>
				<div id="title">카카오 아이디로 로그인하기</div>
				<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=01b88ff29390c24b3527959d05fbc8ae&redirect_uri=http://localhost:90/user/kakao/callback">
				<img src="/image/kakao_login_large_wide.png" width="400px" alt=""></a>
			</div>
		</c:if>
	</div>
	</main>
<script>

</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>