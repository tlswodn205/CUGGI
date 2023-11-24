<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
<div class="main-console ms-4 container">
	<div class="list-table-form table-responsive">
		<div class="h2 mt-3">주문 관리 페이지</div>
		<hr>
		<div class="top-menu text-end">
			<div class="d-flex flex-row justify-content-start mb-4">
				<input type="hidden" id="status" value="${OrderadminPageListDto.status}">
				<select id="type" name="type" class="form-select w-auto me-2">
					<option value="id" ${OrderadminPageListDto.type eq "id" ? "selected":""}>주문번호</option>
					<option value="name" ${OrderadminPageListDto.type eq "name" ? "selected":""}>유저 이름</option>
				</select>
				<input type="text" id="keyword"  class="form-control w-25 me-2" placeholder="검색" value="${OrderadminPageListDto.keyword}">
				<input type="button" id="search-btn"  class="btn btn-outline-secondary me-auto"  value="검색하기" onclick="search()">
			</div>
		</div>

		<table class="list-table table text-center align-middle table-bordered">
			<thead>
			<tr class="table-light">
				<th>주문아이디</th>
				<th>주문날짜</th>
				<th>고객 성명(아이디)</th>
				<th>상품명</th>
				<th>금액</th>
				<th>진행상태</th>
				<th>상세보기 및 수정</th>
			</tr>
			</thead>
			<c:forEach var="order" items="${OrderadminPageListDto.list}">
				<tbody>
				<tr>
					<td>${order.id}</td>
					<td>${order.createdAt}</td>
					<td>${order.name} (${order.username})</td>
					<td>${order.productName}</td>
					<td>${order.price} </td>
					<td>${order.state}</td>
					<td><input type="button" onclick="location.href='./updateOrderList/${order.id}'"  value="상세보기" class= "btn btn-outline-secondary" ></td>
				</tr>
				</tbody>
			</c:forEach>
		</table>
		<a class= "btn btn-outline-secondary"  href="?page=1&type=${OrderadminPageListDto.type}&keyword=${OrderadminPageListDto.keyword}">모두</a>
		<a class= "btn btn-outline-secondary" href="?page=1&type=${OrderadminPageListDto.type}&keyword=${OrderadminPageListDto.keyword}&status=취소요청">취소요청</a>
		<a class= "btn btn-outline-secondary" href="?page=1&type=${OrderadminPageListDto.type}&keyword=${OrderadminPageListDto.keyword}&status=결제취소">결제취소</a>
		<a class= "btn btn-outline-secondary" href="?page=1&type=${OrderadminPageListDto.type}&keyword=${OrderadminPageListDto.keyword}&status=결제완료">결제완료</a>
		<div class="d-flex justify-content-center">
			<ul class="pagination">
				<li class='page-item'>
					<c:choose>
						<c:when test="${OrderadminPageListDto.first}">
						</c:when>
						<c:otherwise>
							<a class="page-link" href="?page=${OrderadminPageListDto.currentPage-1}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Prev</a>
						</c:otherwise>
					</c:choose>
				</li>
				<c:forEach var ="num" begin = "${OrderadminPageListDto.startPageNum}" end="${OrderadminPageListDto.lastPageNum}">
					<li class='page-item ${page eq num ? 'active' : ''}'><a class='page-link' href="?page=${num}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
				</c:forEach>
				<li class='page-item'>
					<c:choose>
						<c:when test="${OrderadminPageListDto.last}">
						</c:when>
						<c:otherwise>
							<a class="page-link" href="?page=${OrderadminPageListDto.currentPage+1}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Next</a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>

	</div>
</div>
<script type="text/javascript">

	function search(){
		let type=$("#type").val();
		let keyword=$("#keyword").val();
		let status=$("#status").val();

//   if(status){
//      location.href="?page=1&type="+type+"&keyword="+keyword+"&status="+status;
//   }else{
		location.href="?page=1&type="+type+"&keyword="+keyword;
//   }
	}
</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>