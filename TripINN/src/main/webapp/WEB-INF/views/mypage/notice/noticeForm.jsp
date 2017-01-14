<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath();%>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
	.left-menu{
		/* border:1px solid black; */
		margin-bottom:20px;
		margin-left:70px;
		width: 300px;
		height:450px;
		float:left;
	}
	.side_poto{
		border:1px solid #dce0e0;
		margin:5px 5px 0px 5px;
    	width:275px;
    	height:200px;	
	} 
	.side_text{
		border:1px solid #dce0e0;
		margin-left:5px;
		margin-top:0px;
		width:275px;
    	height:50px;
   	 	font-size: 19px;
    	color: #484848;
    	text-decoration:none;
    	text-align:center;
    	padding-top:20px;
	}
	.input_ex p{
		margin:0px 5px 0px 20px;
	
		border-bottom:1px solid #dce0e0;
		width:660px;
		float:left;
   	 	font-size:12px;
    	color: #767676;
    	text-decoration:none;
    	padding:4px 0px 4px 3px;
	}
	
	.pro_menu2{
		border:1px solid #dce0e0;
		margin:5px;
		width:700px;
		overflow:hidden;
        height:auto;
	}
	
	.menu2_header {
		/* background-color: #f7f7f7; */
		background-color: #edefed;
		font-size: 14px;
		font-family : 'Noto Sans', sans-serif;
		background-size:100%; 
		border-bottom: 1px solid #dce0e0;
		color:#484848;
		height:25px;
	
	}

	.notice_list{
		margin-left:20px;
		width: 800px;
		height:450px;
		float:left;
	}
	.head_div{
		border:1px solid #dce0e0;
		margin-left:75px;
		margin-bottom:10px;
		width:1020px;
		height:130px;
		background-color:#c2e4e7;
	}
	.head_button{
		background-color:#007a87;
		color:#fff;
		border-radius:4px;
    	text-align: center;
    	vertical-align: middle;
   	 	font-weight: bold;
   	 	height:30px;
   	 	font-family : 'Noto Sans', sans-serif;
	}
	.head_button1{
		background-color:#007a87;
		color:#fff;
		border-radius:4px;
    	text-align: center;
    	vertical-align: middle;
   	 	font-weight: bold;
   	 	height:30px;
   	 	font-family : 'Noto Sans', sans-serif;
	}
	.circle{
		background-color:#c2e4e7;
		border: 5px #007a87 solid;
		width:45px;
		height:45px;
		-webkit-border-radius:100px;
		margin:10px 5px 5px 20px;
		float:left;
		text-align:center; 
 		display:table-cell; 
		vertical-align:middle;
	}
</style>
<script>
$(function(){
	$('.head_button').click(function(){
		$('.head_div').hide();
	});
});
</script>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>

<div style="width:1200px; height:100%; margin:0px auto;">

	<div class="head_div">
		<div class="circle"><strong style="font-size:30px; font-weight:bold; color:#007a87; vertical-align:center;">\</strong></div>
		
		<div style="padding-left:7px; float:left; border:1px solid black; margin:3px 0px 5px 20px;">
			<p style="font-family:'Noto Sans', sans-serif; font-size:16px;"><strong>지금 숙소를  등록하고 호스트가 되어보세요.</strong></p>
			<p style="font-family:'Noto Sans', sans-serif; color:#767676; font-size:13px; ">숙소등록을 하고 이윤을 남겨보세요~!</p> 
		</div>
		
		<div style="border:1px solid black; padding-left:97px; margin-top:94px; overflow:hidden; width:auto;">
			<input type="button" value="숙소등록하기" onclick="location.href='<%=cp%>/house/houseRegister1.do'" class="head_button1" />
			<input type="button" value="나중에 등록하기" class="head_button" />
		</div>
	</div>
	
	<div class="left-menu">
		<div class="side_poto">
			<img style="width:250px; height:200px;padding-left:16px;" src="<%=cp%>/images/${map.MEMBER_IMAGE}">
		</div>
	
		<div class="side_text">
			<strong>${map.MEMBER_NAME}</strong><font style="font-size:15px;s">님</font>
			<a href="<%=cp%>/mypage/profile.do" style="text-decoration:none; color:#008489; padding-left:7px;">
				프로필 보기
			</a>
		</div>
	</div>

	<div class="notice_list">
		<div class="pro_menu2">
			<div class="menu2_header">
				 <span style="padding:7px;">${map.MEMBER_NAME}님 TripINN에 온것을 환영 합니다.</span>			
			</div>
			
			<div class="input_ex">
				<p style="color:#6e6e6e; margin-top:5px;">알림판에서 메시지와 예정된 여행을 확인하고 다음 여행은 어디로 갈지 아이디어를 얻으세요.</p>
				<p style="color:#6e6e6e;">아직 예약을 해본적이 없다면 유의할 사항을 다음과 같습니다.</p>
			
				<p style="color:#008489;">*프로필을 완성해 주세요</p>
				<p>호스트는 자신의 숙소에 묵을 사람에 대해 좀더 알고 싶어 합니다. 사진을 업로드 하시고 간략한 </p>
				<p>소개를 남겨주세요.</p>
				
				<p style="color:#008489;">*신부증제공</p>
				<p>일부 호스트는 게스트가 예약하기 전에 신부증을 제공하도록 요청합니다.지금 정보를 제공하여 미리</p>
				<p>준비 하세요.</p>
			
				<p style="color:#008489; ">*숙소예약 방법 알아보기</p>
				<p style="margin-bottom:8px;">회원님에게 맞는 숙소를 검색하고 호스트에게 연락하여 기억에 남을 만한 여행을 준비하세요.</p>
			</div>
		</div>
		
		<div class="pro_menu2" style="margin-top:25px;">
			<div class="menu2_header">
				<span style="padding:7px;">메시지</span>
			</div>
			
			<div class="input_ex">
				<p>호스트에세 메시지를 보내거나 예약신청을 보내면 여기서 응답을 확인할 수 있습니다.</p>
			</div>
		</div>

	</div>
</div>
<div style="clear:both;"></div>

