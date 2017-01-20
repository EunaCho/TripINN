<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services"></script>

<link rel="stylesheet" href="/TripINN/css/trip/trip.css" />
<link rel="stylesheet" href="/TripINN/css/trip/slide.css" />
<link href='/TripINN/css/trip/jquery.rating.css' type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/TripINN/css/house/message.css">

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/TripINN/js/trip/jquery-1.11.3.min.js" type="text/javascript" data-library="jquery" data-version="1.11.3"></script>
<script src="/TripINN/js/trip/jssor.slider-22.0.15.mini.js" type="text/javascript" data-library="jssor.slider.mini" data-version="22.0.15"></script>
<script src='/TripINN/js/trip/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='/TripINN/js/trip/jquery.rating.js' type="text/javascript" language="javascript"></script>
<script src="/TripINN/js/trip/main.js" type="text/javascript"></script>
<script   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/TripINN/js/trip/message.js"></script>
<script>
var member_idx = "${sessionScope.member_idx}";
var fav = "${trip.FAV}";
var favNum = 0;
	function tripReserve() {
		if(member_idx != null && member_idx!="") {
			var rform = document.rform;
			rform.action = "/TripINN/tripReserveForm.do";
			rform.submit();
		} else {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
	}
	function review() {
		var reviewForm = document.reviewForm;
		
		if(reviewForm.trb_content.value == "") {
			alert("리뷰를 작성해 주세요.");
			return;
		}
		if(member_idx != null && member_idx!="") {
			reviewForm.action = "/TripINN/tripReview.do";
			reviewForm.submit();
		} else {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
	}
	
	function r_like(index, spanTag, trb_idx, trip_idx) {
		var cnt = 0;
		if(member_idx != null && member_idx!="") {
			if(spanTag.style.backgroundColor == "rgb(255, 235, 240)") {  // 추천을 취소할 때
				spanTag.style.backgroundColor = "#fff";
				cnt = -1;
				$.ajax({
					url: "/TripINN/reviewLike.do",
					type: "GET",
					async:true, 
					dataType: "Text", 
					data: {"trb_idx": trb_idx, "cnt": cnt, "member_idx":member_idx, "trip_idx": trip_idx},
					success: function(data) {
						$("#cu_cnt"+index).html(data);
					}
				});
			} else { // 추천 눌렀을 떄
				spanTag.style.backgroundColor = "rgb(255, 235, 240)";
				cnt = 1;
				$.ajax({
					url: "/TripINN/reviewLike.do",
					type: "GET",
					async:true,
					dataType: "Text", 
					data: {"trb_idx": trb_idx, "cnt": cnt, "member_idx":member_idx, "trip_idx": trip_idx},
					success: function(data) {
						$("#cu_cnt"+index).html(data);
					}
				});
			}
			
			
		} else {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
	}
	//즐겨찾기 기능
	function tripFav(idx) {
		if(member_idx != null && member_idx!="") {
			var cnt = 0;
			if($("#heartImg").attr("class")=="heartImg " || $("#heartImg").attr("class")=="heartImg") { //즐겨찾기 추가 
				var _url = "/TripINN/tripBookmark.do";
				$("#heartImg").attr("class", "heartImg on");
			} else { // 삭제
				cnt = -1;
				var _url = "/TripINN/tripBookmarkDelete.do";
				$("#heartImg").attr("class", "heartImg");
			}
			
			$.ajax({
				url: _url,
				type: "GET",
				async:true,
				dataType: "Text", 
				data: {"trip_idx": idx, "cnt": cnt, "member_idx":member_idx},
				success: function(data) {
					
				}
			});
		} else {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
	}
	function fn_search(pageNo){
        var reviewForm = document.reviewForm;
        reviewForm.action = "/TripINN/tripDetail.do";
        reviewForm.currentPageNo.value = pageNo;
        reviewForm.submit();
    }
</script> 
<style>
.heartImg { width:25px;height:25px;float:right;margin:20px;margin-right:50px;cursor:pointer;
			background-image:url(/TripINN/images/house/icon_heart_white.png);background-size:100% 100%;background-repeat: no-repeat; }
.heartImg:hover {background-image:url(/TripINN/images/house/icon_heart_red.png);}
.on{background-image:url(/TripINN/images/house/icon_heart_red.png);}
.reserve_layerWindow { display:none; }
</style>
<form name="rform" method="post">
	<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX}"/>
</form>

<form action="">
	<input type="hidden" id="receiveEmail" value="${trip.MEMBER_EMAIL }"/>
	<input type="hidden" id="trip_idx" value="${trip.TRIP_IDX }"/>
</form>
<hr style="margin:0px;padding:0px;"/>
<div id="wrap">
	<div id="left-wrap">
		<div id="left-info">
			<div class="trDiv">
				<div class="tdDiv-col" style="height:auto;">
					<p style="float:left;margin-top:10px;"><b><font style="font-size:20px;">${trip.TRIP_NAME }</font> - ${trip.TRIP_AREA }</b></p>
					<span class="heartImg <c:if test='${trip.FAV != 0 }'>on</c:if>" 
						id="heartImg"  title="즐겨찾기" onclick="tripFav('${trip.TRIP_IDX}');">
					</span>
				</div>
				
			</div>
			<div class="trDiv">
				<div class="tdDiv-col">
				<p>
				<fmt:formatDate value="${trip.TRIP_FIRST_DATE }" pattern="yyyy-MM-dd HH:mm"/> - 
				<fmt:formatDate value="${trip.TRIP_LAST_DATE }" pattern="yyyy-MM-dd HH:mm"/> 
				 일정의 <b><font color="#1E6198">${trip.TRIP_TYPE }</font></b> 트립</p>
				
				<p style="width:350px;float:left;">호스트 : <b><font color="#1E6198">${trip.MEMBER_NAME }</font></b> 님
					<div style="margin-top: 10px;width:150px;height:50px;">
                        <button type="button" class="btn btn-primary btn-lg"
                           data-toggle="modal" data-target="#Message">메시지 보내기</button>
                     </div>
					<div style="width:150px;height:auto;float:right;margin-top:-50px;margin-right:-30px;">
						<img src="/TripINN/images/member/${trip.MEMBER_IMAGE }" class="hostImg"/>
					</div>
				</p>
				</div>
			</div>
			
			<div class="trDiv" style="background-color:#F9F9F9;margin:10px auto;">
				<div class="includ">
					<h3>포함사항</h3>
					<div class="txt">
		                <span style="BACKGROUND: #ffffff; FONT-SIZE: 9pt; mso-fareast-font-family: 굴림">
		                	<p class="cts">
		                	<c:forEach items="${trip.TRIP_INCLUDE}" var="inc" varStatus="status">
		                		${inc}
		                		<c:if test="${!status.last}">
		                		,
		                		</c:if>
		                	</c:forEach></p>
		                </span>
            		</div>
				</div>
				<div class="includ not">
					<h3>불포함사항</h3>
					<div class="txt">
		                <span style="BACKGROUND: #ffffff; FONT-SIZE: 9pt; mso-fareast-font-family: 굴림">
		                	<p class="cts">
		                	<c:forEach var="notInc" items="${trip.TRIP_NOT_INCLUDE }" varStatus="stat">
		                		${notInc }
		                		<c:if test="${!stat.last }">
		                		,
		                		</c:if>
		                	</c:forEach>
		                	</p>
		                </span>
            		</div>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>트립 소개</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_INTRO }</p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>진행 언어</p></div>
				<div class="tdDiv-right"><p>${trip.TRIP_LANGUAGE } </p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>예약 가능 인원</p></div>
				<div class="tdDiv-right">
				<c:if test="${trip.TRIP_PERSONS - trip.RESERVED_NUM <= 0}">
					<p><b><font color="#cb4242">예약이 가득찼습니다. 다른 트립을 이용해주세요.</font></b></p>
				</c:if>
				<c:if test="${trip.TRIP_PERSONS - trip.RESERVED_NUM > 0}">
					<p style="float:left;"><b>${trip.RESERVED_NUM } 명 / </b></p>
					<p style="float:left;margin-left:10px;"><b>${trip.TRIP_PERSONS } 명</b></p>
					<p style="float:left;margin-left:10px;">
						(총 <b><font color="#cb4242">${trip.TRIP_PERSONS - trip.RESERVED_NUM }</font></b> 명 예약 가능합니다.)
					</p>
				</c:if>						
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>집합 장소</p></div>
				<div class="tdDiv-right">
					<p>
						[${trip.TRIP_ZIPCODE}] ${trip.TRIP_ADDR1 } ${trip.TRIP_ADDR2 } ${trip.TRIP_ADDR3 }
					</p>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>1인당 비용</p></div>
				<div class="tdDiv-right"><p><fmt:formatNumber>${trip.TRIP_PPRICE }</fmt:formatNumber> 원
				 </p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>호스트 연락처</p></div>
				<div class="tdDiv-right"><p>${trip.MEMBER_PHONE } // ${trip.MEMBER_EMAIL } </p></div>
			</div>
			<hr />
			<div class="trDiv" style="margin-top:20px;">
				<div class="tdDiv-col">
					<div style="width:20%;height:40px;background:orange;color:#fff;  margin-right:30px;
						text-align:center;  border-radius: 15px; padding:6px; float:left; padding-top:10px;
						cursor:pointer" onclick="r_confirm('open')">
							<b>트립 신고</b>
					</div>
					
					<div style="width:20%;height:40px;background:#00A2E8;color:#fff; 
					text-align:center;  border-radius: 15px; padding:6px;float:right; margin-right:50px;
					cursor:pointer; padding-top:10px;" 
			<c:if test="${trip.TRIP_PERSONS - trip.RESERVED_NUM > 0}">onclick="tripReserve();"</c:if>
			<c:if test="${trip.TRIP_PERSONS - trip.RESERVED_NUM <= 0}">onclick="alert('예약이 가득찼습니다. 다른 트립을 이용해주세요.');"</c:if>
			>
						<b>트립 신청</b>
					</div>
					<div style="width:20%;height:40px;background:#cb4242;color:#fff;  margin-right:30px;
						text-align:center;  border-radius: 15px; padding:6px; float:right; padding-top:10px;
						cursor:pointer" onclick="location.href='/TripINN/tripList.do'">
							<b>이전으로</b>
					</div>
				</div>
			</div>
<form name="reviewForm" method="post">
<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX}"/>
<input type="hidden" name="member_idx" value="${sessionScope.member_idx}"/>
<input type="hidden" id="currentPageNo" name="currentPageNo"/>
			<div class="trDiv">
				<div class="tdDiv-col" style="margin-top:20px;">
					<div class="Clear" style="height:50px;float:left;width:120px;margin-top:10px;">
					
					 <input class="star" type="radio" name="trb_star" value="1" />
					 <input class="star" type="radio" name="trb_star" value="2" />
					 <input class="star" type="radio" name="trb_star" value="3" />
					 <input class="star" type="radio" name="trb_star" value="4" />
					 <input class="star" type="radio" name="trb_star" value="5" checked="checked" />
					</div>
					<textarea name="trb_content" id="trb_content" cols="50" rows="3" style="float:left;"
						 placeholder="이곳에 후기를 남겨주세요."></textarea>
					<div style="width:10%;height:30px;background:#363636;color:#fff; margin-left:30px;
						text-align:center;  padding:7px; float:left;
						cursor:pointer" onclick="review();">
						<b>등록</b>
					</div>
				</div>
			</div>
			<hr />
			<!-- 후기 리스트 -->
			<c:if test="${subMap.TOTAL_CNT > 0}">
				<fmt:formatNumber var="sum" value="${subMap.STAR_SUM}" pattern="#.##"/>
				<fmt:formatNumber var="cnt" value="${subMap.TOTAL_CNT}" pattern="#.##"/>

			<div class="trDiv">
				<div class="tdDiv-col">
					<span style="float:left;width:80px;font-size:14px;"><b>후기 ${cnt } 개 </b></span> 
					<div style="PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 87px; float:left;	PADDING-TOP: 0px;	HEIGHT: 18px; margin:0px auto;">
							<p style="WIDTH: ${sum * 20 / cnt}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
							</p>
					</div>
					<span style="float:left;width:80px;font-size:14px;margin-left:10px;">
					<b><font color="#cb4646">
					<fmt:formatNumber value="${sum / cnt}" pattern="#.#"/>점 </font></b>
					</span>
				</div>
			</div>
			<hr />
			
			<c:forEach items="${rlist }" var="rlist" varStatus="stat">
			<div class="trDiv" style="border-bottom:1px solid #a6a6a6;">
				<div class="tdDiv-left" style="font-size:12px;width:20%;height:auto;font-family:'Nanum Gothic',malgun Gothic,dotum;padding:5px;">
					<img src="/TripINN/images/member/${rlist.MEMBER_IMAGE }" class="hostImg" /><br />
					<span style="padding:3px;">${rlist.MEMBER_NAME } 님</span>
					<div style="CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 90px;	PADDING-TOP: 0px;	HEIGHT: 18px; margin:0px auto;">
						<p style="WIDTH: ${rlist.TRB_STAR * 20}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
						</p>
					</div>
					<span style="padding:5px;font-size:11px;color:#a6a6a6;">
						<fmt:formatDate value="${rlist.TRB_REGDATE }" pattern="yy-MM-dd" />
					</span>
				</div>
				<div class="tdDiv-right" id="tdDiv-right${stat.index}" style="font-size:12px;display:;height:auto;font-family:'Nanum Gothic',malgun Gothic,dotum;padding:5px;padding-top:10px;padding-bottom:10px;">
					 ${fn:substring(rlist.TRB_CONTENT,0, 100) }
					 <c:if test="${rlist.TRB_CONTENT.length() > 100}">
					 <br />
					 	<span style=""><a href="javascript:moreReview('${stat.index}', '${rlist.TRB_CONTENT}')"
					 	 style="text-decoration:underline;color:#cb4242;">
					 	 		<b>+더보기</b></a>
					 	 </span>
					 </c:if>
				</div>
				<!-- //////////삭제버튼////////////// -->
				
				<c:if test="${rlist.M_IDX eq sessionScope.member_idx }">
				<div style="width:20px;height:20px;margin-right:10px;margin-top:10px;float:right;cursor:pointer;
					background-image:url(/TripINN/images/xxx.png); 
						background-repeat:no-repeat; background-size:100% 100%;"
						onclick="reviewDelete('${rlist.TRB_IDX}');"></div>
				</c:if>
				<!-- ///////////추천 버튼////////// -->
				<span id="cu${stat.index}" class="cu" 
				 style="width:100px;height:33px;float:right;margin-top:7%;vertical-align:middle;text-align: center;
				border:1px solid #c4c4c4;border-radius:10px;padding-top:3px;margin-bottom:10px;cursor:pointer;
				<c:forEach items='${likeList}' var='lList'>
					<c:if test='${lList.TRB_IDX eq rlist.TRB_IDX }'>
					background-color:rgb(255, 235, 240);
					</c:if>
				</c:forEach>"
				onclick="r_like('${stat.index}', this, '${rlist.TRB_IDX }', '${trip.TRIP_IDX}');">
				
					<span style="width:22px;height:22px;margin-top:3px;background-image:url(/TripINN/images/cu33.png);
						background-size: 100%;background-repeat:no-repeat;float:left;margin-left:7px;">
					</span>
				 	<span style="float:left;margin-top:3px;margin-left:3px;">
				 		<font style="font-size:12px;"> 추천 |</font>
				 		<font style="font-size:12px;color:#a6a6a6;" id="cu_cnt${stat.index}">${rlist.TRB_LIKE} 개</font>
				 	</span>
				</span>
				<!-- ///////////추천 버튼////////// -->
			</div>
			</c:forEach>
			
			<!-- ///////////////페이징처리/////////////// -->	
			<style>
			#pagingDiv {height:40px;}
			#pagingDiv a { font-size:12px;width:20px; height:20px; border:1px solid #a6a6a6; margin-right:5px; border-radius:7px;padding:7px;}
			#pagingDiv a:hover {background-color:rgb(255, 235, 240);}
			#pagingDiv strong { font-size:12px;border:1px solid #a6a6a6;border-radius:7px;padding:7px;color:#cb4646;margin-right:5px;}
			</style>			
			<c:if test="${not empty paginationInfo}">
			<div class="trDiv">
				<div class="tdDiv-col" id="pagingDiv" style="text-align:center;height:30px;margin-top:10px;">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
        		</div>
        	</div>
    		</c:if>
     		<!-- ///////////////페이징처리/////////////// -->
     		</c:if>
</form>
		</div>
		
	</div>
	
	<div id="right-wrap">
		<div class="right-info">
			<div class="trDiv" style="margin:20px;">
				<div class="tdDiv-col">
	<!-- 슬라이드 시작 -->		
	<div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 500px; 
	height: 456px; overflow: hidden; visibility: visible; background-color: #24262e; "> 
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('/TripINN/images/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 500px; height: 356px; overflow: hidden;">

              <c:forEach items="${imgs}" var="img" varStatus="status">
           <div data-p="144.50" <c:if test="${status.index != 0 }">style="display:none;"</c:if>>
              	<img data-u="image" src="/TripINN/images/trip/${img}" />
              	<img data-u="thumb" src="/TripINN/images/trip/${img}" style="width:70px;height:70px;"/>
           </div>
        </c:forEach>
         <c:forEach items="${imgs}" var="img" varStatus="status">
           <div data-p="144.50" style="display:none;">
              	<img data-u="image" src="/TripINN/images/trip/${img}" />
              	<img data-u="thumb" src="/TripINN/images/trip/${img}" style="width:70px;height:70px;"/>
           </div>
        </c:forEach>
            <a data-u="any" href="http://www.jssor.com" style="display:none">Image Gallery</a>
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort01" style="position:absolute;left:0px;bottom:0px;width:500px;height:100px;" data-autocenter="1" jssor-slider="true">
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
        <span data-u="arrowleft" class="jssora05l" style="top:158px;left:8px;width:40px;height:40px;"></span>
        <span data-u="arrowright" class="jssora05r" style="top:158px;right:8px;width:40px;height:40px;"></span>
    </div>
</div>
				
<!-- 슬라이드 끝 -->		
				
				
			</div>
			<div class="trDiv" style="margin:20px;">
				<div class="tdDiv-col">
					<div id="map" style="width:550px;height:400px;"></div>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new daum.maps.LatLng(${lat}, ${lng}), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// 마커가 표시될 위치입니다 
						var markerPosition  = new daum.maps.LatLng(${lat}, ${lng}); 
					
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
						    position: markerPosition,
						    title: "${ba}"
						});
					
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
					</script>
				</div>
			</div>
		</div>
	</div>
	
