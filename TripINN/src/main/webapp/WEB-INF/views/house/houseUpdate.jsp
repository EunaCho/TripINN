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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services"></script>
<script type="text/javascript" src="/TripINN/js/house/openHouseRegister.js"></script>

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
					<div class="hrLabelName">님의<!--  <br />  &nbsp;&nbsp;&nbsp;--> 숙소 수정하기</div>
				</div>
		</div><div style="clear:both"></div>
		<div id="leftDiv">
		<ul>
		<div style="color:#fff;height:30px;"><h4>숙소 정보 입력</h4></div>
			<li onclick="fnMove('1')">숙소 이름 & 소개</li>
			<li onclick="fnMove('2')">숙소 주소</li>
			<li onclick="fnMove('3')">숙소 유형</li>
			<li onclick="fnMove('4')">숙박가능 인원</li>
			<li onclick="fnMove('5')">이용료</li>
			<li onclick="fnMove('6')">숙소 이미지 등록</li>
			<li onclick="fnMove('7')">적합한 게스트 유형</li>
			<li onclick="fnMove('8')">체크인, 체크아웃</li>
			<li onclick="fnMove('9')">요금 관련</li>
			<li onclick="fnMove('10')">제공하는 공간</li>
		
		</ul>
		</div>	
		<!-- *********data start********* -->
		<form method="post" action="<%=cp %>/house/houseUpdate.do" enctype="multipart/form-data" name="updateForm" onsubmit="return check();">	
		
		<input type="hidden" name="HOUSE_IDX" value="${house.HOUSE_IDX }">
		
		<div class="hrBody">
				
				<!-- house_name -->
				<div class="hrDiv">
					<div class="hrBorder">
					
					<div class="hr_left">
					<div class="hrLabel1">숙소 이름</div>
					<div class="hrData"><input type="text" name="HOUSE_NAME" value="${house.HOUSE_NAME }" class="hrText"/></div>
					
					<!-- house_info -->
					<div class="hrLabel1">숙소 소개</div>
					<div class="hrData"><textarea rows="20" cols="20" class="hrTextArea" name="HOUSE_INFO">${house.HOUSE_INFO }</textarea></div>
					</div><!-- hr_left end -->
					
					<div class="hr_right">
					
					</div><!-- hr_right end -->
					</div><!-- brBorder -->
		
				</div>
			

				<div style="clear:both;"></div>
				<div style=" width:90%; margin:5%; color: #B9B9B9; border-bottom:1px solid;"></div>
					<!-- house_zipcode, addr1, addr2, add3 -->	
				<div class="hrDiv">
				<div class="hrBorder">
					<div class="hrAddrLeft">
					<div class="hrLabel1">숙소 주소</div>
					<div class="hrData">
					
					<!-- 수정 추가 작업 -->
						<div class="hrDiv2">
							<div class="hrDivSuv hrDivAddr">
							<span><label for="addr1" class="hrLabel2">우편번호</label>
							<input type="text" id="addr1" name="HOUSE_ZIPCODE" value="${house.HOUSE_ZIPCODE }" class="hrText hrText_Addr input-small postcodify_postcode5">
							<input type="button" value="검색" class="hrAddrBtn" id="postcodify_search_button">
							<input type="button" value="지도 업데이트" class="hrAddrBtn" onclick="mapView()"/></span>
							</div>
						</div>
						
						<div class="hrLabel2">
							<label>도로명 주소</label>
							<input type="text" id="addr2" class="hrText hrText_Addr2 input-large postcodify_address" value="${house.HOUSE_ADDR1 }" name="HOUSE_ADDR1">
							
							<label>상세주소</label>
							<input type="text" id="addr3" class="hrText hrText_Addr2 input-large postcodify_details" value="${house.HOUSE_ADDR2 }" name="HOUSE_ADDR2">
							
							<label>참고항목</label>
							<input type="text" id="addr4" class="hrText hrText_Addr2 input-large postcodify_extra_info" value="${house.HOUSE_ADDR3 }" name="HOUSE_ADDR3">
					</div>
					</div>
					</div>
					<div class="hrAddrRight">
						<div id="mapView"></div>
					</div>
				</div>
			</div>
			
			<div style=" width:90%; margin:5%; color: #B9B9B9; border-bottom:1px solid;"></div>
			
				<div class="hrDiv">
					<div class="hrBorder">
					<!-- house_kind -->
					<div class="hr_left">
						<div class="hrLabel1">숙소 유형</div>
						<div class="hrData">
							<select class="hrSelect" name="HOUSE_KIND">
								<option value="">선택</option>
								<option value="집 전체">집 전체</option>
								<option value="개인실">개인실</option>
								<option value="다인실">다인실</option>
							</select>
						</div>
				
					<!-- house_total_persons -->
						<div class="hrLabel1">숙박 가능 인원</div>
						<div class="hrData">
							<div class="hr-persons-div-text"><input type="number" value="${house.HOUSE_TOTAL_PERSONS }" class="hrText2" name="HOUSE_TOTAL_PERSONS"></div>
						</div>
					</div><!-- left -->
				
					<div class="hr_right">
					<!-- hi_guest -->
						<div class="hrLabel1">적합한 게스트 유형</div>
						<div class="hrData">
							<select class="hrSelect" name="HI_GUEST">
								<option value="">선택</option>
								<option value="개인">개인</option>
								<option value="친구">친구</option>
								<option value="커플">커플</option>
								<option value="가족">가족</option>
							</select>
						</div>

				
					
				</div><!-- right end -->
				</div><!-- border end -->
				</div><!-- div end -->
				
				<!-- house_image -->
					<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">숙소 이미지 등록</div>
					<div class="hrData">
						<div class="hrLabelSub">
						<label class="hrLabelImg">사용자에게 제공할 이미지를 등록해주세요</label> <br>
						<input type="button" value="이미지 추가" onclick="javascript:createImg()" class="hrPersonsBtn">
						</div>
						
						<!-- 이미지 추가 -->
						<div id="house_img">
							<div class="house_img_container" id="house_img_container1">
								<div class="house_img_div">
									<div class="house_img_left">
									
									<label for="photo1">업로드</label>
									<input type="file" id="photo1" accept="image/jpg, image/jpeg, image/png, image/gif" onchange="getHousePhotoPrivew(this,$('#house_image_preview1'))" name="HOUSE_IMAGE" value="${house.HOUSE_IMAGE }">
									 </div>
									 
									 <div class="house_img_right">
									 	<div id="house_image_preview1"></div>
									 </div>
								</div>
							</div>
						</div>
					</div>
					</div>
					</div>
					<div style=" width:90%; margin:5%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				<!-- 적합한 게스트 유형 -->
				
				
				<!-- hi_checkin, hi_checkout -->
				<div class="hrDiv">
					<div class="hrBorder">
						<div class="hr_left">
							<div class="hrLabel1">체크인, 체크아웃</div>
							<div class="hrData"><input type="date" name="HI_CHECKIN" value="${house.HI_CHECKIN }" class="hrText2"></div>
							<div class="hrData"><input type="date" name="HI_CHECKOUT" value="${house.HI_CHECKOUT }" class="hrText2"></div>
						</div>
						<!-- hi_room, hi_bad -->
						<div class="hr_right">
							<div class="hrLabel1">제공하는 방 개수</div>
							<div class="hrData">
								<input type="number" class="hrText2"  value="${house.HI_ROOM }" name="HI_ROOM">
							</div>
							<div class="hrLabel1">제공하는 침대 개수</div>
							<div class="hrData">
								<input type="number" class="hrText2" value="${house.HI_BAD }" name="HI_BAD">
							</div>

						</div>
					</div>
				</div>

				
				<div style="clear:both"></div>
				
				<div style=" width:90%; margin:5%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				<!-- hi_deposit, hi_clean_price, hi_sale-->
				<div class="hrDiv">
					
					<div class="hrBorder">
					<!-- 요금관련 -->
						<div class="hr_left">
							<div class="hrLabel1">요금관련</div>
				
							<div class="hrAddrLeft">
								<div class="hrLabel1">할인율</div>
								<div class="hrData">
									<input type="number" class="hrText2" name="HI_SALE" value="${house.HI_SALE }">
								</div>
				
								<div class="hrLabel1">청소비</div>
								<div class="hrData">
									<input type="number" class="hrText2" name="HI_CLEAN_PRICE" value="${house.HI_CLEAN_PRICE }">
								</div>
					
								<div class="hrLabel1">보증금</div>
								<div class="hrData">
									<input type="number" class="hrText2" name="HI_DEPOSIT" value="${house.HI_DEPOSIT }"> 
								</div>
					
							</div>
						</div>
						<div class="hr_right">
							<div class="hrLabel1"> &nbsp;</div>
						<div class="hrAddrLeft">
							<div class="hrLabel1">숙소 가격</div>
							<div class="hrData">
								<input type="number" class="hrText2" value="${house.HOUSE_PRICE }" name="HOUSE_PRICE">
							</div>
							
							<div class="hrLabel1">인원당 가격</div>
							<div class="hrData">
								<input type="number" class="hrText2" value="${house.HOUSE_PERSON_PRICE }" name="HOUSE_PERSON_PRICE">
							</div>
						</div>
					</div>
				

				</div>
				<div style="clear:both"></div>
				
				<div style=" width:90%; margin:5%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				
				<!-- 제공하는 이용공간 및 편의시설 -->
				<!-- hi_space, hi_cspace -->
				<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">제공하는 공간</div>
					
					<div class="hrLabel1">편의 시설</div>
					<div class="hrData selectFont"> 
					
						<input type="hidden" name="HI_SPACE" value="${house.HI_SPACE }"><font color="red"> 현재 선택된 편의 시설 : ${house.HI_SPACE }</font>
						<br>
						<input type="checkbox" name="HI_SPACE" value="필수 품목">필수 품목 :&nbsp;
						<label>수건, 침대시트, 비누, 화장지</label><br>
						<input type="checkbox" name="HI_SPACE" value="무선 인터넷">무선 인터넷<br>
						<input type="checkbox" name="HI_SPACE" value="샴푸">샴푸<br>
						<input type="checkbox" name="HI_SPACE" value="옷장/서랍장">옷장/서랍장<br>
						<input type="checkbox" name="HI_SPACE" value="TV">TV<br>
						<input type="checkbox" name="HI_SPACE" value="난방">난방<br>
						<input type="checkbox" name="HI_SPACE" value="에어컨">에어컨<br>
						<input type="checkbox" name="HI_SPACE" value="조식, 커피, 차">조식, 커피, 차<br>
						<input type="checkbox" name="HI_SPACE" value="책상/작업공간">책상/작업공간<br>
						<input type="checkbox" name="HI_SPACE" value="벽난로">벽난로<br>
						<input type="checkbox" name="HI_SPACE" value="다리미">다리미<br>
						<input type="checkbox" name="HI_SPACE" value="헤어 드라이기">헤어 드라이기<br>
						<input type="checkbox" name="HI_SPACE" value="반려동물">집에서 키우는 반려동물<br>
						<input type="checkbox" name="HI_SPACE" value="출입구 별도">출입구 별도<br>
					</div>
					
					<div class="hrLabel1">안전 시설</div>
					<div class="hrData selectFont">
						<input type="checkbox" name="HI_SPACE" value="연기 감지기">연기 감지기<br>
						<input type="checkbox" name="HI_SPACE" value="일산화탄소 감지기">일산화탄소 감지기<br>
						<input type="checkbox" name="HI_SPACE" value="구급차">구급상자<br>
						<input type="checkbox" name="HI_SPACE" value="안전 카드">안전 카드<br>
						<input type="checkbox" name="HI_SPACE" value="소화기">소화기<br>
						<input type="checkbox" name="HI_SPACE" value="침실에 잠금장치 있음">침실에 잠금창치 있음<br>
					</div>
					
					<div class="hrLabel1">이용 공간</div>
					<div class="hrData selectFont">
					
					<input type="hidden" name="HI_CSPACE" value="${house.HI_CSPACE }"><font color="red"> 현재 선택된 이용 공간 : ${house.HI_CSPACE }</font>
						<br>
						<input type="checkbox" name="HI_CSPACE" value="거실 단독 사용">거실 단독 사용<br>
						<input type="checkbox" name="HI_CSPACE" value="부엌">부엌<br>
						<input type="checkbox" name="HI_CSPACE" value="세탁기">빨래 - 세탁기<br>
						<input type="checkbox" name="HI_CSPACE" value="건조기">빨래 - 건조기<br>
						<input type="checkbox" name="HI_CSPACE" value="주차">주차<br>
						<input type="checkbox" name="HI_CSPACE" value="엘리 베이터">엘리베이터<br>
						<input type="checkbox" name="HI_CSPACE" value="수영장">수영장<br>
						<input type="checkbox" name="HI_CSPACE" value="자쿠지 욕조">자쿠지 욕조<br>
						<input type="checkbox" name="HI_CSPACE" value="헬스장">헬스장<br>
					</div>
					</div><!-- border end -->
					</div><!-- hr_div end -->

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

