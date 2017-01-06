<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services"></script>
<link rel="stylesheet" href="/TripINN/css/trip/slide.css" />
<script src="/TripINN/js/trip/jquery-1.11.3.min.js" type="text/javascript" data-library="jquery" data-version="1.11.3"></script>
<script src="/TripINN/js/trip/jssor.slider-22.0.15.mini.js" type="text/javascript" data-library="jssor.slider.mini" data-version="22.0.15"></script>
<script src="/TripINN/js/trip/main.js" type="text/javascript"></script>
<link rel="stylesheet" href="/TripINN/css/trip/trip.css" />
<script>
	function tripReserve() {
		var rform = document.rform;
		rform.action = "/TripINN/tripReserveForm.do";
		rform.submit();
	}
</script>
<form name="rform" method="post">
	<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX}"/>
</form>
<div id="wrap">
	<div id="left-wrap">
		<div id="left-info">
			<div class="trDiv">
				<div class="tdDiv-col" style="height:auto;">
					<p><b><font style="font-size:20px;">${trip.TRIP_NAME }</font> - ${trip.TRIP_AREA }</b></p> 
				</div>
				
			</div>
			<div class="trDiv">
				<div class="tdDiv-col">
				<p>
				<fmt:formatDate value="${trip.TRIP_FIRST_DATE }" pattern="yyyy-MM-dd HH:mm"/> - 
				<fmt:formatDate value="${trip.TRIP_LAST_DATE }" pattern="yyyy-MM-dd HH:mm"/> 
				 일정의 <font color="#1E6198">${trip.TRIP_TYPE }</font> 트립</p>
				
				<p style="width:350px;float:left;">호스트 : <font color="#1E6198">${trip.MEMBER_NAME }</font> 님
					<div style="width:150px;height:auto;float:right;margin-top:-30px;">
						<img src="/TripINN/images/공유.png" class="hostImg" />
					</div>
				</p>
				</div>
			</div>
			
			<div class="trDiv" style="background-color:#F9F9F9;margin:10px auto;">
				<div class="includ">
					<h3>포함사항</h3>
					<div class="txt">
		                <span style="BACKGROUND: #ffffff; FONT-SIZE: 9pt; mso-fareast-font-family: 굴림">
		                	<p class="cts">왕복교통비, 가이드, 차량보험, 도로비, 봉사료</p>
		                </span>
            		</div>
				</div>
				<div class="includ not">
					<h3>불포함사항</h3>
					<div class="txt">
		                <span style="BACKGROUND: #ffffff; FONT-SIZE: 9pt; mso-fareast-font-family: 굴림">
		                	<p class="cts">여행자보험, 기타개인비용</p>
		                </span>
            		</div>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>트립 소개</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_INTRO }</p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>진행 언어</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_LANGUAGE } </p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>예약 가능 인원</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_PERSONS } 명</p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>집합 장소</p></div>
				<div class="tdDiv-right">
					<p>
						[${trip.TRIP_ZIPCODE}] ${trip.TRIP_ADDR1 } ${trip.TRIP_ADDR2 } ${trip.TRIP_ADDR3 }
					</p>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>1인당 비용</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_PPRICE } </p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>호스트 연락처</p></div>
				<div class="tdDiv-right"><p>${trip.MEMBER_PHONE } // ${trip.MEMBER_EMAIL } </p></div>
			</div>
			<hr />
			<div class="trDiv" style="margin-top:20px;">
				<div class="tdDiv-col">
					<div style="width:20%;height:25px;background:#00A2E8;color:#fff;
					text-align:center;  border-radius: 15px; padding:6px;float:right; margin-right:50px;
					cursor:pointer" onclick="tripReserve();">
						<b>트립 신청</b>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="right-wrap">
		<div class="right-info">
			<div class="trDiv" style="margin:20px;">
				<div class="tdDiv-col">
	<!-- 슬라이드 시작 -->		
	<div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 700px; height: 456px; overflow: hidden; visibility: visible; background-color: #24262e;"
		  jssor-slider="true">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('/TripINN/images/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 700px; height: 356px; overflow: hidden;">

              <c:forEach items="${imgs}" var="img" varStatus="status">
           <div data-p="144.50" <c:if test="${status.index != 0 }">style="display:none;"</c:if>>
              	<img data-u="image" src="/TripINN/images/trip/${img}" />
              	<img data-u="thumb" src="/TripINN/images/trip/${img}" style="width:70px;height:70px;"/>
           </div>
        </c:forEach>
         <c:forEach items="${imgs}" var="img" varStatus="status">
           <div data-p="144.50" style="display:none;">
              	<img data-u="image" src="/TripINN/images/trip/${img}" />
              	<img data-u="thumb" src="/TripINN/images/trip/${img}" style="width:70px;height:70px;"/>
           </div>
        </c:forEach>
            <a data-u="any" href="http://www.jssor.com" style="display:none">Image Gallery</a>
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort01" style="position:absolute;left:0px;bottom:0px;width:700px;height:100px;" data-autocenter="1">
            <!-- Thumbnail Item Skin Begin -->
            <div data-u="slides" style="cursor: default;">
                <div data-u="prototype" class="p">
                    <div class="w">
                        <div data-u="thumbnailtemplate" class="t"></div>
                    </div>
                    <div class="c"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora05l" style="top:158px;left:8px;width:40px;height:40px;"></span>
        <span data-u="arrowright" class="jssora05r" style="top:158px;right:8px;width:40px;height:40px;"></span>
    </div>
</div>
				
<!-- 슬라이드 끝 -->		
				
				
			</div>
			<div class="trDiv" style="margin:20px;">
				<div class="tdDiv-col">
					<div id="map" style="width:500px;height:400px;"></div>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
				</div>
			</div>
		</div>
	</div>
</div>