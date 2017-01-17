<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services"></script>
<script>
 
var containNum = 1;
var createNum = 4;
	$(function () {
	    $("#datepicker").datepicker({
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
	    $("#datepicker2").datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate: new Date(),
	         altField: "#datepicker2",
	         altFormat: "yy-mm-dd"
	  });
	});
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	function fnMove(seq) {
		var offset = $("#tripInfo" + seq).offset();
		$("html, body").animate({scrollTop:offset.top}, 400);
	}
	
	function tripUpdate() {
		var frm = document.form;
		var start_date = frm.date1.value + frm.hour1.value + frm.time1.value;
		var last_date =  frm.date2.value + frm.hour2.value + frm.time2.value;
		start_date = start_date.replace(/-/gi, "");
		last_date = last_date.replace(/-/gi, "");
		
		frm.trip_first_date.value = start_date;
		frm.trip_last_date.value = last_date;
		
		frm.action = "/TripINN/tripUpdate.do";
		frm.submit();
		alert("성공적으로 수정됐습니다.");
	}
	
	
</script>
<style>
	#wrap { width: 100%; min-height:1600px; height:100%; background-color:#eee; }
	#leftDiv { width:15%;background-color:#46649b;min-height:1600px;float:left; height:100%; }
	/* #leftDiv { width:15%;background:url('/TripINN/images/pix2.png') repeat;min-height:1600px;float:left; height:100%; } */
	#rightDiv { width:80%;float:left;margin-left:30px;background-color:#eee;  }
	ul { position: fixed; height:100%; }
	ul li { color:#B9B9B9; margin:7px; list-style: none; font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px; margin-bottom:20px; cursor:pointer;}
	ul li:hover { color:#fff; } 
	.tripInfo { width:100%; margin-bottom: 20px; float:left;}
	.tripInfo div{ width:100%; }
	.tripInfo .text-long { width:500px; height:30px; margin-left:25px; padding:5px; }
	.tripInfo .text-short { width:200px; height:30px; margin-left:25px; padding:5px; float:left; }
	.tripInfo textarea { width:500px;  margin-left:25px; padding:5px; font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px;}
	.tripInfo div .ti, .tripInfo div .ti p { margin-left:25px;float:left; width: 25%; padding:3px; font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px;}
	.tripInfo div .ti { color:#46649b; }
	.tripInfo .inc input[type=checkbox] {margin-left:25px;}
	.tripInfo .inc label {font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif;
	    font-size: 14px;
	    color: #484848 ;}
	#rightDiv .select-long, #rightDiv .select-short {
		font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif;
	    font-size: 14px;
	    color: #484848 ;
	    margin: 5px;
	    margin-left:25px;
	    border: 1px solid #a6a6a6;
	    padding-left: 12px;
	    padding-right: 20px;
	    height: 30px;
	    display: block;
	    width: 25%;
	    float:left;
	}
	
	#rightDiv .select-short {
	    width: 10%;
	}
	
	.imgDiv {
		height: 98px !important;
	    width: 192px !important;
	    border-width: 2px !important;
	    border-color: #DBDBDB !important;
	    border-style: dashed !important;
	    border-radius: 10px !important;
	    margin-left: 25px;
	    float:left;
	}
	.hiddenImg {
		width:192px;
		height:95px;
		display: none;
	}
	.imgDiv .emptyFrame {
		height: 100%;
    	cursor: pointer;
    	display: block;
	    padding-top: 9px;
	    padding-bottom: 8px;
	}
	.va-container-v {
	    height: 100%;
	}
	.va-container {
	    display: table;
	    position: relative;
	}
	.va-middle {
	    vertical-align: middle;
	    display: table-cell;
	}
	.text-center {
	    text-align: center;
	}
	.textContainer {
	    width: 188px !important;
	}
	.plusSign {
	    color: #00A699 !important;
	    font-size: 40px !important;
	    font-weight: 200 !important;
	}
	.imgPlus div { cursor:pointer; }
	.imgPlus div p { margin-left:25px; }
	.imgPlus div p, .imgPlus span { float:left; font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:13px; }
	.imgPlus div span {float:left;width:25px;height:25px;background-image:url('http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons/black-white-pearls-icons-alphanumeric/069304-black-white-pearl-icon-alphanumeric-plussign1.png');background-size:100%;margin-top:8px;}
	.wrap-container { width:100%; height:100px; padding-top:10px;}
	
	.addrDiv .lab { display: inline-block;width:100px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif; font-size:12px;margin-left:20px; }
	.addrDiv .input-small { width:150px; height:20px; padding:5px; margin:5px; }
	.addrDiv .input-large { width:350px; height:20px; padding:5px; margin:5px; }
</style>
<div id="wrap" style="margin-top:2px;">
	<div id="leftDiv">
		<ul>
		<div style="color:#fff;height:30px;"><h4>트립 정보 입력</h4></div>
			<li onclick="fnMove('1')">카테고리</li>
			<li onclick="fnMove('2')">트립 제목  & 소개</li>
			<li onclick="fnMove('3')">시간</li>
			<li onclick="fnMove('4')">사진</li>
			<li onclick="fnMove('5')">제공내역</li>
			<li onclick="fnMove('6')">장소</li>
			<li onclick="fnMove('7')">비용</li>
			<li>최종등록</li>
		</ul>
	</div>
	
	<form name="form" id="form" enctype="multipart/form-data" method="post">
	<input type="hidden" name="trip_idx" value="${trip.TRIP_IDX }" />
	<input type="hidden" name="trip_first_date" value="" />
	<input type="hidden" name="trip_last_date" value="" />
	<input type="hidden" name="trip_pprice" value=""/>
	<input type="hidden" name="trip_tprice" value=""/>
	<div id="rightDiv">
		<div id="tripInfo1" class="tripInfo">
			<h3>카테고리</h3>
			<div style="width:100%;">
				<div class="ti">지역</div>
				<div class="ti">유형</div>
				<div class="ti">언어</div>
			</div>

					
			<select name="trip_area" id="" class="select-long">
				<option value="">도시 선택</option>
				<option value="서울" <c:if test="${trip.TRIP_AREA eq '서울'}">selected="selected"</c:if> >서울</option>
				<option value="인천" <c:if test="${trip.TRIP_AREA eq '인천'}">selected="selected"</c:if>>인천</option>
				<option value="경기" <c:if test="${trip.TRIP_AREA eq '경기'}">selected="selected"</c:if>>경기</option>
				<option value="강원" <c:if test="${trip.TRIP_AREA eq '강원'}">selected="selected"</c:if>>강원</option>
				<option value="충청" <c:if test="${trip.TRIP_AREA eq '충청'}">selected="selected"</c:if>>충청</option>
				<option value="전라" <c:if test="${trip.TRIP_AREA eq '전라'}">selected="selected"</c:if>>전라</option>
				<option value="경상" <c:if test="${trip.TRIP_AREA eq '경상'}">selected="selected"</c:if>>경상</option>
				<option value="제주" <c:if test="${trip.TRIP_AREA eq '제주'}">selected="selected"</c:if>>제주</option>
			</select>
			<select name="trip_type" id="" class="select-long">
				<option value="">유형 선택</option>
				<option value="엔터테인먼트" <c:if test="${trip.TRIP_TYPE eq '엔터테인먼트'}">selected="selected"</c:if>>엔터테인먼트</option>
				<option value="예술 및 디자인" <c:if test="${trip.TRIP_TYPE eq '예술 및 디자인'}">selected="selected"</c:if>>예술 및 디자인</option>
				<option value="패션" <c:if test="${trip.TRIP_TYPE eq '패션'}">selected="selected"</c:if>>패션</option>
				<option value="스포츠" <c:if test="${trip.TRIP_TYPE eq '스포츠'}">selected="selected"</c:if>>스포츠</option>
				<option value="웰빙" <c:if test="${trip.TRIP_TYPE eq '웰빙'}">selected="selected"</c:if>>웰빙</option>
				<option value="자연" <c:if test="${trip.TRIP_TYPE eq '자연'}">selected="selected"</c:if>>자연</option>
				<option value="음료 및 식사" <c:if test="${trip.TRIP_TYPE eq '음료 및 식사'}">selected="selected"</c:if>>음료 및 식사</option>
				<option value="라이프스타일" <c:if test="${trip.TRIP_TYPE eq '라이프스타일'}">selected="selected"</c:if>>라이프스타일</option>
				<option value="역사" <c:if test="${trip.TRIP_TYPE eq '역사'}">selected="selected"</c:if>>역사</option>
				<option value="음악" <c:if test="${trip.TRIP_TYPE eq '음악'}">selected="selected"</c:if>>음악</option>
				<option value="비즈니스" <c:if test="${trip.TRIP_TYPE eq '비즈니스'}">selected="selected"</c:if>>비즈니스</option>
				<option value="바/클럽" <c:if test="${trip.TRIP_TYPE eq '바/클럽'}">selected="selected"</c:if>>바/클럽</option>
			</select>
			<select name="trip_language" id="" class="select-long">
				<option value="">선택</option>
				<option value="한국어" <c:if test="${trip.TRIP_LANGUAGE eq '한국어'}">selected="selected"</c:if>>한국어</option>
				<option value="영어" <c:if test="${trip.TRIP_LANGUAGE eq '영어'}">selected="selected"</c:if>>영어</option>
				<option value="일본어" <c:if test="${trip.TRIP_LANGUAGE eq '일본어'}">selected="selected"</c:if>>일본어</option>
				<option value="중국어" <c:if test="${trip.TRIP_LANGUAGE eq '중국어'}">selected="selected"</c:if>>중국어</option>
			</select>
		</div>
		<hr />
		<div id="tripInfo2" class="tripInfo">
			<h3>세부사항</h3>
			<div style="width:100%;height:30px;">
				<div class="ti">트립 제목</div>
			</div>
			<div>
				<input type="text" name="trip_name" value="${trip.TRIP_NAME }" placeholder="트립 이름을 입력해주세요." class="text-long"/>
			</div>
			<div style="width:100%;height:30px;margin-top:5px;">
				<div class="ti">트립 소개</div>
			</div>
			<div>
				<textarea name="trip_intro" cols="30" rows="10" placeholder="소개 글을 작성해 주세요.">${trip.TRIP_INTRO }</textarea>
			</div>
			
			<div style="width:100%;height:30px;margin-top:5px;">
				<div class="ti" id="tripInfo3">시작일</div>
			</div>
			<div style="height:50px;">
			<fmt:formatDate var="hour1" value="${trip.TRIP_FIRST_DATE}" pattern="HH"/>
			<fmt:formatDate var="hour2" value="${trip.TRIP_LAST_DATE}" pattern="HH"/>
			<fmt:formatDate var="min1" value="${trip.TRIP_FIRST_DATE}" pattern="mm"/>
			<fmt:formatDate var="min2" value="${trip.TRIP_LAST_DATE}" pattern="mm"/>
				<input type="text" name="date1" id="datepicker" placeholder="시작 일자" class="text-short"
					value='<fmt:formatDate value="${trip.TRIP_FIRST_DATE }" pattern="yyyy-MM-dd"/>'/>
				<select name="hour1" id="" class="select-short">
					<option value="" >시</option>
					<c:forEach var="i" begin="0" end="24">
					<c:if test="${i < 10 }">
						<c:set var="h1" value="0${i}" />
					</c:if>
					<c:if test="${i >= 10 }">
						<c:set var="h1" value="${i}" />
					</c:if>
						<option value="${h1 }"
						<c:if test="${hour1 == h1}">selected="selected"</c:if>
						>${h1 }시</option>
					</c:forEach>
				</select>
				<select name="time1" id="" class="select-short">
					<option value="" selected="selected">분</option>
					<c:forEach var="i" begin="0" end="59">
					<c:if test="${i < 10 }">
						<c:set var="m1" value="0${i}" />
					</c:if>
					<c:if test="${i >= 10 }">
						<c:set var="m1" value="${i}" />
					</c:if>
						<option value="${m1 }"
						<c:if test="${min1 == m1}">selected="selected"</c:if>
						>${m1 }분</option>
					</c:forEach>
				</select>
			</div>
			<div style="width:100%;height:30px;margin-top:5px;">
				<div class="ti">마감일</div>
			</div>
			
			<div style="height:50px;">
				<input type="text" name="date2" id="datepicker2" placeholder="마감 일자를 입력해주세요." class="text-short"
				value='<fmt:formatDate value="${trip.TRIP_LAST_DATE }" pattern="yyyy-MM-dd"/>'/>
				<select name="hour2" id="" class="select-short">
					<option value="">시</option>
					<c:forEach var="i" begin="0" end="24">
					<c:if test="${i < 10 }">
						<c:set var="h2" value="0${i}" />
					</c:if>
					<c:if test="${i >= 10 }">
						<c:set var="h2" value="${i}" />
					</c:if>
						<option value="${h2 }"
						<c:if test="${hour2 == h2}">selected="selected"</c:if>
						>${h2 }시</option>
					</c:forEach>
				</select>
				<select name="time2" id="" class="select-short">
					<option value="" >분</option>
					<c:forEach var="i" begin="0" end="59">
					<c:if test="${i < 10 }">
						<c:set var="m2" value="0${i}" />
					</c:if>
					<c:if test="${i >= 10 }">
						<c:set var="m2" value="${i}" />
					</c:if>
						<option value="${m2 }"
						<c:if test="${min2 == m2}">selected="selected"</c:if>
						>${m2 }분</option>
					</c:forEach>
				</select>
			</div>
			
			
			<div style="width:100%;height:30px;margin-top:10px;" id="tripInfo6">
				<div class="ti">집합 장소</div>
			</div>
			<div style="height:200px;border:1px solid gray;" class="addrDiv">
				<div style="width:510px;float:left;">
					<label for="addr1" class="lab">우편번호</label>
					<input type="text" id="addr1" name="trip_zipcode" 
					class="input-small postcodify_postcode5" value="${trip.TRIP_ZIPCODE }"/>
					<input type="button" id="postcodify_search_button" value="검색"/>&nbsp;
					<input type="button" value="지도 업데이트" onclick="mapView();"/>
					<br />
					
					<label for="addr2" class="lab">도로명주소</label>
					<input type="text" id="addr2" name="trip_addr1" 
					class="input-large postcodify_address" value="${trip.TRIP_ADDR1 }" readonly/><br />
					
					<label for="addr3" class="lab">상세주소</label>
					<input type="text" id="addr3" name="trip_addr2"
			class="input-large postcodify_details" value="${trip.TRIP_ADDR2 }" /><br />
					
					<label for="addr4" class="lab">참고항목</label>
					<input type="text" id="addr4" name="trip_addr3" 
					class="input-large postcodify_extra_info" value="${trip.TRIP_ADDR3 }" readonly/><br />
				</div>
				<div style="width:400px;height:200px; margin-left:20px; float:left;" id="mapView">
					
				</div>
			</div>
			
			
			<div style="width:100%;height:30px;margin-top:10px;" id="tripInfo7">
				<div class="ti" style="width:21%;">1인당 요금</div>
				<div class="ti" style="width:7%;">수용 인원</div>
				<div class="ti" style="">예상 수입(수수료 20%)</div>
			</div>
			<div >
				<input type="text" id="trip_price" value="${trip.TRIP_PPRICE }"
					 class="text-short" onkeyup="calcTrip();" style="text-align:right;padding-right:20px;"/>
			</div>
			<div >
				<input type="text" name="trip_persons" id="trip_persons" onkeyup="calcTrip();"
					 value="${trip.TRIP_PERSONS }" class="text-short" 
					 style="width:50px;margin-left:40px;text-align:center;"/>
			</div>
			<div style="height:50px;">
				<input type="text"  id="total_price" value="${trip.TRIP_TPRICE }" class="text-short" 
				style="margin-left:40px;text-align:right;padding-right:20px;" readonly/>
			</div>
			
			<div style="width:100%;height:50px;margin:20px auto;">
				<div style="width:20%;height:25px;background:#95D09F;color:#fff;
					text-align:center;  border-radius: 15px; padding:6px; float:left; margin-left:20px;
					cursor:pointer" onclick="tripUpdate();">
						<b>트립 수정</b>
					</div>
					
				<div style="width:20%;height:25px;background:#cb4242;color:#fff;
					text-align:center;  border-radius: 15px; padding:6px; float:left; margin-left:20px;
					cursor:pointer" onclick="history.go(-1)">
						<b>이전으로</b>
					</div>
			</div>
		</div>
		
	</div>
	</form>
</div>
<script>
function calcTrip() {
	var trip_price = removeComma($("#trip_price").val());
	var trip_persons = $("#trip_persons").val();
	var commission = 0.2; //수수료
	
	// 수수료 공제액 반올림
	var total_price = Math.round((trip_price * trip_persons) - (trip_price * trip_persons * commission));
	
	$("#trip_price").val(insertComma(trip_price));
	$("#total_price").val(insertComma(total_price));
	
	document.form.trip_pprice.value = trip_price;
	document.form.trip_tprice.value = total_price;
}
function insertComma(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function removeComma(number) {
	return number.replace(/,/g, "");
}
function mapView() {
	var addr = $("#addr2").val();
	if(addr == "") {
		alert("주소 검색을 먼저 해주세요.");
		return;
	}
	$.ajax({
		url: "/TripINN/tripMapView.do",
		type: "GET",
		async:true,
		dataType: "Text", 
		data: {"addr": addr},
		success: function(data) {
			$("#mapView").html(data);
		}
	});
}
</script>
<div style="clear:both;"></div>