<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String cp = request.getContextPath(); %>

<<<<<<< HEAD

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<script type="text/javascript" src="<%= cp %>/js/scrollnews.js"></script> <!-- 롤링 스클 -->

=======
  
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
<script src="<%= cp %>/js/main.js"></script>
<link rel="stylesheet" href="/TripINN/css/main.css" />
<<<<<<< HEAD



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
=======
<script src="http://code.jquery.com/jquery-1.7.1.js"></script><!-- 롤링 스크롤 -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<link rel="stylesheet" href="/TripINN/js/main.js" />



>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
<!-- 메인 바디 -->
<div style="width:100%;height:1300px;border:;text-align:center;">


	<!-- 슬라이드 롤링 --> 

<<<<<<< HEAD
	<div class="noti" id="rolling">
		<ul>
			<li><img src="<%= cp %>/images/roll1.jpg"></li>
			<li><img src="<%= cp %>/images/roll2.jpg"></li>
			<li><img src="<%= cp %>/images/roll3.jpg"></li>
		</ul>
=======
    <div class="animation_canvas">
        <div class="slider_panel">
            <img src="<%= cp %>/images/roll1.jpg" class="slider_image"/>
            <img src="<%= cp %>/images/roll2.jpg" class="slider_image"/>
            <img src="<%= cp %>/images/roll3.jpg" class="slider_image"/>
            <img src="<%= cp %>/images/roll4.jpg" class="slider_image"/>
            <img src="<%= cp %>/images/roll5.jpg" class="slider_image"/>
        </div>
        <div class="slider_text_panel">
            <div class="slider_text">
                <h1>Functional Loft</h1>
                <p>with green terrace.</p>
            </div>
            <div class="slider_text">
                <h1>Renovated 1930's cottage</h1>
                <p>Adorable on a beautiful, lush, gated property.</p>
            </div>
            <div class="slider_text">
                <h1>Miamo,</h1>
                <p>Amazing view</p>
            </div>
           <div class="slider_text">
                <h1>Donec</h1>
                <p>Donec a ligula lectus, eu iaculis justo.</p>
            </div>
            <div class="slider_text">
                <h1>Vivamus scelerisque</h1>
                <p>Vivamus scelerisque mauris id nunc dictum sit amet.</p>
            </div>
        </div>
        <div class="control_panel">
            <div class="control_button"></div>
            <div class="control_button"></div>
            <div class="control_button"></div>
          	<div class="control_button"></div>
            <div class="control_button"></div>
        </div>
    </div>
    

	<!-- 공지사항 블록 -->
	<div class="noticeBlock">
	
	 <!-- 공지사항 -->
    <div class="noticeCont">
    	<div class="tab">
        	<h4 class="tab1 on"><a href="#tabNotice">문의게시판</a></h4>
            	<div class="tabContent" id="tabNotice" style="display: block;">
                	<h4 class="hide_el">문의게시판</h4>
                    	<ul>
                        	<li>
                            	<a id="rptNotice_ctl00_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:bold;">공지사항을</a>
                                <img id="rptNotice_ctl00_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl00_lblDate">2017/01/11</span>
                            </li>
							<li>
                                <a id="rptNotice_ctl01_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:bold;">넣읍시다</a>
                                <img id="rptNotice_ctl01_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl01_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl02_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:bold;">누가좀</a>
                                <img id="rptNotice_ctl02_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl02_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl03_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:bold;">만들어주새오</a>
                                <img id="rptNotice_ctl03_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl03_lblDate">2017/01/09</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl04_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:normal;">아직도 안끝났네</a>
                                <span id="rptNotice_ctl04_lblDate">2017/01/04</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl05_hlTitle" href="<%=cp%>/admin/qnaDetail.do?qna_idx=108" style="font-weight:normal;">줄은 더 못늘리겠네</a>
                                <span id="rptNotice_ctl05_lblDate">2017/01/02</span>
                            </li>
                                        
                      </ul>
                </div>
                <p class="more">
               		<a href="<%=cp%>/admin/qnaList.do">
               		<img src="http://www.jinair.com/images/newMain/news_more_new.gif" alt="more"></a>
                </p>
        </div>
    </div>
    
    <!-- 사용가이드 -->

    <div class="noticeCont">
    	<div class="tab">
        	<h4 class="tab2 on"><a href="#tabNotice">FAQ</a></h4>
            	<div class="tabContent" id="tabNotice" style="display: block;">
                	<h4 class="hide_el">FAQ</h4>
                    	<ul>
                        	<li>
                            	<a id="rptNotice_ctl00_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=108" style="font-weight:bold;">TripINN 계정은 어떻게 만드나요?</a>
                             </li>
							<li>
                                <a id="rptNotice_ctl01_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=111" style="font-weight:bold;">TripINN에 등록한 이메일 주소를 변경하려면 어떻게 하나요?</a>
                            </li>
                            <li>
                                <a id="rptNotice_ctl02_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=109" style="font-weight:bold;">비밀번호 변경은 어떻게 하나요?</a>
                            </li>
                            <li>
                                <a id="rptNotice_ctl03_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=107" style="font-weight:bold;">계정 설정 또는 프로필은 어떻게 수정하나요?</a>
                            </li>
                            <li>
                                <a id="rptNotice_ctl04_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=106" style="font-weight:bold;">TripINN 프로필 혹은 프로필 사진이 왜 필요한가요?</a>
                            </li>
                            <li>
                                <a id="rptNotice_ctl05_hlTitle" href="<%=cp%>/admin/faqDetail.do?faq_idx=110" style="font-weight:bold;">페이스북 계정으로 로그인하지만, TripINN 비밀번호를 만들고 싶은 경우</a>     
                            </li>
                                        
                      </ul>
                </div>
                <p class="more">
               		<a href="<%=cp%>/admin/faqList.do">
               		<img src="http://www.jinair.com/images/newMain/news_more_new.gif" alt="more"></a>
                </p>
        </div>
    </div>

