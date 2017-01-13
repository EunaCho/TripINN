<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<script type="text/javascript" src="<%= cp %>/js/scrollnews.js"></script> <!-- 롤링 스클 -->

<script src="<%= cp %>/js/main.js"></script>
<link rel="stylesheet" href="/TripINN/css/main.css" />



<script>

function preSearch() {
	if(confirm("확인요?")) {
		return true;
	} else {
	return false;
	}
	document.preSearchForm.submit();
}

</script>
<!-- 메인 바디 -->
<div style="width:100%;height:1300px;border:;text-align:center;">


	<!-- 슬라이드 롤링 --> 

	<div class="noti" id="rolling">
		<ul>
			<li><img src="<%= cp %>/images/roll1.jpg"></li>
			<li><img src="<%= cp %>/images/roll2.jpg"></li>
			<li><img src="<%= cp %>/images/roll3.jpg"></li>
		</ul>
	</div>

					
	
	<!-- 왼쪽 간편검색바 -->
	<div id="leftDiv">
	<form method="POST" action="house/houseMain.do" name="preSearchForm">
		<div> 
			<h3>숙소 검색하기</h3><br/>
			<input type="text" class="pre_srch_input" name="preSearch_keyword" placeholder="장소, 지역, 숙소명 검색"/>
		</div>
		<div style="margin-top:10px;">
			<div class="date">체크인<br/>
			<input type="text" name="hri_first_date" id="datepicker_in" placeholder="체크인" class="datepicker"/>
			</div>
			<div class="date">체크아웃<br/>
			<input type="text" name="hri_last_date" id="datepicker_out" placeholder="체크아웃" class="datepicker"/>
			</div>
		</div>
		<div class="select">
			객실: <select name="room"> 
				<option value="">객실 수</option>
				<option value="1" <c:if test="${room eq 1}">selected="selected"</c:if> >1개</option>
				<option value="2" <c:if test="${room eq 2}">selected="selected"</c:if> >2개</option>
				<option value="3" <c:if test="${room eq 3}">selected="selected"</c:if> >3개</option>
				<option value="4" <c:if test="${room eq 4}">selected="selected"</c:if> >4개</option>
				<option value="5" <c:if test="${room eq 5}">selected="selected"</c:if> >5개</option>
			</select>
			성인: <select name="adult"> 
				<option value="">성인</option>
				<option value="1" <c:if test="${adult eq 1}">selected="selected"</c:if> >1명</option>
				<option value="2" <c:if test="${adult eq 2}">selected="selected"</c:if> >2명</option>
				<option value="3" <c:if test="${adult eq 3}">selected="selected"</c:if> >3명</option>
				<option value="4" <c:if test="${adult eq 4}">selected="selected"</c:if> >4명</option>
				<option value="5" <c:if test="${adult eq 5}">selected="selected"</c:if> >5명</option>
			</select>
			소아: <select name="child"> 
				<option value="">소아</option>
				<option value="1" <c:if test="${child eq 1}">selected="selected"</c:if> >1명</option>
				<option value="2" <c:if test="${child eq 2}">selected="selected"</c:if> >2명</option>
				<option value="3" <c:if test="${child eq 3}">selected="selected"</c:if> >3명</option>
				<option value="4" <c:if test="${child eq 4}">selected="selected"</c:if> >4명</option>
				<option value="5" <c:if test="${child eq 5}">selected="selected"</c:if> >5명</option>
			</select>
		</div>
		

	<!-- 	<a href="/TripINN/house/houseMain.do" onclick="preSearch();" class="pre_srch_submit">
		//<img src="http://openimage.interpark.com/tourpark/tour/main/btn_search.gif" alt="검색하기"></a> -->
		
		<!-- <span class="btn_join" onclick="preSearch();">검색</span> -->
		<button class="btn_join" type="submit">검색</button>
	</form>	
	</div>
	
	
	<!-- 숙소/트립 미리보기 -->
	<div id="rightDiv">
	
		<!-- 하우스 미리보기 블럭 -->
		<div class="subject">
			<span>등록된 숙소</span>
			<span><a href="">전체보기>></a></span>
		</div>

		<!-- 하우스 미리보기 리스트 출력 -->
		<div class="pre_List">
		<ul>
			<c:forEach items="${houseList}" var="houseList" varStatus="stat">
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="house_idx" value="${houseList.HOUSE_IDX}"/>
					<c:param name=""/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<li>
				<a href="${houseViewURL}">
					<img src="<%= cp %>/images/house/${houseList.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
					<br/>
						<span><strong>${houseList.HOUSE_NAME}</strong></span>
						<span>${houseList.HOUSE_INFO}</span>
					<br>
						<span>${houseList.HRB_STAR}</span> <!-- 숙소 별점 : 조인테이블로 값 불러올것 -->
						<span> 후기 ?? 개</span>
				</a>
				</li>  
			</c:forEach>
			</ul>
		</div>
		
		<!-- 트립 미리보기 블럭 -->
		<div class="subject">
			<span>등록된 트립</span>
			<span><a href="<%=cp%>/tripList.do">전체보기>></a></span>
		</div>
		<!-- 트립 미리보기 리스트 출력 -->
			
		<div class="pre_List" style="">
		<ul>
		
			<c:forEach items="${tripList}" var="tripList" varStatus="stat">
				<c:set var="fullImg" value="${tripList.TRIP_IMAGE }"/>
				<c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
				<fmt:formatNumber var="sum" value="${tripList.TRB_STAR}" pattern="#.##"/>
				<fmt:formatNumber var="cnt" value="${tripList.TOTAL_CNT}" pattern="#.##"/>
				<!-- 미리보기 개체 -->
				<li>
				<a href="javascript:tripDetail('${tripList.TRIP_IDX }');">
					<img src="<%= cp %>/images/trip/${tripImg}" class="houseImage" alt="트립 사진"/>
					<br/>
						<span style="width:100%;height:20px;text-align:left;">
							<strong>
								${tripList.TRIP_NAME}&nbsp;&nbsp;
								<font color="#cb4646" size="2">
								<c:if test="${tripList.TOTAL_CNT != 0}">
								<fmt:formatNumber value="${sum / cnt}" pattern="#.#"/>
								</c:if> 
								<c:if test="${tripList.TOTAL_CNT == 0}">
								0
								</c:if>
								점 </font>
							</strong> 
						</span>
					<br/>
						<span style="width:100%;height:20px;text-align:left;">
						<b><font color="#0886C4" size="2">[ ${tripList.TRIP_TYPE } ]</font></b>
						</span>
						<span style="PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 87px; float:left;	PADDING-TOP: 0px;	HEIGHT: 18px; margin:0px auto;">
							<p style="<c:if test="${tripList.TOTAL_CNT != 0}">width:${sum * 20 / cnt}%;</c:if>
									  <c:if test="${tripList.TOTAL_CNT == 0}">width:0%;</c:if>
							 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
							</p>
						</span> 
						<span style="margin-right:10px;float:right;"> 후기 <b>${cnt }</b> 개</span>
				</a>
				</li>  
			</c:forEach>
			</ul>
		</div>
	
	</div>
</div>

<form action="/TripINN/tripDetail.do" method="post" name="formDetail">
	<input type="hidden" name="trip_idx" value=""/>
</form>
<script>
function tripDetail(trip_idx) {
	var dform = document.formDetail;
	dform.trip_idx.value = trip_idx;
	dform.submit();
}
</script>