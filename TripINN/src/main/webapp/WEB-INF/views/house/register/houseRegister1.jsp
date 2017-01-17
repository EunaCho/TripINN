<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<% String cp = request.getContextPath(); %>
<title>등록 첫 페이지</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterDetail.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="/TripINN/js/house/openHouseRegister.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<body>
<div style="clear:both"></div>
	<div class="hrContainer">
		<div class="hrHeader">
			<!-- member idx 값 받아오기. -->
				<div class="hrDiv">
					<div class="hrBar">
						<div class="hrBar_container">
							<progress class="progressBar" max="100" value="50" id="progressBar"></progress>
							
						</div>
					</div>
					<div class="hrLabelName">${MEMBER.MEMBER_NAME }님의<!--  <br />  &nbsp;-->&nbsp;&nbsp; 숙소 등록하기</div>
				</div>
		</div><div style="clear:both"></div>
		<div id="leftDiv">
		<ul>
		<div style="color:#fff;height:30px;"><h4>숙소 정보 입력</h4></div>
			<li onclick="fnMove('1')" id="title1">숙소 이름 & 소개</li>
			<li onclick="fnMove('2')" id="title2">숙소 주소</li>
			<li onclick="fnMove('3')" id="title3">숙소 유형</li>
			<li onclick="fnMove('4')" id="title4">숙박가능 인원</li>
			<li onclick="fnMove('5')" id="title5">이용료</li>
		
		</ul>
		</div>	
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
					<div class="hrLabel1">숙소 이름</div>
					<div class="hrData"><input type="text" name="HOUSE_NAME" class="hrText" onchange="titleNI();" id="HOUSE_NAME" /></div>
					
					<!-- house_info -->
					<div class="hrLabel1">숙소 소개</div>
					<div class="hrData"><textarea rows="20" cols="20" class="hrTextArea" name="HOUSE_INFO" onchange="titleNI();" id="HOUSE_INFO"></textarea></div>
					</div><!-- hr_left end -->
					
					<div class="hr_right">
					
					</div><!-- hr_right end -->
					</div><!-- brBorder -->
		
				</div>
			

				<div style="clear:both;"></div>
				<div style=" width:90%; margin:1%; color: #B9B9B9; border-bottom:1px solid;"></div>
					<!-- house_zipcode, addr1, addr2, add3 -->	
				<div class="hrDiv">
				<div class="hrBorder">
					<div class="hrAddrLeft">
					<div class="hrLabel1">숙소 주소</div>
					<div class="hrData">
					
					<!-- 수정 추가 작업 -->
						<div class="hrDiv2">
							<div class="hrDiv2_header">
							<span><label for="addr1" class="hrLabel2">우편번호</label>
							<input type="text" id="addr1" name="HOUSE_ZIPCODE" class="hrText hrText_Addr input-small postcodify_postcode5" onchange="titleNI();" >
							<input type="button" value="검색" class="hrAddrBtn" id="postcodify_search_button">
							<input type="button" value="지도 업데이트" class="hrAddrBtn mapUpdateBtn" onclick="mapView()"/></span>
							</div>
						</div>
						
						<div class="hrLabel2">
							<div class="hrLabel2_left">
							<label>도로명 주소</label>
							<label>상세주소</label>
							<label>참고항목</label>
							
							</div>
							<div class="hrLabel2_right" >
							<input type="text" id="addr2" class="hrText hrText_Addr2 input-large postcodify_address" name="HOUSE_ADDR1" onchange="titleNI();" >
							<input type="text" id="addr3" class="hrText hrText_Addr2 input-large postcodify_details" name="HOUSE_ADDR2" onchange="titleNI();" >
							<input type="text" id="addr4" class="hrText hrText_Addr2 input-large postcodify_extra_info" name="HOUSE_ADDR3" onchange="titleNI();" >
							</div>
					</div>
					</div>
					</div>
					<div class="hrAddrRight">
						<div id="mapView"></div>
					</div>
				</div>
			</div>
			
			<div style=" width:90%; margin:1%; color: #B9B9B9; border-bottom:1px solid;"></div>
			
				<div class="hrDiv">
					<div class="hrBorder">
					<!-- house_kind -->
					<div class="hr_left">
					<div class="hrLabel1">숙소 유형</div>
					<div class="hrData">
						<select class="hrSelect" name="HOUSE_KIND" id="HOUSE_KIND" onchange="titleNI();" >
							<option value="">선택</option>
							<option value="집 전체">집 전체</option>
							<option value="개인실">개인실</option>
							<option value="다인실">다인실</option>
						</select>
						<div style="display:none">
						<input type="text" id="htpersons">
						</div>
					</div>
				
					<!-- house_total_persons -->
					<div class="hrLabel1">숙박 가능 인원</div>
					<div class="hrData">
						<div class="hr-persons-div-text">
						<input type="number" class="hrText2" id="HOUSE_TOTAL_PERSONS" name="HOUSE_TOTAL_PERSONS" onchange="titleNI();" >
						<input type="button" class="optionBtn" onclick="personPBtn();" value="+">
						<input type="button" class="optionBtn" onclick="personMBtn();" value="-">
						</div>
					</div>
				</div><!-- left -->
				
				<div class="hr_right">
					<!-- hosue_price -->
					
					<div class="hrData">
						<label style="margin: 10px 0 10px;">숙소 가격</label>
						<div class="hrData">
							<input type="number" class="hrText2" name="HOUSE_PRICE" id="HOUSE_PRICE" onchange="titleNI();" >
							<input type="button" class="optionBtn" onclick="hpricePBtn();" value="+">
							<input type="button" class="optionBtn" onclick="hpriceMBtn();" value="-">
						</div>
						<label style="margin: 10px 0 10px;">인원당 가격</label>
						<div class="hrData">
							<input type="number" class="hrText2" name="HOUSE_PERSON_PRICE" id="HOUSE_PERSON_PRICE" onchange="titleNI();" >
							<input type="button" class="optionBtn" onclick="pricePBtn();" value="+">
							<input type="button" class="optionBtn" onclick="priceMBtn();" value="-">
						</div>
					</div>
				</div><!-- right end -->
				</div><!-- border end -->
				
				</div><!-- div end -->
				
			<div class="hrFooter">
			<div class="hr-footer-btn">
				<div class="hrBtn"><input type="submit" value="다음" class="hrBtn-default"></div>
				<div class="hrBtn"><input type="button" value="뒤로" class="hrBtn-default" onclick="history.back();"></div>
			</div>
			</div>
			
		</div>
		
		
		<div style="clear:both"></div>
	</form>
	</div>
</body>
<script type="text/javascript" src="/TripINN/js/house/mapView.js"></script>
</html>