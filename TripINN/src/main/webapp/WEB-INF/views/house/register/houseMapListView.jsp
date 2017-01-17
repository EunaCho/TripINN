 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services,clusterer"></script>
<style>
	.overlay_info {border-radius: 6px; margin-bottom: 12px; float:left; position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {width: 140px;font-size: 14px; display: block; background: #d95050;padding:12px 36px 12px 14px; text-decoration: none; color: #fff;}
    .overlay_info a strong {background:url('http://icon-icons.com/icons2/508/PNG/512/home_house_icon-icons.com_49851.png') no-repeat; background-size:17px; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 80px;}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info .address2{font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 80px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
    
    #closebtn {float: left; color: white; font-size: xx-large;}
    #diva{float: left;}
    .overlay_info #head{border-radius: 6px 6px 0 0; height: 43px; width: 100%; background: #d95050;}
</style>


<script>
alert("ddd");
 	// 지도의 중심 
 	var addr_size = ${addr_size};
 	/* alert(addr_size); */
 	var lat = new String("${lat }");
 	var lng = new String("${lng }");
 	var ba = new String("${ba }");
 	var img = new String("${img}");
 	var name = new String("${name}");
 	var idx = new String("${idx}");
 	var addr = new String("${addr}");
 	/* alert("lat " + lat);
 	alert("lng " + lng);
 	alert("ba" + ba); */
 	
 	var latSplit = lat.split('/');
 	var lngSplit = lng.split('/');
 	var baSplit = ba.split('/');
 	var imgSplit = img.split('/');
 	var nameSplit = name.split('/');
 	var idxSplit = idx.split('/');
 	var addrSplit = addr.split('/');
 	
 	var latArry = new Array(addr_size);
 	var lngArry = new Array(addr_size);
 	var baArry = new Array(addr_size);
 	var imgArry = new Array(addr_size);
 	var nameArry = new Array(addr_size);
 	var idxArry = new Array(addr_size);
 	var addrArry = new Array(addr_size);
 	
 	for(var i=0; i<addr_size; i++){
 	 latArry[i] = latSplit[i];
 	 lngArry[i] = lngSplit[i];
 	 baArry[i] = baSplit[i];
 	 if(baArry[i]==""){
 		 baArry[i] = '건물명 없음';
 	 }
 	 imgArry[i] = imgSplit[i];
 	 nameArry[i] = nameSplit[i];
 	 idxArry[i] = idxSplit[i];
 	 addrArry[i] = addrSplit[i];
 	}
 	/* alert(baArry); */
 	
 	$(function(){
		if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(function(pos) {
	
	//나의 경위, 위도		
	var mylat = pos.coords.latitude;
	var mylng = pos.coords.longitude;
	
 	var mapContainer = document.getElementById('mapView'),
 		mapOption = {
 			center: new daum.maps.LatLng(mylat, mylng), // 지도 중심 좌표
 			level : 9,
 			mapTypeId: daum.maps.MapTypeId.ROADMAP
 	};
    // 기본 지도 표시
    var map = new daum.maps.Map(mapContainer, mapOption);
    
    // 지도 콘트론 표시
    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
    var mapTypeControl = new daum.maps.MapTypeControl();
    map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
    
    var positions = new Array(addr_size);
    for(var i=0; i<addr_size; i++){
    	 positions[i] = 
    		 {    		 
    			 title: baArry[i],
    			 latlng : new daum.maps.LatLng(latArry[i], lngArry[i])
    		 };
    }
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
    
    
    
    /* var markers = new Array(positions.length);//마커들을 담을 배열 생성 */
    var imageSize = new daum.maps.Size(24, 35);// 마커 이미지의 이미지 크기 입니다
    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
    var markers = new Array(positions.length);
    for(var i = 0; i < positions.length; i++) {
    	 markers[i] = new daum.maps.Marker({
    	 map:map,
    	 titile: positions[i].title,
    	 position: positions[i].latlng,
    	 image: markerImage
    	 });
    	 
    	 var content = '<div class="overlay_info" id="map_display'+ i +'">';
    	 	content += '<div id="head"><div id="diva"> ';
    	    content += '    <a href="/TripINN/main.do" target="_blank"><strong>'+ nameArry[i] +'</strong></a>';
    	    content += '</div>';
    	    content += '    <div id="closebtn" onclick="closeOverlay('+i+')">X</div>';
    	    content += '</div>';
    	    
    	    content += '    <div class="desc">';
    	    content += '        <img src="/TripINN/images/house/'+ imgArry[i] +'" width="50px" height="50px">';
    	    content += '        <span class="address">주소:' + addrArry[i] +'</span>';
    	    content += '        <span class="address2">건물명:' + positions[i].title +'</span>';
    	    content += '    </div>';
    	    content += '</div>';
    	 
    	 var overlay = new daum.maps.CustomOverlay({
    		 content: content,
    		 position : positions[i].latlng,
    		 xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
    		 yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
    		 
    	 });
    	 daum.maps.event.addListener(markers[i], 'click', openOverlay(map, markers[i], overlay, i));
    	 
    }clusterer.addMarkers(markers);
    
    function openOverlay(map, marker, overlay, i) {
        return function() {
            overlay.setMap(map, marker);
            $("#map_display"+i).css("display","block");
        };
    }
    /* alert("map"); */
		});
			}else{
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
			}
		});
	

    
    function closeOverlay(i) {
    	$("#map_display"+i).css("display","none");
    }
</script>



</head>
<body>
<<<<<<< HEAD
<div id="map" class="houseMap" style="height: 630px;"></div>
=======
<div id="map" class="houseMap"></div>

>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN
</body>
</html>