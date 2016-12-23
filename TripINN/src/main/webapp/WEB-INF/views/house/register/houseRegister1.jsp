<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

<title>등록 첫 페이지</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterDetail.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css?ver=1.0">
</head>
<body>
<div style="clear:both"></div>
	<div class="hrContainer">
		<div class="hrHeader">
			<!-- member idx 값 받아오기. -->
				<div class="hrDiv">
					<div class="hrLabelName">님 안녕하세요! <br /> &nbsp;&nbsp;&nbsp; 호스트가 될 준비를 시작해보세요.</div>
				</div>
		</div><div style="clear:both"></div>
		
		<!-- *********data start********* -->
		<form method="post" action="houseInsertRegister1.do" enctype="multipart/form-data" >	
		<div class="hrBody">
				<div class="hrDiv">
					<div class="hrLabel">1단계</div>
					<div class="hrLabelSub">*필수 항목입니다</div>
				</div>
				<!-- house_name -->
				<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">숙소 이름은 무엇인가요?</div>
					<div class="hrData"><input type="text" name="HOUSE_NAME" class="hrText"/></div>
					</div>
				</div>
				
				<!-- house_image -->
				<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">숙소 이미지를 등록해주세요.</div>
					<div class="hrData">
						<div class="hrLabelSub hrLabelImg">등록하기</div>
						
						<div class="hrDiv_file">
						<label for="hrLabel_file" class="hrLabel_file">이미지 등록하기</label>
						<input type="file" class="hrPersonsBtn" name="HOUSE_IMAGE" id="hrLabel_file">
						</div>
					</div>
					</div>
				</div>
				
				<div class="hrDiv">
					<!-- house_info -->
					<div class="hrBorder">
					<div class="hrLabel1">숙소를 소개해주세요.</div>
					<div class="hrData"><textarea rows="20" cols="20" class="hrText" name="HOUSE_INFO"></textarea></div>
					</div>
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
							<div class="hrDivSuv hrLabel2">우편번호</div>
							<div class="hrDivSuv"><input type="button" value="검색" class="hrAddrBtn"/></div>
							<div class="hrDivSuv"><input type="button" value="지도 업데이트" class="hrAddrBtn"/></div>
						</div>
						
						<div><input type="text" class="hrText"></div>
						<div class="hrLabel2">상세주소</div>
						<div><input type="text" class="hrText"></div>
						<div class="hrLabel2">참고항목</div>
						<div><input type="text" class="hrText"></div>
					</div>
					</div>
					<div class="hrAddrRight">
						<div>지도</div>
					</div>
					</div>
				</div>
				<div style="clear:both"></div>
			
				<div class="hrDiv">
					<div class="hrBorder">
					<!-- house_kind -->
					<div class="hrLabel1">회원님의 숙소 유형은 무엇인가요?</div>
					<div class="hrData">
						<select class="hrSelect">
							<option>집 전체</option>
							<option>개인실</option>
							<option>다인실</option>
						</select>
					</div>
					</div>
				</div>
				
					<!-- house_total_persons -->
				<div class="hrDiv">
					<div class="hrBorder">
					<div class="hrLabel1">숙박 가능한 인원은 몇명인가요?</div>
					<div class="hrData">
						<div class="hr-persons-div-text"><input type="number" class="hrText" name="HOUSE_TOTAL_PERSONS"></div>
						<div class="hrDivSub"><input type="button" value="+" class="hrPersonsBtn"></div>
						<div class="hrDivSub"><input type="button" value="-" class="hrPersonsBtn"></div>
					</div>
				</div>
				</div><div style="clear:both"></div>
				
					<!-- hosue_price -->
				<div class="hrDiv">
				<div class="hrBorder">
					<div class="hrLabel1">이용료는 얼마인가요?</div>
					<div class="hrData">
						<div>숙소 가격</div>
						<div>
							<input type="number" class="hrText" name="HOUSE_PRICE">
						</div>
						<div>인원당 가격</div>
						<div>
							<input type="number" class="hrText" name="HOUSE_PERSON_PRICE">
						</div>
					</div>
				</div>
				</div>
		</div>
		
		<div class="hrFooter">
			<div class="hr-footer-btn">
				<div class="hrBtn"><input type="submit" value="다음" class="hrBtn-default"></div>
				<div class="hrBtn"><input type="button" value="뒤로" class="hrBtn-default"></div>
			</div>
		</div>
		<div style="clear:both"></div>
	</form>
	</div>
	
</body>
</html>