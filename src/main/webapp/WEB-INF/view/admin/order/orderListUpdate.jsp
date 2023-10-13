<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="one-table-form" method="post" action="/admin/cancelPayment/${orderListResponseDto.id}">
					<h2>주문 내역 취소 페이지</h2>
					<table class = "one-table">
					    <tbody>
					    <tr>
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
					            <td>원거래 ID</td>
					            <td><input type="text" id="tid" name="tid"  value="${paymentResponseDto.tid}" readonly></td>
					        </tr>
					        <tr>
					            <td>취소여부</td>
					            <td><input type="text" id="state" name="state"  value="${orderListResponseDto.state}" readonly></td>
					        </tr>
					    </tbody>
					</table>
					<c:if test="${orderListResponseDto.state eq '취소요청'}">
					<input type="button" onclick="reqCancel(this.form)" value="결제 취소">
					</c:if>
				</form>
					
<script>		
function reqCancel(form){
	
	const response = confirm("정말 취소하시겠습니까??");
	if(response){
		form.submit();
	}
	
}
</script>


<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>