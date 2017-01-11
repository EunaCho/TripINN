<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/TripINN/css/photo.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/TripINN/css/house/main.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
var curNum = 1;
	function newShowHotelPhotoPageNum(HotelCD, curNum) {
	    ShowBackLayer();
	    var objId = document.getElementById('HotelPhotoView');  //팝업레이어
	    objId.innerHTML = virtualGET('/global/ajax/newHotelPhotoView.aspx?HotelCD=' + HotelCD + "&CurrentPage=" + curNum);
	    ShowPhotoLayer('HotelPhotoView');
	}
	function ShowBackLayer() {
		var div = document.getElementById("divBackGround");
		if (div) {
		   div.style.display = "block";
		}
	}
	function HideBackLayer() {
		var div = document.getElementById("divBackGround");
			if (div) {
			div.style.display = "none";
		}
	}    
 	function HideLayer(layerID){
	    var objId = document.getElementById(layerID);
	    if (objId) objId.style.display = "none";
	}

	
	function newShowHotelPhoto(trip_idx) {
        ShowBackLayer();
        var objId = document.getElementById('HotelPhotoView');  //팝업레이어
        $.ajax({
    		url: "/TripINN/tripPhotoInfo.do",
    		type: "POST",
    		async:true,
    		dataType: "Text", 
    		data: {"trip_idx": trip_idx, "curNum": curNum},
    		success: function(data) {
    			$("#HotelPhotoView").html(data);
    		}
    	});
        ShowPhotoLayer('HotelPhotoView');
    }
	function ShowPhotoLayer(layerID) {
        var layer = $(layerID);
        
        $('#' + layerID).css("display", "block");
        var pHeight = $('#' + layerID).height();
        var pWidth = $('#' + layerID).width()
        
        if(pHeight == 0) {
        	pHeight = 428;
        	pWidth = 637;
        }
        var popMargTop = (pHeight + 80) / 2;
        var popMargLeft = (pWidth + 80) / 2;
        $('#' + layerID).css({ 'margin-left': -popMargLeft, 'margin-top': -popMargTop });
    }
	function fnGoodsPhotoGalleryPrev(HotelCD, curNum, totalPage) {
        if (curNum == 1) {
            alert('첫페이지 입니다.');
        } else {
            curNum--;
            newShowHotelPhotoPageNum(HotelCD, curNum);
        }
    }

    function fnGoodsPhotoGalleryNext(HotelCD, curNum, totalPage) {
        if (curNum == totalPage) {
            alert('마지막 페이지 입니다.');
        } else {
            curNum++;
            newShowHotelPhotoPageNum(HotelCD, curNum);
        }
    }
    function fnGoodsPhoto1(idx, img, MemberID, RegDT, ImgNM) {
        
        $('#HotelPhotoView #img_photo_id').html('by TripINN');
		$('#HotelPhotoView #img_photo_big_image').attr('src', img);
        $('#HotelPhotoView #img_photo_nm').html(ImgNM + '&nbsp;');

    }
   function searchArea(area) {
	   var form = document.formArea;
	   form.area.value = area;
	   form.submit();
   } 
   function tripDetail(idx) {
	   var form = document.formDetail;
	   form.trip_idx.value = idx;
	   form.submit();
   }
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
<style>
	#wrap{ width:100%;height:100%;padding:0px; display: table; margin:0px auto; margin-bottom:20px;}
	.list-container{ width:1000px; height:auto; margin:20px auto;margin-bottom:20px; display: flex; }
	.list-left { width:15%;height:auto;float:left;
	background:#1E6198 url(/TripINN/images/trip_pass.png) no-repeat center bottom;
    
 }
	.list-right { width:84%; height:auto; min-height:350px;border: 1px solid #a6a6a6;float:left; }
	.right-con { width:90%; height:100%; border: 0px solid green;margin:0px auto; display: block; }
	.right-top { width:100%;margin-top:10px;height:35px; }
	.right-middle { width:100%; height:70%; margin:10px auto; text-align:center; display:table; }
	
	.top-area { width:12.5%; text-align:center; height:30px; float:left; padding-top:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;font-weight:bold; }
	.top-area:hover {border-bottom:5px solid #1E6198;cursor:pointer;}
	
	.right-middle .trip-info { width: 30%; float:left; height:300px;  margin:10px;}
	.trip-info .trip-img { width:98%; height:200px; background-size:100% 100%; background-repeat: no-repeat; border-radius:5px;}
	.trip-info .trip-info-ment { width:100%; }
	.trip-info-ment div {width:92%;padding:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;
						 font-size:13px;font-weight:bold;}
	.trip-info-ment .info1 {text-align:left;color:#0886C4;}
	
	.trip-info-ment .info1 span {color:#000;font-size:11px;}
	h1, h2, h3 {color:#fff;}
	font {font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;}
	#selected { border-bottom:5px solid #1E6198; color:#cb4242; background-color:#f8f8f8; }
</style>
<form action="/TripINN/tripSearchArea.do" method="post" name="formArea">
	<input type="hidden" name="area"  value=""/>
</form>
<form action="/TripINN/tripDetail.do" method="post" name="formDetail">
	<input type="hidden" name="trip_idx" value=""/>
</form>

<div id="wrap">
<div id="divBackGround" style="display: none; background-color: #fff; filter: alpha(opacity=50); opacity: 0.5; position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 50;"></div>
<div id="HotelPhotoView" class="popContainer02" style="display: block; position: fixed; top: 50%; left: 50%; z-index: 100;"></div>
	<hr />
	
	<div id="header_container">
	<form id="house_searchForm" method="POST" action="/TripINN/house/houseMain.do">
 
	<div>
		<label>위치</label>
		<input class="location" type="text" name="preSearch_keyword" placeholder="여행지, 트립 유형" value="${search.preSearch_keyword}">
	</div>
	<div>
		<div>
		<label>체크인</label>
		<input class="checkinout" type="text" name="hri_first_date" id="datepicker_in" value="${search.hri_first_date}" placeholder="체크인" >
		</div>
		<div><img src="/TripINN/images/arrow.png"  style="width:30px;"></div>
		<div>
		<label>체크아웃</label>
		<input class="checkinout" type="text" name="hri_last_date" id="datepicker_out" value="${search.hri_last_date}" placeholder="체크아웃">
		</div>
	</div>

	<div style="margin-left:30px;">
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
		<input type="image" id="searchBtn" src="/TripINN/images/searchBtn.png">
	</form>	
</div>
	
	<hr />
	<div class="list-container">
		<div class="list-left">
		<div style="width:100%;height:100%;text-align:center;margin:50px auto;">
			<h1 style="margin-top:50px;">Local</h1>
				<h2>Trip ${area }</h2>
		</div>
		</div>
		<div class="list-right">
			<div class="right-con">
				<div class="right-top">
					<div class="top-area" onclick="searchArea('서울')" <c:if test="${area eq '서울' || area == null}">id="selected"</c:if>>서 울</div>
					<div class="top-area" onclick="searchArea('인천')" <c:if test="${area eq '인천' }">id="selected"</c:if> >인 천</div>
					<div class="top-area" onclick="searchArea('경기')" <c:if test="${area eq '경기' }">id="selected"</c:if>>경 기</div>
					<div class="top-area" onclick="searchArea('강원')" <c:if test="${area eq '강원' }">id="selected"</c:if>>강 원</div>
					<div class="top-area" onclick="searchArea('충청')" <c:if test="${area eq '충청' }">id="selected"</c:if>>충 청</div>
					<div class="top-area" onclick="searchArea('전라')" <c:if test="${area eq '전라' }">id="selected"</c:if>>전 라</div>
					<div class="top-area" onclick="searchArea('경상')" <c:if test="${area eq '경상' }">id="selected"</c:if>>경 상</div>
					<div class="top-area" onclick="searchArea('제주')" <c:if test="${area eq '제주' }">id="selected"</c:if>>제 주</div>
				</div>
				<hr style="margin-top:-1px;width:100%;" />
				<div class="right-middle">
				<c:if test="${empty list }">
					<div style="width:100%;height:100%;background-color:#F8F8F8;padding-top:120px;">
						<h2><font style="color:#000;font-size:20px;margin-top:100px;">조회된 결과가 없습니다.</font></h2>
					</div>
				</c:if>
				<c:forEach var="trip" items="${list }" >
				<c:set var="fullImg" value="${trip.TRIP_IMAGE }"/>
					<c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
					<div class="trip-info">
						<div class="trip-img" style="background-image:url('/TripINN/images/trip/${tripImg }');cursor:pointer;"
							onclick="newShowHotelPhoto('${trip.TRIP_IDX}')"></div>
						<div class="trip-info-ment">
							<div class="info1">
								${trip.TRIP_NAME } [ ${trip.TRIP_TYPE } ] 
								<span style="float:right">
									최대 <font color="#cb4242">${trip.TRIP_PERSONS}</font> 명
								</span>
								<br />
								<span>
								${trip.TRIP_ADDR1 } <br />
								<fmt:formatDate value="${trip.TRIP_FIRST_DATE }"/>
								 ~
								  <fmt:formatDate value="${trip.TRIP_LAST_DATE }"/>
								 </span>
							</div>
							<div style="color:#cb4242;text-align:right;">
								<div style="width:120px;float:left;margin-top:-8px;text-align:left;margin-left:-15px;">
								<img src="http://openimage.interpark.com/tourpark/tour/common/button/btn_detail_view02.gif"
									style="cursor:pointer" width="70px" height="25px" onclick="tripDetail('${trip.TRIP_IDX}');"/>
								<img src="http://openimage.interpark.com/tourpark/tour/sub_depth/icon_search.gif"
									 alt="포토" style="cursor:pointer" onclick="newShowHotelPhoto('${trip.TRIP_IDX}')">
								</div>
								<img style="width:11px;height:11px;"
									src="http://openimage.interpark.com/tourpark/tour/common/icon/icon_won_pink.gif" />
								<fmt:formatNumber>${trip.TRIP_PPRICE }</fmt:formatNumber>
								<font>원</font>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>

		</div>
	</div>
</div>
<div style="width:100%; height:50px;"></div>
<div style="clear:both;"></div>
