<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <link rel="stylesheet" href="/TripINN/resources/bootstrap/css/bootstrap-theme.min.css">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 스타일적용2 -->    
<style>	
	ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:10px;}
	li{margin-right:50px }
	a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
</style>
    
  </head>
  
  <body>
 	 <br><br>
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:1px solid black;text-align:center;">
	<h2>회원정보 수정페이지</h2>
   </div>
   
   
   <!-- 좌측 영역 -->
   <div style="width:15%;height:380px;border:1px solid black;text-align:center;">	
	   <ul>   
        <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>회원관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseList.do"><h2>숙소관리</h2></a></li>
		<li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
		<li><a href = "http://www.daum.net"><h2>투어관리</h2></a></li>
		<li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
		<li><a><h2>문의게시판</h2></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h3>ㄴQ&A</h3></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>

	</ul>
   
   </div>
    <form name="frm" method="post" action="/TripINN/admin/updateMemberModify.do">
   <input type="hidden" value="${map.MEMBER_IDX}" name="MEMBER_IDX"/>
   
   <!-- 가운데 영역 -->
   <div style="color:black;width:64%;height:381px;border:1px solid black;text-align:left; position:absolute;top:208px;left:213px;">
   
   <div style="color:black;width:73%;height:381px;border:1px solid black; margin-left:150px;">
   
	<div style="width:15%;height:150px;border:2px solid blue">
	<img src="/TripINN/images/공유.png" style="width:100%; height:150px;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이미지
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:30px;left:300px;text-align:center; background-color:skyblue;">
	번호
	</div>
	<!-- 번호 받는 곳 -->

	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:30px;left:392px;">
	${map.MEMBER_IDX }
	<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="${map.MEMBER_IDX }">
    </div>
	
	

	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:50px;left:300px;text-align:center; background-color:skyblue;">
	이름
	</div>
	<!-- 이름 받는 곳 -->

	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:50px;left:392px;">
	${map.MEMBER_NAME}
    </div>
	
	
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:70px;left:300px;text-align:center; background-color:skyblue;">
	주소
	</div> 
	<!-- 주소 받는 곳 -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:70px;left:392px;">
	<input type="text" size="57" id="MEMBER_ADDR" name="MEMBER_ADDR" value="${map.MEMBER_ADDR }"/>
	
	
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:90px;left:300px;text-align:center; background-color:skyblue;">
	이메일
	</div>
	
	<!-- 이메일 받는 곳 -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:90px;left:392px;">
	<input type="text" size="57" id="MEMBER_EMAIL" name="MEMBER_EMAIL" value="${map.MEMBER_EMAIL }"/>
	
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:110px;left:300px;text-align:center; background-color:skyblue;">
	휴대폰
	</div>
	
	<!--  휴대폰 받는곳 -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:110px;left:392px;">
	<input type="text" size="57" id="MEMBER_PHONE" name="MEMBER_PHONE" value="${map.MEMBER_PHONE }"/>
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:130px;left:300px;text-align:center; background-color:skyblue;">
	생일
	</div>
	
	<!-- 생일 받는 곳 -->
	<div style="color:black;width:15%;height:20px;border:1px solid black; position:absolute;top:130px;left:392px;">
	${map.MEMBER_BIRTH}
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:130px;left:530px;text-align:center; background-color:skyblue;">
	성별
	</div>
	
	<!-- 성별 받는 곳 -->
	<div style="color:black;width:15%;height:20px;border:1px solid black; position:absolute;top:130px;left:622px;">
	${map.MEMBER_SEX}
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:150px;left:300px;text-align:center; background-color:skyblue;">
	가입일자
	</div>
	
	
	<!-- 가입일자 받는 곳 -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:150px;left:392px;">
	${map.MEMBER_JOINDATE}
	
	</div>
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:170px;left:300px;text-align:center; background-color:skyblue;">
	비밀번호
	</div>
	
	<!-- 비밀번호 받는 곳 -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:170px;left:392px;">
	
	<input type="text" size="57" id="MEMBER_PWD" name="MEMBER_PWD" value="${map.MEMBER_PWD }"/>
	
	</div>
	
	
	<div style="color:black;width:10%;height:20px;border:1px solid black; position:absolute;top:190px;left:300px;text-align:center; background-color:skyblue;">
	회원등급
	</div>
	
	<!--회원 등급 받는 곳  -->
	<div style="color:black;width:40.3%;height:20px;border:1px solid black; position:absolute;top:190px;left:392px;">
	
	<input type="text" size="57" id="MEMBER_LEVEL" name="MEMBER_LEVEL" value="${map.MEMBER_LEVEL }"/>
	</div>
	
	<div style="color:black;width:7%;height:20px;border:2px solid white; position:absolute;top:330px;left:450px;">
	<input type="button" value="완료" onClick="document.frm.submit();">
	</div>
	
	</div>
	
	
   </div>
   </form>
  
   
 
  
  </body>
</html>