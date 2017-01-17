<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->

  
<script src="<%= cp %>/js/main.js"></script>
<link rel="stylesheet" href="/TripINN/css/main.css" />
<script src="http://code.jquery.com/jquery-1.7.1.js"></script><!-- 롤링 스크롤 -->
<script>
$(document).ready(function () {
    // 슬라이더를 움직여주는 함수
    function moveSlider(index) {
        // 슬라이더를 이동합니다.
        var willMoveLeft = -(index * 900);
        $('.slider_panel').animate({ left: willMoveLeft }, 'slow');
        // control_button에 active클래스를 부여/제거합니다.
        $('.control_button[data-index=' + index + ']').addClass('active');
        $('.control_button[data-index!=' + index + ']').removeClass('active');
        // 글자를 이동합니다.
        $('.slider_text[data-index=' + index + ']').show().animate({
            left: 0
        }, 'slow');
        $('.slider_text[data-index!=' + index + ']').hide('slow', function () {
            $(this).css('left', -300);
        });
    }
    // 초기 텍스트 위치 지정 및 data-index 할당
    $('.slider_text').css('left', -300).each(function (index) {
        $(this).attr('data-index', index);
    });
    // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
    $('.control_button').each(function (index) {
        $(this).attr('data-index', index);
    }).click(function () {
        var index = $(this).attr('data-index');
        moveSlider(index);
    });
    // 초기 슬라이더 위치 지정
    var randomNumber = Math.round(Math.random() * 3);
    moveSlider(randomNumber);
});
</script>


