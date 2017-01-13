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
    
 <style>
 
 #dropdown2 li a{
 font-size:19px;
 color:black;
 }
 
 #dropdown2{
            
			list-style-type: none;
			margin-left:-40px;
			position:absolute;
			max-width:300px;
			margin-top:-20px;
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
</style>

  </head>
  <body>
  <br><br>
    <div style="width:100%;height:100px;border:0px solid blue;text-align:center;">
	<h2>관리자 페이지에 오신걸 환영합니다.</h2>
   </div>

   
   <!-- 좌측 영역 -->
   <div style="width:16.8%;height:380px;border:0px solid black;text-align:center;">	
	   <section>
				<nav style="height:400px;width:250px;">

					<ul id="dropdown2">
						<li><a href="http://localhost:8080/TripINN/admin/main.do">관리자 홈</a>
						<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/memberList.do">회원관리</a></li>
						</ul>
						</li>
						
						<li><a href="http://localhost:8080/TripINN/admin/houseList.do">숙소관리</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/houseReportList.do">신고하기</a></li>
							</ul>
						</li>
						
						<li><a href = "http://localhost:8080/TripINN/admin/adminTripList.do">투어관리</a>
							<ul>
						<li><a href = "http://localhost:8080/TripINN/admin/adminTripReportList.do">신고하기</a></li>
							
							</ul>
						</li>
						
						<li>문의게시판
							<ul>
						<li><a href = "http://localhost:8080/TripINN/admin/qnaList.do">Q&A</a></li>
						<li><a href = "http://localhost:8080/TripINN/admin/faqList.do">FAQ</a></li>
							
							</ul>
						</li>
						
					</ul>
				</nav>
		</section>
   
   </div>
   
   <!-- 가운데 영역 -->
   <div style="color:black;width:83%;height:379px;border:1px solid black;text-align:left; position:absolute;top:205px;left:210px;">
	<h3>&nbsp;&nbsp;관리자 공지사항</h3>
	<h4>&nbsp;· &nbsp;관리자 홈으로 이동</h4>
	<h5>&nbsp;&nbsp;&nbsp;&nbsp;관리자 홈으로 바로 이동 할 수 있습니다.</h5>
	
	<h4>&nbsp;· &nbsp;회원관리</h4>
	<h5>&nbsp;&nbsp;&nbsp;&nbsp;회원을 관리하기 위한 페이지로 이동 할 수 있습니다.</h5>
	
	<h4>&nbsp;· &nbsp;숙소관리</h4>
	<h5>&nbsp;&nbsp;&nbsp;&nbsp;숙소 관리를 위한 페이지로 이동 할 수 있습니다.</h5>
	
	<h4>&nbsp;· &nbsp;문의게시판</h4>
	<h5>&nbsp;&nbsp;&nbsp;&nbsp;Q&A와 FAQ 관리를 위한 페이지로 이동 할 수 있습니다.</h5>
	
   </div>
   
  

 
   
   
 
   

   

  
  </body>
</html>