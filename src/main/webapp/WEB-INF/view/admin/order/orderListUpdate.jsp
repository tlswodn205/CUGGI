<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="one-table-form" method="put" action="../updateOrderList">
					<h2>주문 내역 취소 페이지</h2>
					<table class = "one-table">
					    <tbody>
					    	<td>주문 아이디</td>
					    	<td><input type="text" id="id" name="id"value="${orderListResponseDto.id}"></td>
					        </tr>

					        <tr>
					            <td>주문날짜</td>
					            <td><input type="text" id="purchase-Date" name="purchaseDate"  value="${orderListResponseDto.purchaseDate}" readonly></td>
					        </tr>
					        <tr>
					            <td>고객아이디</td>
					            <td><input type="text" id="userId" name="userId"  value="${orderListResponseDto.userId}" readonly></td>
					        </tr>
					        <tr>
					            <td>상품명</td>
					            <td><input type="text" id="productName" name="productName" value="${orderListResponseDto.productName}" readonly></td>
					        </tr>
					        <tr>
					            <td>금액</td>
					            <td><input type="text" id="price" name="price"  value="${orderListResponseDto.price}" readonly></td>
					        </tr>
					        <tr>
					            <td>취소여부</td>
					            <td><input type="text" id="cancel-Date" name="cancelDate"  value="${orderListResponseDto.status}" readonly></td>
					        </tr>
					    </tbody>
					</table>
					<input type="submit" onclick="location.href='./cancelPayMent'" value="결제 취소">
				</form>
		




<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>