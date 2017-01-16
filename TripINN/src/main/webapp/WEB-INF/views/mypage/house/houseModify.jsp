<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>

<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseRegisterDetail.css">

<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/TripINN/css/house/houseDetail.css">
<link href='/TripINN/css/trip/jquery.rating.css' type="text/css" rel="stylesheet"/>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="/TripINN/js/trip/jquery.MetaData.js" type="text/javascript" language="javascript"></script>
<script src="/TripINN/js/trip/jquery.rating.js" type="text/javascript" language="javascript"></script>

<script>
	var MEMBER_IDX = "${sessionScope.member_idx}";
/* 	$(function () {
	    $("#datepicker_in_reserveBar").datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate: new Date(),
	         altField: "#datepicker",
	         altFormat: "yy-mm-dd"
	  });
	});
	$(function () {
	    $("#datepicker_out_reserveBar").datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate: new Date(),
	         altField: "#datepicker2",
	         altFormat: "yy-mm-dd"
	  });
	}); */
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	   function fnMove(seq) {
	      var offset = $("#tripInfo" + seq).offset();
	      $("html, body").animate({scrollTop:offset.top}, 400);
	  	}
	   function getThumbnailPrivew(html, $target) {
	       if (html.files && html.files[0]) {
	           var reader = new FileReader();
	           reader.onload = function (e) {
	               $target.css('display', '');
	               $target.css('background-image', 'url(\"' + e.target.result + '\")');
	               $target.css('background-size', '100%');
	               $(".")
	               //$target.html('<img src="' + e.target.result + '" border="0" alt="" />');
	           }
	           reader.readAsDataURL(html.files[0]);
	       }
	   }
</script>
<style>
.left_div{
		border:1px solid black;
		margin-bottom:20px;
		margin-left:50px;
		width: 200px;
		height:450px;
		float:left;
	}
	.side_list{
		border:1px solid black;
		margin:20px;
    	width:150px;
    	height:27px;	
	} 
	
	.side-text{
		padding: 6px 0;
   	 	font-size: 16px;
    	color: #767676;
    	text-decoration:none
	}
		.right_div{
/* 		border:1px solid black; */
		margin-left:40px;
		width:900px;
		
		overflow:hidden;
		height:auto;
		float:left;
		top:114px;
		left:220px;
	}
</style>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="clear: both;"></div>

	<!-- 숙소 정보 블록 -->
