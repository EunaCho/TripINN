<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
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
	
	.pro_menu{
		border:1px solid black;
		margin:5px;
		width:900px;
		height:200px;
	}

	
	.poto{
		border:1px solid black;
		margin:5px;
    	width:250px;
    	height:170px;
    	float:left;	
	} 
	.poto_text{
		border:1px solid black;
		margin:15px;
		width:590px;
    	height:100px;
		float:left;
		
		padding: 6px 0;
   	 	font-size:10px;
    	color: #767676;
    	text-decoration:none
	}
	.poto_button{
		border:1px solid black;
		margin: 20px;
		width:200px;
    	height:100px;
	
	}
	.pro_menu2{
		border:1px solid black;
		margin:5px;
		width:900px;
		height:600px;
	}
	.pro_menu2-2{
		border:1px solid black;
		margin:5px;
		width:900px;
		height:400px;
	}
	.menu2_header {
		
		background-color: #f7f7f7;
		font-size: 14px;
		font-family : 'Noto Sans', sans-serif;
		background-image: url('/TripINN/view/mypage/image/bg_01.gif');
		background-size:100%;
		background-repeat: no-repeat;
		border-bottom: 1px solid #a6a6a6;
	}
	.input_name{
		border:1px solid black;
		margin:5px;
		margin-bottom:10px;
		width:260px;
    	height:20px;
		float:left;
	}
	.input_form{
		border:1px solid black;
		margin:5px;
		margin-bottom:10px;
		width:570px;
    	height:20px;
		float:left;
	}
	.input_ex p{
		border:1px solid black;
		margin: 0px;
		margin-left:276px;
		width:570px;
		float:left;
   	 	font-size:10px;
    	color: #767676;
    	text-decoration:none
	}

	.profile{
		border:1px solid black;
		margin-left:10px;
		margin-bottom: 10px;
		width:930px;
		height:1600px;
		top:114px;
		left:310px;
		float:left;
	}
</style>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left-menu">
		<div class="side_list">
			<a href="<%=cp%>/mypage/profile.do" class="side-text">프로필 수정</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/check.do" class="side-text">인증현황</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/review.do" class="side-text">후기</a>
		</div>
	</div>

	<div class="profile">
		<div class="pro_menu">
			후기
		</div>
		
</div>
<div style="clear:both;"></div>
</div>