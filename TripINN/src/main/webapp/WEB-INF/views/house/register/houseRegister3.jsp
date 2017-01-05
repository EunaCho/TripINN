<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>

<title>숙소 등록 완료 페이지</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterSuccess.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">
<script type="text/javascript" src="/TripINN/js/house/openHouseRegister.js"></script>
</head>
<body>
	<div style="clear: both"></div>
	<div class="container">
		<div class="header">
			<div class="bar_container">
					<progress class="progressBar" max="100" value="100"></progress>
			</div>
			<div class="label">
				님 안녕하세요! <br /> &nbsp;&nbsp;&nbsp; 숙소 등록을 성공적으로 마무리 했습니다.
			</div>
		</div><!-- header end -->

		<div class="body">
			<div class="btn_container">
				<input type="button" value="MAIN" class="btn btn-default bottom_btn" onclick="openMain()">
				<input type="button" value="HOUSE" class="btn btn-default bottom_btn" onclick="openHouseMain()">
				<input type="button" value="MYPAGE" class="btn btn-default bottom_btn" onclick="#">
			</div>
		</div>
		
		<div class="bottom">
			<div class="bottom_info">
				<div class="label_subject">
					등록한 숙소 정보
				</div>
				<div style="clear: both"></div>
				<div class="bottom_info_container">
					<div class="left">
						img
					</div>
					
					<div class="right">
						<div>
						<div class="label_right_1">기본 정보</div>
						
						<div class="right_sub1">
							<div class="label_right_2">설명</div>
							<div class="rigt_date"><input type="text" readonly="readonly"></div>
						</div>
						
						<div class="right_sub1">
							<div class="label_right_2">종류</div>
							<div class="rigt_date"><input type="text" readonly="readonly"></div>
						</div>
						
						<div>
						<div class="label_right_2">주소</div>
						<div class="rigt_date"><input type="text" readonly="readonly"></div>
						</div>
						
						<div class="label_right_2">
						수용인원
						</div>
						<div class="rigt_date"><input type="text" readonly="readonly"></div>
						
						<div>
						<div class="label_right_1">가격</div>
						
						<div class="label_right_2">인원당 가격</div>
						<div class="rigt_date"><input type="text" readonly="readonly"></div>
						<div class="label_right_2">숙소 가격</div>
						<div class="rigt_date"><input type="text" readonly="readonly"></div>
						</div>
						</div>
						
						<div>
							<div class="label_right_1">추가 정보</div>
							
							<div>
							<div class="label_right_2 label_guest">적합한 게스트</div>
							<div class="rigt_date"><input type="text" readonly="readonly"></div>
							<div></div>
							</div>
							<div>
								<div class="label_right_1">요금</div>
								<div>
								<div class="label_right_2">할인율</div>
								<div class="rigt_date"><input type="text" readonly="readonly"></div>
								<div class="label_right_2">청소비</div>
								<div class="rigt_date"><input type="text" readonly="readonly"></div>
								<div class="label_right_2">보증금</div>
								<div class="rigt_date"><input type="text" readonly="readonly"></div>
								</div>
							</div>
							
							<div>
								<div class="label_right_1">제공 공간</div>
								<div>
									<div class="label_right_2">이용공간</div>
									<div class="rigt_date"><input type="text" readonly="readonly"></div>
									<div class="label_right_2">편의시설</div>
									<div class="rigt_date"><input type="text" readonly="readonly"></div>
									<div class="label_right_2">침대개수</div>
									<div class="rigt_date"><input type="text" readonly="readonly"></div>
									<div class="label_right_2">방개수</div>
									<div class="rigt_date"><input type="text" readonly="readonly"></div>
								</div>
								<div>
								<div class="label_right_2 label_check">체크인 ~ 체크아웃</div>
								<div class="rigt_date"><input type="text" readonly="readonly"></div>
								</div>
							</div>
							
							<div>
								<div class="label_right_1">숙소 체크인 체크아웃</div>
								<div>
								<div class="label_right_2 label_check">체크인 ~ 체크아웃</div>
								<div class="rigt_date"><input type="text" readonly="readonly"></div>
								</div>
							</div>
							
						</div>
					</div><!-- rigth end -->
				</div><!-- bottom_info_container -->
			
				
			</div><!-- bottom_info end -->
		</div><!-- bottom end -->
	</div>
</body>
</html>