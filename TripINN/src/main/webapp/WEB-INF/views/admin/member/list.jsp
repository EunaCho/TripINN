<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 스타일 적용2 -->
<style>   
ul{width:172px;height:340px;background:blue;opacity:0.4;list-style:none;padding-top:15px;}

li{margin-right:50px }

.left-ul li a{font-size:12px;color:#fff;font-weight:bold;text-decoration:none}
.tbl { width:1000px; border:1px; }
.tbl tr th {  border:1px solid #a6a6a6;height:30px;text-align:center; background:#eee; }
.tbl tr td { border:1px solid #a6a6a6; padding:5px;height:30px; }
.tbl tr td a { text-decoration: none; color:#000; }
.tbl tr td a:hover { color: #ff3300; vertical-align: middle; }
#tbl {}
</style> 

  <br><br>
  
 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   		<h2>회원관리 페이지에 오신걸 환영합니다.</h2>
</div>

<div style="height:100%; margin:0px auto; display:table;"> <!-- 좌측+리스트 -->
<!-- 좌측영역 -->
<div style="width:210px;height:380px;border:1px solid black;text-align:center; float:left;">
	<ul class="left-ul">
		<li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>회원관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseList.do"><h2>숙소관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseReportList.do"><h3>ㄴ신고하기</h3></a></li>
		<li><a href = "http://www.daum.net"><h2>투어관리</h2></a></li>
		<li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
		<li><a><h2>문의게시판</h2></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h3>ㄴQ&A</h3></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>
   </ul>
</div><!-- side div End -->
   
<div style="width:1025px;height:100%; border:1px solid red; text-align:center; top:208px;left:400px; margin:10px auto; float:left;">

  		<h2>회원 리스트</h2>
  	<div style="width:1001px; height:80%; margin:10px; border:1px solid blue;"> <!-- table div start -->
 
 		<form name="frm" method="post" action="/TripINN/admin/memberView.do">
 			<input type="hidden" value="" name="MEMBER_IDX"/>
 
			<table class="tbl" cellspacing="0" cellpadding="0" >
		
				<tr>
					<th width="100px">번호</th>
					<th width="500px">이메일</th>
					<th width="1300px">주소</th>
					<th width="350px">가입일</th>	
				</tr>
		
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="member">
					<tr>
						<td align="center">${member.MEMBER_IDX}</td>
						
						<td class="MEMBER_EMAIL">
                                <a href="javascript:formSubmit('${member.MEMBER_IDX}');" >${member.MEMBER_EMAIL }</a>
                        </td>
                        <td align="center">${member.MEMBER_ADDR}</td>
						<td align="center" >${member.MEMBER_JOINDATE}</td>
					</tr>
					</c:forEach>
				</c:when>
			<c:otherwise>
					<tr>
						<td>회원가입한 멤버가 없습니다.</td>
					</tr>
			</c:otherwise>
			</c:choose>
			</table>
 		</form>
	</div><!-- table div End -->
	<!-- 현재 페이지 번호를 저장 -->
    <div class="paging">
       ${pagingHtml}
    </div>
</div><!-- list div End -->

</div><!-- 전체  --> 
<div style="clear:both;"></div>


   
   <!--스크립트 정의  -->
<script type="text/javascript">

	function formSubmit(MEMBER_IDX) {
		document.frm.MEMBER_IDX.value = MEMBER_IDX;
		document.frm.submit();
	}
	
	//게시판 목록을 호출할 때 currentPageNo 값을 같이 전송해줌
    function fn_search(pageNo){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/MemberList.do' />");
        comSubmit.addParam("currentPageNo", pageNo);
        comSubmit.submit();
    }
</script>

