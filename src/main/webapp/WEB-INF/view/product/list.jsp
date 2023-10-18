<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/layout/header.jsp" %>

    <main id="product-list">
    
    <c:if test="${!empty firstCategoryId}">
      <div class="detail-category">
        <div class="detail-category-title">${firstCategoryName}</div>
        <c:choose>
        	<c:when test="${firstCategoryId eq 1}">
        		<img class="detail-category-img" 
        		src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1695923119/HeroRegularStandard_Gucci-Valigeria-Campaign-Oct2023-002_001_Default.jpg" 
        		alt="1차 카테고리 이미지"
        		/>
        	</c:when>
        	<c:when test="${firstCategoryId eq 2}">
        		<img class="detail-category-img" 
        		src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1693406735/HeroRegularStandard_FW-Tier2-Anticipated-Aug23-01_001_Default.jpg" 
        		alt="1차 카테고리 이미지"
        		/>
        	</c:when>
        	<c:when test="${firstCategoryId eq 3}">
        		<img class="detail-category-img" 
        		src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1695632450/HeroRegularStandard_FW-Tier2-Still-Life-Sept23-019_001_Default.jpg" 
        		alt="1차 카테고리 이미지"
        		/>
        	</c:when>
        	<c:when test="${firstCategoryId eq 4}">
        		<img class="detail-category-img" 
        		src="https://media.gucci.com/content/HeroRegularStandard_3200x1350/1690789531/HeroRegularStandard_758937J85008000_001_Default.jpg" 
        		alt="1차 카테고리 이미지"
        		/>
        	</c:when>
        </c:choose>
      </div>
	</c:if>  
	  <input type="hidden" id="second-category-id" value="${secondCategoryId}">    
      <div class="detail-filter">
      	<div>
      		<c:if test="${!empty firstCategofyName}">
      			<a href="/product/list?firstCategofyId=${firstCategofyId}">${firstCategofyName}</a> /
      		</c:if>
      		<a href="/product/list?secondCategoryId=${secondCategoryId}">${secondCategoryName}</a>
      	</div>
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
            <li class="option-list ${filter == 'createAt' ? 'on' : ''} createAt"><a href="/product/list?firstCategoryId=${firstCategoryId}&secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=createAt">신상품</a></li>
            <li class="option-list ${filter == 'priceDESC' ? 'on' : ''} priceDESC"><a href="/product/list?firstCategoryId=${firstCategoryId}&secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=priceDESC">가격 - 높은 가격순</a></li>
            <li class="option-list ${filter == 'priceASC' ? 'on' : ''} priceASC"><a href="/product/list?firstCategoryId=${firstCategoryId}&secondCategoryId=${secondCategoryId}&searchData=${searchData}&filter=priceASC">가격 - 낮은 가격순</a></li>
          </ul>
        </div>
      </div>
      <div class="detail-main">
        <c:forEach items="${productMap}" var="productList">
	        <div class="product-one" id="${productList.key}">
	          <div class="slide">
	          	<c:forEach items="${productList.value}" var="item">
	            	<img src="${item.image.startsWith('/') ? item.image : '/upload/' += item.image}" alt="" />
	            </c:forEach>
	          </div>
	          <div class="product-hover">
	          	<div>${productList.value[0].productName}</div>
	            <div>&#8361;<fmt:formatNumber value="${productList.value[0].price}" pattern="#,###" /></div>
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
	<script src="/js/product/list.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>