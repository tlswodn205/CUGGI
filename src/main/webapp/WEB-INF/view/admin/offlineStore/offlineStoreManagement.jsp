<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
				<div class="listTableForm">
					<h2>지점 관리 페이지</h2>
					<input type="button" class="insertButton" onclick="location.href='./insertOfflineStore'" value="지점 추가">
					<table class = "listTable">
					    <thead>
					        <tr>
					            <th>지점아이디</th>
					            <th>지점이름</th>
					            <th>지점번호</th>
					            <th>지점주소</th>
					            <th>상세보기 및 수정</th>
					            <th>삭제</th>
					        </tr>
					    </thead>
						<c:forEach var="offlineStore" items="${offlineStoreList}">
						    <tbody>
						        <tr>
						            <td>${offlineStore.id}</td>
						            <td>${offlineStore.storeName}</td>
						            <td>${offlineStore.storeNumber}</td>
						            <td>${offlineStore.storeAddress} ${offlineStore.storeAddressDetail} </td>
						            <td> <input type="button" onclick="location.href='./updateOfflineStore/${offlineStore.id}'" value="수정 및 상세보기"></td>
						            <td> 
							            <form action="./deleteOfflineStore/${offlineStore.id}" method="get">
							            	<input type="button" value="삭제" onclick="isDelete(this.form)">
							            </form>
						            </td>
						        </tr>
						    </tbody>
					    </c:forEach>
					</table>
				</div>

<script type="text/javascript">
function isDelete(form){
	const response = confirm("정말 삭제하시겠습니까?");
	console.log(form.method);
	console.log(form.action);
	if(response){
		form.submit();
	}
}
</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>