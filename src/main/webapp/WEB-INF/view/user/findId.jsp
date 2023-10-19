<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
	<main>
	<div id="body">
		<div id="title">아이디 찾기</div>
		<div id="subTitle">
			<p>
				이메일을 입력해주세요
			</p>
		</div>
		<form action="/user/findId" method="post">
			<div>
				<input type="email" placeholder="email*" id="email"
					name="email">
			</div>
			<button type="submit">아이디 찾기</button>
		</form>
	</div>
	</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>