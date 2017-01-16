<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<html>
<head>

<title>HOUSE DETAIL</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="/TripINN/css/house/houseDetail.css">
<link href='/TripINN/css/trip/jquery.rating.css' type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="/TripINN/css/house/slide.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- modal -->
<link rel="stylesheet" href="/TripINN/css/house/message.css">

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services,clusterer"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/TripINN/js/house/houseDetail.js"></script>
<script src="/TripINN/js/house/message.js"></script>

<script src="/TripINN/js/trip/jquery-1.11.3.min.js"	type="text/javascript" data-library="jquery" data-version="1.11.3"></script>
<script src="/TripINN/js/trip/jssor.slider-22.0.15.mini.js"	type="text/javascript" data-library="jssor.slider.mini"	data-version="22.0.15"></script>
<script src="/TripINN/js/trip/jquery.MetaData.js" type="text/javascript" language="javascript"></script>
<script src="/TripINN/js/trip/jquery.rating.js" type="text/javascript"	language="javascript"></script>
<script src="/TripINN/js/trip/main.js" type="text/javascript"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
	var MEMBER_IDX = "${sessionScope.member_idx}";

	$(function() {
		$("#datepicker_in_reserveBar").datepicker(
				{
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					minDate : new Date(),
					altField : "#datepicker",
					altFormat : "yy-mm-dd"
				});
	});
	$(function() {
		$("#datepicker_out_reserveBar").datepicker(
				{
					dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
							'일요일' ],
					dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					minDate : new Date(),
					altField : "#datepicker2",
					altFormat : "yy-mm-dd"
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
					<input type="hidden" id="receiveEmail" value="${house.MEMBER_EMAIL }">
					<input type="hidden" id="house_member_idx" value="${house.MEMBER_IDX }">
					<div class="house_name">
						<label>${house.HOUSE_NAME}</label>
					</div>
					<div>
						<label>${house.HOUSE_ADDR2}</label><label id="label_plus">+</label><label>${house.HOUSE_ADDR1}</label>
					</div>

					<div class="subject_middle">

						<div class="subject_name">
							<label>호스트 : ${house.MEMBER_NAME} 님</label><br>

							<fmt:formatNumber var="sum" value="${house.STAR_SUM}" pattern="#.##" />
							<fmt:formatNumber var="cnt" value="${house.STAR_COUNT}"	pattern="#.##" />

							<div style="background: url(/TripINN/images/trip/icon_star2.gif) 0px 0px; width: 87px; margin-top: 10px;">
								<p style="WIDTH: ${sum * 20 / cnt}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								</p>
							</div>
							<div style="margin-top: 10px">
								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#Message">메시지 보내기</button>
							</div>
						</div>



						<div class="subject_img">
							<img src="/TripINN/images/공유.png" />
						</div>
					</div>

				</div>
				<hr style="width: 98%">

				<div class="house_info_space">
					<div class="hi_space_left">
						이용공간<br> ${house.HI_SPACE }
					</div>

					<div class="hi_space_right">
						편의시설<br> ${house.HI_CSPACE }
					</div>
				</div>
				<hr style="width: 98%; margin-bottom: 2%">


				<div style="clear: both;"></div>
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
						<label>숙소</label>
					</div>

					<div class="block_right">
						<div class="house_right_info">
							<label>수용 인원 : ${house.HI_DEPOSIT } 명</label><br> <label>침실
								: ${house.HI_BAD } 개</label><br> <label>방 : ${house.HI_ROOM }
								개</label><br>

						</div>

						<div class="house_left_info">
							<label>체크인 : ${house.HI_DEPOSIT } 원</label><br> <label>체크아웃
								: ${house.HI_CLEAN_PRICE }원</label><br> <label>인원 비용 :
								${house.HOUSE_PERSON_PRICE } 원</label><br>
						</div>
					</div>
				</div>
				<hr class="block_hr">



				<div class="house_info_block">
					<div class="block_left">
						<label>가격</label>
					</div>
					<input type="hidden" name="HOUSE_MEMBER_IDX" id="HOUSE_MEMBER_IDX"
						value="${house.MEMBER_IDX }">
					<div class="block_right">
						<label>일박 비용 : ${house.HOUSE_PRICE} 원</label><br> <label>인원
							비용 : ${house.HOUSE_PERSON_PRICE } 원</label><br> <label>보증 비용
							: ${house.HI_DEPOSIT } 원</label><br> <label>청소 비용 :
							${house.HI_CLEAN_PRICE }원</label><br> <label>일박 비용 :
							${house.HOUSE_PRICE} 원</label><br> <label>인원 비용 :
							${house.HOUSE_PERSON_PRICE } 원</label><br>
					</div>
				</div>
				<hr class="block_hr">

				<!-- 후기 입력하기 -->
				<div id="review_div">
					<form name="reviewForm" id="reviewForm"
						action="<%=cp%>/house/houseReviewWrite.do" method="post">
						<label id="review_size_label">후기 ${review_size } 개</label>
						<input type="hidden" name="HOUSE_IDX" id="HOUSE_IDX" value="${house_idx }" class="review_text">
						<input type="hidden" name="MEMBER_IDX" id="MEMBER_IDX" value="${sessionScope.member_idx}" class="review_text">
						<input type="text" name="HRB_TITLE" id="HRB_TITLE" value="" placeholder="제목을 입력하세요." class="review_text">
						<input type="password" name="HRB_PWD" id="HRB_PWD" value="" placeholder="비밀번호를 입력하세요." class="review_text">
						<div class="Clear" style="height: 50px; float: left; width: 140px; margin-top: 10px;">
							<input class="star" type="radio" name="hrb_star" value="1" /> <input
								class="star" type="radio" name="hrb_star" value="2" /> <input
								class="star" type="radio" name="hrb_star" value="3" /> <input
								class="star" type="radio" name="hrb_star" value="4" /> <input
								class="star" type="radio" name="hrb_star" value="5"
								checked="checked" />
						</div>

						<textarea id="HRB_CONTENT" name="HRB_CONTENT" cols="60" rows="8" class="review_textArea" placeholder="내용을 입력하세요."></textarea>


						<br>
						<!-- <div class="reviewBtn" id="reviewBtn">리뷰작성</div> -->

						<button type="submit">리뷰작성</button>

					</form>
				</div>





			</div>
			<!-- info end -->

			<div class="header_right">
				<!-- 슬라이드 시작 -->
				<div id="jssor_1"
					style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 583px; height: 456px; overflow: hidden; visibility: visible; background-color: #24262e;"	jssor-slider="true">
					<!-- Loading Screen -->
					<div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
						<div style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
						<div style="position: absolute; display: block; background: url('/TripINN/images/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
					</div>
					<div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 583px; height: 356px; overflow: hidden;">

						<c:forEach items="${imgList}" var="img" varStatus="status">
							<div data-p="144.50"
								<c:if test="${status.index != 0 }">style="display:none;"</c:if>>
								<img data-u="image" src="/TripINN/images/house/${img}" /> <img
									data-u="thumb" src="/TripINN/images/house/${img}"
									style="width: 70px; height: 70px;" />
							</div>
						</c:forEach>
						<c:forEach items="${imgList}" var="img" varStatus="status">
							<div data-p="144.50" style="display: none;">
								<img data-u="image" src="/TripINN/images/house/${img}" /> <img
									data-u="thumb" src="/TripINN/images/house/${img}"
									style="width: 70px; height: 70px;" />
							</div>
						</c:forEach>
						<a data-u="any" href="http://www.jssor.com" style="display: none">Image
							Gallery</a>
					</div>
					<!-- Thumbnail Navigator -->
					<div data-u="thumbnavigator" class="jssort01"
						style="position: absolute; left: 0px; bottom: 0px; width: 100%; height: 100px;"
						data-autocenter="1">
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
					<span data-u="arrowleft" class="jssora05l"
						style="top: 158px; left: 8px; width: 40px; height: 40px;"></span>
					<span data-u="arrowright" class="jssora05r"
						style="top: 158px; right: 8px; width: 40px; height: 40px;"></span>
				</div>
				<!-- 슬라이드 끝 -->


				<div class="map">
					<input type="hidden" value="${house.HOUSE_ADDR1}" id="addr2">
					<div id="mapView"></div>
				</div>

				<%@ include file="/WEB-INF/views/house/review/reserveBar.jspf"%>


			</div>

		</div>

		<div style="clear: both;"></div>
		<!-- 후기 블록 -->
		<div class="review">
		
		<input type="hidden" value="${review_size }" id="review_size">
		

			<!-- 후기 리스트 출력 -->
			<c:forEach items="${review}" var="review" varStatus="stat">
				<!-- 리뷰블록 -->
				<div class="reviewBlock">
					<!-- 작성자정보 -->
					<div id="review_left">
						<div class="writer">
							<img src="/TripINN/images/공유.png" /><br /> <label>작성자:
								${review.MEMBER_NAME} 님</label>
							<div style="background: url(/TripINN/images/trip/icon_star2.gif) 0px 0px; margin: 0 auto; width: 87px;">
								<p style="WIDTH: ${review.HRB_STAR * 20 }%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								</p>
							</div>
							<div class="reviewDate">
								<fmt:formatDate value="${review.HRB_REGDATE }"
									pattern="yy-MM-dd" />
							</div>

						</div>
						<!-- writer end -->
					</div>
					<!-- review_left end -->

					<div id="review_right">
						<!-- 리뷰내용 -->
						<div class="reviewContent">
							<p>${review.HRB_CONTENT}</p>
						</div>
						<c:set var="list_member_idx" value="${review.MEMBER_IDX}" />
						<c:set var="my_member_idx" value="${sessionScope.member_idx}" />
						<input type="hidden" id="reviewDelBtnIndex${stat.index}" value="${stat.index}">
						<c:choose>
							<c:when test="${list_member_idx eq  my_member_idx}">
							
						
								<input type="hidden" value="${review.HRB_IDX }" id="review_hrb_idx${stat.index }">
								<input type="hidden" value="${review.HRB_PWD }" id="review_hrb_pwd${stat.index }">
							
								<!-- 추천하기 버튼 -->
								<div class="review_btn">
									<div class="my_like" id="my_like">추천 ${review.HRB_LIKE }개</div>
									<div class="u_d_btn" onclick="u_d_btn(${stat.index})">삭제</div>
								</div>
							</c:when>

							<c:otherwise>
								<div class="like" id="other_like"
									style="float: right; text-align: center; background-color: white; padding: 2px;
						width: auto; border: 1px solid #BABABB; color: #black; border-radius: 5px;
						<c:forEach items='${likeList }' var= 'lList'>
							<c:if test='${lList.HRB_IDX eq review.HRB_IDX }'>
								border: 2px solid white;
    							color: white;
    							background: #ff5a5f;
							</c:if>
						</c:forEach>"
									onclick="review_l_check('${stat.index}', this, '${review.HRB_IDX }', '${review.HOUSE_IDX }');">
									추천 <label id="like_cnt${stat.index }">${review.HRB_LIKE }개</label>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
				<hr style="width: 100%;">
			</c:forEach>
		</div>
		<%@ include file="/WEB-INF/views/house/review/message.jspf"%>


	</div>
	<!-- houseDetail end -->



</body>
<script type="text/javascript">
	(function() {
		/* alert("gd"); */
		var addr = $("#addr2").val();
		$.ajax({
			url : "/TripINN/house/houseMapView.do",
			type : "GET",
			async : true,
			dataType : "Text",
			data : {
				"addr" : addr
			},
			success : function(data) {
				$("#mapView").html(data);
			}
		});
	})()
</script>
</html>