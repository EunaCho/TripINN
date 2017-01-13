<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<% String cp = request.getContextPath(); %>

<!-- 작성자: 이진욱 -->
<!-- 스타일적용1 -->
<style>   
ul{width:172px;height:720px;background-color:#c2e4e7;list-style:none;padding-top:1px;}
li{margin-right:50px }
a{font-size:12px;color:#008489;font-weight:bold;text-decoration:none}
</style>

<!-- 스타일 적용2 -->
<style>
   .howToUse_div{
      border:2px;
      width:900px;
      overflow:hidden;
      height:auto;
      border-radius:4px;
      background-color:white;
      margin-left:10px;
      margin-top:10px;
      
   }
   .howToUse{
   border:0px solid black;
   
   width:200px;
   height:30px;
   margin:10px 10px 50px 10px;
   font-size:21px;
   text-align: center;
   }
   
   .list1{
    border:1px solid #828282;
   width:895px;
   height:auto;
   margin:0px;
   }
   .howToUse_title{
   border:0px solid black;c
   border-radius:4px;
   width:99%;
   height:20%;
   margin-left:5px;
   margin-top:10px;
   font-size:19px;
   vertical-align:middle;
	   
   }
   .howToUse_content{
   border:0px solid black;
   border-radius:4px;
   width:98%;
   height:60%;
   padding:4px;   
   margin-left:5px;
   margin-top:10px;
   font-size:14px;
   
   }
   

</style>


 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>FAQ 페이지에 오신걸 환영합니다.</h2>
</div>

<!-- 가운데 영역(좌+우) 전체 -->
<div style="width:100%;height:auto;border:1px solid black;">

<!-- 가운데 좌측영역 -->
<!-- height 380 -->
<div style="width:15%; height:380px;float:left;">
   <ul>
   	  <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
	  <li> <a><h1>시&nbsp;작&nbsp;하&nbsp;기</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h2>ㄴ이용방법</h2></a></li> 
      <li><a href = "http://localhost:8080/TripINN/admin/faqList1.do"><h2>ㄴ여행방법</h2></a></li>
   
       <a><h1>계정과&nbsp;프로필</h1></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/faqList2.do"><h2>ㄴ보안,비밀번호</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/faqList3.do"><h2>ㄴ알&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;림</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/faqList4.do"><h2>ㄴ문제해결</h2></a></li>
       
       <a><h1>호&nbsp;스&nbsp;팅</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ호스트 되기</h2></a></li>
      
       <a><h1>여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ숙소찾기</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ숙소예약</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ결제</h2></a></li>
      
      <a><h1>트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;립</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ트립참가</h2></a></li>
	  <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ트립호스팅</h2></a></li>

   </ul>
</div>


<!-- 가운데 우측 영역 , height 380 , 포지션 left: 230 대체할수 있는 퍼센트-->
<div style="width:82%;height:50%;float:left;border:0px solid black;">

<!-- 이용방법 영역 -->   
   <div class="howToUse_div">
  
   	<!-- 글자 덮는 영역 -->
   	<div class="howToUse">
   		<h1>여행 방법</h1>
   </div>
   
   
   <form name="frm" method="post" action="/TripINN/admin/faqList.do">
	 
   
   <c:choose>
   	<c:when test="${fn:length(list)>0}">
		<!-- 조건문 -->
		
   	<c:forEach var="howToUse" items="${list}">
   		<c:if test="${howToUse.FAQ_TYPE == 2}">
							
    <!-- 리스트1 -->
    <div class="list1">  
      	<!-- 제목 -->
      	<div class="howToUse_title">
    	  <a style = "font-size:19px;color:black;">${howToUse.FAQ_TITLE }</a>
     	</div> 
      
      	<!-- 내용 -->
     	 <div class="howToUse_content">
      		<font style="font-size:13px;line-height:2.3em">${howToUse.FAQ_CONTENT} </font>
      	</div>
      	
      	<!-- 이미지 -->
      	<!--  
      	<div class="picture">
      		<img class="picture1" src="<%=cp%>/images/house/${howToUse.FAQ_IMAGE}">
      	</div>
      	-->
    </div><!-- 리스트1 영역끝 -->
    	
    	<!-- 관리자인가 아닌가 구분하는 조건 -->
    	<c:if test="${member_level == 1}">
					
    	<!--버튼을 감싸는 영역  -->
    	<div style="margin-bottom: 50px;text-align:right">
    		<a href="javascript:fn_faqBoardUpdate('${howToUse.FAQ_IDX }');" class="btn_edit" id="update">수정하기</a>
			<a href="javascript:fn_faqDeleteBoard('${howToUse.FAQ_IDX }');" class="btn_del" id="delete">삭제하기</a>
		</div>
		
		</c:if><!-- 관리자여부 구분하는 조건 끝 -->
		
		
		</c:if><!--FAQ_TYPE 조건 끝 -->
   	</c:forEach>		
    </c:when>
    		<c:otherwise>
				<div>
					현재 등록된 내용이 없습니다. 내용을 등록해주세요.
				</div>
			</c:otherwise>
	    </c:choose>
	
	<!--버튼을 감싸는 영역  -->
	<!-- 관리자인가 아닌가 구분하는 조건 -->
    <c:if test="${member_level == 1}">
    	<div style="text-align:right;">    
			<a href="#this" class="btn_write" id="write">글쓰기</a>	
		</div>
	</c:if>			
</form>


   	 </div> <!-- faq 영역 끝 -->
   </div><!-- 가운데 우측영역 끝-->
</div><!-- 가운데영역 전체(좌+우) 끝 -->


	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
    <!--스크립트 정의  -->
	<script type="text/javascript">
	$(document).ready(function(){
    	$("#write").on("click", function(e){ //글쓰기 버튼
        	e.preventDefault();
        	fn_faqBoardWrite();
    	});
        
       /*  $("#update").on("click", function(e){//수정하기 버튼
            e.preventDefault();
            fn_faqBoardUpdate();
        }); */
        /*
        $("#delete").on("click", function(e){ //삭제하기 버튼
            e.preventDefault();
            fn_faqDeleteBoard();
        });
    	*/
	});
    
	//게시글 쓰기
	function fn_faqBoardWrite(){
    	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/admin/faqWrite.do' />");
   		comSubmit.submit();
	}
	
	 //게시글 수정
    function fn_faqBoardUpdate(idx){
        var faq_idx = idx;
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/faqUpdate.do' />");
        comSubmit.addParam("FAQ_IDX", faq_idx);
      
        comSubmit.submit();
    }
    
    //게시글 삭제
    function fn_faqDeleteBoard(idx){
    	var faq_idx = idx;
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/faqDelete.do' />");
        comSubmit.addParam("FAQ_IDX", faq_idx);
        comSubmit.submit();
    }
	
</script>

