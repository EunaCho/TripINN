<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services,clusterer"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 마커를 표시할 위치와 title 객체 배열입니다 

var positions = [
    {
        title: '${ba}', 
        latlng: new daum.maps.LatLng(${lat}, ${lng})
    } <c:if test="${!empty nearByList}">
	    <c:forEach var="list" items="${nearByList}">
	     , {
	    	 title: '${list.ba}',
	    	 latlng: new daum.maps.LatLng(${list.lat}, ${list.lng})
	     }
	    </c:forEach>
      </c:if>
];

//마커 클러스터러를 생성합니다 
var clusterer = new daum.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 7 // 클러스터 할 최소 지도 레벨 
});


var markers = new Array(); //마커 들을 담을 배열 생성

// 마커 이미지의 이미지 주소입니다
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    if (i == 0) {
    	var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    } else {
    	//var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    }
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    // 마커를 생성합니다
    
    markers[i] =  new daum.maps.Marker({
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	});
}
//클러스터러에 마커들을 추가합니다
clusterer.addMarkers(markers);
	</script>
	
	<h3>
	<c:if test="${!empty nearByList}">
	    <c:forEach var="list" items="${nearByList}" step="1">
	   list.ba : ${list.ba}, &nbsp;&nbsp; 
	    	 latlng : ${list.lat}, ${list.lng} <br />
	     
	    </c:forEach>
	</c:if>	
	</h3>
</body>
</html>