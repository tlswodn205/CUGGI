<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

<form class="one-table-form ms-4 container" method="post" action="/admin/product" enctype="multipart/form-data">
  <div class="h2 mt-3">
    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gift-fill fs-1" viewBox="0 0 16 16">
      <path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zm6 4v7.5a1.5 1.5 0 0 1-1.5 1.5H9V7h6zM2.5 16A1.5 1.5 0 0 1 1 14.5V7h6v9H2.5z"/>
    </svg>
    상품 등록 페이지
  </div>
  <hr>
  <table class="one-table table table-bordered text-center align-middle">
    <tbody>
    <tr>
      <th class="table-light" scope="row">상품 이름</th>
      <td><input type="text" class="form-control" id="prduct-name" name="product.productName" value="" placeholder="상품 이름을 입력해주세요" required /></td>
    </tr>
    <tr>
      <th class="table-light" scope="row">상품 가격</th>
      <td><input type="number" class="form-control" id="prduct-price" name="product.price" value="" placeholder="상품 가격을 입력해주세요" required /></td>
    </tr>
    <tr>
      <th class="table-light" scope="row">상품 설명</th>
      <td>
        <textarea rows="4" class="form-control" cols="140" id="product-feature" name="product.productFeature" style="resize: none" placeholder="상품 설명을 입력해주세요" required></textarea>
      </td>
    </tr>
    <tr>
      <th class="table-light" scope="row">재고</th>
      <td><input type="number" class="form-control" id="product-quantity" name="product.quantity" value="" placeholder="상품 재고를 입력해주세요" required /></td>
    </tr>
    <tr>
      <th class="table-light" scope="row">1차카테고리</th>
      <td>
        <select name="product.firstCategoryId" class="form-select"  id="first-category-id">
          <option value="1">트래블</option>
          <option value="2">핸드백</option>
          <option value="3">지갑</option>
          <option value="4">쥬얼리&시계</option>
        </select>
      </td>
    </tr>
    <tr>
      <th class="table-light" scope="row">2차카테고리</th>
      <td>
        <select name="product.secondCategoryId" class="form-select" id="second-category-id">
          <option value="1">트롤리 & 캐리어</option>
          <option value="2">더플백</option>
          <option value="3">트래블 소품</option>
          <option value="4">하드쉘 러기지</option>
          <option value="5">구찌 포터</option>
        </select>
      </td>
    </tr>
    <tr>
      <th class="table-light"  scope="row">썸네일</th>
      <td id="thumbnailImgTd">
        <div style="display: flex; justify-content: center; text-align: center">
          <input type="file" class="form-control" name="thumbImg" multiple />
        </div>
      </td>
    </tr>
    <tr>
      <th class="table-light" scope="row">상품 세부 이미지</th>
      <td id="detailImglTd">
        <div style="display: flex; justify-content: center; text-align: center">
          <input type="file" class="form-control" name="detailImg" multiple />
        </div>
      </td>
    </tr>
    </tbody>
  </table>
  <div class="text-end">
    <input type="submit" class="btn btn-outline-secondary" value="상품 등록" />
  </div>
</form>
<script>
  // 1차 카테고리 변경시 2차 카테고리 변경

  const firstSelect = document.getElementById('first-category-id');
  const secondSelect = document.getElementById('second-category-id');

  firstSelect.addEventListener('change', function (e) {
    const fcId = e.target.value;
    fetch('/admin/product/category/first/' + fcId)
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