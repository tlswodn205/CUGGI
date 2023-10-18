<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="common-black-background common-white-font">
	<div class="footer-content">
		<div>
			<p>구찌 코리아 유한책임회사</p>
			<p>대표자: 실뱅 꼴라델 / 서울시 강남구 영동대로 517, 35층(삼성동, 아셈타워) / 사업자등록번호: 120-81-79834</p>
			<p>통신판매업 신고번호 제 2015-서울강남-00052 호 (사업자 정보 확인)</p>
			<p>개인정보보호책임자: 한소희 / 호스팅 서비스: Rackspace Hosting</p>
		</div>
		<div>
			<c:if test="${principal != null }">
			<p><span><a class="common-white-line-link" href="/qna/insertQna">문의사항</a></span></p>
			</c:if>
			<p>근무시간 : 월 ~ 금 AM 9:00 ~ PM 7:00</p>
			<p>점심시간 : PM12 :00 ~ PM 1 : 00</p>
			<p>고객센터 : AM 10: 00 ~ PM6 : 00</p>
		</div>
	</div>
</footer>
<div class="overlay"></div>
</body>
	<script src="/js/script.js"></script>
</html>