<form action="/TripINN/tripReport.do" method="post" name="reportForm">
<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX }" />
<input type="hidden" name="member_idx" value="${sessionScope.member_idx }" />
<input type="hidden" name="report_state" value="0" /> <!-- 0 진행중, 1 경고, 2 삭제 -->
<input type="hidden" name="report_type" value="2" /> <!-- 0 숙소신고, 1 투어신고 -->
<div class="report_layerWindow">

	 <div class="bg"></div>
	 <div id="report_layer">
	 	<h2 style="border-bottom:1px solid black;">신고하기</h2>
	 	<p>허위 신고시 불이익을 당할 수 있습니다.</p>
		 <div class="login_line">
		 	<div class="box_in">

		 		<input type="text" name="report_title" id="" placeholder="제목" style="width:450px;height:30px;padding:5px;"><br />
				<textarea name="report_content" placeholder="내용" style="width:450px;height:200px;padding:5px;"></textarea>
			</div>
			<div style="clear:both;"></div>
		 </div>

	    <div class="close" >
          <table width="100%" id="reportTbl">
             <tr>
                <td width="100%" align="right" style="text-align:right;">
                    <a href="javascript:r_confirm('close')" title="레이어 닫기" class="btn_login" >닫기</a>
                	<a href="javascript:tripReport();" class="btn_login" style="color:red" >신고하기</a>
                </td>
             </tr>
          </table>
       </div>
	 </div>
