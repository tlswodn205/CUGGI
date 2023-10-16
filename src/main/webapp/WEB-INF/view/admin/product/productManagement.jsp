<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
				<div class="list-table-form">
					<h2>상품 관리 페이지</h2>
					<div class="top-menu">
						<div>
					    <input type="hidden" id="status" value="${adminPageListDto.status}">
						<select id="type" name="type" >
						    <option value="id" ${adminPageListDto.type eq "id" ? "selected":""}>상품아이디</option>
						    <option value="productName" ${adminPageListDto.type eq "productName" ? "selected":""}>상품명</option>
						</select>
						<input type="text" id="keyword" placeholder="검색" value="${adminPageListDto.keyword}">
						<input type="button" id="search-btn" value="검색하기" onclick="search()">
						</div>
						<input type="button" class="insertButton" onclick="location.href='/admin/product'" value="상품 추가">
					</div>
					<table class = "list-table">
					    <thead>
					        <tr>
					            <th>상품아이디</th>
					            <th>상품명</th>
					            <th>가격</th>
					            <th>수량</th>
					            <th>상세보기 및 수정</th>
					            <th>삭제</th>
					        </tr>
					    </thead>
						<c:forEach var="product" items="${adminPageListDto.list}">
						    <tbody>
						        <tr>
						            <td>${product.id}</td>
						            <td>${product.productName}</td>
						            <td>${product.price}</td>
						            <td>${product.quantity}</td>
						            <td> <input type="button" onclick="location.href='/admin/product/${product.id}'" value="수정 및 상세보기"></td>
						            <td> 
							            <form action="./deleteOfflineStore/${product.id}" method="get">
							            	<input type="button" value="삭제" onclick="isDelete(this.form)">
							            </form>
						            </td>
						        </tr>
						    </tbody>
					    </c:forEach>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
								<c:choose>
									<c:when test="${adminPageListDto.first}">
									</c:when>
									<c:otherwise>	
							<li class='page-item'>
										<a class="page-link" href="?page=${adminPageListDto.currentPage-1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Prev</a>
							</li>
									</c:otherwise> 
								</c:choose> 
							<c:forEach var ="num" begin = "${adminPageListDto.startPageNum}" end="${adminPageListDto.lastPageNum}">
								<li class='page-item'><a class='page-link' href="?page=${num}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
							</c:forEach>
								<c:choose>
									<c:when test="${adminPageListDto.last}">
									</c:when>
									<c:otherwise>	
							<li class='page-item'>
										<a class="page-link" href="?page=${adminPageListDto.currentPage+1}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Next</a>
							</li>
									</c:otherwise> 
								</c:choose>
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