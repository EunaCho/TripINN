<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
<style>
        * { margin:0px; padding:0px; }
        /* Animation Canvas */
        .animation_canvas  {
            overflow:hidden;
            position:relative;     
            margin:30px;     
            float:left; 
            width:900px; height:400px;
        }
    
        /* Slider Panel */
        .slider_panel { width:4500px; position:relative; }
        .slider_image { float:left; width:900px; height:400px; }
    
        /* Slider Text Panel */
        .slider_text_panel { position:absolute; top:200px; left:50px; }
        .slider_text { position:absolute; width:250px; height:150px; color:white;}
    
        /* Control Panel */
        .control_panel  {
            position:absolute; top:380px; 
            left:270px; height:13px; 
            overflow:hidden; 
        }

        .control_button {
            width:12px; height:46px;
            position:relative; 
    
            float:left; cursor:pointer;  
            background:url('/TripINN/images/point_button.png');
        }
        .control_button:hover { top:-16px; }
        .control_button.active { top:-31px; }
    </style>
    <script src="http://code.jquery.com/jquery-1.7.1.js"></script>
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
        
      /*   //3초마다 이미지 오른쪽으로 이동
        var auto_slider = setlnterval(function() {
        	if (auto_slider > 4) {
        		auto_slider = 0;
        	}
        	moveSlider(auto_slider);
        }, auto_time); */
        

        
    </script>

<!-- 메인 바디 -->
<div style="width:100%;height:1300px;border:;text-align:center;">


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
		<div class="select">
			객실: <select name="room"> 
				<option value="">객실 수</option>
				<option value="1" <c:if test="${room eq 1}">selected="selected"</c:if> >1개</option>
				<option value="2" <c:if test="${room eq 2}">selected="selected"</c:if> >2개</option>
				<option value="3" <c:if test="${room eq 3}">selected="selected"</c:if> >3개</option>
				<option value="4" <c:if test="${room eq 4}">selected="selected"</c:if> >4개</option>
				<option value="5" <c:if test="${room eq 5}">selected="selected"</c:if> >5개</option>
			</select>
			인원: <select name="person"> 
				<option value="">인원</option>
				<option value="1" <c:if test="${adult eq 1}">selected="selected"</c:if> >1명</option>
				<option value="2" <c:if test="${adult eq 2}">selected="selected"</c:if> >2명</option>
				<option value="3" <c:if test="${adult eq 3}">selected="selected"</c:if> >3명</option>
				<option value="4" <c:if test="${adult eq 4}">selected="selected"</c:if> >4명</option>
				<option value="5" <c:if test="${adult eq 5}">selected="selected"</c:if> >5명</option>
			</select>
		</div>
		

	<!-- 	<a href="/TripINN/house/houseMain.do" onclick="preSearch();" class="pre_srch_submit">
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
			<span><a href="/house/houseMain.do">전체보기>></a></span>
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
			<span><a href="">전체보기>></a></span>
		</div>
		<!-- 트립 미리보기 리스트 출력 -->
			
		<div class="pre_List">
		<ul>
			<c:forEach items="${tripList}" var="tripList" varStatus="stat">
			
				<!-- 트립 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="tripViewURL" value="/trip/tripDetail.do">
					<c:param name="trip_idx" value="${tripList.TRIP_IDX}"/>
					<c:param name=""/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<li>
				<a href="${tripViewURL}">
					<img src="<%= cp %>/images/trip/${tripList.TRIP_IMAGE}" class="houseImage" alt="트립 사진"/>
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