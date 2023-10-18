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
	#login {
		display: flex;
		flex-direction: column;
	}
	#username {
		width: 380px;
		height: 56px;
		font-size: 18px;
		margin-bottom: 20px;
		padding: 0px 10px;
	}
	#password {
		width: 380px;
		height: 56px;
		font-size: 18px;
		margin-bottom: 30px;
		padding: 0 10px;
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
    .line {
    	display: flex;
    	flex-basis: 100%;
    	align-items: center;
    	color: grey;
    	font-size:15px;
    	margin: 5px 0px;
    }
    .line::before {
    	content:"";
    	flex-grow:1;
    	margin: 20px 5px;
    	background:grey;
    	height: 1px;
    	font-size:0px;
    	line-height: 0px;
    }
    .line::after {
    	content:"";
    	flex-grow:1;
    	margin: 0px 5px;
    	background:grey;
    	height: 1px;
    	font-size:0px;
    	line-height: 0px;
    }
    #line_text {
       	font-size:18px;
    }
</style>
	<main>
	<div id="body">
		<div id="title">나의 CUGGI 계정</div>
		<div id="subTitle">로그인</div>
		<form action="/user/signIn" method="post">
			<div id="login">
				<input type="text" id="username" name="username" placeholder="아이디*">
				<input type="password" id="password" name="password" placeholder="비밀번호*">
			</div>
			<button type="submit" >로그인</button>
			<br>
			<div>
				<div class="line">또는</div>
				<span id="line_text">SNS 계정으로 간편하게 로그인 하세요.</span>
			</div>
			<br>
			<div>
				<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=01b88ff29390c24b3527959d05fbc8ae&redirect_uri=http://192.168.0.65:90/user/kakao/callback">
				<img src="/image/kakao_login_large_wide.png" width="400px" alt=""></a>
			</div>
		</form>
		<br>
		<div>
			<a href="/user/signUp">회원가입</a>
			<a href="/user/findId">아이디 찾기</a>
			<a href="/user/findPassword">비밀번호 찾기</a>
		</div>
	</div>
	</main>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>