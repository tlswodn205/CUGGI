<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="one-table-form" method="put" action="../updateOfflineStore">
					<h2>상품 수정 페이지</h2>
					<table class = "one-table">
					    <tbody>
					        <tr>
					            <td>상품 아이디</td>
					            <td><input type="text" id="product-feature" name="id" placeholder="" value="${adminProductList[0].id}"></td>
					        </tr>
					        <tr>
					            <td>상품 이름</td>
					            <td><input type="text" id="prduct-name" name="productName" placeholder="" value="${adminProductList[0].productName}"></td>
					        </tr>
					        <tr>
					            <td>상품 설명</td>
					            <td><input type="text" id="product-feature" name="productFeature" placeholder="" value="${adminProductList[0].productFeature}"></td>
					        </tr>
					        <tr>
					            <td>재고</td>
					            <td><input type="text" id="product-quantity" name="quantity" placeholder="" value="${adminProductList[0].quantity}"></td>
					        </tr>
					        <tr>
					            <td>추가</td>
					            <td><input type="text" id="" name="" placeholder="" value=""></td>
					        </tr>
					    </tbody>
					</table>
					<input type="submit" value="상품 수정">
				</form>
	
<script>

</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>