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

<!-- 스타일적용1 -->    
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
		border:0px solid black;
		width:1040px;
		height:85%;
		margin:auto;
		margin-left:220px;
		margin-top:-70px;
		
	}
	.report_list{
	border:0px solid black;
	width:200px;
	height:30px;
	margin:10px;
	font-size:21px;
	}
	
	.list1{
	   border-top:1px solid blue;
	   border-bottom:1px solid blue;
	   width:900px;
	   height:260px;
	   margin:40px;
	}
	.picture{
	border:0px solid black;
	width:200px;
	height:180px;
	margin:10px;
	border-radius:7px;
	}
	.picture1{
	border:0px solid black;
	width:180px;
	height:160px;
	margin:10px;
	border-radius:7px;
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
	border:0px solid black;
	width:70px;
	height:20px;
	margin-left:750px;
	margin-top:50px;
	background-color:#eee;
	font-size:14px;
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
	height:60px;
	margin-left:550px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	overflow-y:scroll;
	}
	.house_persons{
	border:0px solid black;
	width:300px;
	height:40px;
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
	margin-top:-140px;
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
	height:40px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	 .trip_pprice{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.trip_tprice{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	 .trip_persons{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:-10px;
	background-color:#eee;
	font-size:14px;
	border-radius:7px;
	}
	.paging{
    font-size:17px;
    margin-left:450px;
    }
	
	
</style>

<style type="text/css">
#STATICMENU {margin:0pt;padding:0pt;position:absolute;left:0px;top:0px;}
</style>
    
  </head>
  
  
 	 <br><br>
 	 
 	 
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:0px solid black;text-align:center;">
	<h2>투어관리 페이지에 오신걸 환영합니다.</h2>
   </div>
   
   <body onload="InitializeStaticMenu();">
   
   <!-- 좌측 영역 -->
   <div id="STATICMENU" style="width:17.5%;height:380px;border:0px solid black;text-align:center;">	
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
  <h4>&nbsp;&nbsp;전체 투어 목록</h4>
   </div>
   <div style="width:1030px; height:0px; border-bottom:2px solid #dcdcdc; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   </div>
   <c:choose>
   <c:when test="${fn:length(list)>0}">
   <c:forEach var="adminTrip" items="${list}">
    <div class="list1">
     <div class="picture">
     <c:set var="fullImg" value="${adminTrip.TRIP_IMAGE }"/>
	 <c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
    <img class="picture1" src="<%=cp%>/images/trip/${tripImg}">
      </div>
      <div class="house_idx">
      &nbsp;번호: ${adminTrip.TRIP_IDX}
      </div>
       <div class="house_info">
      &nbsp;지역: ${adminTrip.TRIP_AREA}
      </div>
      <div class="house_name">
   &nbsp;투어 테마: ${adminTrip.TRIP_TYPE}
      </div>
      <div class="house_price">
     &nbsp;언어: ${adminTrip.TRIP_LANGUAGE}
      </div>
      <div class="house_zipcode">
     &nbsp;투어이름: ${adminTrip.TRIP_NAME}
      </div>
      <div class="house_addr">
     &nbsp;소개:${adminTrip.TRIP_INTRO}
      </div>
     <div class="house_persons">
   &nbsp;투어기간:${adminTrip.TRIP_FIRST_DATE} ~ ${adminTrip.TRIP_LAST_DATE}
      </div>
       <div class="house_total_price">
  &nbsp;포함사항:${adminTrip.TRIP_INCLUDE}
      </div>
       <div class="house_person_price">
   &nbsp;우편번호:${adminTrip.TRIP_ZIPCODE}
      </div>
      <div class="house_kind">
  &nbsp;주소:${adminTrip.TRIP_ADDR1} ${adminTrip.TRIP_ADDR2} ${adminTrip.TRIP_ADDR3}
      </div>
       <div class="trip_pprice">
  &nbsp;인원당 가격: ${adminTrip.TRIP_PPRICE}
      </div>
       <div class="trip_tprice">
  &nbsp;총 가격: ${adminTrip.TRIP_TPRICE}
      </div>
      <div class="trip_persons">
  &nbsp;인원수: ${adminTrip.TRIP_PERSONS}
      </div>
      
    </div>
    </c:forEach>
    </c:when>
    <c:otherwise>
				<div class="report_listNo">
					등록된 투어가 없습니다.
					
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
        comSubmit.setUrl("<c:url value='/admin/adminTripList.do' />");
        comSubmit.addParam("currentPageNo", pageNo);
        comSubmit.submit();
    }
  //스크롤에 따라서 드롭다운이 따라감
    var stmnLEFT = 10; // 오른쪽 여백 
    var stmnGAP1 = 0; // 위쪽 여백 
    var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
    var stmnBASE = 150; // 스크롤 시작위치 
    var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
    var stmnScrollSpeed = 30; //스크롤 속도 (클수록 느림)
    var stmnTimer; 
    
    function RefreshStaticMenu() { 
        var stmnStartPoint, stmnEndPoint; 
        stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
        stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
        if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
        if (stmnStartPoint != stmnEndPoint) { 
         stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
         document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
         stmnRefreshTimer = stmnScrollSpeed; 
         }
        stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
        } 
       function InitializeStaticMenu() {
        document.getElementById('STATICMENU').style.left = stmnLEFT + 'px';  //처음에 왼쪽 위치
        document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
        RefreshStaticMenu();
        }
</script>
   
    
   
  
  
</html>