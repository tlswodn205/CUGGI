<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
<div class="main-console ms-4 container">
	<div class="list-table-form table-responsive">
		<div class="h2 mt-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gift-fill fs-1" viewBox="0 0 16 16">
				<path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zm6 4v7.5a1.5 1.5 0 0 1-1.5 1.5H9V7h6zM2.5 16A1.5 1.5 0 0 1 1 14.5V7h6v9H2.5z"/>
			</svg>
			상품 관리 페이지
		</div>
		<hr>
		<div class="top-menu text-end">
			<div class="d-flex flex-row justify-content-start mb-4">
				<input type="hidden" id="status" value="${adminPageListDto.status}">
				<select id="type" name="type" class="form-select w-auto me-2">
					<option value="id" ${adminPageListDto.type eq "id" ? "selected":""}>상품아이디</option>
					<option value="productName" ${adminPageListDto.type eq "productName" ? "selected":""}>상품명</option>
				</select>
				<input type="text" class="form-control w-25 me-2" id="keyword" placeholder="검색" value="${adminPageListDto.keyword}">
				<input type="button" class="btn btn-outline-secondary me-auto" id="search-btn" value="검색하기" onclick="search()">
				<input type="button" class="insertButton btn btn-outline-secondary" onclick="location.href='/admin/product'" value="상품 추가">
			</div>
		</div>

		<table class="list-table table text-center align-middle table-bordered">
			<thead>
			<tr class="table-light">
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
					<td> <input type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/product/${product.id}'" value="수정 및 상세보기"></td>
					<td>
						<form action="/deleteProduct/${product.id}" method="get">
							<input type="button" class="btn btn-outline-secondary" value="삭제" onclick="isDelete(this.form)">
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
					<li class="page-item  ${page eq num ? 'active' : ''}"><a class="page-link" href="?page=${num}${empty adminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
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
</div>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>