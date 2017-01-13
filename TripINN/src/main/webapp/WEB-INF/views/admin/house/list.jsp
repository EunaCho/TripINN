<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
  
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
			

 
 
<!-- 스타일 적용2 -->
<style>
	
	.house_div{
		border:0px solid blue;
		width:1040px;
		height:100%;
		border-radius:4px;
		margin:auto;
		margin-left:220px;
		margin-top:-383px;
		
	}
	.report_list{
	border:0px solid black;
	width:200px;
	height:30px;
	margin:10px;
	font-size:21px;
	font-
	}
	
	.list1{
	   border-top:1px solid blue;
	   border-bottom:1px solid blue;
	   width:900px;
	   height:200px;
	   margin:40px;
	}
	.picture{
	border:0px solid black;
	width:200px;
	height:180px;
	margin:10px;
	}
	.picture1{
	border:0px solid black;
	width:180px;
	height:160px;
	margin:10px;
	}
	.house_idx{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:-190px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	
	}
	.house_info{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:-20px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_name{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_price{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:-20px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_delete{
	border:2px solid black;
	width:70px;
	height:20px;
	margin-left:750px;
	margin-top:50px;
	border-radius:7px;
	}
	.report_listNo{
	border:0px solid black;
	width:200px;
	height:30px;
	margin:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	
	.house_zipcode{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_addr{
	border:0px solid black;
	width:300px;
	height:40px;
	margin-left:550px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_persons{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_total_price{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:-105px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.house_person_price{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
    .house_kind{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	
   .paging{
   font-size:17px;
   margin-left:450px;
   }
	
	
	
</style>
    
  </head>
  
  
 	 <br><br>
 	 
 	 
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:0px solid black;text-align:center;">
	<h2>숙소관리 페이지에 오신걸 환영합니다.</h2>
   </div>
   
  
   <!-- 좌측 영역 -->
   
   <div  style="width:17.5%;height:380px;border:0px solid black;text-align:center;">	
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
   <div class="house_div">
   <div class="report_list">
     &nbsp;&nbsp;&nbsp;<Strong>전체 숙소 목록</Strong>
   </div>
   <div style="width:1030px; height:0px; border-bottom:2px solid #dcdcdc; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   </div>
   <c:choose>
   <c:when test="${fn:length(list)>0}">
   <c:forEach var="house" items="${list}">
    <div class="list1">
     <div class="picture">
    <img class="picture1" src="<%=cp%>/images/house/${house.HOUSE_IMAGE}">
      </div>
      <div class="house_idx">
     &nbsp;번호: ${house.HOUSE_IDX}
      </div>
       <div class="house_info">
     &nbsp;설명: ${house.HOUSE_INFO}
      </div>
      <div class="house_name">
      &nbsp;이름: ${house.HOUSE_NAME}
      </div>
      <div class="house_price">
      &nbsp;숙소가격: ${house.HOUSE_PRICE}
      </div>
      <div class="house_zipcode">
     &nbsp; 우편번호: ${house.HOUSE_ZIPCODE}
      </div>
      <div class="house_addr">
      &nbsp;주소: ${house.HOUSE_ADDR1}  ${house.HOUSE_ADDR2}  ${house.HOUSE_ADDR3}
      </div>
     <div class="house_persons">
     &nbsp; 최대수용인원: ${house.HOUSE_PERSONS}
      </div>
       <div class="house_total_price">
      &nbsp;총 가격: ${house.HOUSE_TOTAL_PRICE}
      </div>
       <div class="house_person_price">
      &nbsp;인원 당 가격: ${house.HOUSE_PERSON_PRICE}
      </div>
      <div class="house_kind">
      &nbsp;종류: ${house.HOUSE_KIND}
      </div>
      
      
    </div>
    </c:forEach>
    </c:when>
    <c:otherwise>
				<div class="report_listNo">
					등록된 숙소가 없습니다.
					
				</div>
		</c:otherwise>
    </c:choose>
     <!-- 현재 페이지 번호를 저장 -->
    <div class="paging">
       ${pagingHtml}
    </div>
   </div>
   
  
   
   <!--스크립트 정의  -->
<script type="text/javascript">

   
   //게시판 목록을 호출할 때 currentPageNo 값을 같이 전송해줌
    function fn_search(pageNo){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/houseList.do' />");
        comSubmit.addParam("currentPageNo", pageNo);
        comSubmit.submit();
    }
</script>
</html>