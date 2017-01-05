<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<% String cp = request.getContextPath(); %>
<title>등록 첫 페이지</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterDetail.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=422f5e3f211b3528145a528229d0877d&libraries=services"></script>
<script type="text/javascript" src="/TripINN/js/house/openHouseRegister.js"></script>
<script>

</script>
</head>
<body>
<div style="clear:both"></div>
	<div class="hrContainer">
		<div class="hrHeader">
			<!-- member idx 값 받아오기. -->
				<div class="hrDiv">
					<div class="hrBar">
						<div class="hrBar_container">
							<progress class="progressBar" max="100" value="33"></progress>
						</div>
					</div>
					<div class="hrLabelName">님 안녕하세요! <br /> &nbsp;&nbsp;&nbsp; 호스트가 될 준비를 시작해보세요.</div>
				</div>
		</div><div style="clear:both"></div>
		
		<!-- *********data start********* -->
		<form method="post" action="houseRegister2.do" enctype="multipart/form-data" name="registerFrm" onsubmit="return check();">	
		
		
		<div class="hrBody">
				<div class="hrDiv">
					<div class="hrLabel">1단계</div>
					<div class="hrLabelSub">*필수 항목입니다</div>
				</div>
				
				<!-- house_name -->
				<div class="hrDiv">
					<div class="hrBorder">
					
					<div class="hr_left">
					<div class="hrLabel1">숙소 이름은 무엇인가요?</div>
					<div class="hrData"><input type="text" name="HOUSE_NAME" class="hrText"/></div>
					
					<!-- house_info -->
					<div class="hrLabel1">숙소를 소개해주세요.</div>
					<div class="hrData"><textarea rows="20" cols="20" class="hrTextArea" name="HOUSE_INFO"></textarea></div>
					</div><!-- hr_left end -->
					
					<div class="hr_right">
					
					</div><!-- hr_right end -->
					</div><!-- brBorder -->
				
				
					
					
				</div>
				
				
				
				<div style="clear:both"></div>
					<!-- house_zipcode, addr1, addr2, add3 -->	
				<div class="hrDiv">
				<div class="hrBorder">
					<div class="hrAddrLeft">
					<div class="hrLabel1">숙소 주소는 무엇인가요?</div>
					<div class="hrData">
					
					<!-- 수정 추가 작업 -->
						<div class="hrDiv2">
							<div class="hrDivSuv hrDivAddr">
							<span><label for="addr1" class="hrLabel2">우편번호</label>
							<input type="text" id="addr1" name="HOUSE_ZIPCODE" class="hrText hrText_Addr input-small postcodify_postcode5">
							<input type="button" value="검색" class="hrAddrBtn" id="postcodify_search_button">
							<input type="button" value="지도 업데이트" class="hrAddrBtn" onclick="mapView()"/></span>
							</div>
						</div>
						
						<div class="hrLabel2">
							<label>도로명 주소</label>
							<input type="text" id="addr2" class="hrText hrText_Addr2 input-large postcodify_address" name="HOUSE_ADDR1">
							
							<label>상세주소</label>
							<input type="text" id="addr3" class="hrText hrText_Addr2 input-large postcodify_details" name="HOUSE_ADDR2">
							
							<label>참고항목</label>
							<input type="text" id="addr4" class="hrText hrText_Addr2 input-large postcodify_extra_info" name="HOUSE_ADDR3">
					</div>
					</div>
					</div>
					<div class="hrAddrRight">
						<div id="mapView"></div>
					</div>
				</div>
			</div>
				<div class="hrDiv">
					<div class="hrBorder">
					<!-- house_kind -->
					<div class="hr_left">
					<div class="hrLabel1">회원님의 숙소 유형은 무엇인가요?</div>
					<div class="hrData">
						<select class="hrSelect" name="HOUSE_KIND">
							<option value="">선택</option>
							<option value="집 전체">집 전체</option>
							<option value="개인실">개인실</option>
							<option value="다인실">다인실</option>
						</select>
					</div>
				
					<!-- house_total_persons -->
					<div class="hrLabel1">숙박 가능한 인원은 몇명인가요?</div>
					<div class="hrData">
						<div class="hr-persons-div-text"><input type="number" class="hrText" name="HOUSE_TOTAL_PERSONS"></div>
					</div>
				</div><!-- left -->
				
				<div class="hr_right">
					<!-- hosue_price -->
					<div class="hrLabel1">이용료는 얼마인가요?</div>
					<div class="hrData">
						<label>숙소 가격</label>
						<div>
							<input type="number" class="hrText" name="HOUSE_PRICE">
						</div>
						<label>인원당 가격</label>
						<div>
							<input type="number" class="hrText" name="HOUSE_PERSON_PRICE">
						</div>
					</div>
				</div><!-- right end -->
				</div><!-- border end -->
				</div><!-- div end -->
		</div>
		
		<div class="hrFooter">
			<div class="hr-footer-btn">
				<div class="hrBtn"><input type="submit" value="다음" class="hrBtn-default"></div>
				<div class="hrBtn"><input type="button" value="뒤로" class="hrBtn-default" onclick="history.back();"></div>
			</div>
		</div>
		<div style="clear:both"></div>
	</form>
	</div>
	
</body>
<script type="text/javascript" src="/TripINN/js/house/mapView.js"></script>
</html>