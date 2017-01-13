<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script>
	var mapContainer = document.getElementById('mapView'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(${lat}, ${lng}); 
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition,
	    title: "${ba}"
	    
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); 
    

</script>

</head>
<body>
<div id="map" class="houseMap"></div>
</body>
</html>