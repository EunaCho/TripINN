<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<!--스크립트 정의  -->
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>



<!-- 스타일 적용2 -->
<style>   
ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:15px;}

li{margin-right:50px }

a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
</style> 
</head>

<body>
  <br><br>
  
 <!-- 가운데 윗 영역 -->
    <div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>회원관리 페이지에 오신걸 환영합니다.</h2>
   </div>
<div style="width:66%;height:381px;border:1px solid black;text-align:center; position:absolute;top:200px;left:220px;">
<div class="row" style="padding-left:15px;width:900px; text-align:left;">    
  <h2>회원 리스트</h2>
<table border="1">
		<tr>
			<td>번호</td>
			<td>이메일</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>생일</td>
			<td>핸드폰</td>
			<td>성별</td>
			<td>주소</td>
			<td>가입일</td>
			<td>회원등급</td>
			
		</tr>
		
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="member">
					<tr>
						<td>${member.MEMBER_IDX}</td>
						<td>${member.MEMBER_EMAIL}</td>
						<td>${member.MEMBER_NAME}</td>
						<td>${member.MEMBER_PWD}</td>
						<td>${member.MEMBER_BIRTH}</td>
						<td>${member.MEMBER_PHONE}</td>
						<td>${member.MEMBER_SEX}</td>
						<td>${member.MEMBER_ADDR}</td>
						<td>${member.MEMBER_JOINDATE}</td>
						<td>${member.MEMBER_LEVEL}</td>
						
						
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
			<tr>
				<td>등록된 숙소가 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
		
	</table>
  
  
</div>


</div>

<!-- 좌측영역 -->
<div style="width:15%;height:380px;border:1px solid black;text-align:center;">
   
   <ul>
  <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>회원관리</h2></a></li>

      <li><a href = "http://www.naver.com"><h2>숙소관리</h2></a></li>
      <li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>

      <li><a href = "http://www.daum.net"><h2>투어관리</h2></a></li>
      <li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
      
      <li><a><h2>문의게시판</h2></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h3>ㄴQ&A</h3></a></li>

        <li><a href = "http://www.naver.com"><h3>ㄴFAQ</h3></a></li>

        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>


   </ul>
   
   <!-- 우측 영역 -->
   </div>
   <div style="color:black;width:20%;height:380px;border:1px solid black;text-align:left; position:absolute;top:200px;left:1133px;">
   <img src="/TripINN/images/풍차.jpg" style="width: 290px; height:381px;">
   </div>
</body>

<!-- 스타일 적용2 -->
<style>	
ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:15px;}

li{margin-right:50px }

a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
</style> 
</head>

<body>
  <br><br>
  


