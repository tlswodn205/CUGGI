<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
	#body {
		display: flex;
		align-items: center;
		flex-direction: column;
		justify-content: center;
		padding: 5%;
	}
	#title {
		font-size: 50px;
		font-weight: bold;
		margin-bottom: 50px;
	}
	#subTitle {
		font-size: 30px;
		margin-bottom: 30px;
	}
	button {
		width: 400px;
		height: 56px;
		background-color: black;
		color: white;
		font-size: 18px;
		margin-bottom: 20px;
	}
	button:hover {
        background-color: white;
        color: black;
        border-radius: 0px;
        cursor: pointer;
    }

</style>
	<main>
	<div id="body">
		<div>
			<div id="title">비밀번호 확인</div>
			<div id="subTitle">회원님의 임시 비밀번호입니다.</div>
			<div id="newPassword" name="newPassword">${newPassword}</div>
			<button onclick="location.href='signIn'">로그인</button>
		</div>
	</div>
	</main>
<script>

</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>