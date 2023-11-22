<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
<div class="main-console ms-4 container">
	<div class="list-table-form table-responsive">
		<div class="h2 mt-3">회원정보 상세보기 페이지</div>
		<hr>
		<form method="post" action="/admin/userInfoDetail">
			<input type="hidden" name="userId" value="${userInfoDetail.id}">
			<table class="list-table table text-center align-middle table-bordered">
				<tbody>
				<tr>
					<th>아이디</th>
					<td><input class="form-control" type="text" name="username" value="${userInfoDetail.username}"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input class="form-control" type="text" name="name" value="${userInfoDetail.name}"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td class="d-flex" style="gap: .5rem;">
						<input class="form-control" type="address" name="address" value="${userInfoDetail.address}" readonly><input class="btn btn-outline-secondary" type="button" onclick="openZipSearch()" value="검색" id="search">
					</td>

				</tr>
				<tr>
					<th>상세주소</th>
					<td><input class="form-control" type="text" name="addressDetail" value="${userInfoDetail.addressDetail}"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="form-control" type="email" name="email" value="${userInfoDetail.email}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input class="form-control" type="phoneNumber" name="phoneNumber" value="${userInfoDetail.phoneNumber}"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input class="form-control" type="date" name="birthday" value="${userInfoDetail.birthday}"></td>
				</tr>
				<tr>
					<th>권한</th>
					<td><input class="form-control" type="text" name="level" value="${userInfoDetail.level}"></td>
				</tr>
				</tbody>
			</table>
			<div class="text-end">
			<input class="btn btn-outline-secondary" type="submit" value="회원정보 수정">
			</div>
		</form>
	</div>
</div>
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