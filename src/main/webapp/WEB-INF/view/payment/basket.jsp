<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
main>.subMain {
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	font-size: 100%;
	vertical-align: baseline;
}

.content {
	margin-left: auto;
	margin-right: auto;
	padding-left: 15px;
	padding-right: 15px;
	text-align: left;
	background: #fff;
	padding-bottom: 15px;
	padding-top: 15px;
	position: relative;
}

content .shopping-bag-wrapper {
	background: inherit;
}

.shopping-bag-content {
	margin: 0 auto;
	max-width: 1200px;
	padding: 53px 30px;
}

.shopping-bag-column {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	display: inline-block;
	font-size: 12px;
	margin-right: 20px;
	padding-left: 0;
	padding-right: 0;
	position: relative;
	vertical-align: top;
	width: calc(100% - 370px);
}

.your-selections {
	background: inherit;
}

.your-selections-wrapper {
	width: 100%;
}

.your-selections-header {
	position: relative;
	line-height: 3.5rem;
}

.eyerow {
	font-size: 14px;
	font-weight: normal
}

.order-detail {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.your-selections-wrapper h2 {
	letter-spacing: 0;
}

.basketTop {
	display: list-item;
	list-style: none;
	text-align: -webkit-match-parent;
}

.basketTop .baglist-item-selected:first-child {
	border-top: solid 1px #c8c6c5;
}

.basketTop .baglist-item-selected {
	opacity: 1;
	position: relative;
	display: table;
	width: 100%;
}

.basketTop .image-column {
	height: 230px;
	text-align: left;
	width: 25%;
}

.baglist-item-selected-column-wrapper {
	clear: none;
	display: table-cell;
	float: none;
	vertical-align: middle;
}

.central-info {
	width: 100%;
}

.basket .column-wrapper {
	clear: none;
	float: left;
	width: calc(100% - 205px);
}

.baglist-item-properties, .baglist-item-reference, .item-title {
	clear: both;
	float: left;
}

.basketTop .item-title {
	font-weight: 200;
	font-style: normal;
	color: #1b1b1b;
	font-size: 16px;
	line-height: 25px;
	margin-bottom: 12px;
	margin-top: 42px;
	text-transform: none;
	clear: both;
	float: left;
}

.basketTop .baglist-item-reference {
	font-weight: 400;
	font-style: normal;
	color: #999;
	font-size: 11px;
	margin-bottom: 12px;
	white-space: nowrap;
}

.basketTop .baglist-item-reference {
	font-style: normal;
	color: #000;
}

.basketTop .central-info .column-separator-wrapper {
	padding-right: 24px;
}

.basketTop .central-info .column-separator-wrapper .item-title {
	margin-top: 0;
}

.basketTop .item-title {
	font-style: normal;
	color: #000;
}

.basketTop.column-wrapper {
	clear: none;
	float: left;
	width: calc(100% - 205px);
}

.central-info.column-separator-wrapper.item-title {
	margin-top: 0;
}

body.new-design.basketTop.item-title {
	font-style: normal;
}

.basketTop .item-price-quantity {
	float: right;
	width: 45%;
}

.basketTop .footer-item {
	float: left;
	width: 100%;
}

body.new-design.language-ko .baglist-item-availability {
	font-family: "Gucci Sans Pro", "Apple SD Gothic Neo", "Noto Sans KR",
		"Malgun Gothic", sans-serif;
	word-break: keep-all;
}

#quantity {
	width: 40px;
	border: revert;
}

.baglist-item-availability {
	font-family: GucciSans, Helvetica, Arial, sans-serif;
	font-style: normal;
	color: #000;
}

.shipping-info {
	font-family: GucciSans, Helvetica, Arial, sans-serif;
	font-style: normal;
}

.shipping-info .title {
	font-size: 12px;
	line-height: 16px;
	font-weight: 400;
	letter-spacing: -.03em;
	color: #000;
}

.shipping-info .title {
	font-size: 12px;
	line-height: 16px;
	font-weight: 400;
	letter-spacing: -.03em;
	color: #000;
}

.shipping-info .subtitle {
	font-size: 12px;
	line-height: 16px;
	font-weight: 400;
	letter-spacing: -.03em;
	color: #000;
	font-style: normal;
}

.basket .footer-item {
	float: left;
	width: 100%;
}

.baglist-item-actions .edit-action {
	display: inline-block;
	position: relative;
	margin-top: 15px;
}

.baglist-item-actions .edit-action .delete {
	border: none;
	background-color: rgba(0, 0, 0, 0);
	cursor: pointer;
	text-decoration: underline;
}

.product-total-price-style {
	font-size: 18px;
	font-weight: bold;
	text-align: end;
}

.order-summary.order-details {
	width: 345px;
	float: right;
	border: 1px solid #c8c6c5;
	height: 430px;
	margin-top: 77px;
}

.payment {
	width: 100%;
	margin-top: 30px;
}

.payment-body {
	text-align: center;
}
.payment .patment-body {
text-align: center;
}
.quantity {
    border: inset;
}

input, textarea{
	border: none;
	outline: none;
	text-align:left;
	resize: none;
	font-family: serif;
	spellcheck: false;
}


.paybtn {
	display: block;
	width: 100%;
	height: 68px;
	background-color: black;
	color: white;
	font-size: 18px;
	line-height: 65px;
	text-align: center;
	margin-top: 151px;
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
        	reloadTotalPrice();
        } else {
            alert("삭제 실패");
        }
    });
    
    
};





