

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
.order-detail {
	width: 900px;
}

.basketTop {
	display: flex;
	justify-content: space-between;
	margin: 10px;
	list-style: none;
	height: 150px;
}

.product-one-top {
	
}

.product-one-center-top {
	margin-top:12px;
}

.product-one-center {
	margin-top:12px;
}

.product-one-bottom {
	display: flex;
	justify-content: space-between;
	margin-top:12px;
	
}
.endRow {
margin-top:133px;
}

.order input {
	border: none;
	outline: none;
	margin: 15px;
}

.payment input {
	border: none;
	outline: none;
}

form {
	overflow: hidden;
}

table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	padding: 10px;
}

th {
	
}

th:first-child, td:first-child {
	border-left: none;
}

.test {
	display: grid
}

.delete {
	border-radius: 20px;
	border: none;
	background-color: gray;
	color: white;
	
}
.delete:hover {
    background: silver;
  }

.quantity{
 width:33px;
}
</style>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js"
	type="text/javascript"></script>
<script type="text/javascript">

function deleteOrderProduct(id){
	let url = "/order/deleteBasket/"+id
	let removeClass = '.product-one-'+id;
    $.ajax(url, {
        type: "get",
        headers: {
            "Content-Type": "application/json"
        }
    }).done((data)=> {
        if(data == "1"){
        	$(removeClass).remove();
        	console.log($("#order-detail").children().eq(0));
        	console.log(removeClass);
        } else {
            alert("삭제 실패");
        }
    });
    
    
};





//결제창 최초 요청시 실행됩니다.
function nicepayStart(){
	
    let quantity = document.getElementsByClassName("quantity");
    let price = document.getElementsByClassName("price");
	let totalprice = 0;
	
	for(let i=0; i < quantity.length; i++ ) {
 	 		console.log(quantity[i].value);
		 totalprice += quantity[i].value*price[i].value;
	}
	
	console.log(totalprice);
	
	$("#Amt").val(totalprice); 
	
	$("#Moid").val($("#orderId").val()); 
		
	let orderId = $("#orderId").val();
	
	
	
	let data={
			price : totalprice
	}

	
	let url = "/order/nicepayInfo";
	
	
	$.ajax(url, {
	    type: "Post",
	    dataType: "json",
	    data: JSON.stringify(data),
	    headers: {
	        "Content-Type": "application/json"
	    }
	}).done((res) => {
		$("#EdiDate").val(res.ediDate);
		$("#SignData").val(res.hashString);
		$("#returnURL").val(res.returnURL);
				if(checkPlatform(window.navigator.userAgent) == "mobile"){//모바일 결제창 진입
					document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
					document.payForm.acceptCharset="euc-kr";
					document.payForm.submit();
				}else{//PC 결제창 진입
					goPay(document.payForm);
				}
	 });
	
}

//[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepaySubmit(){
	document.payForm.submit();
}

//[PC 결제창 전용]결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
function nicepayClose(){
	alert("결제가 취소 되었습니다");
}

