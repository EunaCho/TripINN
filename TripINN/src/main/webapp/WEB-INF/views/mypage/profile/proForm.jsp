<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<style>
	.left_div{
		border:1px solid #b0bdbe;
		background-color:rgba(219, 219, 219, 0.22);
		border-radius:5px;
		margin-bottom:20px;
		margin-left:50px;
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
	
	.pro_menu{
		/* border:1px solid black; */
		margin:5px;
		width:900px;
		height:200px;
	}

	
	.poto{
		border:1px solid #b0bdbe;
		border-radius:5px;
		margin:5px;
    	width:250px;
    	height:170px;
    	float:left;	
	} 
	.poto_text{
		border:1px solid #b0bdbe;
		border-radius:5px;
		margin:15px;
		width:585;
    	height:100px;
		float:left;
		padding-right:8px;
		padding-left: 8px;
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
		border:1px solid #b0bdbe;
		border-radius:5px;
		margin:5px;
		width:800px;
		height:auto; overflow:hidden;
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
		border:2px solid rgb(224, 224, 224);
		border-radius:5px;
		padding-left:8px;
		text-align:left;
		margin:5px;
		margin-bottom:10px;
		width:170px;
    	height:20px;
		float:left;
		font-color:#6a6c6d;
		font-size:14px;font-family : 'Noto Sans', sans-serif;
	}
	.input_form{
		border:2px solid rgb(224, 224, 224);
		border-radius:5px;
		margin:5px;
		margin-bottom:10px;
		width:570px;
    	height:20px;
		float:left;
	}
	.input_ex p{
		/* border:1px solid black; */
		margin: 0px;
		margin-left:190px;
		width:570px;
		float:left;
   	 	font-size:10px;
    	color: #767676;
    	text-decoration:none;
	}

	.profile{
		/* border:1px solid black; */
		margin-left:10px;
		margin-bottom: 10px;
		width:930px;
		overflow:hidden;
		height:auto;
		top:114px;
		left:310px;
		float:left;
	}
	.profile_div{
		style=" margin:5px; width:860px; height:250px;"
	}
	.bottomBnt{
		 background-color:#fff; border:2px solid #b0bdbe; border-radius:5px;
	}
	
	.filebox label {
		display: inline-block; padding: .5em .75em; 
		color: #999; font-size: inherit; width:126px; height:20px;
		line-height: normal;  margin-left:20px; text-align:center;
		vertical-align: middle; background-color: #fdfdfd; cursor: pointer; 
		border: 2px solid rgb(224, 224, 224); border-radius: 8px; 
	}
	.filebox input[type="file"] { /* 파일 필드 숨기기 */
		 width: 1px; height: 1px; 
		 padding: 0; margin: -1px; overflow: hidden;
		 clip:rect(0,0,0,0); border: 0;
		  
	 }
</style>
<script>
function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('display', '');
            $target.css('background-image', 'url(\"' + e.target.result + '\")');
            $target.css('background-size', '100% 100%');
            $(".")
            //$target.html('<img src="' + e.target.result + '" border="0" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
    }
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<form id="profile_form" action="/TripINN/mypage/profileModify.do" method="post" enctype="multipart/form-data">	
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/profile.do" class="side-text" style="border-bottom:2px solid #cb4242;">프로필 수정</a>
		</div>
	
		
		<div class="filebox">
			<label for="MEMBER_IMAGE">사진 바꾸기</label>
			<input type="file" name="MEMBER_IMAGE" id="MEMBER_IMAGE" onchange="getThumbnailPrivew(this,$('#member_img'))"/>
		</div>
	</div>
	

	<div class="profile">
		<div class="pro_menu">
			<div class="poto" id="member_img" style="width:250px; height:170px;
				background-size:100% 100%; background-repeat:no-repeat;background-image:url('/TripINN/images/member/${map.MEMBER_IMAGE}');">
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
			
		
				<div style=" margin:5px; width:860px; height:auto; overflow:hidden;" >
					<div class="input_name">
						이름
					</div>
					<div class="input_form">
						<input type="text" id="MEMBER_NAME" name="MEMBER_NAME" size="30" value="${map.MEMBER_NAME}">
					</div>
		
					<div class="input_name">
						성별(여자/남자)
					</div>
					<div class="input_form">
						<select name="MEMBER_SEX" id="" style="height:20px;width:80px;padding:0px;">
						<option value="0" <c:if test="${map.MEMBER_SEX == 0}">selected="selected"</c:if>>남자</option>
						<option value="1" <c:if test="${map.MEMBER_SEX == 1}">selected="selected"</c:if>>여자</option>
						</select>
						
					</div>
		
					<div class="input_name">
						생년월일(0000-00-00)
					</div>
					<div class="input_form">
						<input type="text" id="MEMBER_BIRTH" name="MEMBER_BIRTH" 
						size="30" value='<fmt:formatDate value="${map.MEMBER_BIRTH}" pattern="yyyy-MM-dd"/>'>
					</div>
			
					<div class="input_name">
						이메일주소
					</div>
					<div class="input_form">
						<input type="text" id="MEMBER_EMAIL" name="MEMBER_EMAIL" size="30" value="${map.MEMBER_EMAIL}">
					</div>
			
					<div class="input_name" >
						전화번호
					</div>
					<div class="input_form" style="margin-bottom:0px;">
						<input type="text" id="MEMBER_PHONE" name="MEMBER_PHONE" size="30" value="${map.MEMBER_PHONE }">
					</div>
					<div class="input_ex" style="width:570px;">
						<p>＊전화번호는 예약이 완료될 경우에만 공유됩니다. 번호가 공유되면 개인적으로 연락할 수 있습니다.</p>
					</div>
				
					<div class="input_name">
						거주지
					</div>
					<div class="input_form">
						<input type="text" id="MEMBER_ADDR" name="MEMBER_ADDR" size="30" value="${map.MEMBER_ADDR}">
					</div>
				
					<div class="input_name">
						자기소개
					</div>
					<div class="input_form" style="height:80px; margin-bottom:1px;">
						<textarea rows="5" cols="80" name="MEMBER_CONTENTS" id="MEMBER_CONTENTS">자신을 소개해주세요.</textarea>
					</div>
					<div class="input_ex">
						<p>＊TripINN은 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지  알려주세요.</p>
						<p>&nbsp;&nbsp;&nbsp;좋아하는 활동을 공유해 주세요.좋아하는 음악,영화등 뭐든 좋습니다.</p>
						<p>&nbsp;&nbsp;&nbsp;회원님은 어떤스타일의 게스트 혹은 호스트인가요?</p>
						<p>&nbsp;&nbsp;&nbsp;인생의 좌우명은 무엇인가요?</p>
					</div>
				</div>
				
		
		</div>
			<div style="text-align:center; padding-right:140px;">
				<input type="submit" value="수정완료" style="height:40px;" class="bottomBnt"/>
			</div>
			
</div>
		</form>
<div style="clear:both;"></div>
</div>