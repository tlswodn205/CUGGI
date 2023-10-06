<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<div class="list-table-form">
					<h2>주문 내역 관리 페이지</h2>
					<input type="button" class="insertButton" onclick="location.href='./insertOfflineStore'" value="검색">
					<table class = "list-table">
					    <thead>
					        <tr>
					            <th>주문아이디</th>
					            <th>주문날짜</th>
					            <th>고객아이디</th>
					            <th>상품명</th>					            
					            <th>금액</th>	
					            <th>취소여부</th>				            
					            <th>상세보기 및 수정</th>
					        </tr>
					    </thead>
						<c:forEach var="order" items="${orderList}">
						    <tbody>
						        <tr>
						            <td>${order.id}</td>
						            <td>${order.createdAt}</td>
						            <td>${order.userId}</td>
						            <td>${order.productName}</td>
						            <td>${order.price} </td>
						            <td>${order.cancelDate}</td>
						            <td><input type="button" onclick="location.href='./updateOrderList/${order.id}'"  value="상세보기"></td>					            
						        </tr>
						    </tbody>
					    </c:forEach>
					</table>
				</div>

<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>