<div style="width:1200px; height:100%; margin:0px auto;">
	
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/house.do" class="side-text">호스팅 숙소</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/houseReser.do" class="side-text">예약관리</a>
		</div>
	</div>
	
	<div class="right_div">
	<div class="houseInfo" style="margin-left:40px; border:1px solid black; float:left; width:65%;padding-left:10px;">
		<!-- 숙소 제목 -->
		<div class="house_subject">
			<input type="hidden" id="house_idx" value="${house.HOUSE_IDX}">
		
			<div style="width:400px; height:32px; border:1px solid black;" >
				<label for=house_name>숙소이름</label>
				<input type="text" name="HOUSE_NAME" value="${house.HOUSE_NAME}" maxlength="30" size="35" style="height:26px; margin-left:5px; border-radius:8px;">
				<!--  ${house.HOUSE_NAME}</label>-->
			</div>
			
			<div class="subject_middle" style="border:1px solid black;" >
				<div class="subject_name">
					<label>호스트 : ${house.MEMBER_NAME} 님</label><br>
				
					<fmt:formatNumber var="sum" value="${house.STAR_SUM}" pattern="#.##"/>
					<fmt:formatNumber var="cnt" value="${house.STAR_COUNT}" pattern="#.##"/>
				
					<div style="background: url(/TripINN/images/trip/icon_star2.gif) 0px 0px; width: 87px; margin-top: 10px;">
						<p style="WIDTH: ${sum * 20 / cnt}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;"></p>
					</div>
				</div>
				
				<div class="subject_img">
					<img src="/TripINN/images/공유.png"/>
				</div>
			</div>
	
			
			<div style="border:1px solid black; width:410px; height:240px;">
			<div style="width:400px;">
			<label for="addr1" class="lab">우편번호</label>
					<input type="text" id="addr1" name="trip_zipcode" class="input-small postcodify_postcode5" value="" style="height:30px; margin-left:5px; border-radius:8px;"/>
					<input type="button"  class="hrAddrBtn" id="postcodify_search_button" value="검색" />&nbsp;
					<input type="button"  class="hrAddrBtn" value="지도 업데이트" onclick="mapView();"/>
					<br />
					
					<label for="addr2" class="lab">도로명주소</label><br/>
					<input type="text" id="addr2" name="trip_addr1" class="input-large postcodify_address" value="" style="height:30px; margin-left:5px; border-radius:8px; width:350px;"  readonly/><br />
					
					<label for="addr3" class="lab">상세주소</label><br/>
					<input type="text" id="addr3" name="trip_addr2" class="input-large postcodify_details" value="" style="height:30px; margin-left:5px; border-radius:8px; width:350px;""/><br />
					
					<label for="addr4" class="lab">참고항목</label><br/>
					<input type="text" id="addr4" name="trip_addr3" class="input-large postcodify_extra_info" value=""style="height:30px; margin-left:5px; border-radius:8px; width:350px;""  readonly/><br />
			</div>
				<!-- <div class="hrDiv2" style="width:400px;">
					<div class="hrDivSuv hrDivAddr" style="border:1px solid black;">
						<span>
						<label for="addr1" class="lab">우편번호</label>
						<input type="text" id="addr1" name="HOUSE_ZIPCODE" size="17" style="height:30px; margin-left:5px; border-radius:8px;">
						<input type="button" value="검색" class="hrAddrBtn" id="postcodify_search_button">
						<input type="button" value="지도 업데이트" class="hrAddrBtn" onclick="mapView()"/></span>
					</div>
				</div>
						
				<div class="hrDiv2" style="width:400px;">
					<label>도로명 주소</label>
					<input type="text" id="addr2" class="hrText hrText_Addr2 input-large postcodify_address" name="HOUSE_ADDR1" style="height:30px; margin-left:5px; border-radius:8px;">
							
					<label>상세주소</label>
					<input type="text" id="addr3" class="hrText hrText_Addr2 input-large postcodify_details" name="HOUSE_ADDR2" style="height:30px; margin-left:5px; border-radius:8px;">
								
					<label>참고항목</label>
					<input type="text" id="addr4" class="hrText hrText_Addr2 input-large postcodify_extra_info" name="HOUSE_ADDR3" style="height:30px; margin-left:5px; border-radius:8px;">
				</div> -->
			</div>
			
		</div>
		<hr style="width: 98%">
		
		<div class="house_info_space">
		<div style="width:43%; float:left; margin-bottom:2%; margin-right:2%; margin-left:6%;">
			숙소유형(집전체/개인실/다인실)<br>
			<input type="text" name="HI_SPACE" value="${house.HI_SPACE}" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;">
			
		</div>
		
		<div style="width:43%; float:left; margin-bottom:2%;">
			편의시설<br>
			<input type="text" name="HI_CSPACE" value="${house.HI_CSPACE}" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;">
			
		</div>
		</div>
		<hr style="width: 98%; margin-bottom: 2%">
		
		
		<div style="clear: both;"></div>
		<!-- 숙소상세정보 -->
		<div class="house_info_block">
			<div class="block_left" style="width:50px;">
				<label>소개</label>
			</div>
			
			<div class="block_right">
				<textarea name="HOUSE_INFO" row="5" cols="50" style="height:100px; width:400px; border-radius:8px;">${house.HOUSE_INFO}</textarea>
			</div>
		</div>
		<hr class="block_hr">
		
		<div class="house_info_block">
			<div class="block_left" style="width:50px;">
				<label>숙소</label>
			</div>
			
			<div class="block_right">
				<div class="house_right_info">
					수용 인원 :<br/><input type="text" name="HI_DEPOSIT" value="${house.HI_DEPOSIT}" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
					침실 :<br/><input type="text" name="HI_DEPOSIT" value="${house.HI_DEPOSIT}" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
					방 :<br/><input type="text" name="HI_ROOM" value="${house.HI_ROOM} " maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;">
				</div>
				
				<div class="house_left_info">
					체크인 :<br/><input type="text" name="HI_DEPOSIT " value=" ${house.HI_DEPOSIT }" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
					체크아웃 :<br/><input type="text" name="HI_CLEAN_PRICE " value="${house.HI_CLEAN_PRICE }" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
				</div>
			</div>
		</div>
		<hr class="block_hr">
		
		<div class="house_info_block">
			<div class="block_left" style="width:50px;">
				<label>가격</label>
			</div>
			<input type="hidden" name="HOUSE_MEMBER_IDX" id="HOUSE_MEMBER_IDX" value="${house.MEMBER_IDX }">
			<div class="block_right">
				<div style="float:left; margin-right:50px;">
				일박 비용 :<br/><input type="text" name="house.HOUSE_PRICE" value=" ${house.HOUSE_PRICE} " maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
				인원 비용 :<br/><input type="text" name="HOUSE_PERSON_PRICE" value=" ${house.HOUSE_PERSON_PRICE }" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
				보증 비용:<br/><input type="text" name="HI_DEPOSIT " value="${house.HI_DEPOSIT }" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
				</div>
				
				<div style="float:left;">
				청소 비용 :<br/><input type="text" name="HI_CLEAN_PRICE " value=" ${house.HI_CLEAN_PRICE } " maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
				할인율 :<br/><input type="text" name="HOUSE_PRICE " value=" ${house.HOUSE_PRICE}" maxlength="30" size="20" style="height:30px; margin-left:5px; border-radius:8px;"><br/>
			
				</div>
			</div>
		</div>
	
		<hr class="block_hr">	
		
		<div class="house_info_block" style="text-align:right; ">
			<input type="button" value="숙소 수정하기" onclick="modifyButton();" style="border:2px solid blue;  background-color:#fff; border-radius:8px; margin-right:15px; height:40px;"/>
		</div>	
	</div> <!-- info end -->
	
	<div style="border:1px solid red; width:100px; height:100px; float:left;">
		<input type="button" value="숙소 삭제하기" onclick="houseDelete();" style="border:2px solid red; background-color:#fff; border-radius:8px;"/>
	</div>
	
	</div><!-- right_div -->
</div><!-- houseHead -->
	

	
<div style="clear: both;"></div>

</body>
<script type="text/javascript">

</script>
