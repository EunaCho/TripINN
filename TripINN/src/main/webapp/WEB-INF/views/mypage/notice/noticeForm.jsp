<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<style>
	.left-menu{
		border:1px solid black;
		margin-bottom:20px;
		width: 300px;
		height:450px;
		float:left;
	}
	.side_poto{
		border:1px solid black;
		margin:5px;
    	width:285px;
    	height:200px;	
	} 
	.side_text{
		border:1px solid black;
		margin:5px;
		width:285px;
    	height:90px;
		padding: 6px 0;
   	 	font-size: 16px;
    	color: #767676;
    	text-decoration:none
	}
	.input_ex p{
		margin:0px;
		border:1px solid black;
		width:570px;
		float:left;
   	 	font-size:10px;
    	color: #767676;
    	text-decoration:none
	}
	
	.pro_menu2{
		border:1px solid black;
		margin:5px;
		width:786px;
		height:200px;
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

	.notice_list{
		border:1px solid black;
		margin:5px;
		width: 800px;
		height:450px;
		float:left;
	}
</style>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>

<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left-menu">
		<div class="side_poto">
			<p>poto</p>
		</div>
	
		<div class="side_text">
			<p>이름.</p>
			<a href="" style="text-decoration:none">프로필 보기</a>
		</div>
	</div>

	<div class="notice_list">
		<div class="pro_menu2">
			<div class="menu2_header">
				 <span>${membber_name}님 TripINN에 온것을 환영 합니다.</span>			
			</div>
			
			<div class="input_ex" style="border:1px solid black; margin:5px;">
				<p>알림판에서 메시지와 예정된 여행을 확인하고 다음 여행은 어디로 갈지 아이디어를 얻으세요.</p>
				<p>아직 예약을 해본적이 없다면 유의할 사항을 다음과 같습니다.</p>
			
				<p style="color:blue;">*프로필을 완성해 주세요</p>
				<p>&nbsp;&nbsp;&nbsp;호스트는 자신의 숙소에 묵을 사람에 대해 좀더 알고 싶어 합니다. 사진을 업로드 하시고 간략한 </p>
				<p>&nbsp;&nbsp;&nbsp;소개를 남겨주세요.</p>
				
				<p style="color:blue;">*신부증제공</p>
				<p>&nbsp;&nbsp;&nbsp;일부 호스트는 게스트가 예약하기 전에 신부증을 제공하도록 요청합니다.지금 정보를 제공하여 미리</p>
				<p>&nbsp;&nbsp;&nbsp;준비 하세요.</p>
			
				<p style="color:blue;">*숙소예약 방법 알아보기</p>
				<p>&nbsp;&nbsp;&nbsp;회원님에게 맞는 숙소를 검색하고 호스트에게 연락하여 기억에 남을 만한 여행을 준비하세요.</p>
			</div>
		</div>
		
		<div class="pro_menu2">
			<div class="menu2_header">
				<span>메시지</span>
			</div>
			
			<div class="input_ex" style="border:1px solid black; margin:5px;">
				<p>호스트에세 메시지를 보내거나 예약신청을 보내면 여기서 응답을 확인할 수 있습니다.</p>
			</div>
		</div>

	</div>
</div>
<div style="clear:both;"></div>

