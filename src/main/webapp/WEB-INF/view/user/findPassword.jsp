<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<div id="title">비밀번호 찾기</div>
		<div id="subTitle">
			<p>
				아이디와 이메일을 입력해주세요
			</p>
		</div>
		<form action="/user/showPassword" method="post">
			<div>			
				<input type="text" placeholder="아이디*" id="username" name="username">
			</div>
			<div>
				<input type="email" placeholder="email*" id="email" name="email">
			</div>
			<button type="submit">비밀번호 찾기</button>
		</form>
	</div>
	</main>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>