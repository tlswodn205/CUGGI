<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>CUGGI</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous"
	/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
	<style>
		body {
			min-height: 100vh;
			min-height: -webkit-fill-available;
		}

		html {
			height: -webkit-fill-available;
		}

		main {
			display: flex;
			flex-wrap: nowrap;
			height: 100vh;
			height: -webkit-fill-available;
			/* max-height: 100vh; */
			overflow-x: auto;
			overflow-y: hidden;
		}

		.b-example-divider {
			flex-shrink: 0;
			/*width: 1.5rem;*/
			/* height: 100vh; */
			background-color: rgba(0, 0, 0, 0.1);
			border: solid rgba(0, 0, 0, 0.15);
			border-width: 1px 0;
			box-shadow: inset 0 0.5em 1.5em rgba(0, 0, 0, 0.1), inset 0 0.125em 0.5em rgba(0, 0, 0, 0.15);
		}

		.bi {
			vertical-align: -0.125em;
			pointer-events: none;
			fill: currentColor;
		}

		.updateProduct .imgDiv{
			width: 20%;
		}
		.updateProduct .custom-file-upload {
			display: inline-block;
			padding: 10px 20px;
			background-color: #007bff;
			color: #fff;
			cursor: pointer;
			border-radius: 5px;
			font-weight: bold;
			text-align: center;
			transition: background-color 0.3s ease;
		}
		.custom-file-upload:hover {
			background-color: #0056b3;
		}
	</style>
</head>
<body>
<main>
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px">
		<span class="fs-4 text-center">CUGGI Admin</span>
		<hr />
		<ul class="nav nav-pills flex-column mb-auto">
			<li>
				<a href="/admin/userInfoList" class="nav-link text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill fs-1" viewBox="0 0 16 16">
						<path
								d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"
						/>
					</svg>
					유저관리
				</a>
			</li>
			<li>
				<a href="/admin/products" class="nav-link text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gift-fill fs-1" viewBox="0 0 16 16">
						<path
								d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zm6 4v7.5a1.5 1.5 0 0 1-1.5 1.5H9V7h6zM2.5 16A1.5 1.5 0 0 1 1 14.5V7h6v9H2.5z"
						/>
					</svg>
					상품관리
				</a>
			</li>
			<li>
				<a href="/admin/orderListManagement" class="nav-link text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list fs-1" viewBox="0 0 16 16">
						<path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"
						/>
						<path
								d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"
						/>
					</svg>
					주문관리
				</a>
			</li>
			<li>
				<a href="/admin/qnaList" class="nav-link text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-octagon-fill fs-1" viewBox="0 0 16 16">
						<path
								d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM5.496 6.033a.237.237 0 0 1-.24-.247C5.35 4.091 6.737 3.5 8.005 3.5c1.396 0 2.672.73 2.672 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.105a.25.25 0 0 1-.25.25h-.81a.25.25 0 0 1-.25-.246l-.004-.217c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.803 0-1.253.478-1.342 1.134-.018.137-.128.25-.266.25h-.825zm2.325 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z"
						/>
					</svg>
					문의사항관리
				</a>
			</li>
			<li>
				<a href="/admin/offlineStoreManagement" class="nav-link text-white">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shop fs-1" viewBox="0 0 16 16">
						<path
								d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"
						/>
					</svg>
					오프라인매장관리
				</a>
			</li>
		</ul>
	</div>
	<div class="b-example-divider"></div>

	<form class="one-table-form ms-4 container" method="POST" action="/admin/product/${adminProductList[0].id}" enctype="multipart/form-data">
		<div class="h2 mt-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gift-fill fs-1" viewBox="0 0 16 16">
				<path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zm6 4v7.5a1.5 1.5 0 0 1-1.5 1.5H9V7h6zM2.5 16A1.5 1.5 0 0 1 1 14.5V7h6v9H2.5z"/>
			</svg>
			상품 수정 페이지
		</div>
		<hr>
		<table class="one-table table table-bordered text-center align-middle updateProduct">
			<tbody>
			<tr>
				<th scope="row">상품 아이디</th>
				<td><input type="hidden" class="form-control" id="product-feature" name="id" value="${adminProductList[0].id}" />${adminProductList[0].id}</td>
			</tr>
			<tr>
				<th scope="row">상품 이름</th>
				<td><input type="text" class="form-control" id="prduct-name" name="productName" value="${adminProductList[0].productName}" /></td>
			</tr>
			<tr>
				<th scope="row">상품 가격</th>
				<td><input type="number" class="form-control" id="prduct-price" name="price" value="${adminProductList[0].price}" /></td>
			</tr>
			<tr>
				<th scope="row">상품 설명</th>
				<td>
					<textarea rows="4" cols="140" class="form-control" id="product-feature" name="productFeature" style="resize: none;">${adminProductList[0].productFeature}</textarea>
				</td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" class="form-control" id="product-quantity" name="quantity" value="${adminProductList[0].quantity}" /></td>
			</tr>
			<tr>
				<td>1차카테고리</td>
				<td>
					<select name="firstCategoryId" class="form-select" id="first-category-id">
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
					<select name="secondCategoryId" class="form-select" id="second-category-id">
						<c:forEach items="${secondCategory}" var="item">
							<option value="${item.id}" ${item.id == adminProductList[0].scId ? 'selected' : '' }>${item.secondCategoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>썸네일<br><button type="button" class="btn btn-dark btnAddImg">추가</button></td>
				<td class="tableImgTd d-flex" id="thumbnailImgTd">
					<c:forEach var="product" items="${adminProductList}" varStatus="status">
						<c:if test="${product.isThumbnail == 1}">
							<div class="card imgDiv">
								<img src="${product.image.startsWith('/') ? product.image : '/upload/' += product.image}" class="card-img-top" alt="${product.imgId}" style="height: 233px; object-fit: contain;">
								<div class="card-body d-flex">
									<label for="fileInput${status.index}" class="custom-file-upload col-10">
										<span>파일 선택</span>
									</label>
									<input type="file" id="fileInput${status.index}" class="form-control updateFile" name="${product.imgId}" style="display: none;">
									<div class="btn deleteImg col-2"><i class="fa-solid fa-x" style="font-size: 26px; line-height: 26px;"></i></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>세부 이미지<br><button type="button" class="btn btn-dark btnAddImg">추가</button></td>
				<td class="tableImgTd d-flex" id="detailImglTd">
					<c:forEach var="product" items="${adminProductList}" varStatus="status">
						<c:if test="${product.isThumbnail == 0}">
							<div class="card imgDiv">
								<img src="${product.image.startsWith('/') ? product.image : '/upload/' += product.image}" class="card-img-top" alt="${product.imgId}" style="height: 233px; object-fit: contain;">
								<div class="card-body d-flex">
									<label for="fileInput${status.index}" class="custom-file-upload col-10">
										<span>파일 선택</span>
									</label>
									<input type="file" id="fileInput${status.index}" class="form-control updateFile" name="${product.imgId}" style="display: none;">
									<div class="btn deleteImg col-2"><i class="fa-solid fa-x" style="font-size: 26px; line-height: 26px;"></i></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</td>
			</tr>
			</tbody>
		</table>
		<div class="text-end">
			<input type="submit" class="btn btn-outline-secondary" value="상품 수정" />
		</div>
	</form>

	<script src="/js/admin/product/update.js"></script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>