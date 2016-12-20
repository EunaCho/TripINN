<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% String cp = request.getContextPath(); %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<script type="text/javascript" src="<%= cp %>/js/scrollnews.js"></script> <!-- 롤링 스클 -->
<script src="<%= cp %>/js/common.js"></script>

  <link rel="stylesheet" href="/TripINN/css/main.css" />

<!-- 메인 바디 -->
<div style="width:100%;height:1300px;border:1px solid #9BC3FF;text-align:center;">

	
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
	<form>
		<div> 
			<h3>숙소 검색하기</h3><br/>
			<input type="text" class="pre_srch_input" name="preSearch" placeholder="장소, 지역, 숙소명 검색"/>
		</div>
		<div style="margin-top:10px;">
			<div class="date">체크인<br/>
			<input type="text" name="periodToStay_startDate" id="datepicker_in" placeholder="체크인" class="datepicker"/>
			</div>
			<div class="date">체크아웃<br/>
			<input type="text" name="periodToStay_startDate" id="datepicker_out" placeholder="체크아웃" class="datepicker"/>
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
		
		<a href="" class="pre_srch_submit" >
		<img src="http://openimage.interpark.com/tourpark/tour/main/btn_search.gif" alt="검색하기"></a>
	</form>
	</div>
	
	
	<!-- 숙소/트립 미리보기 -->
	<div id="rightDiv">
		<div class="subject">
			<span>등록된 숙소</span>
			<span><a href="">전체보기>></a></span>
		</div>

		<!-- 하우스 미리보기 리스트 출력 -->
		<div class="pre_houseList">
		<ul>
			<c:forEach items="${houseList}" var="houseList" varStatus="stat">
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="viewURL" value="/house/houseDetail.do">
					<c:param name="house_idx" value="${houseList.HOUSE_IDX}"/>
					<c:param name=""/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<li>
				<a href="viewURL">
					<img src="<%= cp %>/images/house/${houseList.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
					<br/>
						<span><strong>${houseList.HOUSE_NAME}</strong></span>
						<span>${houseList.HOUSE_INFO}</span>
					<br/>
						<span>${houseList.HRB_STAR}</span> <!-- 숙소 별점 : 조인테이블로 값 불러올것 -->
						<span> 후기 ?? 개</span>
				</a>
				</li>  
			</c:forEach>
			</ul>
		</div>
			<!-- 트립 미리보기 리스트 출력 -->
	
	</div>
	
	
</div>