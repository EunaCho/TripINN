
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String cp = request.getContextPath(); %>
<html>
<head>
<title>HOUSE LIST</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!--  -->
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$( function() {
		$( "#slider-range" ).slider({
			range: true,
			min: 10000,
			max: 500000,
			values: [ 30000, 100000],
			slide: function( event, ui ) {
				$( "#amount" ).val( ui.values[ 0 ] +" 원" + " - " + ui.values[ 1 ]  +"원");
			}
		});
		$( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +" 원" +
			" - " + $( "#slider-range" ).slider( "values", 1 ) +" 원");
	} );

	
	$(function () {
	    $("#datepicker_in_sub").datepicker({
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
	    $("#datepicker_out_sub").datepicker({
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

<STYLE> 
#left { scrollbar-3dlight-color:#FFFFFF;
scrollbar-arrow-color:#000000;
scrollbar-track-color:#FFFFFF;
scrollbar-darkshadow-color:#FFFFFF;
scrollbar-face-color:#FFFFFF;
scrollbar-highlight-color:#FFFFFF;
scrollbar-shadow-color:#FFFFFF} 
</STYLE> 
</head>

<body>

	<div id="header">
	
	<!-- <a href="#this" class="btn" id="houseRegister">숙소 등록</a> -->
	</div>
	<!-- 왼쪽 -->
	<div id="left" style="width:48%; height:600px; overflow-y:scroll; min-width: 530px; border:1px solid black; float:left; align:center;">

	<!-- 상세검색폼 -->
	<form id="searchForm" >
	
	<!-- 날짜 설정 -->
	<div class="border_date">
		<div><h4>날 짜</h4></div>
		<div>
			<label>체크인</label>
			<input class="checkinout" type="text" name="hr_first_date" id="datepicker_in_sub" value="${search.hr_first_date}" placeholder="체크인" >
		</div>
		<div>
			<label>체크아웃</label>
			<input class="checkinout" type="text" name="hr_last_date" id="datepicker_out_sub" value="${search.hr_last_date}" placeholder="체크아웃">
		</div>
		<div>
			<label>인원</label>
			<select name="person" placeholder="인원 1명">	
				<option value="인원 1명">인원 1명</option>
				<option value="1" <c:if test="${person eq 1}">selected="selected"</c:if> >인원 1명</option>
				<option value="2" <c:if test="${person eq 2}">selected="selected"</c:if> >인원 2명</option>
				<option value="3" <c:if test="${person eq 3}">selected="selected"</c:if> >인원 3명</option>
				<option value="4" <c:if test="${person eq 4}">selected="selected"</c:if> >인원 4명</option>
				<option value="5" <c:if test="${person eq 5}">selected="selected"</c:if> >인원 5명</option>
			</select>	
		</div>
	</div>
	<div class="border_category">
		<div><h4>숙소 유형</h4></div>
		<div class="h_category">집 전체<input type="checkbox" name="" id="" style="color:"></div>
		<div class="h_category" >개인실<input type="checkbox" name="" id=""></div>
		<div class="h_category" >다인실<input type="checkbox" name="" id=""></div>
	</div>
	
	
	<!-- 가격 설정 -->
	<div class="border_price">
		<div><h4>가격 범위</h4></div>
		<div class="price_range">
			<span><label for="amount">Price range:</label></span>
			<span><input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;"></span>
			<div id="slider-range" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
			<div style="margin-top: 10px;"class="ui-slider-range ui-corner-all ui-widget-header" style="left: 15%; width: 45%;"></div>
				<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 15%;"></span>
				<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 60%;"></span>
			</div>

		</div>
	</div>
	
	<button class="button" type="submit">검색</button>
	</form>
	 

	<!-- 하우스 미리보기 블럭 -->
	<div id="house_div">
		<!-- 하우스 미리보기 리스트 출력 -->
		<div class="pre_List">
		<ul>
			<c:forEach items="${list}" var="house" varStatus="stat">
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="house_idx" value="${house.HOUSE_IDX}"/>
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
			</c:forEach>
			</ul>
		</div>
	</div>


	<!-- 숙소미리보기 정렬 -->
	<%-- <table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>소개</td>
		</tr>
		
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="house">
					<tr>
						<td>${house.HOUSE_IDX}</td>
						<td>${house.HOUSE_NAME}</td>
						<td>${house.HOUSE_INFO}</td>
						<td>${house.HOUSE_PRICE }</td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
			<tr>
				<td>등록된 숙소가 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
		
	</table> --%>
	</div>
	
	
	<!-- 오른쪽 -->
	<div name="right" style="width:48%;min-width: 530px;  border:1px solid red;  float:left;">
	지도
	</div>
	

</body>
</html>