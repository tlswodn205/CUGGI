<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>
<div class="main-console ms-4 container">
	<div class="list-table-form table-responsive">
		<div class="h2 mt-3">주문내역 취소 페이지</div>
		<hr>
		<form method="post" action="/admin/cancelPayment/${adminOrderDetailListResponseDto[0].id}">
			<table class="list-table table text-center align-middle table-bordered">
				<tbody>
				<tr>
					<td>주문 아이디</td>
					<td><input class="form-control" type="text" id="id" name="id"value="${adminOrderDetailListResponseDto[0].id}" readonly></td>
				</tr>

				<tr>
					<td>주문날짜</td>
					<td><input class="form-control" type="text" id="purchase-Date" name="purchaseDate"  value="${adminOrderDetailListResponseDto[0].purchaseDate}" readonly></td>
				</tr>

				<tr>
					<td>고객아이디</td>
					<td class="d-flex" style="gap: .5rem"><input class="form-control" type="text" id="userId" name="userId"  value="${adminOrderDetailListResponseDto[0].userId}" readonly>
						<input class="btn btn-outline-secondary" type="button" onclick='window.location.href="/admin/userInfoDetail/${adminOrderDetailListResponseDto[0].userId}";' value="정보확인"></td>
				</tr>

				<tr>
					<td>원거래 ID</td>
					<td><input class="form-control" type="text" id="tid" name="tid"  value="${adminOrderDetailListResponseDto[0].tid}" readonly></td>
				</tr>

				<tr>
					<td>총금액</td>
					<td><input class="form-control" type="text" id=total-price name="total-price"  value="" readonly></td>
				</tr>

				<tr>
					<td>취소여부</td>
					<td><input class="form-control" type="text" id="state" name="state"  value="${adminOrderDetailListResponseDto[0].state}" readonly>
						<c:if test="${adminOrderDetailListResponseDto[0].state eq '취소요청'}">
							<input type="button" onclick="reqCancel(this.form)" value="결제 취소">
						</c:if></td>
				</tr>
				</tbody>
			</table>
			<br>
			<c:forEach  var="orderDetail" items="${adminOrderDetailListResponseDto}" varStatus="status">
				<div>상품 ${status.count}</div>
				<table class="list-table table text-center align-middle table-bordered">
					<tr>
						<td>상품명</td>
						<td><input class="form-control" type="text" id="productName" name="productName" value="${orderDetail.productName}" readonly></td>
					</tr>
					<tr>
						<td>금액</td>
						<td><input class="form-control" type="text" id="price" name="price" class="price" value="${orderDetail.price}" readonly></td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input class="form-control" type="text" id="quantity" name="quantity"  value="${orderDetail.quantity}" readonly></td>
					</tr>


				</table>
				<br>
			</c:forEach>
		</form>
	</div>
</div>
<script>		
function reqCancel(form){
	
	const response = confirm("정말 취소하시겠습니까??");
	if(response){
		form.submit();
	}
	
}

window.onload=function(){
	let prices= 0;
	$(".one-table .price").each((a)=>{
		prices += Number($(".one-table .price").eq(a).val());
	})
	$('#total-price').val(prices);
};


</script>


<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>