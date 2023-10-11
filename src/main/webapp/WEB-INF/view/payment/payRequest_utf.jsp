<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>
<%
/*
*******************************************************
* <결제요청 파라미터>
* 결제시 Form 에 보내는 결제요청 파라미터입니다.
* 샘플페이지에서는 기본(필수) 파라미터만 예시되어 있으며, 
* 추가 가능한 옵션 파라미터는 연동메뉴얼을 참고하세요.
*******************************************************
*/
String merchantKey 		= "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg=="; // 상점키
String merchantID 		= "nicepay00m"; 				// 상점아이디
String goodsName 		= (String)request.getAttribute("goodsName"); 					// 결제상품명
String price            = "1000"; 						// 결제상품금액	
String buyerName 		= (String)request.getAttribute("buyerName"); 			// 구매자명
String buyerTel 		= (String)request.getAttribute("buyerTel"); 			// 구매자연락처
String buyerEmail 		= (String)request.getAttribute("buyerEmail"); 			// 구매자메일주소
String moid 			= (String)request.getAttribute("moid"); 			   // 상품주문번호	
String returnURL 		= "http://localhost:8080/nicepay3.0_utf-8/payResult_utf.jsp"; // 결과페이지(절대경로) - 모바일 결제창 전용

/*
*******************************************************
* <해쉬암호화> (수정하지 마세요)
* SHA-256 해쉬암호화는 거래 위변조를 막기위한 방법입니다. 
*******************************************************
*/
DataEncrypt sha256Enc 	= new DataEncrypt();
String ediDate 			= getyyyyMMddHHmmss();	
String hashString 		= sha256Enc.encrypt(ediDate + merchantID + price + merchantKey);
%>
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
	if(checkPlatform(window.navigator.userAgent) == "mobile"){//모바일 결제창 진입
		document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
		document.payForm.acceptCharset="euc-kr";
		document.payForm.submit();
	}else{//PC 결제창 진입
		goPay(document.payForm);
	}
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
			<td><input type="text"    name="GoodsName"  readonly value="<%=goodsName%>"></td>
		</tr>
		<tr>
			<th><span>결제 상품금액</span></th>
			<td><input type="text"  name="Amt"  readonly value="<%=price%>"></td>
		</tr>				
		<tr>
			<th><span></span></th>
			<td><input type="hidden"  name="MID"  readonly value="<%=merchantID%>"></td>
		</tr>	
		<tr>
			<th><span>상품 주문번호</span></th>
			<td><input type="text"  name="Moid"  readonly value="<%=moid%>"></td>
		</tr> 
		<tr>
			<th><span>구매자명</span></th>
			<td><input type="text"  name="BuyerName"  readonly value="<%=buyerName%>"></td>
		</tr>	 
		<tr>
			<th>구매자 이메일</th>
			<td><input type="text"  name="BuyerEmail"  readonly value="<%=buyerEmail%>"></td>
		</tr>			
		<tr>
			<th><span>구매자 연락처</span></th>
			<td><input type="text" style="border: none;outline: none; " name="BuyerTel"  readonly value="<%=buyerTel%>"></td>
		</tr>	 
		<tr>
			<th><span><!-- (모바일 결제창 전용)PC 결제창 사용시 필요 없음 --></span></th>
			<td><input type="hidden" name="ReturnURL"  value="<%=returnURL%>"></td>
		</tr>
		
					
		<!-- 옵션 --> 
		<input type="hidden" name="GoodsCl" value="1"/>						<!-- 상품구분(실물(1),컨텐츠(0)) -->
		<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
		<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
		<input type="hidden" name="ReqReserved" value=""/>					<!-- 상점 예약필드 -->
					
		<!-- 변경 불가능 -->
		<input type="hidden" name="EdiDate" value="<%=ediDate%>"/>			<!-- 전문 생성일시 -->
		<input type="hidden" name="SignData" value="<%=hashString%>"/>	<!-- 해쉬값 -->
	</table>
	<a href="#" class="btn_blue" onClick="nicepayStart();">결제하기</a>
</form>
</div>
</main>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
<%!
public final synchronized String getyyyyMMddHHmmss(){
	SimpleDateFormat yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
	return yyyyMMddHHmmss.format(new Date());
}
// SHA-256 형식으로 암호화
public class DataEncrypt{
	MessageDigest md;
	String strSRCData = "";
	String strENCData = "";
	String strOUTData = "";
	
	public DataEncrypt(){ }
	public String encrypt(String strData){
		String passACL = null;
		MessageDigest md = null;
		try{
			md = MessageDigest.getInstance("SHA-256");
			md.reset();
			md.update(strData.getBytes());
			byte[] raw = md.digest();
			passACL = encodeHex(raw);
		}catch(Exception e){
			System.out.print("암호화 에러" + e.toString());
		}
		return passACL;
	}
	
	public String encodeHex(byte [] b){
		char [] c = Hex.encodeHex(b);
		return new String(c);
	}
}
%>