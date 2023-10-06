

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.product-one {
	display: flex;
}

.product-one .test {
	margin-left: 10px;
	width: 300px;
	line-height: 400%;
}

.product-one {
	text-align: justify;
}

.product-one-bottom {
	display: flex;
	justify-content: space-between;
}

.order input {
	border: none;
	outline: none;
	margin: 15px;
}
</style>

<main>

	<div class="main-column">
		<form action="/order/orderDetail">
			<h2 style="text-align: center">주문 내역 상세보기</h2>
			<div class="order-detail">
			
			
			<c:forEach var="orderDetail" items="${orderDetailList}">
				<div class="product-one">
					<img src="${orderDetail.image}"/>
					<div class="test">
						<div class="product-one-top">
							<div>${orderDetail.productName}</div>

							<div>${orderDetail.secondCategoryName}</div>

						</div>
						<div class="product-one-bottom">
							<span>수량 ${orderDetail.quantity} </span> 
						    <span>가격 ${orderDetail.price}</span>
						</div>
					</div>
				</div>
				</c:forEach>
			

				<br> <b>주문자</b>
				<hr size="1px" color="gray">

				<table class="order" >
					<tr>
						<td><span>주문자 </span></td>
						<td><input type="text" name="name" readonly value= "${orderDetailPerson.name}"></td>
					</tr>
					<tr>
						<td><span>배송지</span></td>
						<td><input type="text" name="address" readonly value="${orderDetailPerson.address}"></td>
					</tr>
					<tr>
						<td><span>전화번호</span></td>
						<td><input type="text" name="phoneNumber" readonly value="${orderDetailPerson.phoneNumber}"></td>
					</tr>
					<tr>
						<td><span>이메일</span></td>
						<td><input type="text" name="email" readonly value="${orderDetailPerson.email}"></td>
					</tr>
				</table>

				<br> <b>결제 정보</b>
				<hr size="1px" color="gray">

				<table class="order">
					<tr>
						<td><span>결제금액</span></td>
						<td><input type="text" name="price" readonly value="${orderDetailPayment.price} "></td>
					</tr>
					<tr>
						<td><span>결제방법</span></td>
						<td><input type="text" name="" readonly value="nicepay"></td>
						<td>
					</tr>

				</table>








			</div>

		</form>
	</div>
</main>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
