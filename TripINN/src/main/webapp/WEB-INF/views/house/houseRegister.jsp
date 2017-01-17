<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>

<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegister.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">
<script type="text/javascript" src="/TripINN/js/house/openHouseRegister.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ include file = "/WEB-INF/common/login.jsp" %>

<title>숙소 등록 페이지</title>
</head>
<body>
<hr style="margin:0px;padding:0px;"/>

<div class="houseRegister" style="margin:0px;padding:0px;" >
	
	<div class="hostInfo" style="margin:0px;padding:0px;">
		<div class="hostInfo_header" style="background-color:#AAB9FF;">
		<div class="header_font1">Trip INN</div>
		<div class="header_img"><img src="/TripINN/images/house/logo.png" width="350px"></div>
		<div class="header_font2" style="margin-top:-20px;">호스팅의 장점</div>
		</div>
		
		<div class="hostInfo_body">
			<div class="info">
				<div class="info_div1">부가수입</div>
				<div class="info_img"><img src="/TripINN/images/house/money.png"></div>
				<div class="info_div2">집 수리에서 꿈꿔온 여행까지, 호스팅 수입으로 진짜 하고 싶은 일을 하세요.</div>
			</div>
			
			<div class="info">
				<div class="info_div1">호스트 지원</div>
				<div class="info_img"><img src="/TripINN/images/house/persons.png"></div>
				<div class="info_div2">유용한 팁과 필요한 도구를 지원받고 전세계 다른 호스트와 교류하세요.</div>
			</div>
			
			<div class="info" style="vertical-align: top;">
				<div class="info_div1">유연성</div>
				<div class="info_img"><img src="/TripINN/images/house/pen.png"></div>
				<div class="info_div2">요금, 호스팅 시기 및 빈도 모두 호스트가 전적으로 결정합니다.</div>
			</div>
		</div>
		
		<div class="hostInfo_bottom">
			<button type="button" class="btn btn-default houseStartBtn" onclick="location.href='/TripINN/house/houseRegister1.do'">숙소 호스팅</button>
			<button type="button" class="btn btn-default houseStartBtn" onclick="location.href='/TripINN/trip.do'">트립 호스팅</button>
		</div>	
	</div>
</div>
<div style="clear: both;"></div>

</body>
</html>