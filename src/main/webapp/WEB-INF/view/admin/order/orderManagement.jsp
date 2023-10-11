<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<div class="list-table-form">
					<h2>주문 내역 관리 페이지</h2>
					<div class="top-menu">
						<div>
					    <input type="hidden" id="status" value="${OrderadminPageListDto.status}">
						<select id="type" name="type" >
						    <option value="id" ${OrderadminPageListDto.type eq "id" ? "selected":""}>주문번호</option>
						    <option value="name" ${OrderadminPageListDto.type eq "name" ? "selected":""}>유저 이름</option>
						</select>
						<input type="text" id="keyword" placeholder="검색" value="${OrderadminPageListDto.keyword}">
						<input type="button" id="search-btn" value="검색하기" onclick="search()">
						</div>	
					</div>
										
					<table class = "list-table">
					    <thead>
					        <tr>
					            <th>주문아이디</th>
					            <th>주문날짜</th>
					            <th>고객 성명(아이디)</th>
					            <th>상품명</th>					            
					            <th>금액</th>	
					            <th>취소여부</th>				            
					            <th>상세보기 및 수정</th>
					        </tr>
					    </thead>
						<c:forEach var="order" items="${OrderadminPageListDto.list}">
						    <tbody>
						        <tr>
						            <td>${order.id}</td>
						            <td>${order.createdAt}</td>
						            <td>${order.name} (${order.userId})</td>
						            <td>${order.productName}</td>
						            <td>${order.price} </td>
						            <td>${order.status}</td>
						            <td><input type="button" onclick="location.href='./updateOrderList/${order.id}'"  value="상세보기"></td>					            
						        </tr>
						    </tbody>
					    </c:forEach>
					</table>
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<li class='page-item'>
								<c:choose>
									<c:when test="${OrderadminPageListDto.first}">
										<label>Prev</label>
									</c:when>
									<c:otherwise>	
										<a class="page-link" href="?page=${OrderadminPageListDto.currentPage-1}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Prev</a>
									</c:otherwise> 
								</c:choose> 
							</li>
							<c:forEach var ="num" begin = "${OrderadminPageListDto.startPageNum}" end="${OrderadminPageListDto.lastPageNum}">
								<li class='page-item'><a class='page-link' href="?page=${num}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">${num}</a></li>
							</c:forEach>
							<li class='page-item'>
								<c:choose>
									<c:when test="${OrderadminPageListDto.last}">
										<label>Next</label>
									</c:when>
									<c:otherwise>	
										<a class="page-link" href="?page=${OrderadminPageListDto.currentPage+1}${empty OrderadminPageListDto.keyword ? "": "&keyword="+= adminPageListDto.keyword}${empty adminPageListDto.type ? "": "&type="+= adminPageListDto.type}${empty adminPageListDto.status ? "": "&status="+= adminPageListDto.status}">Next</a>
									</c:otherwise> 
								</c:choose>
							</li>
						</ul>
					</div>			
				</div>
				
<script type="text/javascript">
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
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>\