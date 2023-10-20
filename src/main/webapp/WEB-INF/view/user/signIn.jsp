<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<div id="title">나의 CUGGI 계정</div>
		<div id="subTitle">로그인</div>
		<form action="/user/signIn" method="post" autocomplete="off">
			<div id="login">
				<input type="text" id="username" name="username" placeholder="아이디*">
				<input type="password" id="password" name="password" placeholder="비밀번호*">
			</div>
			<button type="submit" >로그인</button>
			<br>
			<div id="sns-area">
				<div class="line">또는</div>
				<span id="line_text">SNS 계정으로 간편하게 로그인 하세요.</span>
			</div>
			<br>
			<div>
				<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=01b88ff29390c24b3527959d05fbc8ae&redirect_uri=http://localhost:90/user/kakao/callback">
				<img src="/image/kakao_login_large_wide.png" width="400px" alt=""></a>
			</div>
		</form>
		<br>
		<div id="link-area">
			<a class="common-black-font" href="/user/signUp">회원가입</a>
			<a class="common-black-font" href="/user/findId">아이디 찾기</a>
			<a class="common-black-font" href="/user/findPassword">비밀번호 찾기</a>
		</div>
	</div>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>