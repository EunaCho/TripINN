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
 	<!-- 가운데 윗 영역 -->
  		<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   			<h5>수정 페이지 입니다.</h5>
  		</div>
  	
  	<!-- 가운데 영역 전체(좌측+우측) -->
  	<div style="width:100%;height:85%;border:1px solid black;">

  	<!-- 가운데 좌측영역 -->
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
   </div><!-- 가운데 좌측영역 끝-->
  		
	<!-- 가운데 우측 영역 -->
 		<div style="width:80%;height:381px;border:1px solid black;text-align:center; position:absolute;top:170px;left:240px;">
		
		<!-- 수정폼 감싸는 영역 -->
		<div class="row" style="padding-left:15px;width:1100px; text-align:center;">

	
	<form id="frm">
		<table class="board_view">
       	 <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        
        <!-- 글씨 덮는 영역 -->
        <div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   			<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>게시글 수정</strong></font>
		</div>		
		<br>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>
                	${map.QNA_IDX}
                    <input type="hidden" id="QNA_IDX" name="QNA_IDX" value="${map.QNA_IDX }">
                    </td>
                	<th scope="row">조회수</th>
                	<td>${map.QNA_READCOUNT}</td>
            </tr>
            <tr>
               
                <th scope="row">작성자</th>
                <td>${map.MEMBER_NAME }</td>
               
                <th scope="row">작성시간</th>
                <td>${map.QNA_REGDATE}</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">
                        <input type="text" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90" value="${map.QNA_TITLE }"/>
                    </td>
            </tr>
            <tr><!-- 글내용 -->
                <td colspan="4" class="view_text">
                    <textarea rows="4" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT">${map.QNA_CONTENT}</textarea>
                </td>
            </tr>
        </tbody>
      </table>
    </form>
    <br> 
    <a href="#this" class="btn_list" id="list">목록으로</a>
    <a href="#this" class="btn_write" id="update">저장하기</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_faqBoardList();
            });
            
            $("#update").on("click", function(e){//저장하기 버튼
                e.preventDefault();
                fn_faqUpdateBoard();
            });
            
           
            
        });
         
        function fn_faqBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqList.do' />");
            comSubmit.submit();
        }
         
        function fn_faqUpdateBoard(){
        	var comSubmit = new ComSubmit("frm");
        	comSubmit.setUrl("<c:url value='/admin/faqUpdatePro.do' />");
            comSubmit.submit();
        }
        
    </script>
</div> <!-- 수정폼 감싸는 영역 끝 -->
</div><!-- 가운데 우측영역 끝 -->

</div><!-- 가운데 전체(좌측+우측)영역 끝 -->

</body>
</html>