>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
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
			<input type="text" name="hr_first_date" id="datepicker_in" placeholder="체크인" class="datepicker"/>
			</div>
			<div class="date">체크아웃<br/>
			<input type="text" name="hr_last_date" id="datepicker_out" placeholder="체크아웃" class="datepicker"/>
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
<<<<<<< HEAD
		
=======
		<!-- 여행 목적 선택 -->
		<div class="hc_f_triptype">
                <div class="hc_f_triptype_label">
                    <span>여행목적</span> <em>(선택사항)</em>
                </div>
                <div class="hc_f_triptype_options">
                    <label for="hc_f_id_triptype_2_1">
                        <span>휴가</span>
                        <input type="radio" name="hc_f_triptype_1" id="hc_f_id_triptype_2_1" value="2" data-triptype="Leisure">
                    </label>
                    <label for="hc_f_id_triptype_1_1">
                        <span>출장</span>
                        <input type="radio" name="hc_f_triptype_1" id="hc_f_id_triptype_1_1" value="1" data-triptype="Business">
                    </label>
                    <div class="hc_f_triptype_help">
                        <div class="hc_f_triptype_tooltip_wrapper">
                            <div class="hc_f_triptype_tooltip" data-triptypetooltip="" style="top: -45px; display: none;">
                                <h3>여행 목적:</h3>
                                <ul>
                                    <li class="hc_f_triptype_tooltip_personal"><strong>여행:</strong> 예산, 위치, 이용 후기 등을 고려하여 최고의 숙소를 추천해 드립니다.</li>
                                    <li class="hc_f_triptype_tooltip_business"><strong>출장:</strong> 비즈니스 여행자에게 인기 있는 숙소를 추천해 드립니다.</li>
                                </ul>
                            </div>
                        </div>
                     </div>
                    <div class="cDivBoth"></div>
                </div>
            </div>
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git

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
<<<<<<< HEAD
			<span><a href="">전체보기>></a></span>
=======
			<span><a href="<%=cp %>/house/houseMain.do">전체보기>></a></span>
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
		</div>

		<!-- 하우스 미리보기 리스트 출력 -->
		<div class="pre_List">
		<ul>
			<c:forEach items="${houseList}" var="houseList" varStatus="stat">
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="HOUSE_IDX" value="${houseList.HOUSE_IDX}"/>
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
			
		<div class="pre_List">
		<ul>
			<c:forEach items="${tripList}" var="tripList" varStatus="stat">
				<c:set var="fullImg" value="${tripList.TRIP_IMAGE }"/>
				<c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
				<!-- 미리보기 개체 -->
				<li>
				<a href="javascript:tripDetail('${tripList.TRIP_IDX }');">
					<img src="<%= cp %>/images/trip/${tripImg}" class="houseImage" alt="트립 사진"/>
					<br/>
						<span><strong>${tripList.TRIP_NAME}</strong></span>
						<span>${tripList.TRIP_INFO}</span>
					<br/>
						<span>${tripList.TRB_STAR}</span> <!-- 숙소 별점 : 조인테이블로 값 불러올것 -->
						<span> 후기 ?? 개</span>
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