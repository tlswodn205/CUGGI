<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file ="/WEB-INF/view/admin/layout/header.jsp" %>

				<form class="oneTableForm" method="put" action="../updateOfflineStore">
					<h2>지점 수정 페이지</h2>
					<table class = "oneTable">
					    <tbody>
					    	<input type="hidden" id="id" name="id"value="${offlineStoreResponseDto.id}"></td>
					        </tr>
					    
					        <tr>
					            <td>지점 이름</td>
					            <td><input type="text" id="storeName" name="storeName" placeholder="지점 이름을 입력하세요." value="${offlineStoreResponseDto.storeName}"></td>
					        </tr>
					        <tr>
					            <td>지점 번호</td>
					            <td><input type="text" id="storeNumber" name="storeNumber" placeholder="지점 번호를 입력하세요." value="${offlineStoreResponseDto.storeNumber}"></td>
					        </tr>
					        <tr>
					            <td>지점 주소</td>
					            <td><input type="text" id="storeAddress" name="storeAddress" placeholder="지점 주소를 입력하세요." value="${offlineStoreResponseDto.storeAddress}" readonly><input type="button" onclick="openZipSearch()" value="주소입력" ></td>
					        </tr>
					        <tr>
					            <td>지점 상세주소</td>
					            <td><input type="text" id="storeAddressDetail" name="storeAddressDetail" placeholder="지점 상세주소를 입력하세요." value="${offlineStoreResponseDto.storeAddressDetail}"></td>
					        </tr>
					    </tbody>
					</table>
					<input type="submit" value="지점 수정">
				</form>
		


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<script>
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}

		//$("#zip_code").val(data.zonecode);
		$("#storeAddress").val(addr);
		$("#storeAddressDetail").focus();
        }
    }).open();
}
</script>
<%@ include file ="/WEB-INF/view/admin/layout/footer.jsp" %>