//pc, mobile 구분(가이드를 위한 샘플 함수입니다.)
function checkPlatform(ua) {
	if(ua === undefined) {
		ua = window.navigator.userAgent;
	}
	
	ua = ua.toLowerCase();
	var platform = {};
	var matched = {};
	var userPlatform = "pc";
	var platform_match = /(ipad)/.exec(ua) || /(ipod)/.exec(ua) 
		|| /(windows phone)/.exec(ua) || /(iphone)/.exec(ua) 
		|| /(kindle)/.exec(ua) || /(silk)/.exec(ua) || /(android)/.exec(ua) 
		|| /(win)/.exec(ua) || /(mac)/.exec(ua) || /(linux)/.exec(ua)
		|| /(cros)/.exec(ua) || /(playbook)/.exec(ua)
		|| /(bb)/.exec(ua) || /(blackberry)/.exec(ua)
		|| [];
	
	matched.platform = platform_match[0] || "";
	
	if(matched.platform) {
		platform[matched.platform] = true;
	}
	
	if(platform.android || platform.bb || platform.blackberry
			|| platform.ipad || platform.iphone 
			|| platform.ipod || platform.kindle 
			|| platform.playbook || platform.silk
			|| platform["windows phone"]) {
		userPlatform = "mobile";
	}
	
	if(platform.cros || platform.mac || platform.linux || platform.win) {
		userPlatform = "pc";
	}
	
	return userPlatform;
}
</script>
<main>

	<div class="main-column">
		<form id="deleteForm" name="deleteForm" class="one-table-form"
			method="post" action="../basket">
			<h2 style="text-align: center">장바구니</h2>
			<div class="order-detail" id="order-detail">


				<c:forEach var="orderBasket" items="${orderBasketResponseDto}">
					<div class="product-one-${orderBasket.id} basketTop">
						<img src="${orderBasket.image}" />
						<div class="test">
							<div class="product-one-top">
								<div>${orderBasket.productName}</div>


							</div>
							
							<div class="product-one-center-top">
							<div>${orderBasket.secondCategoryName}</div>
							</div>
							<div class="product-one-center">
								
								<div>수량</div>
								<input type="number" id="quantity" class="quantity"
										value="${orderBasket.quantity}" min="1">
							
							</div>
							<div class="product-one-bottom">
								<span>가격 <span class="product-total-price"
									id="product-total-price" style="padding:110px;">₩<fmt:formatNumber
											type="number" maxFractionDigits="3"
											value="${orderBasket.price}" /></span></span>
							 <input type="hidden" class="price" id="price"
									readonly value="${orderBasket.price}"> <input
									type="hidden" class="orderId" id="orderId" readonly
									value="${orderBasket.orderId}">
							</div>
						</div>
						<div class="endRow">
								<span>상세보기</span>
							<span> <input type="button" value="제거" class="delete"
								onclick="deleteOrderProduct(${orderBasket.id})"></span>
								</div>
					</div>
					<br>
					<hr size="1px" color="gray">
				</c:forEach>
				<span><span type="hidden" id="total-price"></span></span>
		</form>

		<form name="payForm" method="post" action="paymentResult">
			<table class="payment">
				<tr>
					<input type="hidden" id="GoodsName" name="GoodsName" readonly
						value="">
					<input type="hidden" id="Amt" name="Amt" readonly>
					<input type="hidden" id="MID" name="MID" readonly
						value="nicepay00m">
				</tr>
				<tr>

					<td><input type="hidden" id="Moid" name="Moid" readonly></td>
				</tr>
				<tr>
					<th><span>구매자명</span></th>
					<td><input type="text" id="BuyerName" name="BuyerName"
						readonly value="신재우"></td>
				</tr>
				<tr>
					<th>구매자 이메일</th>
					<td><input type="text" id="BuyerEmail" name="BuyerEmail"
						readonly value="tlswodn205@naver.com"></td>
				</tr>
				<tr>
					<th><span>구매자 연락처</span></th>
					<td><input type="text" style="border: none; outline: none;"
						id="BuyerTel" name="BuyerTel" readonly value="01025383724"></td>
				</tr>

				<tr>
					<th><span>
							<!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 -->
					</span></th>
					<td><input type="hidden" id="ReturnURL" name="ReturnURL"
						value=""></td>
				</tr>


				<!-- 옵션 -->
				<input type="hidden" name="GoodsCl" value="1" />
				<!-- 상품구분(실물(1),컨텐츠(0)) -->
				<input type="hidden" name="TransType" value="0" />
				<!-- 일반(0)/에스크로(1) -->
				<input type="hidden" name="CharSet" value="utf-8" />
				<!-- 응답 파라미터 인코딩 방식 -->
				<input type="hidden" name="ReqReserved" value="" />
				<!-- 상점 예약필드 -->

				<!-- 변경 불가능 -->
				<input type="hidden" id="EdiDate" name="EdiDate" value="" />
				<!-- 전문 생성일시 -->
				<input type="hidden" id="SignData" name="SignData" value="" />
				<!-- 해쉬값 -->
			</table>
			<a href="#" class="btn_blue" onClick="nicepayStart();">결제하기</a>
		</form>
</main>
<script>





$('input[type=number]').change( function() {

	//console.log($(this).val());
	//console.log($(this).parent().parent().parent());
	
	//console.log($(this).parent().parent().parent().find('#product-total-price'));
	//console.log($(this).parent().parent().parent().find('#price').val());
	
	let a = $(this).parent().parent().parent().find('#price').val();
	let b = Number(a);
	let quantity = $(this).val()
	console.log(b.toLocaleString('ko-KR'));
	let price = a*quantity
	$('#product-total-price').text(price.toLocaleString('ko-KR'))
			
	
	
})

$('#totalprice').change( function() {
	
	
	
})


</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
