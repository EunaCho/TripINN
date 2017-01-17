<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String cp = request.getContextPath(); %>
<html>
<head>
<title>HOUSE LIST</title>


<link rel="stylesheet" href="/TripINN/css/house/houseList.css">                                                                              

	<!-- daum map -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=31244aa6795ca046e48d086d5b53f8c6&libraries=services,clusterer"></script>

<link rel="stylesheet" type="text/css" href="/TripINN/css/house/main.css?ver=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="/TripINN/js/trip/jquery.MetaData.js" type="text/javascript"></script>
<script src="/TripINN/js/trip/jquery.rating.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/TripINN/js/house/houseList.js"></script>
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
	    $("#datepicker_in_reserveBar").datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate: new Date(),
	         altField: "#datepicker_in_reserveBar",
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
	         altField: "#datepicker_out_reserveBar",
	         altFormat: "yy-mm-dd"
	  });
	});
	</script>

</head>

<body>

	<div id="header">
	</div>
	<!-- 왼쪽 -->
	<div id="left" style="    width: 48%;
    height: 630px;
    overflow-y: scroll;
    overflow:auto;
    min-width: 530px;
    float: left;">

	<!-- 상세검색폼 -->
	<form id="searchForm" action="/TripINN/house/houseMain.do" method="POST">
	
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
				<option value="0">인원 1명</option>
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
		<div class="h_category">집 전체<input type="checkbox" name="HOUSE_KIND" id="" style="color:"></div>
		<div class="h_category">개인실<input type="checkbox" name="HOUSE_K  IND" id=""></div>
		<div class="h_category">다인실<input type="checkbox" name="HOUSE_KIND" id=""></div>
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
		<div class="ajaxList">
		<div class="pre_List">
			<c:forEach items="${list}" var="house" varStatus="stat" end="2"><!--  end="2" -->
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="HOUSE_IDX" value="${house.HOUSE_IDX}"/>
					<c:param name="MEMBER_IDX" value="${house.MEMBER_IDX }"/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<div class="pre_view_container">
				<a href="${houseViewURL}">
					<input type="hidden" id="HOUSE_NAME${stat.index }" value="${house.HOUSE_NAME }" >
					<input type="hidden" id="HOUSE_IMAGE${stat.index }"value="${house.HOUSE_IMAGE }">
					<input type="hidden" id="HOUSE_IDX${stat.index }" value="${house.HOUSE_IDX }">
					<input type="hidden" id="house_total_price${stat.index }" value="${house.HOUSE_TOTAL_PRICE }">
					<input type="hidden" id="house_member_idx${stat.index }" value="${house.MEMBER_IDX }">
					<div class="pre_view_img">
					<img src="<%= cp %>/images/house/${house.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
					</div>
					<div class="pre_view_info">
						<div class="view_left">
						<label class="pre_info_name">${house.HOUSE_NAME}</label>
						<fmt:formatNumber var="sum" value="${house.STAR_SUM}" pattern="#.##" />
						<fmt:formatNumber var="cnt" value="${house.STAR_COUNT}"	pattern="#.##" />
						<div style="background: url(/TripINN/images/trip/icon_star2.gif) 0px 0px; width: 87px;">
								<p style="WIDTH: ${sum * 20 /cnt}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								</p>
						</div>
						
						<label class="pre_info_info2"> 후기 ${house.STAR_COUNT } 개</label>
						
						<label class="pre_info_info2">${house.HOUSE_INFO}</label>
						<label class="pre_info_info2">${house.HOUSE_TOTAL_PRICE } $</label>
						</div>
					</div>
				</a>
				</div>
			</c:forEach>
				<button class="plustListBtn" id="2" onclick="plusList();"
					style="width: 90%; text-align: center; height: 54px; font-weight: bold; border-radius: 5px; border: 2px solid white; color: white; outline: none !important; background: #ff5a5f; margin-top: 10px; clear: right; text-align: center; display: inline-block; font-size: 22px;">
					더보기 (${map_list_length-3})</button>
		</div>
		</div>
         
	</div>
	</div>
	
	<div style="display:none">
	<c:forEach items="${list}" var="house" varStatus="stat">
				<!-- 미리보기 개체 -->
				<div class="pre_view_container">
				<a href="${houseViewURL}">
					<input type="hidden" class="HOUSE_NAME${stat.index }" value="${house.HOUSE_NAME }" >
					<input type="hidden" class="HOUSE_IMAGE${stat.index }"value="${house.HOUSE_IMAGE }">
					<input type="hidden" class="HOUSE_IDX${stat.index }" value="${house.HOUSE_IDX }">
					<input type="hidden" class="house_total_price${stat.index }" value="${house.HOUSE_TOTAL_PRICE }">
					<input type="hidden" class="house_member_idx${stat.index }" value="${house.MEMBER_IDX }">
					<div class="pre_view_img">
					<img src="<%= cp %>/images/house/${house.HOUSE_IMAGE}" class="houseImage" alt="숙소 사진"/>
					</div>
					<div class="pre_view_info">
						<div class="view_left">
						<label class="pre_info_name">${house.HOUSE_NAME}</label>
						<fmt:formatNumber var="sum" value="${house.STAR_SUM}" pattern="#.##" />
						<fmt:formatNumber var="cnt" value="${house.STAR_COUNT}"	pattern="#.##" />
						<div style="background: url(/TripINN/images/trip/icon_star2.gif) 0px 0px; width: 87px;">
								<p style="WIDTH: ${sum * 20 /cnt}%; PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
								</p>
						</div>
						
						<label class="pre_info_info2"> 후기 ${house.STAR_COUNT } 개</label>
						
						<label class="pre_info_info2">${house.HOUSE_INFO}</label>
						<label class="pre_info_info2">${house.HOUSE_TOTAL_PRICE } $</label>
						</div>
					</div>
				</a>
				</div>
			</c:forEach>
	</div>
	<!-- 오른쪽 -->
	<div id="right" style="width:48%;  float:left;">
		<c:forEach items="${map_list }" var="map" varStatus="stat">
			<input type="hidden" value="${map}" class="map_addr${stat.index}">
		</c:forEach>
		
		<div id="mapView"></div>
	</div>
	<script>
	window.onload = function() {
		var addr, img, name, idx, price, house_member_idx;
		var addr2 = "";
		var img2 = ""; 
		var name2 = "";
		var idx2 = "";
		var price2 = "";
		var house_member_idx2 = "";
		
		var addrArr = new Array(${map_list_length } );
		for(var i=0; i<addrArr.length; i++){
			addr = $(".map_addr"+i).val(); 
			addr2 = addr2 + addr + ",";
			
			img = $(".HOUSE_IMAGE"+i).val();
			name = $(".HOUSE_NAME"+i).val(); 
			idx = $(".HOUSE_IDX"+i).val();
			price = $(".house_total_price"+i).val();
			house_member_idx = $(".house_member_idx"+i).val();
			img2 = img2 + img + ",";
			name2 = name2 + name + ",";
			idx2 = idx2 + idx + ",";
			price2 = price2 + price + ",";
			house_member_idx2 = house_member_idx2 + house_member_idx + ",";
			
		}
		 /* alert(addr2); */
		$.ajax({
			url: "/TripINN/house/houseMapListView.do",
			type: "GET",
			async:true,
			dataType: "Text", 
			data: {"addr": addr2, "img": img2, "name": name2, "idx" : idx2, "price" : price2, "house_member_idx" : house_member_idx2},
			success: function(data) {
				$('#mapView').html(data);
			}
		});
	}
	</script>

</body>
</html>