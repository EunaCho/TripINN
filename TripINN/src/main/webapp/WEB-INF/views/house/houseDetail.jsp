<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>


<html>
<head>

<title>HOUSE DETAIL</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/TripINN/js/house/houseDetail.js"></script>
<link rel="stylesheet" href="/TripINN/css/house/houseDetail.css">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services,clusterer"></script>
	<script>
	
	$(function () {
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
	});
	</script>

</head>
<body>

<div style="clear: both;"></div>
<!-- 왼쪽: 숙소상세 -->
<div id="houseDetail">
	<!-- 숙소 정보 블록 -->
	<div class="houseHead">
	<div class="houseInfo">
		<!-- 숙소 제목 -->
		<div class="house_subject">
		<input type="hidden" name="FVR_IDX" value="${house_idx }">
		<input type="hidden" name="FVR_IDX" value="${FVR_IDX }">
		<input type="hidden" id="house_idx" value="${house.HOUSE_IDX}">
		 ${house.HI_TOTAL_STAR}
			<div class="house_name">
				<label>${house.HOUSE_NAME}</label>
			</div>
			<div>
				<label>${house.HOUSE_ADDR2}+${house.HOUSE_ADDR1}</label>
			</div>
			<input type="hidden" value="${house.MEMBER_IDX }" id="member_idx" name="MEMBER_IDX">
			<div class="subject_middle">
				<label>호스트 : ${house.MEMBER_IDX } 님</label>
				<img src="/TripINN/images/공유.png"/>
			</div>
			
		</div>
		<hr style="width: 98%">
		
		<!-- 숙소상세정보 -->
		<div class="house_info_block">
			<div class="block_left">
				<label>소개</label>
			</div>
			
			<div class="block_right">
				<label>${house.HOUSE_INFO }</label>
			</div>
		</div>
		<hr class="block_hr">
		
		
		<div class="house_info_block">
			<div class="block_left">
				<label>추가 정보</label>
			</div>
			
			<div class="block_right">
				<label>${house.HOUSE_INFO }</label>
			</div>
		</div>
		<hr class="block_hr">
		
		
		
		
		
		
		
		
		
		
		
	</div> <!-- info end -->
	
	<div class="map">
		<input type="hidden" value="${house.HOUSE_ADDR1}" id="addr2">
		<div id="mapView"></div>
	</div>
	</div>
	
	<div style="clear: both;"></div>
	<!-- 후기 블록 -->
	<div class="review">
	
	<!-- 후기 입력하기 -->
		<div id="review_div">
		<label id="review_size_label">후기 ${review_size } 개</label>
		<hr style="margin-top: 20px;">
		</div>
		
		<form name="reviewForm" id="reviewForm" action="<%=cp %>/house/houseReviewWrite.do" method="post">
			<input type="hidden" name="HOUSE_IDX" id="HOUSE_IDX" value="${house_idx }" class="review_text">
			<input type="text" name="HRB_TITLE" id="HRB_TITLE" value="" placeholder="제목을 입력하세요." class="review_text"> 
			<textarea id="HRB_CONTENT" name="HRB_CONTENT" cols="60" rows="8" class="review_textArea" placeholder="내용을 입력하세요."></textarea>
			<input type="password" name="HRB_PWD" id="HRB_PWD" value="" placeholder="비밀번호를 입력하세요." class="review_text">
			<br>
			<!-- <div class="reviewBtn" id="reviewBtn">리뷰작성</div> -->
			
			<button type="submit" id="reviewBtn">리뷰작성</button>
			
		</form>
		<!-- 후기 리스트 출력 -->
		<c:forEach items="${review}" var="review" varStatus="stat">
			<!-- 리뷰블록 -->
			<div class="reviewBlock">
				<!-- 작성자정보 -->
				<div id="review_left">
				<div class="writer">
					<img src="/TripINN/images/공유.png"/><br/>
					<label>작성자: ${review.MEMBER_IDX} 님</label>
					<div class="reviewDate">
				 <fmt:formatDate value="${review.HRB_REGDATE }" pattern="yy-MM-dd"/>
				</div>
					
				</div>
				</div>
				
				<div id="review_right">
				<!-- 리뷰내용 -->
				<div class="reviewContent">
				<p> ${review.HRB_CONTENT}</p>
				</div>
				
				<!-- 추천하기 버튼 -->
				<div class="like">추천</div>
				</div>
			</div>
		</c:forEach>
	</div>


</div>


<!-- houseDetail end -->
<%-- 
<!-- 오른쪽 :예약바-->
<div id="reserveBar">
	<form id="reservation" action="" method="post">
	<div class="price">
	가격 : ${house.HOUSE_PRICE}원  / 박
	</div>
	<div class="checkinout">
		<label>체크인</label>
		<input type="text" name="hr_first_date" id="datepicker_in_reserveBar" value="${search.hr_first_date}" placeholder="체크인" >
	</div>
	<div class="checkinout">
		<label>체크아웃</label>
		<input type="text" name="hr_last_date" id="datepicker_out_reserveBar" value="${search.hr_last_date}" placeholder="체크아웃">
	</div>
	<div class="checkinout">
		<label>인원</label>
		<select name="person">	
			<option value="인원 1명">인원 1명</option>
			<option value="1" <c:if test="${person eq 1}">selected="selected"</c:if> >인원 1명</option>
			<option value="2" <c:if test="${person eq 2}">selected="selected"</c:if> >인원 2명</option>
			<option value="3" <c:if test="${person eq 3}">selected="selected"</c:if> >인원 3명</option>
			<option value="4" <c:if test="${person eq 4}">selected="selected"</c:if> >인원 4명</option>
			<option value="5" <c:if test="${person eq 5}">selected="selected"</c:if> >인원 5명</option>
		</select>	
	</div>
	
	<button class="button" type="submit">예약하기</button>
	</form>
	<div class="state">
		<p> 결제액이 청구되지 않습니다.</p>
		<p> 이 숙소는 지난주에 총 ??번 조회되었습니다.</p>
	</div>
	
	<div class="wishList" >
		<div id="wishIcon"> </div>
		<!-- <img src="/TripINN/images/house/icon_heart_white.png"> -->
		<div>위시리스트 담기</div>
	</div>
	<div class="toHost">
		호스트에게<br>
		<span>메일보내기</span>
		<span>쪽지보내기</span>
	</div>
	<div class="report">
		<span><img src="/TripINN/images/house/report.png"></span>
		<span>이 숙소 신고하기</span>
	</div>
	
</div> --%>
</body>
<script type="text/javascript">
	(function(){
		/* alert("gd"); */
		var addr = $("#addr2").val();
		$.ajax({
			url: "/TripINN/house/houseMapView.do",
			type: "GET",
			async:true,
			dataType: "Text", 
			data: {"addr": addr},
			success: function(data) {
				$("#mapView").html(data);
			}
		});
	})()
</script>
</html>