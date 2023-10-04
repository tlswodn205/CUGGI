<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ����</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>
	
<body>
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
				<input type ="button" class="loadMap" onclick="loadMap(${offlineStore.id})" value="��������">
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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
	    };  
		
		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new kakao.maps.services.Geocoder();
		// �ּҷ� ��ǥ�� �˻��մϴ�
		geocoder.addressSearch(storeAddress, function(result, status) {
		
		    // ���������� �˻��� �Ϸ������ 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+storeName+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
		        map.setCenter(coords);
		    } 
		});    
	}
</script>

</body>
</html>
