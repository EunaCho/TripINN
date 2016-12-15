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
	<h2>회원정보 상세페이지</h2>
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
   
   <!-- 가운데 영역 -->
   <div style="color:black;width:66%;height:381px;border:1px solid black;text-align:left; position:absolute;top:192px;left:213px;">
   
   <div style="color:black;width:66%;height:381px;border:1px solid black; margin-left:150px;">
   
	<div style="width:20%;height:150px;border:2px solid blue">
	<img src="/TripINN/images/공유.png" style="width:100%; height:150px;">
	</div>
	
	<div style="color:black;width:30%;height:20px;border:1px solid black; position:absolute;top:30px;right:350px;">
	<h4><strong>아이디:</strong></h4>
	</div>
	
	</div>
   </div>
   
   <!-- 우측영역 -->
   <div style="color:black;width:20%;height:380px;border:1px solid black;text-align:left; position:absolute;top:192px;left:1142px;">
   <img src="/TripINN/images/풍차.jpg" style="width: 280px; height:381px;">
   </div>
  
  </body>
</html>