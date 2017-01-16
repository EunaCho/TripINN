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
			margin-left:-50px;
			margin-top:80px;
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

<style type="text/css">
#STATICMENU {margin:0pt;padding:0pt;position:absolute;left:0px;top:0px;}
</style>

<!-- 스타일 적용3 -->
<style>
	
	.house_div{
		border:0px solid black;
		width:1040px;
		height:100%;
		background-color:white;
		margin:auto;
		margin-left:212px;
		margin-top:-60px;
		
	}
	.report_list{
	border:0px solid black;
	width:140px;
	height:30px;
	margin:10px;
	font-size:21px;
	}
	
   .list1{
    border-top:1px solid blue;
    border-bottom:1px solid blue;
	width:900px;
	height:200px;
	margin:40px;
	}
	.house_idx{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:130px;
	margin-top:10px;
	font-size:14px;
	background-color:#eee;
	border-radius:4px;
	}
	.house_info{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:460px;
	margin-top:-20px;
	font-size:14px;
	background-color:#eee;
	border-radius:4px;
	}
	.house_name{
	border:0px solid black;
	width:630px;
	height:60px;
	margin-left:130px;
	margin-top:10px;
	font-size:14px;
	background-color:#eee;
	border-radius:4px;
	overflow-y:scroll;
	
	}
	.house_price{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:130px;
	margin-top:10px;
	font-size:14px;
	background-color:#eee;
	border-radius:4px;
	}
	.house_type{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:460px;
	margin-top:-20px;
	background-color:#eee;
	font-size:14px;
	border-radius:4px;
	}
	.paging{
    font-size:17px;
    margin-left:450px;
    }
	
	
	
	
	
</style>
    
  </head>
  
  
 	 <br><br>
 	 
 <form name="frm" method="post" action="/TripINN/admin/houseReportDelete.do">
 <input type="hidden" value="" name="REPORT_IDX"/>
 
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:0px solid black;text-align:center;">
	<h2>신고관리 페이지에 오신걸 환영합니다.</h2>
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
   <div style="text-align:right">
     <h4>신고된 숙소의 번호를 누르시면 숙소가 삭제 됩니다.</h4>
  </div>
   <div class="report_list">
   <h3>&nbsp;&nbsp;&nbsp;신고 목록</h3>
   </div>
   <div style="width:1028px; height:0px; border-bottom:2px solid #dcdcdc; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
        </div>
   <c:choose>
   <c:when test="${fn:length(list)>0}">
   <c:forEach var="house" items="${list}">
    <div class="list1">
    
      <div class="house_idx">
    &nbsp;번호: <a href="javascript:formSubmit('${house.REPORT_IDX}');">${house.REPORT_IDX }</a>
      </div>
       <div class="house_info">
      &nbsp;제목: ${house.REPORT_TITLE}
      </div>
      <div class="house_name">
      &nbsp;내용: ${house.REPORT_CONTENT}
      </div>
      <div class="house_price">
     &nbsp; 작성일자: ${house.REPORT_REGDATE}
      </div>
       <div class="house_type">
      &nbsp;신고유형: ${house.REPORT_TYPE}
      </div>
      
    </div>
     
    </c:forEach>
    </c:when>
    <c:otherwise>
				<div class="report_listNo">
					신고된 숙소가 없습니다.
					
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

	function formSubmit(REPORT_IDX) {
		document.frm.REPORT_IDX.value = REPORT_IDX;
		document.frm.submit();
	}
	 //게시판 목록을 호출할 때 currentPageNo 값을 같이 전송해줌
    function fn_search(pageNo){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/houseReportList.do' />");
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
 
    
   
  </form>
  
</html>