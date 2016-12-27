<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- 작성자: 이진욱 -->
<!-- 스타일 적용1 -->
<style>   
ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:15px;}
li{margin-right:50px }
a{font-size:12px;color:whit e;font-weight:bold;text-decoration:none}
</style>
</head>

<body>
  <br><br>
  
 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>Q&A 페이지에 오신걸 환영합니다.</h2>
   </div>
   
<div style="width:66%;height:381px;border:1px solid black;text-align:center; position:absolute;top:200px;left:220px;">

<div class="row" style="padding-left:15px;width:900px; text-align:center;">    
   <h5 class="page-header">QnA 게시판</h5>
	<table class="board_list">
	<!--<table style="border:1px solid #ccc">-->
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
           
            <c:forEach var="row" items="${list}" varStatus="status">                
                    <tr>
                        <td>${row.QNA_IDX }</td>
                        <td class="title">
                        <!-- a태그를 이용하여 링크 가능하도록 함 -->
                                <a href="#this" name="title">${row.QNA_TITLE }</a>
                        <!-- hidden 태그를 이용하여 글번호를 숨겨둠 -->        
                                <input type="hidden" id="QNA_IDX" value="${row.QNA_IDX }">
                        </td>
                        <td>${row.QNA_READCOUNT }</td>
                        <td>${row.QNA_REGDATE }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>        
    </tbody>
</table>
<br/>

	<!-- 화면에서 페이징으로 바뀔 부분 -->	
	<c:if test="${not empty paginationInfo}">
	<!-- paginationInfo= 페이징 태그를 만들기 위해서 필요한 정보, AbstractDAO에서 반환한게 여기서 사용됨 -->
	<!-- jsFunction = 페이징 태그를 클릭했을 때 수행할 함수 ,즉 fn_search 라는 함수를 호출 -->
        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
    </c:if>
    
    <!-- 현재 페이지 번호를 저장 -->
    <input type="hidden" id="currentPageNo" name="currentPageNo"/>
     
    <a href="#this" class="btn" id="write">글쓰기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    
    <script type="text/javascript">
    
  
        $(document).ready(function(){
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_qnaBoardWrite();
            }); 
             
            $("a[name='title']").on("click", function(e){ //제목 
                e.preventDefault();
            
              //아래의 함수를 실행, 여기서 $(this)가 jQuery 객체를 뜻하며 게시글 제목인 <a>태그를 의미함.
                fn_qnaBoardDetail($(this));
            });
        });
         
        
        function fn_qnaBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaWrite.do' />");
            comSubmit.submit();
        }
         
  
        function fn_qnaBoardDetail(obj){
        	
        	//ComSubmit 객체를 만든 이유중 하나가 폼에 동적으로 값을 추가하는 기능을 편하게 사용하기 위함이며 addParam 함수가 그 역할을 담당한다.
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaDetail.do' />");
            //서버로 전송될 키 값
             //jQuery를 이용하여 선택된 <a> 태그의 부모 노드 내에서 IDX라는 값을 가진 태그를 찾고 그 태그의 값을 가져오도록 한 것 
            comSubmit.addParam("QNA_IDX", obj.parent().find("#QNA_IDX").val());
            comSubmit.submit();
        } 
        
        //게시판 목록을 호출할 때 currentPageNo 값을 같이 전송해줌
        function fn_search(pageNo){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
            comSubmit.addParam("currentPageNo", pageNo);
            comSubmit.submit();
        }
    </script> 


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
        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>


   </ul>
   
   <!-- 우측 영역 -->
  <!-- 
   </div>
   <div style="color:black;width:20%;height:380px;border:1px solid black;text-align:left; position:absolute;top:200px;left:1133px;">
   <img src="/TripINN/images/풍차.jpg" style="width: 290px; height:381px;">
   </div>
    -->
</body>
</html>
 