<!-- 메인 바디 -->
<div style="width:1350px;height:1300px;border:;text-align:center;">


   <!-- 슬라이드 롤링 --> 

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
           <h4 class="tab1 on"><a href="#tabNotice">공지사항</a></h4>
               <div class="tabContent" id="tabNotice" style="display: block;">
                   <h4 class="hide_el">공지사항</h4>
                       <ul>
                           <li>
                               <a id="rptNotice_ctl00_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15719" style="font-weight:bold;">공지사항을</a>
                                <img id="rptNotice_ctl00_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl00_lblDate">2017/01/11</span>
                            </li>
                     <li>
                                <a id="rptNotice_ctl01_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15699" style="font-weight:bold;">넣읍시다</a>
                                <img id="rptNotice_ctl01_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl01_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl02_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15679" style="font-weight:bold;">누가좀</a>
                                <img id="rptNotice_ctl02_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl02_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl03_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15639" style="font-weight:bold;">만들어주새오</a>
                                <img id="rptNotice_ctl03_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl03_lblDate">2017/01/09</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl04_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15619" style="font-weight:normal;">아직도 안끝났네</a>
                                <span id="rptNotice_ctl04_lblDate">2017/01/04</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl05_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15559" style="font-weight:normal;">줄은 더 못늘리겠네</a>
                                <span id="rptNotice_ctl05_lblDate">2017/01/02</span>
                            </li>
                                        
                      </ul>
                </div>
                <p class="more">
                     <a href="javascript:MoreNews();">
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
                               <a id="rptNotice_ctl00_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15719" style="font-weight:bold;">호놀룰룰루</a>
                                <img id="rptNotice_ctl00_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl00_lblDate">2017/01/11</span>
                            </li>
                     <li>
                                <a id="rptNotice_ctl01_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15699" style="font-weight:bold;">3일남았당</a>
                                <img id="rptNotice_ctl01_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl01_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl02_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15679" style="font-weight:bold;">FAQ넣기 넣기넣기</a>
                                <img id="rptNotice_ctl02_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl02_lblDate">2017/01/10</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl03_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15639" style="font-weight:bold;">금요일에 야근하는거 아니야</a>
                                <img id="rptNotice_ctl03_btnNew" src="http://www.jinair.com/images/newMain/new.gif" alt="new" style="border-width:0px;">
                                <span id="rptNotice_ctl03_lblDate">2017/01/09</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl04_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15619" style="font-weight:normal;">금요일에 야근하는거 아니야</a>
                                <span id="rptNotice_ctl04_lblDate">2017/01/04</span>
                            </li>
                            <li>
                                <a id="rptNotice_ctl05_hlTitle" href="/HOM/Notice/NoticeView.aspx?seq=15559" style="font-weight:normal;">금요일에 야근하는거 아니야</a>
                                <span id="rptNotice_ctl05_lblDate">2017/01/02</span>
                            </li>
                                        
                      </ul>
                </div>
                <p class="more">
                     <a href="javascript:MoreNews();">
                     <img src="http://www.jinair.com/images/newMain/news_more_new.gif" alt="more"></a>
                </p>
        </div>
    </div>

   </div>
   
       
   
   <!-- 왼쪽 간편검색바 -->
   <div id="leftDiv">
   <form method="POST" action="house/houseMain.do" name="preSearchForm" id="preSearchForm">
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
      <!-- <div style="clear:both;"></div> -->
      <div class="select">객실<br/>
      <select name="room"> 
            <option value="">객실 수</option>
            <option value="1" <c:if test="${room eq 1}">selected="selected"</c:if> >1개</option>
            <option value="2" <c:if test="${room eq 2}">selected="selected"</c:if> >2개</option>
            <option value="3" <c:if test="${room eq 3}">selected="selected"</c:if> >3개</option>
            <option value="4" <c:if test="${room eq 4}">selected="selected"</c:if> >4개</option>
            <option value="5" <c:if test="${room eq 5}">selected="selected"</c:if> >5개</option>
         </select>
      </div>
      <div class="select">인원<br/>
      <select name="person"> 
            <option value="">인원</option>
            <option value="1" <c:if test="${adult eq 1}">selected="selected"</c:if> >1명</option>
            <option value="2" <c:if test="${adult eq 2}">selected="selected"</c:if> >2명</option>
            <option value="3" <c:if test="${adult eq 3}">selected="selected"</c:if> >3명</option>
            <option value="4" <c:if test="${adult eq 4}">selected="selected"</c:if> >4명</option>
            <option value="5" <c:if test="${adult eq 5}">selected="selected"</c:if> >5명</option>
         </select>
      </div>
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
                        <a href="javascript:void(0);" class="hc_f_triptype_help_icon" data-triptypeicon=""></a>
                    </div>
                    <div class="cDivBoth"></div>
                </div>
            </div>

   <!--    <a href="/TripINN/house/houseMain.do" onclick="preSearch();" class="pre_srch_submit">
      //<img src="http://openimage.interpark.com/tourpark/tour/main/btn_search.gif" alt="검색하기"></a> -->
      
      <!-- <span class="btn_join" onclick="preSearch();">검색</span> -->
      <button class="btn_search" type="submit">검색</button>
   </form>   
   </div>
   
   
   <!-- 숙소/트립 미리보기 -->
   <div id="rightDiv">
   
      <!-- 하우스 미리보기 블럭 -->
      <div class="subject">
         <span>등록된 숙소</span>
         <span><a href="<%=cp%>/house/houseMain.do">전체보기>></a></span>
      </div>

      <!-- 하우스 미리보기 리스트 출력 -->
      <div class="pre_List">
      <ul>
         <c:forEach items="${houseList}" var="houseList" varStatus="stat">
         
         <fmt:formatNumber var="sum" value="${houseList.STAR}" pattern="#.##"/>
         <fmt:formatNumber var="cnt" value="${houseList.STAR_COUNT}" pattern="#.##"/>
            <!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
            <c:url var="houseViewURL" value="/house/houseDetail.do">
               <c:param name="HOUSE_IDX" value="${houseList.HOUSE_IDX}"/>
               <c:param name="MEMBER_IDX" value="${houseList.MEMBER_IDX }"/>
            </c:url>
            
            <!-- 미리보기 개체 -->
            <li>
            <a href="${houseViewURL}">
               <div>
               <img src="<%= cp %>/images/house/${houseList.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
               </div>
               <div style="width: 100%; height: 37px;">
                        <div style="float: left; width: auto; font-weight: bold; font-size: 15px; margin-right: 25px; color: gray;">${houseList.HOUSE_NAME}</div>
                        <div style="float: left; width: auto; color: rgb(203, 70, 70); font-size: small;">
                           <c:if test="${houseList.STAR_COUNT != 0}">
                              <b><fmt:formatNumber value="${sum / cnt}" pattern="#.#" /></b>
                           </c:if>
                           <c:if test="${houseList.STAR_COUNT == 0}">
                        <b>0</b>
                        </c:if>
                           점
                        </div>
                     </div>
                     <div>
                  <div style="PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 87px; float:left;   PADDING-TOP: 0px;   HEIGHT: 18px; margin:0px auto;">
                     <p style="<c:if test="${houseList.STAR_COUNT != 0}">width:${sum * 20 / cnt}%;</c:if>
                             <c:if test="${houseList.STAR_COUNT == 0}">width:0%;</c:if>
                      PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
                     </p>
                  </div> 
                  <div style="float: right; width: 50%; color: gray;"> 후기  <b>${houseList.STAR_COUNT}</b> 개</div>
               </div>
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
                  <span style="PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 87px; float:left;   PADDING-TOP: 0px;   HEIGHT: 18px; margin:0px auto;">
                     <p style="<c:if test="${tripList.TOTAL_CNT != 0}">width:${sum * 20 / cnt}%;</c:if>
                             <c:if test="${tripList.TOTAL_CNT == 0}">width:0%;</c:if>
                      PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
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