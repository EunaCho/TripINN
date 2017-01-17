<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<% String cp=request.getContextPath(); %>

<style>
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
	.left-menu{
		border:1px solid black;
=======
	.left_div{
		border:1px solid #b0bdbe;
		background-color:rgba(219, 219, 219, 0.22);
		border-radius:5px;
>>>>>>> 51e9c86 마이페이지 
		margin-bottom:20px;
		width: 200px;
		height:210px;
		float:left;
	}
	.side_list{
		border:2px solid rgb(224, 224, 224);
		background-color:#fff;
		border-radius:8px;
		margin:20px;
    	width:150px;
    	height:27px;
    	text-align:center;	
	} 
	
	.side-text{
		padding: 6px 0;
   	 	font-size: 15px;
    	color:#6a6c6d;
    	text-decoration:none;
	}
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
=======
   
	.right_div{
		
>>>>>>> 51e9c86 마이페이지 
	
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
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text">예약관리</a>
=======
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text" style="border-bottom:2px solid #cb4242;">예약관리</a>	
>>>>>>> 51e9c86 마이페이지 
		</div>
	</div>

	<div class="trip_list">
		<div class="pro_menu2">
			예약관리
		</div>
	</div>
</div>
<div style="clear:both;"></div>