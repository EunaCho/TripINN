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

a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
</style> 
</head>

<body>
  <br><br>
  
 <!-- 가운데 윗 영역 -->
  <div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h5>상세보기 페이지 입니다.</h5>
  </div>

 <div style="width:66%;height:381px;border:1px solid black;text-align:center; position:absolute;top:200px;left:220px;">
<!-- 900 -->
<div class="row" style="padding-left:15px;width:1650px; text-align:center;">

 <!-- 상세보기,편집 할 수 없도록 <input> 태그를 사용하지 않았음. -->
<table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="30%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <br>
        <caption>게시글 상세보기</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.QNA_TITLE }</td>
                <th scope="row">조회수</th>
                <td>${map.QNA_READCOUNT }</td>
            </tr>
            <tr>
            <!--  
                <th scope="row">작성자</th>
                <td>${map.MEMBER_NAME }</td>
            -->    
                <th scope="row">작성시간</th>
                <td>${map.QNA_REGDATE }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.QNA_TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.QNA_CONTENT }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_qnaBoardList();
            });
            
            $("#update").on("click", function(e){//수정하기 버튼
                e.preventDefault();
                fn_qnaBoardUpdate();
            });
        });
         
        function fn_qnaBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
            comSubmit.submit();
        }
         
        function fn_qnaBoardUpdate(){
            var idx = "${map.QNA_IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaUpdate.do' />");
            comSubmit.addParam("QNA_IDX", qna_idx);
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
   </div>
   <div style="color:black;width:20%;height:380px;border:1px solid black;text-align:left; position:absolute;top:200px;left:1133px;">
   <img src="/TripINN/images/풍차.jpg" style="width: 290px; height:381px;">
   </div>
</body>
</html>
 

