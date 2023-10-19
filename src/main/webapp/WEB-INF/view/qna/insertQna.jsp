<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
          <%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>

.form-group {
	margin:25px 0;
	
}

.form-group label {
	display: flex;
	margin-left: 9px;
	margin-bottom: 20px;
}

.form-group input {
  font-size: 15px;
  color: #222222;
  width: 500px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  background: none;
  outline: none;
}

.form-group textarea {
  font-size: 15px;
  color: #222222;
  width: 500px;
  border: none;
  border-top: solid #aaaaaa 1px;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  background: none;
  resize:none;
}

.qna-btn {
	width: 100%;
	height: 56px;
	font-size: 18px;
	cursor: pointer;
	border: none;
}
.qna-btn:hover {
	background-color: white;
	color: black;	
	border: 2px solid black;
}

	</style>
        <main>
        	<div class="main-column">
        		<h3>문의사항</h3>	
	            <form id="insertQna" action="insertQna" method="post">
	            	<div class="form-group">
	            		<label for="username">이름</label>
	            		<input type="text" id="username" name="username" placeholder="Name" readonly value="${qnaPerson.name}">
	            	</div>
	            	<div class="form-group">
	            		<label for="username">이메일</label>
	            		<input type="text" id="email" name="email" placeholder="Email" readonly value="${qnaPerson.email}">
	            	</div>
	            	<div class="form-group">
	            		<label for="username">휴대폰 번호</label>
	            		<input type="text" id="phone" name="phoneNumber" placeholder="Phone Number" readonly value="${qnaPerson.phoneNumber}">
	            	</div>
	            	<div class="form-group">
	            		<label for="title">제목</label>
	            		<input type="text" id="title" name="title" placeholder="Title" required>
	            	</div>
	            	<div class="form-group">
	            		<label for="username">문의내용</label>
	            		<textarea rows="10" id="content" name="content" placeholder="Q&A" required></textarea>
	            	</div>
	            	<div class="form-group rt">
						<button class="qna-btn common-black-background common-white-font" type="submit">문의하기</button>
	            	</div>
	            </form>
            </div>
        </main>

          <%@ include file="/WEB-INF/view/layout/footer.jsp" %>
