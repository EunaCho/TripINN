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
</style>


</head>
  
  <body>
 	 <br><br>
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:0px solid blue;text-align:center;">
	<h2>회원정보 상세페이지</h2>
   </div>
   
   
   <!-- 좌측 영역 -->
   <div style="width:16.7%;height:380px;border:0px solid black;text-align:center;">	
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
   <div style="color:black;width:83%;height:378px;border:1px solid black;text-align:left; position:absolute;top:205px;left:210px;">
   
   <form name="frm" method="post">
   <input type="button" value="수정하기" id="button2" onClick="mySubmit(1)" style="position:absolute;top:400px;left:380px;"/>
   <input type="button" value="삭제하기" id="button3" onClick="mySubmit(2)" style="position:absolute;top:400px;left:520px;"/>
   <input type="hidden" value="${map.MEMBER_IDX}" name="MEMBER_IDX"/>
  


   

   
   
   
	
	
	
	<div style="font-size:21px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:20px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	번호
	</div>
	
	<!-- 번호 받는 곳 -->
	<div style="font-size:18px;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:20px;left:180px;text-align:center; background-color:">
	${map.MEMBER_IDX}
    </div>

	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:55px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	이름
	</div>
	<!-- 이름 받는 곳 -->

	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:55px;left:180px;">
	${map.MEMBER_NAME}
    </div>
	
	
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:90px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	주소
	</div>
	<!-- 주소 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:90px;left:180px;">
	${map.MEMBER_ADDR}
	
	
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:125px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	이메일
	</div>
	
	<!-- 이메일 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:125px;left:180px;">
	${map.MEMBER_EMAIL}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:160px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	휴대폰
	</div>
	
	<!--  휴대폰 받는곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:160px;left:180px;">
	${map.MEMBER_PHONE}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:195px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	생일
	</div>
	
	<!-- 생일 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:195px;left:180px;">
	${map.MEMBER_BIRTH}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:230px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	성별
	</div>
	
	<!-- 성별 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:230px;left:180px;">
	${map.MEMBER_SEX}
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:265px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	가입일자
	</div>
	
	
	<!-- 가입일자 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:265px;left:180px;">
	
	${map.MEMBER_JOINDATE}
	
	</div>
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:300px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	비밀번호
	</div>
	
	<!-- 비밀번호 받는 곳 -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:300px;left:180px;">
	
	${map.MEMBER_PWD}
	
	</div>
	
	
	<div style="font-size:20px;color:black;width:15%;height:30px;border:0px solid black; position:absolute;top:335px;left:20px;text-align:center; background-color:#D2D2FF;border-radius:7px;">
	회원등급
	</div>
	
	<!--회원 등급 받는 곳  -->
	<div style="font-size:18px;text-align:center;color:black;width:80%;height:30px;border:1px solid black; position:absolute;top:335px;left:180px;">
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