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
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
        center: new daum.maps.LatLng(${lat}, ${lng}), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 

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

//��Ŀ Ŭ�����ͷ��� �����մϴ� 
var clusterer = new daum.maps.MarkerClusterer({
    map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
    averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
    minLevel: 7 // Ŭ������ �� �ּ� ���� ���� 
});


var markers = new Array(); //��Ŀ ���� ���� �迭 ����

// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
for (var i = 0; i < positions.length; i ++) {
    
    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new daum.maps.Size(24, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    if (i == 0) {
    	var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    } else {
    	//var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    }
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    // ��Ŀ�� �����մϴ�
    
    markers[i] =  new daum.maps.Marker({
	        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
	        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
	        image : markerImage // ��Ŀ �̹��� 
	});
}
//Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
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