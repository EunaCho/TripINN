<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
</head>
<% String cp = request.getContextPath(); %>
<body>
			<c:forEach items="${list}" var="house" varStatus="stat"><!--  end="2" -->
			
				<!-- 하우스 사진 클릭시 이벤트 : 상세 페이지로 넘어감 -->
				<c:url var="houseViewURL" value="/house/houseDetail.do">
					<c:param name="HOUSE_IDX" value="${house.HOUSE_IDX}"/>
					<c:param name="MEMBER_IDX" value="${house.MEMBER_IDX }"/>
				</c:url>
				
				<!-- 미리보기 개체 -->
				<div class="pre_view_container">
				<a href="${houseViewURL}">
					<input type="hidden" id="HOUSE_NAME${stat.index+last_index-2}" value="${house.HOUSE_NAME }" >
					<input type="hidden" id="HOUSE_IMAGE${stat.index+last_index-2}"value="${house.HOUSE_IMAGE }">
					<input type="hidden" id="HOUSE_IDX${stat.index+last_index-2}" value="${house.HOUSE_IDX }">
					<input type="hidden" id="house_total_price${stat.index+last_index-2}" value="${house.HOUSE_TOTAL_PRICE }">
					<input type="hidden" id="house_member_idx${stat.index+last_index-2}" value="${house.MEMBER_IDX }">
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
			<c:if test="${(list_size-last_index) > 0}">
			<button class="plustListBtn"  id="${last_index }" onclick="plusList();"
					style="width: 90%; text-align: center; height: 54px; font-weight: bold; border-radius: 5px; border: 2px solid white; color: white; outline: none !important; background: #ff5a5f; margin-top: 10px; clear: right; text-align: center; display: inline-block; font-size: 22px;">
					더보기 (${list_size-last_index})</button>
			</c:if>
</body>
</html>