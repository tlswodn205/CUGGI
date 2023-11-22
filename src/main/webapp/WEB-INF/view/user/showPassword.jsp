<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<div>
			<div id="title">비밀번호 확인</div>
			<div id="subTitle">회원님의 임시 비밀번호입니다.</div>
			<div id="newPassword" name="newPassword">${newPassword}</div>
			<br><br>
			<button onclick="location.href='signIn'">로그인</button>
		</div>
	</div>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>