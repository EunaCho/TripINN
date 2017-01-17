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
<<<<<<< HEAD
	
 
 #dropdown2 li a{
 font-size:19px;
 color:black;
 }
 
 #dropdown2{
            
			list-style-type: none;
			margin-left:-40px;
			position:absolute;
			max-width:280px;
			margin-top:-5px;
			}

			#dropdown2 li{
			    
				width: 200px;
				height: 28px;
				border: 0px;
				border-style: solid dashed;
				margin: 2px;
				overflow:hidden;
				background: #eeeeff;
				display:inline-block;
				transition: all 0.4s ease-out;
				float:left;
				text-align:center;
				font-weight: 800;
				padding-left: 10px;
				font-size:14pt;
				
				
			}

			#dropdown2 > li > ul > li{
		     	
				height: 30px;
				border: 2px;
				list-style-type: none;
				margin-left:-50px;
				background:#c2e4e7;
				text-align:center;
				font-weight: 800;
				font-size: 16pt;
				padding-left: 10px;
				opacity: 0.3;
				transition: text-shadow 0.25s ease, opacity 0.8s ease;
			}
			#dropdown2 > li > ul > li:hover{
				opacity: 1;
				text-shadow: 1px 1px 1px #ffffff, -1px -1px 1px #8888ff;
			}
			#dropdown2 > li:hover{
				height:90px;
			}
			section{
				display: block;
				border: 0px solid gray;
			}
			hr{ width:95%; color:#eee;}

	
#button2{
 background: #2e8ce3;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #73c8f0;
 background: -moz-linear-gradient(0%, 100%, 90deg, #2e8ce3, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#2e8ce3));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#196ebb;
 text-shadow:0 -1px 0 #196ebb;
 }

#button3{
 background: #F361DC;
 padding:7px 30px 7px 30px;
 font-size:15px;
 font-weight:bold;
 color:#000000;
 text-align:center;
 border:solid 1px #FFB2D9;
 background: -moz-linear-gradient(0%, 100%, 90deg, #F361DC, #ffffff);
 background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ffffff), to(#F361DC));

border-radius:5px;
 -moz-border-radius:5px;
 -webkit-border-radius:5px;
 border-bottom-color:#99004C;
 text-shadow:0 -1px 0 #99004C;
 }
=======
	ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:10px;}
	li{margin-right:50px }
	a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
</style>
    
  </head>
  
  <body>
 	 <br><br>
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:1px solid blue;text-align:center;">
	<h2>회원정보 상세페이지</h2>
   </div>
   
   
   <!-- 좌측 영역 -->
<<<<<<< HEAD
   <div style="width:17%;height:100%;border:0px solid black;text-align:center;background:#eeeeff;margin-top:-34px;margin-left:-8px;">	
	   <section>
				<nav style="height:400px;width:250px;">
=======
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
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git

	</ul>
   
   </div>
   
    <!-- 가운데 영역 -->
<<<<<<< HEAD
   <div style="color:black;width:83%;height:378px;border:3px solid #eeeeff;;text-align:left; position:absolute;top:205px;left:210px;">
=======
   <div style="color:black;width:80%;height:381px;border:2px solid red;text-align:left; position:absolute;top:208px;left:213px;">
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
   
   <form name="frm" method="post">
   <input type="button" value="수정하기"  onClick="mySubmit(1)"/>
   <input type="button" value="삭제하기"  onClick="mySubmit(2)"/>
   <input type="hidden" value="${map.MEMBER_IDX}" name="MEMBER_IDX"/>
  


   

   
   
   
	<div style="width:15%;height:150px;border:2px solid blue">
	<img src="/TripINN/images/공유.png" style="width:100%; height:150px;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이미지
	</div>
	
	
	<div style="font-size:20px;color:black;font-weight:bold;width:15%;height:30px;border:1px solid black; position:absolute;top:20px;left:175px;text-align:center; background-color:#eee;">
	번호
	</div>
	<!-- 번호 받는 곳 -->

	<div style="font-size:20px;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:20px;left:327px;text-align:center;">
	${map.MEMBER_IDX}
    </div>

	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:50px;left:175px;text-align:center; background-color:#eee;">
	이름
	</div>
	<!-- 이름 받는 곳 -->

	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:50px;left:327px;">
	${map.MEMBER_NAME}
    </div>
	
	
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:80px;left:175px;text-align:center; background-color:#eee;">
	주소
	</div>
	<!-- 주소 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:80px;left:327px;">
	${map.MEMBER_ADDR}
	
	
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:110px;left:175px;text-align:center; background-color:#eee;">
	이메일
	</div>
	
	<!-- 이메일 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:110px;left:327px;">
	${map.MEMBER_EMAIL}
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:140px;left:175px;text-align:center; background-color:#eee;">
	휴대폰
	</div>
	
	<!--  휴대폰 받는곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:20%;height:30px;border:1px solid black; position:absolute;top:140px;left:327px;">
	${map.MEMBER_PHONE}
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:170px;left:175px;text-align:center; background-color:#eee;">
	생일
	</div>
	
	<!-- 생일 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:170px;left:327px;">
	${map.MEMBER_BIRTH}
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:140px;left:530px;text-align:center; background-color:#eee;">
	성별
	</div>
	
	<!-- 성별 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:14.8%;height:30px;border:1px solid black; position:absolute;top:140px;left:683px;">
	${map.MEMBER_SEX}
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:200px;left:175px;text-align:center; background-color:#eee;">
	가입일자
	</div>
	
	
	<!-- 가입일자 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:200px;left:327px;">
	
	${map.MEMBER_JOINDATE}
	
	</div>
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:230px;left:175px;text-align:center; background-color:#eee;">
	비밀번호
	</div>
	
	<!-- 비밀번호 받는 곳 -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:230px;left:327px;">
	
	${map.MEMBER_PWD}
	
	</div>
	
	
	<div style="font-size:20px;font-weight:bold;color:black;width:15%;height:30px;border:1px solid black; position:absolute;top:260px;left:175px;text-align:center; background-color:#eee;">
	회원등급
	</div>
	
	<!--회원 등급 받는 곳  -->
	<div style="font-size:20px;text-align:center;color:black;width:50%;height:30px;border:1px solid black; position:absolute;top:260px;left:327px;">
	${map.MEMBER_LEVEL}
	</div>
	
	 <script>
  function mySubmit(index){
	  if(index==1){
		  
		  document.frm.action="/TripINN/admin/memberModify.do";
	  }
	  
	  if(index==2){
		  document.frm.action="/TripINN/admin/deleteList.do";
	  }
	  document.frm.submit();
  }
  
  
  </script>
	
	
	
	
	
	</form>
	</div>
	
	
	
	
   
   
 
  

  </body>
</html>