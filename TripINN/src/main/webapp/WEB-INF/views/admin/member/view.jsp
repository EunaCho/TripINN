<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div style="width:100%;height:100px;border:1px solid blue;text-align:center;">
	<h2>회원정보 상세페이지</h2>
   </div>
   
   
   <!-- 좌측 영역 -->
   <div style="width:16.7%;height:380px;border:1px solid black;text-align:center;">	
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
   
    <!-- 가운데 영역 -->
   <div style="color:black;width:80%;height:470px;border:2px solid red;text-align:left; position:absolute;top:208px;left:213px;">
   
   <form name="frm" method="post">
   <input type="button" value="수정하기"  onClick="mySubmit(1)" style="position:absolute;top:400px;left:520px;"/>
   <input type="button" value="삭제하기"  onClick="mySubmit(2)" style="position:absolute;top:400px;left:450px;"/>
   <input type="hidden" value="${map.MEMBER_IDX}" name="MEMBER_IDX"/>
  


   

   
   
   
	
	
	
	<div style="font-size:21px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:20px;left:20px;text-align:center; background-color:#D2D2FF;">
	번호
	</div>
	
	<!-- 번호 받는 곳 -->
	<div style="font-size:18px;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:20px;left:175px;text-align:center; background-color:">
	${map.MEMBER_IDX}
    </div>

	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:55px;left:20px;text-align:center; background-color:#D2D2FF;">
	이름
	</div>
	<!-- 이름 받는 곳 -->

	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:55px;left:175px;">
	${map.MEMBER_NAME}
    </div>
	
	
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:90px;left:20px;text-align:center; background-color:#D2D2FF;">
	주소
	</div>
	<!-- 주소 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:90px;left:175px;">
	${map.MEMBER_ADDR}
	
	
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:125px;left:20px;text-align:center; background-color:#D2D2FF;">
	이메일
	</div>
	
	<!-- 이메일 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:125px;left:175px;">
	${map.MEMBER_EMAIL}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:160px;left:20px;text-align:center; background-color:#D2D2FF;">
	휴대폰
	</div>
	
	<!--  휴대폰 받는곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:160px;left:175px;">
	${map.MEMBER_PHONE}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:195px;left:20px;text-align:center; background-color:#D2D2FF;">
	생일
	</div>
	
	<!-- 생일 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:195px;left:175px;">
	${map.MEMBER_BIRTH}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:230px;left:20px;text-align:center; background-color:#D2D2FF;">
	성별
	</div>
	
	<!-- 성별 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:230px;left:175px;">
	${map.MEMBER_SEX}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:265px;left:20px;text-align:center; background-color:#D2D2FF;">
	가입일자
	</div>
	
	
	<!-- 가입일자 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:265px;left:175px;">
	
	${map.MEMBER_JOINDATE}
	
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:300px;left:20px;text-align:center; background-color:#D2D2FF;">
	비밀번호
	</div>
	
	<!-- 비밀번호 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:300px;left:175px;">
	
	${map.MEMBER_PWD}
	
	</div>
	
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:335px;left:20px;text-align:center; background-color:#D2D2FF;">
	회원등급
	</div>
	
	<!--회원 등급 받는 곳  -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:335px;left:175px;">
	${map.MEMBER_LEVEL}

	</div>
	
	 <script>
	 function mySubmit(index){
		 if(index==1){
			  if(confirm("수정하시겠습니까?")== true){
			  
			  document.frm.action="/TripINN/admin/memberModify.do";
		  }
		  }
		  
		  if(index==2){
			  if(confirm("삭제하시겠습니까?")== true){
			  
				  document.frm.action="/TripINN/admin/deleteList.do";
		  }
		  }
		  document.frm.submit();
	  }
  
  </script>
	
	
	
	
	
	</form>
	</div>
	
	
	
	
   
   
 
  

  </body>
</html>