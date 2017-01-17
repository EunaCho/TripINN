<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %> 
<% String cp = request.getContextPath(); %>
<link rel="stylesheet" href="/TripINN/css/photo.css" />
<script>

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
   function deleteWish(idx){
	   
	   var form = document.formDelete;
	   form.HOUSE_IDX.value=idx;
	   form.submit();
	   
   }
</script>

<style>
	#wrap{ width:100%;height:100%;padding:0px; display: table; margin:0px auto;}
	.list-container{ width:1000px; height:100%; margin:20px auto;margin-bottom:20px; display: block; }
	.list-left { width:15%;height:100%;float:left; background-color:rgba(138, 0, 0, 1);}
	.list-right { width:84%; height:100%;float:left; }
	.right-con { width:90%; height:100%; border: 0px solid green;margin:0px auto; display: block; }
	.right-top { width:35%;margin-top:10px;height:35px; }
	.right-middle { width:100%; height:70%; margin:10px auto; text-align:center; display:table; }
	
	.top_div { width:50%; text-align:center; height:30px; float:left; padding-top:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;font-weight:bold; }
	.top_div:hover {border-bottom:5px solid #1E6198;cursor:pointer;}
	.on {border-bottom:5px solid #1E6198;cursor:pointer; background-color: #f8f8f8;}
	
	.right-middle .trip-info { width: 30%; float:left; height:356px;  margin:10px;}
	.trip-info .trip-img { width:98%; height:200px; background-size:100% 100%; background-repeat: no-repeat; border-radius:5px;}
	.trip-info .trip-info-ment { width:98%; border:1px solid #dce0e0; border-radius:5px;}
	.trip-info-ment div {width:92%;padding:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;
						 font-size:13px;font-weight:bold;}
	.trip-info-ment .info1 {text-align:left;color:#0886C4;}
	
	.trip-info-ment .info1 span {color:#000;font-size:11px;}
	h1, h2, h3 {color:#fff;}
	font {font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;}
	#selected { border-bottom:5px solid #1E6198; color:#cb4242; background-color:#f8f8f8; }
</style>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>

<form action="/TripINN/house/houseDetail.do" name="formDetail">
	<input type="hidden" name="HOUSE_IDX" value=""/>
</form>

<form action="/TripINN/mypage/deleteHouseWish.do" method="post" name="formDelete">
	<input type="hidden" name="HOUSE_IDX" value=""/>
</form>

<div id="wrap">
	<hr/>

	<div class="list-container">
		<div class="list-left">
			<div style="width:100%; height:100%; text-align:center; margin:50px auto;">
				<h1 style="margin-top:50px;">MY WISH</h1>
				<h2>HOUSE</h2>
			</div>
		</div>
		<div class="list-right">
			<div class="right-con">
			<form name="formWish_kind" meth	od="post">
				<div class="right-top">
					<div class='top_div <c:if test="${wishType eq 'house'}">on</c:if>' onclick="searchWish_kind(1)">숙소</div>
					<div class=top_div <c:if test="${wishType == 'trip'}">on</c:if> onclick="searchWish_kind(2)">트립</div>
				</div>
			</form>
				<hr style="margin-top:-1px;width:100%;" />
				<div class="right-middle">
				<c:if test="${empty list}">
					<div style="width:100%;height:100%;background-color:#F8F8F8;padding-top:120px;">
						<h2><font style="color:#000;font-size:20px;margin-top:100px;">조회된 결과가 없습니다.</font></h2>
					</div>
				</c:if>
				<c:forEach var="list" items="${list}" >
				<c:set var="fullImg" value="${list.HOUSE_IMAGE}"/>
					<c:set var="houseImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
						<fmt:formatNumber var="sum" value="${list.HRB_STAR}" pattern="#.##"/>
						<fmt:formatNumber var="cnt" value="${list.TOTAL_CNT }" pattern="#.##"/>
					<div class="trip-info">
						<div style="background-image:url('/TripINN/images/house/${houseImg}');" class="trip-img"></div>
						
						<div class="trip-info-ment" style="border:1px solid #dce0e0; border-radius:5px;">
							<div class="info1">
								${list.HOUSE_NAME} [ ${list.HOUSE_KIND} ] ${list.FAR_IDX}
								<span style="float:right">
									최대 <font color="#cb4242">${list.HOUSE_PERSONS}</font> 명
								</span>
								
								<div style="clear:both;padding:2px;"></div>
								<span style="PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(/TripINN/images/trip/icon_star2.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 87px; float:left;	PADDING-TOP: 0px;	HEIGHT: 18px; margin:0px auto;">
									<p style="<c:if test="${list.TOTAL_CNT != 0}">width:${sum * 20 / cnt}%;</c:if>
											  <c:if test="${list.TOTAL_CNT  == 0}">width:0%;</c:if>
									 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(/TripINN/images/trip/icon_star.gif) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 18px;">
									</p>&nbsp;&nbsp;
								</span>
								<span style="float:left;width:50px;margin-left:10px;">
										<font color="#cb4646" size="2">
										<c:if test="${list.TOTAL_CNT  != 0}">
										<fmt:formatNumber value="${sum / cnt}" pattern="#.#"/>
										</c:if> 
										<c:if test="${list.TOTAL_CNT  == 0}">
										0
										</c:if>
										</font>점
								</span>
								
								<div style="clear:both;padding:2px;"></div>
								<span style="float:left;display:block;height:40px;padding:3px;">
									${list.HOUSE_ADDR1} ${list.HOUSE_ADDR2} ${list.HOUSE_ADDR3}
								 </span>
								 <div style="clear:both;padding:2px;"></div>
							</div>
							<div style="color:#cb4242;text-align:right; ">
								<div style="width:120px;float:left;margin-top:-8px;text-align:left;margin-left:-7px;">
									<img src="http://openimage.interpark.com/tourpark/t				our/common/button/btn_detail_view02.gif"
										style="cursor:pointer" width="70px" height="25px" onclick="houseDetail('${list.HOUSE_IDX}');"/>
								</div>
								<img style="width:11px;height:11px;" src="http://openimage.interpark.com/tourpark/tour/common/icon/icon_won_pink.gif" />
									<fmt:formatNumber>${list.HOUSE_PERSON_PRICE}</fmt:formatNumber><font>원</font>
							</div>
				
							<div style="color:#cb4242; text-align:right; border-top:1px solid #dce0e0; width:95%; margin-top:2px;">
								<img style="width:25px; height:25px; cursor:pointer;" src="<%=cp%>/images/mypage/wishlist.jpg" 
								onclick="javascript:deleteWish(${list.HOUSE_IDX})"/>
							</div>
						
						</div>
					</div>
				</c:forEach>
				
				<c:if test="${not empty paginationInfo}">
					<div style="clear:both;"></div>
					<div class="trDiv" style="width:100%;margin-top:20px;">
						<div class="tdDiv-col" id="pagingDiv" style="text-align:center;height:30px;margin-top:10px;">
        				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
        				</div>
        			</div>
    			</c:if>
				
				</div>
			</div>
			
	<!-- ///////////////페이징처리/////////////// -->
			<form name="listForm" >
			 <input type="hidden" name="currentPageNo" value="" />
			</form>	
			<style>
			#pagingDiv {height:40px;}
			#pagingDiv a { font-size:12px;width:20px; height:20px; border:1px solid #a6a6a6; margin-right:5px; border-radius:7px;padding:7px;}
			#pagingDiv a:hover {background-color:rgb(255, 235, 240);}
			#pagingDiv strong { font-size:12px;border:1px solid #a6a6a6;border-radius:7px;padding:7px;color:#cb4646;margin-right:5px;}
			</style>			
			<script>
			function fn_search(pageNo){
			    var listForm = document.listForm;
			    listForm.action = "/TripINN/mypage/houseWishList.do";
			    listForm.currentPageNo.value = pageNo;
			    listForm.submit();
			}
			</script>
     		<!-- ///////////////페이징처리/////////////// -->

		</div>
	</div>
</div>
<div style="width:1000px; height:50px;display:table;"></div>
<div style="clear:both;"></div>
