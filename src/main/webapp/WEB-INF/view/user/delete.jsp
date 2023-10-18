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
		text-align: center;
	}
	#deleteBtn {
		width: 400px;
		height:56px;
		background-color: white;
		color: black;
		font-size: 18px;

	}
	#deleteBtn:hover {
        background-color: black;
        color: white;
        border-radius: 0px;
        cursor: pointer;
    }

</style>
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
				<input type="password" placeholder="비밀번호*" id="password"
					name="password">
				</c:if>
			</div>
			<button type="submit"  onclick="delete()" id="deleteBtn">회원 탈퇴</button>
		</form>
	</div>
	</main>
	
<script>
	function delete() {
		form.submit;
	}
</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>