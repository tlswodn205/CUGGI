

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.payment input{
		border:none;
		outline:none;
	}
	form {overflow: hidden;}
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
</style>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>

<script type="text/javascript">
//결제창 최초 요청시 실행됩니다.
function nicepayStart(){
	// product_id, quntity 리스트
//	$("#Amt").val($("#price").val()); 
	
	$("#Moid").val($("#orderId").val()); 
	
	
	let orderId = $("#orderId").val();
	let price = $("#Amt").val();
	
	let data={
			price : price
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
		<form class="one-table-form" method="post" action="../basket">
			<h2 style="text-align: center">장바구니</h2>
			<div class="order-detail">
			
			
			<c:forEach var="orderBasket" items="${orderBasketResponseDto}">
				<div class="product-one">
					<img src="${orderBasket.image}"/>
					<div class="test">
						<div class="product-one-top">
							<div>${orderBasket.productName}</div>

							<div>${orderBasket.secondCategoryName}</div>
							<div>수량 ${orderBasket.quantity} </div> 

						</div>
						<div class="product-one-bottom">
						    <span>상세보기</span>
						    <span>제거</span>
						    <span>가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderBasket.price}" />₩</span>
						  <!--	<input type="hidden" id="price" readonly value="${orderBasket.price}"> --> 
						  	   <input type="hidden" id="orderId" readonly value="${orderBasket.orderId}">
						</div>
					</div>
				</div>
				</c:forEach>
				
				<br> 
				<hr size="2px" color="gray">				
</form>

<form name="payForm" method="post" action="paymentResult">
	<table class="payment">	
		<tr>
			<input type="hidden" id="GoodsName" name="GoodsName"  readonly value=""> 
			<input type="hidden" id="Amt" name="Amt"  readonly value="2000"> 
			<input type="hidden" id="MID" name="MID"  readonly value="nicepay00m"> 
		</tr>	
		<tr>

			<td><input type="hidden" id="Moid"  name="Moid"  readonly value="12345"></td>
		</tr> 
		<tr>
			<th><span>구매자명</span></th>
			<td><input type="text" id="BuyerName"  name="BuyerName"  readonly value="신재우"></td>
		</tr>	 
		<tr>
			<th>구매자 이메일</th>
			<td><input type="text" id="BuyerEmail"  name="BuyerEmail"  readonly value="tlswodn205@naver.com"></td>
		</tr>			
		<tr>
			<th><span>구매자 연락처</span></th>
			<td><input type="text" style="border: none;outline: none; "  id="BuyerTel" name="BuyerTel"  readonly value="01025383724"></td>
		</tr>	 
		<tr>
			<th><span><!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 --></span></th>
			<td><input type="hidden" id="ReturnURL" name="ReturnURL"  value=""></td>
		</tr>
		
					
		<!-- 옵션 --> 
		<input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
		<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
		<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
		<input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->
					
		<!-- 변경 불가능 -->
		<input type="hidden" id="EdiDate" name="EdiDate" value=""/>			<!-- 전문 생성일시 -->
		<input type="hidden" id="SignData" name="SignData" value=""/>	<!-- 해쉬값 -->
	</table>
	<a href="#" class="btn_blue" onClick="nicepayStart();">결제하기</a>
</form>

	
</main>



<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
