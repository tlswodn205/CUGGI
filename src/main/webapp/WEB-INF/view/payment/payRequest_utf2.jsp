<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>

<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
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
<!-- 아래 js는 PC 결제창 전용 js입니다.(모바일 결제창 사용시 필요 없음) -->
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script type="text/javascript">
//결제창 최초 요청시 실행됩니다.
function nicepayStart(){
	//product_id, quntity 리스트 
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
<div class="main-column" >
<form name="payForm" method="post" action="payResult_utf.jsp">
<h2 style="text-align: center">결제 Page</h2>
	<table class="payment">	
		<tr>
			<th><span>결제 상품명</span></th>
			<td><input type="text" id="GoodsName" name="GoodsName"  readonly value="테스트"></td>
		</tr>
		<tr>
			<th><span>결제 상품금액</span></th>
			<td><input type="text" id="Amt" name="Amt"  readonly value="2000"></td>
		</tr>				
		<tr>
			<th><span></span></th>
			<td><input type="hidden" id="MID" name="MID"  readonly value="nicepay00m"></td>
		</tr>	
		<tr>
			<th><span>상품 주문번호</span></th>
			<td><input type="text" id="Moid"  name="Moid"  readonly value="12345"></td>
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
</div>
</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>