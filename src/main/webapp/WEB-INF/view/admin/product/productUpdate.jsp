<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

<form class="one-table-form" method="POST" action="/admin/product/${adminProductList[0].id}" enctype="multipart/form-data">
      <h2>상품 수정 페이지</h2>
      <table class="one-table">
        <tbody>
          <tr>
            <td>상품 아이디</td>
            <td><input type="hidden" id="product-feature" name="id" value="${adminProductList[0].id}" />${adminProductList[0].id}</td>
	      </tr>
	      <tr>
	        <td>상품 이름</td>
	        <td><input type="text" id="prduct-name" name="productName" value="${adminProductList[0].productName}" /></td>
	      </tr>
	      <tr>
	        <td>상품 가격</td>
	        <td><input type="text" id="prduct-price" name="price" value="${adminProductList[0].price}" /></td>
	      </tr>
	      <tr>
	        <td>상품 설명</td>
	        <td>
	          <textarea rows="4" cols="100" id="product-feature" name="productFeature" style="resize: none">${adminProductList[0].productFeature}</textarea>
	        </td>
	      </tr>
	      <tr>
	        <td>재고</td>
	        <td><input type="text" id="product-quantity" name="quantity" value="${adminProductList[0].quantity}" /></td>
	      </tr>
	      <tr>
	        <td>1차카테고리</td>
	        <td><input type="text" id="product-first-category" name="fcName" value="${adminProductList[0].firstCategoryName}" /></td>
	      </tr>
	      <tr>
	        <td>2차카테고리</td>
	        <td>
	          <input type="text" id="autocomplete" name="scName" list="choices" value="${adminProductList[0].secondCategoryName}" autocomplete="off" />
	          <datalist id="choices">
	            <!-- forEach? -->
	            <option value="트롤리 & 캐리어"></option>
	            <option value="더플백"></option>
	            <option value="트래블 소품"></option>
	            <option value="더플하드쉘 러기지백"></option>
	            <option value="구찌 포터"></option>
	            <option value="탑 핸들백"></option>
	            <option value="숄더백"></option>
	            <option value="크로스백"></option>
	            <option value="미니백"></option>
	            <option value="장지갑"></option>
	            <option value="반지갑"></option>
	            <option value="체인 지갑 "></option>
	            <option value="여성 파인 주얼리"></option>
	            <option value="여성 실버 주얼리"></option>
	            <option value="여성 패션 주얼리"></option>
	            <option value="장지갑"></option>
	            <option value="여성 시계"></option>
	          </datalist>
	        </td>
	      </tr>
	      <tr>
	        <td>썸네일</td>
	        <td id="thumbnailImgTd">
	        <input type="file" id="product-thumbnail" name="thumbnails" multiple value="" accept="image/*" /><br>
	          <c:forEach var="product" items="${adminProductList}">
	          	<c:if test="${product.isThumbnail == 1}">
	          		<img src="${product.image}" alt="${product.imgId}" style="width:19%">
	          	</c:if>
	          </c:forEach>
	          
	        </td>
	      </tr>
	      <tr>
	        <td>상품 세부 이미지</td>
	        <td id="detailImglTd">
	        <input type="file" id="product-detail-img" name="detailImgs" multiple value="" accept="image/*" /><br>
  	          <c:forEach var="product" items="${adminProductList}">
	          	<c:if test="${product.isThumbnail == 0}">
	          		<img src="${product.image}" alt="${product.imgId}" style="width:19%">
	          	</c:if>
	          </c:forEach>
	          
	        </td>
	      </tr>
	    </tbody>
	  </table>
  <input type="submit" value="상품 수정" />
</form>
	
<script>

</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>