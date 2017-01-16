<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String cp = request.getContextPath(); %>
<link rel="stylesheet" href="/TripINN/css/photo.css" />
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
    		url: "/TripINN/mypage/hosuePhotoInfo.do",
    		type: "POST",
    		async:true,
    		dataType: "Text", 
    		data: {"house_idx": trip_idx, "curNum": curNum},
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
   function searchWish_kind(wish_kind) {
	   var form = document.formWish_kind;
	   if(wish_kind == 1){
	   		form.action="/TripINN/mypage/houseWishList.do";
   		}
	   
	   if(wish_kind == 2){
	   		form.action="/TripINN/mypage/tripWishList.do";
  		}
	   form.submit();
   } 
   function houseDetail(idx) {
	   var form = document.formDetail;
	   form.HOUSE_IDX.value = idx;
	   form.submit();
   }
</script>

<style>
	#wrap{ width:100%;height:100%;padding:0px; display: table; margin:0px auto; margin-bottom:20px;}
	.list-container{ width:1000px; height:100%; margin:20px auto;margin-bottom:20px; display: block; }
	.list-left { width:15%;height:100%;float:left;background-color:#ffd4df;}
	.list-right { width:84%; height:100%; border: 1px solid #a6a6a6;float:left; }
	.right-con { width:90%; height:100%; border: 0px solid green;margin:0px auto; display: block; }
	.right-top { width:35%;margin-top:10px;height:35px; }
	.right-middle { width:100%; height:70%; margin:10px auto; text-align:center; display:table; }
	
	.top_div { width:50%; text-align:center; height:30px; float:left; padding-top:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;font-weight:bold; }
	.top_div:hover {border-bottom:5px solid #1E6198;cursor:pointer;}
	.on {border-bottom:5px solid #1E6198;cursor:pointer; background-color: #f8f8f8;}
	
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
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<!-- <form  method="post" name="formWish_kind" >
	<input type="hidden" name="wish_kind"  value=""/>
</form>  -->
<form action="/TripINN/house/houseDetail.do" method="post" name="formDetail">
	<input type="hidden" name="HOUSE_IDX" value=""/>
</form>

<div id="wrap">
<!-- <div id="divBackGround" style="display: none; background-color: #fff; filter: alpha(opacity=50); opacity: 0.5; position: fixed; left: 0; top: 0; width: 100%; height: 100%; z-index: 50;"></div>
<div id="HotelPhotoView" class="popContainer02" style="display: block; position: fixed; top: 50%; left: 50%; z-index: 100;"></div> -->
	<hr/>

	<div class="list-container">
		<div class="list-left">
			<div style="width:100%;height:100%;text-align:center;margin:50px auto;">
				<h1 style="margin-top:50px;">MY WISH</h1>
				<h2>TRIP</h2>
			</div>
		</div>
		<div class="list-right">
			<div class="right-con">
			<form name="formWish_kind" meth	od="post">
				<div class="right-top" style="border:1px solid red;">
					<div class='top_div <c:if test="${wishType eq 'house'}">on</c:if>' onclick="searchWish_kind(1)">숙소</div>
					<div class=top_div <c:if test="${wishType == 'trip'}">on</c:if> onclick="searchWish_kind(2)">트립</div>
				</div>
			</form>
				<hr style="margin-top:-1px;width:100%;" />
				<div class="right-middle" style="border:1px solid black;">
				<c:if test="${empty list}">
					<div style="width:100%;height:100%;background-color:#F8F8F8;padding-top:120px;">
						<h2><font style="color:#000;font-size:20px;margin-top:100px;">조회된 결과가 없습니다.</font></h2>
					</div>
				</c:if>
				<c:forEach var="list" items="${list }" >
				<c:if test="${list.TOTAL_COUNT == 0}">
					<div style="width:100%;height:100%;background-color:#F8F8F8;padding-top:120px;">
						<h2><font style="color:#000;font-size:20px;margin-top:100px;">조회된 결과가 없습니다.</font></h2>
					</div>
				</c:if>
				<c:if test="${list.TOTAL_COUNT != 0}">
				<c:set var="fullImg" value="${list.TRIP_IMAGE }"/>
					<c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
						<fmt:formatNumber var="sum" value="${list.TRB_STAR}" pattern="#.##"/>
						<fmt:formatNumber var="cnt" value="${list.TOTAL_CNT}" pattern="#.##"/>
					<div class="trip-info">
						<div class="trip-img" style="background-image:url('/TripINN/images/trip/${tripImg }');cursor:pointer;"
							onclick="newShowHotelPhoto('${listTRIP_IDX}')"></div>
						<div class="trip-info-ment">
							<div class="info1">
								${list.TRIP_NAME } [ ${list.TRIP_TYPE } ] 
								<span style="float:right">
									최대 <font color="#cb4242">${list.TRIP_PERSONS}</font> 명
								</span>
								<div style="clear:both;padding:2px;"></div>
								<span style="PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 87px; float:left;	PADDING-TOP: 0px;	HEIGHT: 18px; margin:0px auto;">
									<p style="<c:if test="${list.TOTAL_CNT != 0}">width:${sum * 20 / cnt}%;</c:if>
											  <c:if test="${list.TOTAL_CNT == 0}">width:0%;</c:if>
									 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
									</p>&nbsp;&nbsp;
								</span>
								<span style="float:left;width:50px;margin-left:10px;">
										<font color="#cb4646" size="2">
										<c:if test="${list.TOTAL_CNT != 0}">
										<fmt:formatNumber value="${sum / cnt}" pattern="#.#"/>
										</c:if> 
										<c:if test="${list.TOTAL_CNT == 0}">
										0
										</c:if>
										</font>점
								</span>
								<div style="clear:both;padding:2px;"></div>
								<span style="margin-top:-5px;">
								${list.TRIP_ADDR1 } <br />
								<fmt:formatDate value="${list.TRIP_FIRST_DATE }"/>
								 ~
								  <fmt:formatDate value="${list.TRIP_LAST_DATE }"/>
								 </span>
							</div>
							<div style="color:#cb4242;text-align:right;">
								<div style="width:120px;float:left;margin-top:-8px;text-align:left;margin-left:-15px;">
								<img src="http://openimage.interpark.com/tourpark/tour/common/button/btn_detail_view02.gif"
									style="cursor:pointer" width="70px" height="25px" onclick="tripDetail('${list.TRIP_IDX}');"/>
								<img src="http://openimage.interpark.com/tourpark/tour/sub_depth/icon_search.gif"
									 alt="포토" style="cursor:pointer" onclick="newShowHotelPhoto('${list.TRIP_IDX}')">
								</div>
								<img style="width:11px;height:11px;"
									src="http://openimage.interpark.com/tourpark/tour/common/icon/icon_won_pink.gif" />
								<fmt:formatNumber>${list.TRIP_PPRICE }</fmt:formatNumber><font>원</font>
							</div>
							
							<div style="color:#cb4242; text-align:right; border:1px solid #dce0e0; width:95%; margin-top:2px;">
								<img style="width:25px; height:25px;" src="<%=cp%>/images/mypage/wishlist.jpg"/>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
				</div>
			</div>

		</div>
	</div>
</div>
<div style="width:100%; height:50px;"></div>
<div style="clear:both;"></div>