//결제창 최초 요청시 실행됩니다.
function nicepayStart(){
	
	let totalprice = $("#Amt").val();
	
	
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
	<div class="subMain">
		<div class="content gutter">
			<div class="shopping-bag-wrapper" data-module="shoppingBag">
				<div class="shopping-bag-content">
					<div class="shopping-bag-column">
					
						<form id="deleteForm" name="deleteForm" class="one-table-form" method="post" action="../basket">
											
							<section class="your-selections">
								<div class="your-selections-wrapper">
									<div class="your-selections-header">

										<h2 class="eyerow">고객님의 셀렉션</h2>

										<div class="order-detail" id="order-detail">

											<c:if test="${empty orderBasketResponseDto}">
										 	 	<h1>장바구니를 채워주세요</h1>
											</c:if>
											
											<c:forEach var="orderBasket" items="${orderBasketResponseDto}">
											
										

										
												<div id="product-one-${orderBasket.id}" class="product-one-${orderBasket.id} basketTop">
													<div class="baglist-item-selected group">
														<div
															class="baglist-item-selected-column-wrapper image-column">
															<img src="${orderBasket.image}" />
														</div>
														<div class="baglist-item-selected-column-wrapper">
															<div class="column-wrapper central-info">
																<div class="column-separator-wrapper">
																	<h3 class="item-title">${orderBasket.productName}</h3>
																	<div class="baglist-item-reference">${orderBasket.secondCategoryName}</div>
																</div>
																<div class="footer-item">
																	<div class="baglist-item-availability">
																		<div class="shipping-info">
																			<div class="title">
																				수량 <input type="number" id="quantity"
																					class="quantity" value="${orderBasket.quantity}"
																					min="1"> 
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="footer-item">
																<div class="baglist-item-actions">
																	<div class="edit-action">
																		<span> <input type="button" value="제거" class="delete" onclick="deleteOrderProduct(${orderBasket.id})"></span>
																	</div>
																	<span><a href="/product/detail?productId=${orderBasket.productId}">상세보기 클릭</a></span>
																</div>
															</div>
														</div>
														<div class="product-total-price-style">
															<span>₩<span class="product-total-price" id="product-total-price">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderBasket.price*orderBasket.quantity}" /></span>
															</span> <input type="hidden" class="price" id="price" readonly value="${orderBasket.price}"> <input
																type="hidden" class="orderId" id="orderId" readonly value="${orderBasket.orderId}">
														</div>
													</div>
												</div>										
											</c:forEach>
										</div>
									</div>
							</section>
							
						</form>
					</div>
					
					<div class="order-details order-summary">
						<form name="payForm" method="post" action="paymentResult">
							<table class="payment">
								<tbody class="payment-body">
									<tr>
										<input type="hidden" id="GoodsName" name="GoodsName" readonly value="">
										<input type="hidden" id="MID" name="MID" readonly value="nicepay00m">
									</tr>
									<tr>
										<td><input type="hidden" id="Moid" name="Moid" readonly></td>
									</tr>
									<tr>
										<th valign="middle"><span>구매자명</span></th>
										<td valign="middle"><input type="text" id="BuyerName"
											name="BuyerName" readonly value="${person.name}"></td>
									</tr>
									<tr>
										<th>구매자 이메일</th>
										<td><input type="text" id="BuyerEmail" name="BuyerEmail"
											readonly value="${person.email}"></td>
									</tr>
									<tr>
										<th><span>구매자 연락처</span></th>
										<td><input type="text" id="BuyerTel" name="BuyerTel"
											readonly value="${person.phoneNumber}"></td>
									</tr>
									<tr>
										<th><span>구매자 주소</span></th>
										<td><textarea id="address" name="address"readonly>${person.address}</textarea></td>
									</tr>
									<tr>
										<th><span>구매자 상세주소</span></th>
										<td><input type="text" id="addressDetail" name="addressDetail"
											readonly value="${person.addressDetail}"></td>
									</tr>
									<th><span>총금액</span></th>
										<td><input type="text" id="total-price" readonly value=""></td>
										<td><input type="hidden" id="Amt" name="Amt" readonly value=""></td>
									<tr>
										<th><span> <!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 -->
										</span></th>
										<td><input type="hidden" id="ReturnURL" name="ReturnURL"
											value=""></td>
									</tr>
									<tr>
										<th colspan="2"><span> <!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 -->
											<a href="#" class="btn_blue paybtn" onClick="nicepayStart();">결제하기</a>
										</span></th>
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
								</tbody>
							</table>


						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
</main>
<script>

window.onload=()=>{
	reloadTotalPrice();
}

function reloadTotalPrice(){
	let quantitys = document.getElementsByClassName("quantity");
	let prices = document.getElementsByClassName("price");
	let totalprice = 0;
	
	for(let i=0; i < quantitys.length; i++ ) {
		 totalprice += quantitys[i].value*prices[i].value;
	}
	$("#total-price").val(totalprice.toLocaleString('ko-KR'))
	$("#Amt").val(totalprice);
}



$('input[type=number]').change( function() {

	//console.log($(this).val());
	//console.log($(this).parent().parent().parent());
	
	//console.log($(this).parent().parent().parent().find('#product-total-price'));
	//console.log($(this).parent().parent().parent().find('#price').val());
	
	console.log($(this).closest('.basketTop'));
	let a = $(this).closest('.basketTop').find('#price').val();
	let b = Number(a);
	let quantity = $(this).val()
	console.log(b.toLocaleString('ko-KR'));
	let price = a*quantity
	$(this).closest('.basketTop').find('#product-total-price').text(price.toLocaleString('ko-KR'))
			
	reloadTotalPrice();
	
})

$('#totalprice').change( function() {
	
	
	
})


</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
