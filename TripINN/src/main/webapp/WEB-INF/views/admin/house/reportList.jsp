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
	ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:10px;}
	li{margin-right:50px }
	.left-ul li a{font-size:12px;color:#fff;font-weight:bold;text-decoration:none}
</style>
<!-- 스타일 적용2 -->
<style>
	
	.house_div{
		border:2px solid black;
		width:1040px;
		height:100%;
		border-radius:4px;
		background-color:white;
		margin:auto;
		margin-left:220px;
		margin-top:-383px;
		
	}
	.report_list{
	border:0px solid black;
	width:100px;
	height:30px;
	margin:10px;
	font-size:21px;
	background-color:#eee;
	}
	
   .list1{
    border:1px solid blue;
	width:900px;
	height:200px;
	margin:40px;
	}
	.picture{
	border:1px solid black;
	width:200px;
	height:180px;
	margin:10px;
	}
	.picture1{
	border:1px solid black;
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
	
	}
	.house_info{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:-20px;
	background-color:#eee;
	font-size:14px;
	}
	.house_name{
	border:0px solid black;
	width:630px;
	height:100px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	}
	.house_price{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:220px;
	margin-top:10px;
	background-color:#eee;
	font-size:14px;
	}
	.house_type{
	border:0px solid black;
	width:300px;
	height:20px;
	margin-left:550px;
	margin-top:-20px;
	background-color:#eee;
	font-size:14px;
	}
	
	
	
	
	
	
</style>
    
  </head>
  
  
 	 <br><br>
 	 
 <form name="frm" method="post" action="/TripINN/admin/houseReportDelete.do">
 <input type="hidden" value="" name="REPORT_IDX"/>
 
 <!-- 가운데 윗 영역 -->	 
    <div style="width:100%;height:100px;border:1px solid black;text-align:center;">
	<h2>신고관리 페이지에 오신걸 환영합니다.</h2>
   </div>
   
   
   
  
  
   <!-- 좌측 영역 -->
   <div style="width:17.5%;height:380px;border:1px solid black;text-align:center;">	
	  <ul class="left-ul">
       <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>회원관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseList.do"><h2>숙소관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseReportList.do"><h3>ㄴ신고하기</h3></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/adminTripList.do"><h2>투어관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/adminTripReportList.do"><h3>ㄴ신고하기</h3></a></li>
		<li><a><h2>문의게시판</h2></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h3>ㄴQ&A</h3></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>

	</ul>
   
   </div>
   
   <!-- 가운데 영역 -->
   <div class="house_div">
   <div style="text-align:right">
     <h4>신고된 숙소의 번호를 누르시면 숙소가 삭제 됩니다.</h4>
  </div>
   <div class="report_list">
   신고 목록
   </div>
   <c:choose>
   <c:when test="${fn:length(list)>0}">
   <c:forEach var="house" items="${list}">
    <div class="list1">
     <div class="picture">
    <img class="picture1" src="<%=cp%>/images/house/${house.HOUSE_IMAGE}">
      </div>
      <div class="house_idx">
     번호: <a href="javascript:formSubmit('${house.REPORT_IDX}');">${house.REPORT_IDX }</a>
      </div>
       <div class="house_info">
      제목: ${house.REPORT_TITLE}
      </div>
      <div class="house_name">
      내용: ${house.REPORT_CONTENT}
      </div>
      <div class="house_price">
      작성일자: ${house.REPORT_REGDATE}
      </div>
       <div class="house_type">
      신고유형: ${house.REPORT_TYPE}
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
   </div>
     <!--스크립트 정의  -->
<script type="text/javascript">

	function formSubmit(REPORT_IDX) {
		document.frm.REPORT_IDX.value = REPORT_IDX;
		document.frm.submit();
	}
	
</script>
 
    
   
  </form>
  
</html>