<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/product/list.css" />
  </head>

  <body>
    <header>
      <nav>
        <div class="logo">
          <a href="/"><img src="/images/logo/logo.png" alt="" /></a>
        </div>
        <ul class="menu">
          <li>트래블</li>
          <li>핸드백</li>
          <li>지갑</li>
          <li>쥬얼리&시계</li>
          <div class="submenu">
            <span class="close">X</span>
            <div class="subcategory">
              <ul>
                <li>더블백</li>
                <li>캐리어</li>
                <li>하드쉘</li>
              </ul>
              <ul>
                <li>탑 핸들백</li>
                <li>토트백</li>
                <li>숄더백</li>
                <li>크로스백</li>
                <li>미니백</li>
                <li>클러치</li>
              </ul>
              <ul>
                <li>카드 지갑</li>
                <li>반지갑</li>
                <li>장지갑</li>
                <li>체인지갑</li>
              </ul>
              <ul>
                <li>패션 주얼리</li>
                <li>파인 주얼리</li>
                <li>실버 주얼리</li>
                <li>시계</li>
              </ul>
            </div>
          </div>
        </ul>
      </nav>
    </header>

    <main id="product-list">
      <div class="detail-category">
        <div class="detail-category-title">핸드백</div>
        <img
          class="detail-category-img"
          src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1693406735/HeroRegularStandard_FW-Tier2-Anticipated-Aug23-01_001_Default.jpg"
          alt=""
        />
      </div>
      <div class="detail-filter">
        <div>핸드백</div>
        <div>
          <div class="detail-filter-current">정렬기준 : <span>신상품</span></div>
        </div>
        <div class="detail-filter-option">
          <ul>
            <li class="option-list createAt on"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&filter=createAt">신상품</a></li>
            <li class="option-list priceDESC"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&filter=priceDESC">가격 - 높은 가격순</a></li>
            <li class="option-list priceASC"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&filter=priceASC">가격 - 낮은 가격순</a></li>
          </ul>
        </div>
      </div>
      <div class="detail-main">
        <c:forEach items="${productMap}" var="productList">
	        <div class="product-one" id="${productList.key}">
	          <div class="slide">
	          	<c:forEach items="${productList.value}" var="item">
	            	<img src="${item.image}" alt="" />
	            </c:forEach>
	          </div>
	          <p class="btnPrev"><i class="fa-solid fa-less-than"></i></p>
	          <p class="btnNext"><i class="fa-solid fa-greater-than"></i></p>
	        </div>
		</c:forEach>
        
      </div>
      <div class="product-all-btn">모두 보기</div>
    </main>

    <footer class="common-black-background common-white-font">
      <div>
        <p>구찌 코리아 유한책임회사</p>
        <p>대표자: 실뱅 꼴라델 / 서울시 강남구 영동대로 517, 35층(삼성동, 아셈타워) / 사업자등록번호: 120-81-79834</p>
        <p>통신판매업 신고번호 제 2015-서울강남-00052 호 (사업자 정보 확인)</p>
        <p>개인정보보호책임자: 한소희 / 호스팅 서비스: Rackspace Hosting</p>
      </div>
    </footer>
  </body>
  <script src="/js/script.js"></script>
  <script src="/js/product/list.js"></script>
</html>