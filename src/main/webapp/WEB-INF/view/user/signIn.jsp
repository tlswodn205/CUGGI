<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>나의 구찌 계정</h1>
	<h2>로그인</h2>
	<form action="/user/signIn" method="post">
		<div>
			<input type="text" id="username" name="username" placeholder="아이디*">
			<input type="password" id="password" name="password" placeholder="비밀번호*">
		</div>
		<button type="submit" >로그인</button>
		<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=01b88ff29390c24b3527959d05fbc8ae&redirect_uri=http://localhost:90/user/kakao/callback">
		<img src="/image/kakao_login_small.png" width="74" height="38" alt=""></a>
</body>
</html>