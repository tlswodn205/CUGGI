<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

<form class="one-table-form" method="POST" action="/admin/product/${adminProductList[0].id}" enctype="multipart/form-data">
      <h2>상품 수정 페이지</h2>
      <table class="one-table updateProduct">
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
	        <td><input type="number" id="prduct-price" name="price" value="${adminProductList[0].price}" /></td>
	      </tr>
	      <tr>
	        <td>상품 설명</td>
	        <td>
	          <textarea rows="4" cols="140" id="product-feature" name="productFeature">${adminProductList[0].productFeature}</textarea>
	        </td>
	      </tr>
	      <tr>
	        <td>재고</td>
	        <td><input type="number" id="product-quantity" name="quantity" value="${adminProductList[0].quantity}" /></td>
	      </tr>
	      <tr>
	        <td>1차카테고리</td>
	        <td>
	         	<select name="firstCategoryId" id="first-category-id">
                	<option value="1" ${adminProductList[0].fcId == 1 ? 'selected' : '' }>트래블</option>
                    <option value="2" ${adminProductList[0].fcId == 2 ? 'selected' : '' }>핸드백</option>
                    <option value="3" ${adminProductList[0].fcId == 3 ? 'selected' : '' }>지갑</option>
                    <option value="4" ${adminProductList[0].fcId == 4 ? 'selected' : '' }>쥬얼리&시계</option>
                </select>
        	</td>
	      </tr>
	      <tr>
	        <td>2차카테고리</td>
	        <td>
              <select name="secondCategoryId" id="second-category-id">
              	<c:forEach items="${secondCategory}" var="item">
	                <option value="${item.id}" ${item.id == adminProductList[0].scId ? 'selected' : '' }>${item.secondCategoryName}</option>
                </c:forEach>
              </select>
       		 </td>
	      </tr>
	      <tr>
	        <td>썸네일</td>
	        <td class="tableImgTd" id="thumbnailImgTd">
	          <div>
		          <c:forEach var="product" items="${adminProductList}">
		          	<c:if test="${product.isThumbnail == 1}">
		          		<div>
		          			<div><i class="fa-solid fa-x"></i></div>
		          			<img src="${product.image.startsWith('/') ? product.image : '/upload/' += product.image}" alt="${product.imgId}"><br>
		          			<input type="file" name="${product.imgId}"><br>
	          			</div>
		          	</c:if>
		          </c:forEach>
	          </div>
	        </td>
	      </tr>
	      <tr>
	        <td>상품 세부 이미지</td>
	        <td class="tableImgTd" id="detailImglTd">
  	          <div>
		          <c:forEach var="product" items="${adminProductList}">
		          	<c:if test="${product.isThumbnail == 0}">
		          		<div>
		          			<div><i class="fa-solid fa-x"></i></div>
		          			<img src="${product.image.startsWith('/') ? product.image : '/upload/' += product.image}" alt="${product.imgId}" ><br>
		          			<input type="file" name="${product.imgId}"><br>
	          			</div>
		          	</c:if>
		          </c:forEach>
	          </div>
	        </td>
	      </tr>
	    </tbody>
	  </table>
  <input type="submit" value="상품 수정" />
</form>
	
<script>
const firstSelect = document.getElementById('first-category-id');
const secondSelect = document.getElementById('second-category-id');

firstSelect.addEventListener('change', function (e) {
  const fcId = e.target.value;
  fetch("/admin/product/category/first/" + fcId)
    .then((res) => res.json())
    .then((data) => {
      secondSelect.innerHTML = '';
      data.forEach((e) => {
        let scOption = document.createElement('option');
        scOption.value = e.id;
        scOption.textContent = e.secondCategoryName;
        secondSelect.append(scOption);
      });
    })
    .catch((err) => console.log(err));
});


</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>