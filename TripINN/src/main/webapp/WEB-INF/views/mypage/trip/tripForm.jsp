<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<% String cp=request.getContextPath(); %>

<style>
	.left-menu{
		border:1px solid black;
		margin-bottom:20px;
		width: 200px;
		height:450px;
		float:left;
	}
	.side_list{
		border:1px solid black;
		margin:20px;
    	width:150px;
    	height:27px;	
	} 
	
	.side-text{
		padding: 6px 0;
   	 	font-size: 16px;
    	color: #767676;
    	text-decoration:none
	}
	
	.trip_list{
		border:1px solid black;
		margin:5px;
		width:900px;
		height:450px;
		
		float:left;
		top:114px;
		left:220px;
	}
	
	.pro_menu2{
		border:1px solid black;
		margin:5px;
		width:890px;
		height:435px;
	}
</style>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left-menu">
		<div class="side_list">
			<a href="<%=cp%>/mypage/trip.do" class="side-text">트립목록</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text">예약관리</a>
		</div>
	</div>

	<div class="trip_list">
		<div class="pro_menu2">
			트립 관리 
		</div>
	</div>
</div>
<div style="clear:both;"></div>