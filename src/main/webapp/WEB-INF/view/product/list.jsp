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
	<%@ include file="/WEB-INF/view/product/header.jsp" %>

    <main id="product-list">
    <c:if test="${!empty firstCategoryId}">
      <div class="detail-category">
        <div class="detail-category-title">검색 결과가 없습니다.</div>
        <img
          class="detail-category-img"
          src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1693406735/HeroRegularStandard_FW-Tier2-Anticipated-Aug23-01_001_Default.jpg"
          alt="1차 카테고리 이미지"
        />
      </div>
	</c:if>      
      <div class="detail-filter">
      	<div>${secondCategoryName}</div>
        <div>
          <div class="detail-filter-current">정렬기준 : <span>
          <c:choose>
          	<c:when test="${filter == 'createAt'}">신상품</c:when>
          	<c:when test="${filter == 'priceDESC'}">가격 - 높은 가격순</c:when>
          	<c:when test="${filter == 'priceASC'}">가격 - 낮은 가격순</c:when>
          </c:choose></span></div>
        </div>
        <div class="detail-filter-option">
          <ul>
          	
            <li class="option-list ${filter == 'createAt' ? 'on' : ''} createAt"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=createAt">신상품</a></li>
            <li class="option-list ${filter == 'priceDESC' ? 'on' : ''} priceDESC"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=priceDESC">가격 - 높은 가격순</a></li>
            <li class="option-list ${filter == 'priceASC' ? 'on' : ''} priceASC"><a href="http://localhost:90/product/list?secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=priceASC">가격 - 낮은 가격순</a></li>
          </ul>
        </div>
      </div>
      <div class="detail-main">
        <c:forEach items="${productMap}" var="productList">
	        <div class="product-one" id="${productList.key}">
	          <div class="slide">
	          	<c:forEach items="${productList.value}" var="item">
	            	<img src="${item.image.startsWith('/') ? item.image : '/images/' += item.image}" alt="" />
	            </c:forEach>
	          </div>
	          <p class="btnPrev"><i class="fa-solid fa-less-than"></i></p>
	          <p class="btnNext"><i class="fa-solid fa-greater-than"></i></p>
	        </div>
		</c:forEach>
		<c:if test="${empty productMap}">
        	<div style="text-align: center; width:100%">검색결과가 없습니다.</div>
        </c:if>
      </div>
      <c:if test="${productCount >= 20}">
      	<div class="product-all-btn">모두 보기</div>
      </c:if>
    </main>

<%@ include file="/WEB-INF/view/product/footer.jsp" %>
  </body>
  <script src="/js/script.js"></script>
  <script src="/js/product/list.js"></script>
</html>