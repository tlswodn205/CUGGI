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
	#username {
		width: 380px;
		height: 56px;
		font-size: 18px;
		margin-bottom: 20px;
		padding: 0px 10px;
	}
	#email {
		width: 380px;
		height: 56px;
		font-size: 18px;
		margin-bottom: 20px;
		padding: 0px 10px;
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
			<button type="submit"  onclick="findPassword()">비밀번호 찾기</button>
		</form>
	</div>
	</main>
	
<script>
	function findPassword() {
		form.submit;
	}
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>