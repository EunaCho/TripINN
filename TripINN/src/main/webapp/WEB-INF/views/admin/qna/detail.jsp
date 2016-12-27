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
  <div style="width:100%;height:100px;border:1px solid red;text-align:center;">
   <h5>상세보기 페이지 입니다.</h5>
  </div>



 <div style="width:66%;height:381px;border:1px solid red;text-align:center; position:absolute;top:200px;left:220px;">
<!-- 900 -->
<div class="row" style="padding-left:15px;width:1600px;border:1px solid red; text-align:center;">



 <!-- 상세보기,편집 할 수 없도록 <input> 태그를 사용하지 않았음. -->
<table class="board_view" >
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
                <td>${map.QNA_IDX }
                        <input type="hidden" id="QNA_IDX" name="QNA_IDX" value="${map.QNA_IDX }"></td>
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
    <a href="#this" class="btn" id="delete">삭제하기</a>
     
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
            
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_qnaDeleteBoard();
            });
        });
         
        function fn_qnaBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
            comSubmit.submit();
        }
         
        function fn_qnaBoardUpdate(){
            var qna_idx = "${map.QNA_IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaUpdate.do' />");
            comSubmit.addParam("QNA_IDX", qna_idx);
          
            comSubmit.submit();
        }
        
        function fn_qnaDeleteBoard(){
        	//var qna_idx = "${map.QNA_IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaDelete.do' />");
            comSubmit.addParam("QNA_IDX", $("#QNA_IDX").val());
            comSubmit.submit();
             
        }
        
    </script>
    
<!-- 댓글쓰는 창	 -->	
<div class="inner" style ="border:1px solid red;">
	<form class="commentForm" method="post" onsubmit="return validation();">
		<input type="hidden" name="content_num" value="${QnAModel.no}"/>
		<input type="hidden" name="commenter" value="${session_member_id}"/>	
	      	
	      	
<div class="reply_grp" >
     <div class="reply_form">
            
       <div class="reply_write">
          <div class="textarea_grp" style="width: 1000px;">
          
              <!-- 로그인안했을 때 보여주는 댓글 요청 내용 -->
	      	<br/><c:if test="${session_member_id == null}">
	      	<input type="text" style="align:center; margin: 10px; width: 950px; height: 55px;" value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly"/>
	      	 </c:if>
	      	 <!-- 댓글 쓰는 창 -->
	      	 <c:if test="${session_member_id != null}">
	      	 <!-- 글자 수 제한 -->
	      	 <textarea name="commentt" style="width: 885px; height: 55px;"onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
	      		<button type="button" class="btn1 btn-primary1" onclick="onComment()">입력	</button>
	      		<div style="margin-bottom:10px;"><br/>&nbsp;&nbsp;&nbsp;<span id="byteInfo">0</span>/200Byte</div>
	      	 </c:if>
	      	 
				</div>
				</div>
				
				
<p class="reply_num"> <strong>댓글 총 개수 :   ${comment_count}</strong></p>
			</div >
			
	<!-- 댓글 차례로 보여주는 창 -->
		<c:forEach var="list" items="${CommList}">		
	<div style="margin-bottom:50px;">
		<div class="reply_view" >
			<div class="reply_tit">
				<p class="tit"><strong>${list.commenter}</strong>님  <fmt:formatDate value="${list.reg_date}" pattern="yy.MM.dd"></fmt:formatDate><span class="ip"></span> </p>
					<!-- 입력되어 있는 작성자와 아이디가 같거나, 아이디가 admin 일때만 삭제  창을 띄운다. -->
					<c:if test="${session_member_id == list.commenter || session_member_id == 'admin'}">
					<td align="left">
						<%-- <input type="button" onclick="qnacommDelete(${list.comment_num},${session_member_id})&QnAcommUpdate2(${list.content_num})"  value="삭제" class="btn btnC_01 btnP_02"/> --%>
						<a href="QnAcommDelete.dog?comment_num=${list.comment_num}&no=${QnAModel.no}&commenter=${list.commenter}">
						<input type="button" onclick="qnacommDelete(${list.comment_num})"  value="삭제" class="btn btnC_01 btnP_02"/>
					</a>
					</td>
<!-- 						<span class="btn btnC_05 reply_btn">	삭제</span> -->
				
					</c:if>
				</div>
			
				<div class="reply_cts" >
					<p>${list.commentt}</p><br/>
				</div>
			</div>
			</div>
				</c:forEach>
			
			</div>
	</form>
				<c:if test="${fn:length(CommList) le 0}">
	      				<br/><center>등록된 댓글이 없습니다</center><br/>
	      	</c:if> 	

	      	
	      					
	      			</div>
	      		</div>
	 					</div>
	 					</div>    
    
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
 

