<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>등록 두번 째 페이지</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterDetail.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/TripINN/js/house/openHouseRegister.js"></script>
<script>
var imgArray = new Array();
var imgNum = 2;
function createImg() {
	var chtml = "";
	
		var containHtml = "<div class='house_img_container' id='house_img_container"+imgNum+"'></div>";
		$("#house_img").append(containHtml);
	
	chtml += "<div style='clear: both;'></div>";
	chtml += "<div class='house_img_div'>";
	chtml += "<div class='house_img_left'>";
	chtml += "<label for='photo"+imgNum+"'>업로드</label>";
	chtml += "<input type='file' id='photo"+imgNum+"' accept='image/jpg, image/jpeg, image/png, image/gif' " +
			"onchange=getHousePhotoPrivew(this,$('#house_image_preview"+imgNum+"')) name='HOUSE_IMAGE"+ imgNum + "' >";
	chtml += "</div>";
	
	chtml += "<div class='house_img_right'>";
	chtml += "<div id='house_image_preview"+imgNum+"' class='house_img_class'></div>";
	chtml += "</div>";
	chtml += "</div>";
	
	$("#house_img_container"+ imgNum).append(chtml);
	imgArray.push("house_img_file"+imgNum);
	imgNum++;
//	alert("배열 길이"+imgArray.length+"배열"+imgArray);
	
	
}
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
							<progress class="progressBar" max="100" value="100"></progress>
						</div>
					</div>
					<div class="hrLabelName">${MEMBER.MEMBER_NAME }님의<!--  <br />  &nbsp;&nbsp;-->&nbsp; 숙소 등록하기</div>
				</div>
		</div>
		<div style="clear:both"></div>
		<div id="leftDiv2">
		<ul>
		<div style="color:#fff;height:30px;"><h4>숙소 정보 입력</h4></div>
			<li onclick="fnMove('6')" id="title1">숙소 이미지 등록</li>
			<li onclick="fnMove('7')" id="title2">적합한 게스트 유형</li>
			<li onclick="fnMove('8')" id="title3">체크인, 체크아웃</li>
			<li onclick="fnMove('9')" id="title4">요금 관련</li>
			<li onclick="fnMove('10')" id="title5">제공하는 공간</li>
		
		</ul>
		</div>
		<!-- *********data start********* -->
		<form name="registerFrm" method="post" action="houseRegisterInput.do" enctype="multipart/form-data" onsubmit="return check2();">
		
		<input type="hidden" value="${map.HOUSE_NAME }" name="HOUSE_NAME"/>
		<input type="hidden" value="${map.HOUSE_INFO }" name="HOUSE_INFO"/>
		<input type="hidden" value="${map.HOUSE_ZIPCODE }" name="HOUSE_ZIPCODE"/>
		<input type="hidden" value="${map.HOUSE_ADDR1 }" name="HOUSE_ADDR1"/>
		<input type="hidden" value="${map.HOUSE_ADDR2 }" name="HOUSE_ADDR2"/>
		<input type="hidden" value="${map.HOUSE_ADDR3 }" name="HOUSE_ADDR3"/>
		<input type="hidden" value="${map.HOUSE_KIND }" name="HOUSE_KIND"/>
		<input type="hidden" value="${map.HOUSE_TOTAL_PERSONS }" name="HOUSE_TOTAL_PERSONS"/>
		<input type="hidden" value="${map.HOUSE_PERSON_PRICE }" name="HOUSE_PERSON_PRICE"/>
		<input type="hidden" value="${map.HOUSE_PRICE }" name="HOUSE_PRICE"/>
		
		
		
		<div class="hrBody">
				<div class="hrDiv">
					<div class="hrLabel">2단계</div>
					<div class="hrLabelSub">*추가 정보 항목입니다</div>
				</div>
				
				<!-- house_image -->
					<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">숙소 이미지 등록</div>
					<div class="hrData">
						<div class="hrLabelSub">
						<label class="hrLabelImg">사용자에게 제공할 이미지를 등록해주세요</label> <br/>
						<input type="button" value="이미지 추가" onclick="javascript:createImg()" class="hrPersonsBtn" id="HOUSE_IMG" onclick="titleNI2"/>
						</div>
						
						<!-- 이미지 추가 -->
						<div id="house_img">
							<div class="house_img_container" id="house_img_container1">
								<div class="house_img_div">
									<div class="house_img_left" >
									
									<label for="photo1">업로드</label>
									<input type="file" id="photo1" accept="image/jpg, image/jpeg, image/png, image/gif"
									 onchange="getHousePhotoPrivew(this,$('#house_image_preview1'))" name="HOUSE_IMAGE1">
									 </div>
									 
									 <div class="house_img_right" >
									 	<div id="house_image_preview1"></div>
									 </div>
								</div>
							</div>
						</div>
					</div>
					</div>
					</div>
					<div style=" width:90%; margin:1%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				<!-- 적합한 게스트 유형 -->
				<!-- hi_guest -->
				<div>
				<div class="hrDiv3">
					<div class="hrBorder">
					<div class="hrLabel1">적합한 게스트 유형</div>
					<div class="hrData">
						<select class="hrSelect" name="HI_GUEST" id="HI_GUEST" onchange="titleNI2();">
							<option value="">선택</option>
							<option value="개인">개인</option>
							<option value="친구">친구</option>
							<option value="커플">커플</option>
							<option value="가족">가족</option>
						</select>
					</div>
					</div>
				</div>
				
				<!-- hi_checkin, hi_checkout -->
				<div class="hrDiv3">
					<div class="hrBorder">
					<div class="hrLabel1">체크인, 체크아웃</div>
					<div class="hrData"><input type="date" name="HI_CHECKIN" class="hrText2" id="HOUSE_CHECKIN"/></div>
					<div class="hrData"><input type="date" name="HI_CHECKOUT" class="hrText2" id="HOUSE_CHECKOUT"/></div>
					</div>
				</div>
				
				<!-- hi_room, hi_bad -->
				<div class="hrDiv3">
					<div class="hrBorder">
					<div class="hrLabel1">제공하는 방 개수</div>
					<div class="hrData">
						<input type="number" class="hrText2" style="width:165px;" name="HI_ROOM" id="HI_ROOM" readonly="readonly" placeholder="버튼을 이용하세요.">
						<input type="button" class="optionBtn" onclick="optionBtn(7);" value="+">
						<input type="button" class="optionBtn" onclick="optionBtn(8);" value="-">
					</div>
					
					<div class="hrLabel1">제공하는 침대 개수</div>
					<div class="hrData">
					<input type="number" class="hrText2" style="width:165px;" name="HI_BAD" id="HI_BAD" readonly="readonly" placeholder="버튼을 이용하세요.">
					<input type="button" class="optionBtn" onclick="optionBtn(9);" value="+">
					<input type="button" class="optionBtn" onclick="optionBtn(10);" value="-">
					</div>
					
					</div>
				</div>
				</div>
				<div style="clear:both"></div>
				
				<div style=" width:90%; margin:1%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				<!-- hi_deposit, hi_clean_price, hi_sale-->
				<div class="hrDiv">
					
				<div class="hrBorder">
				<!-- 요금관련 -->
				<div class="hrLabel1">요금관련</div>
				
					<div class="hrAddrLeft">
					
					<div class="hrDivPrice">
					<div class="hrLabel1">할인율</div>
					<div class="hrData">
						<input type="number" class="hrText2 hrText3" name="HI_SALE" id="HI_SALE" readonly="readonly" placeholder="버튼을 이용하세요.">
						<input type="button" class="optionBtn" onclick="optionBtn(1);" value="+">
						<input type="button" class="optionBtn" onclick="optionBtn(2);" value="-">
					</div>
					</div>
					
					<div class="hrDivPrice">
					<div class="hrLabel1">청소비</div>
					<div class="hrData">
						<input type="number" class="hrText2 hrText3" name="HI_CLEAN_PRICE" id="HI_CLEAN_PRICE" readonly="readonly" placeholder="버튼을 이용하세요.">
						<input type="button" class="optionBtn" onclick="optionBtn(3);" value="+">
						<input type="button" class="optionBtn" onclick="optionBtn(4);" value="-">
					</div>
					</div>
					
					<div class="hrDivPrice">
					<div class="hrLabel1">보증금</div>
					<div class="hrData">
						<input type="number" class="hrText2 hrText3" name="HI_DEPOSIT" id="HI_DEPOSIT" readonly="readonly" placeholder="버튼을 이용하세요.">
						<input type="button" class="optionBtn" onclick="optionBtn(5);" value="+">
						<input type="button" class="optionBtn" onclick="optionBtn(6);" value="-">
					</div>
					</div>
					
					</div>
				</div>
				</div>
				<div style="clear:both"></div>
				
				<div style=" width:90%; margin:1%; color: #B9B9B9; border-bottom:1px solid;"></div>
				
				
				<!-- 제공하는 이용공간 및 편의시설 -->
				<!-- hi_space, hi_cspace -->
				<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">제공하는 공간</div>
					
					<div class="hrDiv4">
					<div class="hrLabel1">편의 시설</div>
					<div class="hrData selectFont">
						<input type="checkbox" name="HI_SPACE" value="필수 품목" id="HI_SPACE" checked="checked">필수 품목 :&nbsp;
						<label style="color:rgba(52, 42, 42, 0.68); font-size:10px;">수건, 침대시트, 비누, 화장지</label><br/>
						<input type="checkbox" name="HI_SPACE" value="무선 인터넷">무선 인터넷<br/>
						<input type="checkbox" name="HI_SPACE" value="샴푸">샴푸<br/>
						<input type="checkbox" name="HI_SPACE" value="옷장/서랍장">옷장/서랍장<br/>
						<input type="checkbox" name="HI_SPACE" value="TV">TV<br/>
						<input type="checkbox" name="HI_SPACE" value="난방">난방<br/>
						<input type="checkbox" name="HI_SPACE" value="에어컨">에어컨<br/>
						<input type="checkbox" name="HI_SPACE" value="조식, 커피, 차">조식, 커피, 차<br/>
						<input type="checkbox" name="HI_SPACE" value="책상/작업공간">책상/작업공간<br/>
						<input type="checkbox" name="HI_SPACE" value="벽난로">벽난로<br/>
						<input type="checkbox" name="HI_SPACE" value="다리미">다리미<br/>
						<input type="checkbox" name="HI_SPACE" value="헤어 드라이기">헤어 드라이기<br/>
						<input type="checkbox" name="HI_SPACE" value="반려동물">집에서 키우는 반려동물<br/>
						<input type="checkbox" name="HI_SPACE" value="출입구 별도">출입구 별도<br/>
					</div>
					</div>
					<div class="hrDiv4">
					<div class="hrLabel1">안전 시설</div>
					<div class="hrData selectFont">
						<input type="checkbox" name="HI_SPACE" value="연기 감지기">연기 감지기<br/>
						<input type="checkbox" name="HI_SPACE" value="일산화탄소 감지기">일산화탄소 감지기<br/>
						<input type="checkbox" name="HI_SPACE" value="구급차">구급상자<br/>
						<input type="checkbox" name="HI_SPACE" value="안전 카드">안전 카드<br/>
						<input type="checkbox" name="HI_SPACE" value="소화기">소화기<br/>
						<input type="checkbox" name="HI_SPACE" value="침실에 잠금장치 있음">침실에 잠금창치 있음<br/>
					</div>
					</div>
					<div class="hrDiv4">
					<div class="hrLabel1">이용 공간</div>
					<div class="hrData selectFont">
						<input type="checkbox" name="HI_CSPACE" value="거실 단독 사용">거실 단독 사용<br/>
						<input type="checkbox" name="HI_CSPACE" value="부엌">부엌<br/>
						<input type="checkbox" name="HI_CSPACE" value="세탁기">빨래 - 세탁기<br/>
						<input type="checkbox" name="HI_CSPACE" value="건조기">빨래 - 건조기<br/>
						<input type="checkbox" name="HI_CSPACE" value="주차">주차<br/>
						<input type="checkbox" name="HI_CSPACE" value="엘리 베이터">엘리베이터<br/>
						<input type="checkbox" name="HI_CSPACE" value="수영장">수영장<br/>
						<input type="checkbox" name="HI_CSPACE" value="자쿠지 욕조">자쿠지 욕조<br/>
						<input type="checkbox" name="HI_CSPACE" value="헬스장">헬스장<br/>
					</div>
					</div>

					</div><!-- border end -->

						<div class="hrFooter">
							<div class="hr-footer-btn">
								<div class="hrBtn">
									<input type="submit" value="다음" class="hrBtn-default">
								</div>
								<div class="hrBtn">
									<input type="button" value="뒤로" class="hrBtn-default"
										onclick="history.back();">
								</div>
							</div>
						</div>
					
					
					</div><!-- hr_div end -->
				</div>
				<div style="clear:both"></div>
		
		
		<div style="clear:both"></div>
	</form>
	</div><!-- container end -->
	
</body>
</html>