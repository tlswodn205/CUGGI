<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
				<div class="list-table-form">
					<h2>회원정보 관리 페이지</h2>
					<div class="top-menu">
						<div>
					    <input type="hidden" id="status" value="${adminPageListDto.status}">
						<select id="type" name="type" >
						    <option value="name" ${adminPageListDto.type eq "name" ? "selected":""}>이름</option>
						    <option value="username" ${adminPageListDto.type eq "username" ? "selected":""}>아이디</option>
						</select>
						<input type="text" id="keyword" placeholder="검색" value="${adminPageListDto.keyword}">
						<input type="button" id="search-btn" value="검색하기" onclick="search()">
						</div>
					</div>
					<table class = "list-table">
					    <thead>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>생년월일</th>
								<th>권한</th>
								<th>상세보기 및 수정</th>
							</tr>
						</thead>
					    <tbody>
					    	<c:choose>
					    		<c:when test="${adminPageListDto != null}">
					    			<c:forEach var="user" items="${adminPageListDto.list}">
								        <tr>
								            <td>${user.id}</td>
								            <td>${user.username}</td>
								            <td>${user.name}</td>
								            <td>${user.address}</td>
								            <td>${user.addressDetail}</td>
								            <td>${user.email}</td>
								            <td>${user.phoneNumber}</td>
								            <td>${user.birthday}</td>
								            <td>${user.level}</td>
								            <td><input type="button" onclick="location.href='./userInfoDetail/${user.id}'" value="수정 및 상세보기"></td>
								        </tr>
							        </c:forEach>
						        </c:when>
					        </c:choose>
					    </tbody>
					</table>
					<a href="?page=1&type=${adminPageListDto.type}&keyword=${adminPageListDto.keyword}">전체보기</a>
					<a href="?page=1&type=${adminPageListDto.type}&keyword=${adminPageListDto.keyword}&status=확인중">확인중</a>
					<a href="?page=1&type=${adminPageListDto.type}&keyword=${adminPageListDto.keyword}&status=답변 완료">답변완료</a>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<li class='page-item'>
								<c:choose>
									<c:when test="${adminPageListDto.first}">
										<label>Prev</label>
									</c:when>
									<c:otherwise>	
										<a class="page-link" href="?page=${adminPageListDto.currentPage-1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Prev</a>
									</c:otherwise> 
								</c:choose> 
							</li>
							<c:forEach var ="num" begin = "${adminPageListDto.startPageNum}" end="${adminPageListDto.lastPageNum}">
								<li class='page-item'><a class='page-link' href="?page=${num}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
							</c:forEach>
							<li class='page-item'>
								<c:choose>
									<c:when test="${adminPageListDto.last}">
										<label>Next</label>
									</c:when>
									<c:otherwise>	
										<a class="page-link" href="?page=${adminPageListDto.currentPage+1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Next</a>
									</c:otherwise> 
								</c:choose>
							</li>
						</ul>
					</div>
				</div>			
<script type="text/javascript">
//delete 확인 자바스크립트
function isDelete(form){
	const response = confirm("정말 삭제하시겠습니까?");
	if(response){
		form.submit();
	}
}

function search(){
	let type=$("#type").val();
	let keyword=$("#keyword").val();
	let status=$("#status").val();
	
//	if(status){
//		location.href="?page=1&type="+type+"&keyword="+keyword+"&status="+status;
//	}else{
		location.href="?page=1&type="+type+"&keyword="+keyword;
//	}
}
</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>