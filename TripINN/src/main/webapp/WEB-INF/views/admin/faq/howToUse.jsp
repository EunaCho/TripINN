<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- 작성자: 이진욱 -->
<!-- 좌측영역 스타일적용1 -->
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
			margin-top:-20px;
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

<!-- 우측영역 스타일 적용 -->
<style>
   .howToUse_div{
      border:2px;
      width:1000px;
      overflow:hidden;
      height:auto;
      border-radius:4px;
      background-color:white;
      margin-left:50px;
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
    border-radius:4px;
   width:995px;
   height:auto;
   margin-bottom:20px;
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
   <h2>Faq 페이지에 오신걸 환영합니다.</h2>
   </div>

<!-- 가운데 영역 전체(좌+우) -->
<div style="width:100%;height:auto;border:0px solid black;">

<!-- 좌측 영역 -->
   <div style="width:16.8%;height:420px;border:1px solid black;text-align:center;float:left;">	
	   <section>
				<nav style="width:250px;height:400px;margin-top:30px;">

					<ul id="dropdown2">
					<c:if test="${member_level == 1}">
						<li><a href="http://localhost:8080/TripINN/admin/main.do">관리자 홈</a></li>
					</c:if>	
						<li><a>시작하기</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList.do">이용방법</a></li>
							</ul>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList1.do">여행방법</a></li>
							</ul>
						</li>
						<li><a>계정과 프로필</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList2.do">내 정보</a></li>
							</ul>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList3.do">보안과 비밀번호</a></li>
							</ul>
						</li>
						<li><a>여행</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList4.do">숙소 찾기</a></li>
							</ul>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList5.do">숙소 예약</a></li>
							</ul>
						</li>
						<li><a>트립</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList6.do">트립 참가</a></li>
							</ul>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/faqList7.do">트립 호스팅</a></li>
							</ul>
						</li>
						<li><a href = "http://localhost:8080/TripINN/admin/faqList8.do">후기</a></li>
						<li><a href="http://localhost:8080/TripINN/admin/qnaList.do">문의하기</a></li>
						
					</ul>
				</nav>
		</section>
   
   </div>


<!-- 가운데 우측 영역-->
<div style="width:82%;height:auto;border:1px solid black;float:left;">

<!-- 이용방법 영역 -->   
   <div class="howToUse_div">
  
   	<!-- 글자 감싸는 영역 -->
   	<div class="howToUse">
   		<h1>이용 방법</h1>
   </div>
   
   <!--글쓰기버튼 감싸는 영역  -->
	<!-- 관리자인가 아닌가 구분하는 조건 -->
    <c:if test="${member_level == 1}">
    	<div style="text-align:right;margin-top:-50px;margin-bottom:30px;">    
			<a href="#this" class="btn_write" id="write">글쓰기</a>	
		</div>
	</c:if>	
   
   
   <form name="frm" method="post" action="/TripINN/admin/faqList.do">
	 
   
   <c:choose>
   	<c:when test="${fn:length(list)>0}">
		<!-- 조건문 -->
		
   	<c:forEach var="howToUse" items="${list}">
   		<c:if test="${howToUse.FAQ_TYPE == 1}">
							
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
      	
      	
    </div><!-- 리스트1 영역끝 -->
    	
    	<!-- 관리자인가 아닌가 구분하는 조건 -->
    	<c:if test="${member_level == 1}">
					
    	<!--버튼을 감싸는 영역  -->
    	<div style="margin-bottom: 30px;text-align:right">
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
	});
    
	//게시글 쓰기
	function fn_faqBoardWrite(){
    	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/admin/faqWrite.do' />");
    	comSubmit.addParam("FAQ_TYPE",faq_type);
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

