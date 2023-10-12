<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
				<div class="list-table-form">
					<h2>지점 관리 페이지</h2>
					<div class="top-menu">
						<div>
					    <input type="hidden" id="status" value="${adminPageListDto.status}">
						<select id="type" name="type" >
						    <option value="storeName" ${adminPageListDto.type eq "storeName" ? "selected":""}>지점이름</option>
						    <option value="storeAddress" ${adminPageListDto.type eq "storeAddress" ? "selected":""}>지점주소</option>
						</select>
						<input type="text" id="keyword" placeholder="검색" value="${adminPageListDto.keyword}">
						<input type="button" id="search-btn" value="검색하기" onclick="search()">
						</div>
						<input type="button" class="insertButton" onclick="location.href='./insertOfflineStore'" value="지점 추가">
					</div>
					<table class = "list-table">
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
						<c:forEach var="offlineStore" items="${adminPageListDto.list}">
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
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${!adminPageListDto.first}">
								<li class='page-item'>
									<a class="page-link" href="?page=${adminPageListDto.currentPage-1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Prev</a>
								</li>
							</c:if> 

							<c:forEach var ="num" begin = "${adminPageListDto.startPageNum}" end="${adminPageListDto.lastPageNum}">
									<c:choose>
										<c:when test="${num==adminPageListDto.currentPage}">
											<li class='page-item'><label>${num}</label></li>
										</c:when>
										<c:otherwise>	
											<li class='page-item'><a class='page-link' href="?page=${num}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
										</c:otherwise> 
									</c:choose>
							</c:forEach>
							<c:if test="${!adminPageListDto.last}">	
								<li class='page-item'>
									<a class="page-link" href="?page=${adminPageListDto.currentPage+1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Next</a>
						
								</li>
							</c:if>
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