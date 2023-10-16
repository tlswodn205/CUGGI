<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

<form class="one-table-form" method="post" action="/admin/product" enctype="multipart/form-data">
<h2>상품 등록 페이지</h2>
<table class="one-table">
  <tbody>
    <tr>
      <td>상품 이름</td>
      <td><input type="text" id="prduct-name" name="productName" value="" placeholder="상품 이름을 입력해주세요" required /></td>
    </tr>
    <tr>
      <td>상품 가격</td>
      <td><input type="number" id="prduct-price" name="price" value="" placeholder="상품 가격을 입력해주세요" required /></td>
    </tr>
    <tr>
      <td>상품 설명</td>
      <td>
        <textarea rows="4" cols="140" id="product-feature" name="productFeature" style="resize: none" placeholder="상품 설명을 입력해주세요" required></textarea>
      </td>
    </tr>
    <tr>
      <td>재고</td>
      <td><input type="number" id="product-quantity" name="quantity" value="" placeholder="상품 재고를 입력해주세요" required /></td>
    </tr>
    <tr>
      <td>1차카테고리</td>
      <td>
        <select name="firstCategoryId" id="first-category-id">
          <option value="1">트래블</option>
          <option value="2">핸드백</option>
          <option value="3">지갑</option>
          <option value="4">쥬얼리&시계</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>2차카테고리</td>
      <td>
        <select name="secondCategoryId" id="second-category-id">
          <option value="1">트롤리 & 캐리어</option>
          <option value="2">더플백</option>
          <option value="3">트래블 소품</option>
          <option value="4">하드쉘 러기지</option>
          <option value="5">구찌 포터</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>썸네일</td>
      <td id="thumbnailImgTd">
        <div style="display: flex; justify-content: center; text-align: center">
          <input type="file" name="thumbImg" multiple/>
        </div>
      </td>
    </tr>
    <tr>
      <td>상품 세부 이미지</td>
      <td id="detailImglTd">
        <div style="display: flex; justify-content: center; text-align: center">
            <input type="file" name="detailImg" multiple/>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
  <input type="submit" value="상품 등록" />
</form>
<script>
// 1차 카테고리 변경시 2차 카테고리 변경

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