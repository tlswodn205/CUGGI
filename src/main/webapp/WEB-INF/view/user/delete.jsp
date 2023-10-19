<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<div id="title">회원 탈퇴</div>
		<div id="subTitle">
			<p>
				회원 탈퇴를 하면
				서비스를 더 이상 이용하실 수 없습니다.
				<br>
				회원 탈퇴를 진행하시겠습니까?
			</p>
		</div>
		<form action="/user/delete" method="post">
			<div id="delete">
				<c:if test="${iskakaoUser == false}">
				<input type="password" placeholder="비밀번호*" id="password" name="password">
				</c:if>
			</div>
			<button type="submit" id="deleteBtn">회원 탈퇴</button>
		</form>
	</div>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>