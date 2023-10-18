<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file ="/WEB-INF/view/layout/header.jsp" %>
<style>
	.locator-div{
		display: flex;
		margin-top:20px;
		margin-bottom:20px;
	}
	
	.locator-div{
		font-size: 16px;
	}
	
	.locator-div .locator{
	 	padding: 5px;
		background: #fff;
		border: 0;
		font-weight: bold;
		appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
	}
	
	.locator-div .locator:focus{
	  outline: 0;
	}
		
	.locator-div .locator option{
	  outline: 0;
	  padding: 5px;
	}
	
	.locator-div .locator option:selected{
		background: #000;
		font-color: #fff;
	}
	.offline-store{
		padding: 20px;
		width : 760px;
		border : 1px solid #000;
		border-radius: 10px;
		margin-bottom: 20px;
	}
	
/*	
	.offline-store:nth-child(even) {
		background : #ccc;
	}
	
	.offline-store:nth-child(odd) {
		background : #fff;
	}
*/
		
	.offline-store .offline-store-container{
		display: flex;
	    justify-content: space-between;
	}
	
	.offline-store .offline-store-container div{
		margin-bottom: 10px;
	}
	
	.offline-store .store-name{
		font-size: 20px;
		font-weight: bold;
	}
	
	.offline-store .load-map{
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
	
	.offline-store .load-map:hover {
    	animation: animateButtonBackgroundEven 0.5s forwards;
	}
/*
	.offline-store:nth-child(even) .load-map:hover {
    	animation: animateButtonBackgroundEven 0.5s forwards;
	}
*/
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

/*	
	.offline-store:nth-child(odd) .load-map:hover {
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
*/
.offline-store #map{
	margin-top: 10px;
}

</style>
<main>
    <div class="main-column" id="main-column">
    	<div class="locator-div">
	    	<span>지역 선택</span>
	    	<select id="locator" class="locator" >
				<option value="">모두보기</option>
				<c:forEach var="locator" items="${locator}">
					<option value=${locator}>${locator}</option>
				</c:forEach>
	    	</select>
    	</div>
		<c:forEach var="offlineStore" items="${offlineStoreList}">
			<div id="offline-store-${offlineStore.id}" class = "offline-store">
				<input type ="hidden" id="store-name" name="storeName" value="${offlineStore.storeName}">
				<input type ="hidden" id="store-address" name="storeAddress" value="${offlineStore.storeAddress}">
			    <div class = "offline-store-container">
					<div class = "offline-store-info">
						<div class ="store-name">${offlineStore.storeName}</div>
						<div class ="store-address">${offlineStore.storeAddress} ${offlineStore.storeAddressDetail}</div>
						<div class ="store-number">tel: ${offlineStore.storeNumber}</div> 
					</div>
						<input type ="button" class="load-map" onclick="loadMap(${offlineStore.id})" value="지도보기">
				</div>
			</div>
		</c:forEach>
	</div>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09ac6df625984823e4707926c0c624be&libraries=services"></script>

<script>
	let mapId = 0;
	function loadMap(id){
		let storeName = $("#offline-store-"+id).children("#store-name").val();
	
		let storeAddress = $("#offline-store-"+id).children("#store-address").val();
		
		if(mapId != id){
			if(mapId > 0){
				$("#offline-store-"+mapId).children("#map").remove();
			}
			mapId = id;

			$("#offline-store-"+id).append('<div id="map" style="width:100%;height:350px;"></div>');
			createMap(storeName,storeAddress);
		}else{
			$("#offline-store-"+mapId).children("#map").remove();
			mapId = 0;
		}
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
	
	
	
	$("#locator").change((val) => {
		let locator = $("#locator").val();

           $.ajax("/offlineStore/location", {
               type: "Post",
               dataType: "json",
               data: JSON.stringify(locator),
               headers: {
                   "Content-Type": "application/json"
               }
           }).done((res) => {
            	   $('#main-column div').remove('.offline-store');
            	   console.log($('#main-column'));
            	   res.forEach((offlineStore) => {
            			   let html = '<div id="offline-store-'+offlineStore.id +'" class = "offline-store">';
				               html += '<input type ="hidden" id="store-name" name="storeName" value="'+ offlineStore.storeName +'">';
				               html += '<input type ="hidden" id="store-address" name="storeAddress" value="'+offlineStore.storeAddress+'">';
				               html += '<div class = "offline-store-container">';
				               html += '<div class = "offline-store-info">';
				               html += '<div class ="store-name">'+ offlineStore.storeName +'</div>';
				               html += '<div class ="store-address">'+offlineStore.storeAddress+' '+offlineStore.storeAddressDetail+'</div>';
				               html += '<div class ="store-number">tel:'+offlineStore.storeNumber+'</div> ';
				               html += '</div>';
				               html += '<input type ="button" class="load-map" onclick="loadMap('+offlineStore.id +')" value="지도보기">';
				               html += '</div>';
				               html += '</div>';
				               
				               $('#main-column').append(html);
            	   });
           });
       });

</script>


<%@ include file ="/WEB-INF/view/layout/footer.jsp" %>