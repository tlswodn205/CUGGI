<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file ="/WEB-INF/view/layout/header.jsp" %>
<style>
	.offlineStore{
		padding: 5px;
	}
	
	.offlineStore:nth-child(even) {
		background : #ccc;
	}
	
	.offlineStore:nth-child(odd) {
		background : #fff;
	}
		
	.offlineStoreContainer{
		display: flex;
	    justify-content: space-between;
	}
	.storeName{
		font-size: 20px;
		font-weight: bold;
	}
	
	.loadMap{
		background: inherit ; 
		border:none; 
		box-shadow:none; 
		border-radius:0; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		letter-spacing : 1px;
		margin-right : 20px;
	}
	
	
	.offlineStore:nth-child(even) .loadMap:hover {
    	animation: animateButtonBackgroundEven 0.5s forwards;
	}
 
	@keyframes animateButtonBackgroundEven {
	    0% {
	        background-color: #ccc;
	    }
	    16% {
	        background-color: #ddd;
	    }
	    33% {
	        background-color: #eee;
	    }
	    50% {
	        background-color: #fff;
	    }
	    67% {
	        background-color: #eee;
	    }
	    84% {
	        background-color: #ddd;
	    }	    
	    100% {
	        background-color: #ccc;
	    }
	}
	
	.offlineStore:nth-child(odd) .loadMap:hover {
    	animation: animateButtonBackgroundOdd 0.5s forwards;
	}
	
	@keyframes animateButtonBackgroundOdd {
	    0% {
	        background-color: #fff;
	    }
	    16% {
	        background-color: #eee;
	    }
	    33% {
	        background-color: #ddd;
	    }
	    50% {
	        background-color: #ccc;
	    }
	    67% {
	        background-color: #ddd;
	    }
	    84% {
	        background-color: #eee;
	    }	    
	    100% {
	        background-color: #fff;
	    }
	}
</style>
	<c:forEach var="offlineStore" items="${offlineStoreList}">
		<div id="${offlineStore.id}" class = "offlineStore">
			<input type ="hidden" id="storeName" name="storeName" value="${offlineStore.storeName}">
			<input type ="hidden" id="storeAddress" name="storeAddress" value="${offlineStore.storeAddress}">
		    <div class = "offlineStoreContainer">
				<div>
					<span class ="storeName">${offlineStore.storeName}</span>
					<br>
					<span class ="storeAddress">${offlineStore.storeAddress} ${offlineStore.storeAddressDetail}</span>
					<br>
					<span class ="storeNumber">${offlineStore.storeNumber}</span>
				</div>
				<input type ="button" class="loadMap" onclick="loadMap(${offlineStore.id})" value="지도보기">
			</div>
		</div>
	</c:forEach>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09ac6df625984823e4707926c0c624be&libraries=services"></script>
<script>
	let mapId = 0;
	function loadMap(id){
		let storeName = $("#"+id).children("#storeName").val();
	
		let storeAddress = $("#"+id).children("#storeAddress").val();
		
		if(mapId > 0){
			$("#"+mapId).children("#map").remove();
		}
		mapId = id;

		$("#"+id).append('<div id="map" style="width:100%;height:350px;"></div>');
		createMap(storeName,storeAddress);
	}
	
	function createMap(storeName,storeAddress){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(storeAddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+storeName+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	}
</script>

<%@ include file ="/WEB-INF/view/layout/footer.jsp" %>