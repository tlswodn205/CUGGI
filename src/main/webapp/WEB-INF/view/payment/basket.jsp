

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
		<form class="one-table-form" method="post" action="../orderDetail/${order.id}">
			<h2 style="text-align: center">장바구니</h2>
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
			

				
</form>

	
</main>

<script>

</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
