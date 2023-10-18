

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>

.order-detatil-title {
text-align: center;
margin-bottom: 5%;
}
.order-detail {
width: 900px;

}

.product-one-detail {
	display:flex;
	text-align: justify;
	justify-content: space-between;
	font-weight: bolder;
	 text-align: center;
	
}
#product-one-top-productName {
margin-bottom: 130px;
}


#product-one-bottom-quantity{
    margin-bottom: 135px;
}



.order input {
	border: none;
	outline: none;
	margin: 15px;
}

.order-top {

width: 65%;
}

.order-bottom{
width: 100%;
}
.deletebtn-top {
text-align: right;

}

#deletebtn {
    background-color: black;
    font-size: medium;
    color: white;
    width: 40%;
    cursor: pointer;
}
#deletebtn:hover {
background-color: white;
color: black;
  box-shadow: 0 0 0 2px black inset;
}


</style>

<main>

	<div class="main-column">
		<form class="one-table-form" method="post" action="../orderDetail/${order.id}">
			<h2 class ="order-detatil-title">Order Detail</h2>
			<div class="order-detail">
			
			
			<c:forEach var="orderDetail" items="${orderDetailList}">
				<div class="product-one-detail">
					<img src="${orderDetail.image}"/>

						<div class="product-one-top">
							<div id = "product-one-top-productName">${orderDetail.productName}</div>

							<div>분류 : ${orderDetail.secondCategoryName}</div>

						</div>
						
						<div class="product-one-bottom">
							<div id="product-one-bottom-quantity"><span>수량 ${orderDetail.quantity} </span></div> 
						    <span>가격 ₩ ${orderDetail.price * orderDetail.quantity}</span>
						    <input type="hidden" class="total-product-price" value="${orderDetail.price * orderDetail.quantity}"  />
						</div>
					</div>

				</c:forEach>
			

				<br> <b>주문자</b>
				<hr size="1px" color="gray">
<div class="order">
				<table class="order-top">
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

				<table class="order-bottom">
					<tr>
						<td><span>결제금액</span></td>
						<td><input type="text" name="price" id="total-price" readonly value="${orderDetailPayment.price}"></td>
					</tr>
					
					<tr>
						<td><span>결제방법</span></td>
						<td><input type="text" name="" readonly value="nicepay"></td>
						<td>
					</tr>
					<tr>
					<td><span>진행상태</span>
					<td><input type="text" id="status" id = "status" name="status" readonly value="${order.state}"></td>
					<td class="deletebtn-top"><c:if test="${order.state eq '결제완료'}">
					<input type="button" id="deletebtn" value="취소 요청" onclick="isDelete(this.form)">
					</c:if></td>
					</tr>

				</table>
				</div>
				
</div>					
</form>

			</div>

	
</main>

<script>
function isDelete(form){
	const response = confirm("정말 취소하시겠습니까??");
	if(response){
		form.submit();
	}
}

window.onload=function(){
	let prices= 0;
	$(".order-detail .total-product-price").each((a)=>{
		prices += Number($(".order-detail .total-product-price").eq(a).val());
	})
	$('#total-price').val(prices);
};

</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
