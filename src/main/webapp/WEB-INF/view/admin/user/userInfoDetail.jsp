<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="oneTableForm" method="post" action="/admin/userInfoDetail">
					<input type="hidden" name="userId" value="${userInfoDetail.id}">
					<h2>회원정보 상세보기 페이지</h2>
					<table class = "list-table">
					    <tbody>
					        <tr>
					            <th>아이디</th>
					            <td><input type="text" name="username" value="${userInfoDetail.username}"></td>
					        </tr>
					        <tr>
					            <th>이름</th>
					            <td><input type="text" name="name" value="${userInfoDetail.name}"></td>					      
					        </tr>
					        <tr>
					            <th>주소</th>
					            <td><input type="address" name="address" value="${userInfoDetail.address}" readonly><input type="button" onclick="openZipSearch()" value="검색" id="search"></td>
								
					        </tr>
					        <tr>
					            <th>상세주소</th>
					       		<td><input type="text" name="addressDetail" value="${userInfoDetail.addressDetail}"></td>
					        </tr>
					        <tr>
					            <th>이메일</th>
					       		<td><input type="email" name="email" value="${userInfoDetail.email}"></td>
					        </tr>
					        <tr>
					            <th>전화번호</th>
					       		<td><input type="phoneNumber" name="phoneNumber" value="${userInfoDetail.phoneNumber}"></td>
					        </tr>
					        <tr>
					            <th>생년월일</th>
					       		<td><input type="date" name="birthday" value="${userInfoDetail.birthday}"></td>
					        </tr>
					        <tr>
					            <th>권한</th>
					       		<td><input type="text" name="level" value="${userInfoDetail.level}"></td>
					        </tr>
					    </tbody>
					</table>
					<input type="submit" value="회원정보 수정">
				</form>
<script>
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
	
				$("#address").val(addr);
				$("#address_detail").focus();
			}
		}).open();
}
</script>
		
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>