</div>
</form>
</div>
<form name="reviewDel" action="/TripINN/reviewDel.do" method="post">
	<input type="hidden" name="trb_idx" value="" />
	<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX}" />
</form>

<style>

.report_layerWindow{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.report_layerWindow.open{display:block}
.report_layerWindow .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#report_layer{
	position:absolute;width:500px;top:20%;left:35%;margin:0px auto;padding:0px 28px 0 28px;
	border:2px solid #9BC3FF; background:#fff;font-size:12px;font-family:Tahoma, Geneva, sans-serif;
	color:#767676;line-height:normal;white-space:normal; 
}
.login_line{margin:10px 0 0;height:300px;}
.box_in{float:left;margin:0 10px 0; }
.box_in input{width:120px;height:24px;display:block;margin:3px 0 0;}
.btn_login{
			width:72px;background:#363636;color:#a6a6a6;float:right;
			text-align:center;margin-top:5px;margin:10px;
			cursor: pointer;
			}
#report_layer h2{color:#636363;font-size:24px;line-height:40px;}
.close { margin-bottom:10px; text-decoration: none; width:100%; text-align:right; cursor: pointer}
.close a { color: #9BC3FF; }
#reportTbl tr td{
	font-size:11px;
	font-family : 'NanumGothic';
}
</style>


<script>
function moreReview(idx, cont) {
	var regExp = /[\'\"]/gm
	var con = cont.replace(/[\'\"]/g, "");
	
	$("#tdDiv-right"+idx).html(con);
}
function reviewDelete(review_idx) {
	if(confirm("삭제 하시겠습니까?")) {
		var form = document.reviewDel;
		form.trb_idx.value = review_idx;
		form.submit();
	}
}
function tripReport() {
	var rform = document.reportForm;
	rform.submit();
	alert("신고가 성공적으로 접수되었습니다.");
}
function r_confirm (confirm) {
	confirm == "open" ? 
			$(".report_layerWindow").css("display", "block") :
				$(".report_layerWindow").css("display", "none");
}
</script>
 <%@ include file="/WEB-INF/views/trip/message.jspf"%>