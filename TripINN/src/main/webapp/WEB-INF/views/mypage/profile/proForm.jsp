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
			<div class="poto">
				<p>poto</p>
			</div>
	
			<div class="poto_text">
				<p>잘나온 얼굴 정면 사진을 호스트와 게스트가 서로 알아보는데 중요합니다.</p>
				<p>자신의 인물사진 이외의 사진을 올리면 호스트 또는 게스트가 알아보기 힘들겠죠?</p>
				<p>자신의 얼굴이 잘 나온 정면 사진을 올려주세요.</p>
			</div>
		</div>
	
		<div class="pro_menu2">
				<div class="menu2_header">
					필수사항
				</div>
			
			<form id="profile_form">	
				<div style="border:1px solid black; margin:5px; width:860px; height:500px;" >
					<div class="input_name">
						이름
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
		
					<div class="input_name">
						성별
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
		
					<div class="input_name">
						생년월일
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
			
					<div class="input_name">
						이메일주소
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
			
					<div class="input_name" >
						전화번호
					</div>
					<div class="input_form" style="margin-bottom:0px;">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
					<div class="input_ex" style="width:570px;">
						<p>＊전화번호는 예약이 완료될 경우에만 공유됩니다. 번호가 공유되면 개인적으로 연락할 수 있습니다.</p>
					</div>
				
					<div class="input_name">
						거주지
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
				
					<div class="input_name">
						자기소개
					</div>
					<div class="input_form" style="height:80px; margin-bottom:1px;">
						<textarea rows="5" cols="80" name="member_contents">자신을 소개해주세요.</textarea>
					</div>
					<div class="input_ex">
						<p>＊TripINN은 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지  알려주세요.</p>
						<p>&nbsp;&nbsp;&nbsp;좋아하는 활동을 공유해 주세요.좋아하는 음악,영화등 뭐든 좋습니다.</p>
						<p>&nbsp;&nbsp;&nbsp;회원님은 어떤스타일의 게스트 혹은 호스트인가요?</p>
						<p>&nbsp;&nbsp;&nbsp;인생의 좌우명은 무엇인가요?</p>
					</div>
				</div>
			</form>
		</div>
		
		<div class="pro_menu2-2" style="height:300px;">
			<div class="menu2_header">
				선택사항
			</div>
			
			<form id="profile_form2">	
				<div style="border:1px solid black; margin:5px; width:860px; height:250px;" >
					<div class="input_name">
						학교
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
		
					<div class="input_name">
						직업
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
		
					<div class="input_name">
						긴급 연락처
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
					<div class="input_ex">
						<p>＊고객지원 팀에서 긴급 상황시 연락할 수 있도록 신뢰하는 사람의 연락처를 제공해 주세요.</p>
					</div>
			
					<div class="input_name">
						배송지주소
					</div>
					<div class="input_form">
						<input type="text" id="member_name" name="member_name" size="30">
					</div>
				</div>
			</form>
		</div>
</div>
<div style="clear:both;"></div>
</div>