<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="/TripINN/css/house/house.css">

<% String cp = request.getContextPath(); %>


<html>
<head>

<title>HOUSE DETAIL</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!--  -->
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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


<!-- 왼쪽: 숙소상세 -->
<div id="houseDetail">
	<!-- 숙소 정보 블록 -->
	<div class="houseInfo">
		<!-- 숙소 제목 -->
		<div class="house_subject">
			<div class="house_name">
				<span><h2>${house.HOUSE_NAME}</h2></span>
				<span>${house.HOUSE_ADDR2}, ${house.HOUSE_ADDR1} ${house.HI_TOTAL_STAR} 후기 ??개</span>
			</div>
			<div class="testt">
				<span><img src="/TripINN/images/공유.png"/></span> <br/>
				<span>호스트: ${house.MEMBER_IDX } 님</span>
			</div>
			
		</div>
		<!-- 숙소상세정보 -->
		<div class="house_desc">
			<div>
				<ul>
				<h4>숙소</h4>
				</ul> 
				<ul>
					<li>숙박가능인원 : <strong>${house.HOUSE_TOTAL_PERSONS }</strong> 명</li>
					<li>침실 : <strong>${house.HI_ROOM }</strong> 개</li>
					<li>침대 : <strong>${house.HI_BAD }</strong> 개</li>
					<li>욕실 : </li>
				</ul>
				<ul>
					<li>체크인 : <strong>${house.HI_CHECKIN}</strong> 시 이후</li>
					<li>체크아웃 : <strong>${house.HI_CHECKOUT}</strong> 시</li>
					<li>집유형 : <strong>${house.HOUSE_KIND } </strong></li>
					<li>숙소유형: <strong></strong></li>
				</ul>
			</div>
			<div>
				<ul>
				<h4>가격</h4>
				</ul>
				<ul>
					<li>보증금 : <strong>${house.HI_DEPOSIT}</strong> 원</li>
					<li>청소비용 : <strong>${house.HI_CLEAN_PRICE }</strong> 원</li>
					<li>1박 당 : <strong>${house.HOUSE_PRICE }</strong> 원</li>
					<li>시설4 </li>
				</ul>
				<ul>
					<li>시설1</li>
					<li>시설2</li>
					<li>시설3</li>
					<li>시설4</li>
				</ul>
			</div>
			<div>
				<ul>
				<h4>설명</h4>
				</ul>
				<ul>
					<li>1번 침실</li>
					<li>2번 침실</li>
					<li>3번 침실</li>
					<li>4번 침실</li>
				</ul>
				<ul>
					<li>5번 침실</li>
					<li>6번 침실</li>
					<li>7번 침실</li>
					<li>8번 침실</li>
				</ul>
			</div>
		</div>

		
	</div>
	
	
	<!-- 사진 미리보기 -->
	<div class="pictures">
	사진미리보기블럭
	</div>
	
	<!-- 후기 블록 -->
	<div class="review">
	<!-- 후기 입력하기 -->
		<form name="reviewForm" id="reviewForm" action="<%=cp %>/house/houseReviewWrite.do" method="post">
			 
			 <%-- <input type="hidden" name="hrb_idx"/>
			 <input type="text" name="HOUSE_IDX" value="${house.HOUSE_IDX }"/>
  			 <input type="text" name="MEMBER_IDX" value="${sessionAttribute.MEMBER_IDX }" />
			 --%>
			<textarea name="HRB_CONTENT" theme="simple" value="" cols="60" rows="8"></textarea>
			<br>
			<button class="reviewBtn" type="submit" name="reviewSubmit">리뷰작성</button>
		</form>
		<!-- 후기 리스트 출력 -->
		<c:forEach items="${review}" var="review" varStatus="stat">
			<!-- 리뷰블록 -->
			<div class="reviewBlock">
				<!-- 작성자정보 -->
				<div class="writer">
					<span><img src="/TripINN/images/공유.png"/></span> <br/>
					<span>작성자: ${review.MEMBER_IDX} 님</span>
				</div>
				<!-- 리뷰내용 -->
				<div class="reviewContent">
				<p> ${review.HRB_CONTENT}</p>
				</div>
				<div class="reviewDate">
				 ${review.HRB_REGDATE }
				</div>
				<!-- 추천하기 버튼 -->
				<div class="like">추천</div>
				
			</div>
			
			
	
			<%-- <!-- 리뷰블록 -->	
			<div class="reviewContent" style="width:100%; margin-top:20px;">
			<!-- 작성자정보 -->
			<div class="" style="width:10%;">
				<span class="m_image" 
				<c:if test="${RevList.member_image != null }">
					style="background:url('/Taster/images/member/${RevList.member_image }') no-repeat;
							background-size: 36px 36px;" </c:if>>
				</span>
				<span class="r_content">${RevList.member_nicname}</span>
			</div>
			<!-- 리뷰내용 -->
			<div class="r_content" style="width:70%;" >
				<span class="gray">
					<fmt:formatDate value="${RevList.r_regdate}" pattern="yyyy-MM-dd"/>
				</span>
				&nbsp;&nbsp;&nbsp;
				<span>${RevList.r_content }</span>
				<br/>
				<c:if test="${RevList.r_image ne null }">
					<c:set var="imgf" value="${fn:split(RevList.r_image, '|') }"/>
					<c:forEach var="s1" items="${imgf }">
						<img src="/Taster/images/review/${s1 }" alt="" style="width:50px;height:50px;" />
					</c:forEach>
				</c:if>
			</div> --%>
			
		</c:forEach>
	</div>
	

</div>

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
		<span><img src="/TripINN/images/house/icon_heart_white.png"></span>
		<span>위시리스트 담기</span>
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
	
</div>


<%-- 
<!-- 하우스 미리보기 블럭 -->
	<div id="house_div">
		<!-- 하우스 미리보기 리스트 출력 -->
		<div class="pre_List">
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="house_idx" value="${detail.HOUSE_IDX}"/>
					<c:param name=""/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<li>
				<a href="${houseViewURL}">
					<img src="<%= cp %>/images/house/${house.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
					<br/>
						<span><strong>${house.HOUSE_NAME}</strong></span>
						<span>${house.HOUSE_INFO}</span>
					<br>
						<span>${house.HRB_STAR}</span> <!-- 숙소 별점 : 조인테이블로 값 불러올것 -->
						<span> 후기 ?? 개</span>
				</a>
				</li>  

		</div>
	</div>
 --%>

</body>
</html>