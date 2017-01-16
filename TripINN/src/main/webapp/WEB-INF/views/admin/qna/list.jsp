<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- 작성자: 이진욱 -->
<!--가운데 좌측영역 스타일 적용-->
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



 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>Q&A 페이지에 오신걸 환영합니다.</h2>
   </div>

<!-- 가운데 영역 전체(좌+우) -->
<div style="width:100%;height:auto;border:0px solid black;">

<!-- 가운데 좌측 영역 -->
   <div style="width:16.8%;height:420px;border:0px solid black;text-align:center;float:left;">	
	   <section>
				<nav style="width:250px;height:400px;margin-top:30px;">

					<ul id="dropdown2">
					<c:if test="${member_level == '1'}">
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
					</c:if>
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


<!-- 가운데 우측 영역-->
<div style="width:82%;height:auto;border:0px solid black;float:left;">
	<div class="row" style="padding-left:5px;width:80%;height:95%; margin-left:10px;">    
	
	
	<!-- Qna게시판 글씨 덮는 영역 -->
	<div class="row" style="width:600px; height:35px; border-bottom:1px solid #dcdcdc; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   		<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>QnA</strong> 게시판</font>
	</div>
	
	<table class="board_list">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
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
                        <td class="title2">
                        <!-- a태그를 이용하여 링크 가능하도록 함 -->
                                <a href="#this" name="title">${row.QNA_TITLE }</a>
                        <!-- hidden 태그를 이용하여 글번호를 숨겨둠 -->
                                <input type="hidden" id="QNA_IDX" value="${row.QNA_IDX }">
                        </td>
                        <td>${row.MEMBER_NAME }</td>
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
    
    	<!--  <div class="paging" style="text-align: center;">${pagingHtml}</div>-->
    
     	<!-- 글쓰기버튼 ,페이징,검색 기능 -->
	   	 <!-- 검색파트 영역1 -->
      		<div class="row">
      	 		<!-- 페이징, 검색파트 영역2 -->
         	<div style="margin:20px 0px 0px 0px;">
         	
         		<!-- 페이징 영역 -->
         		<div style="text-align: center;">
					${pagingHtml}
				</div>	
				
				 <!-- 비회원의 경우 문의게시판 글쓰기 버튼이 안보임 -->
				<div style="text-align: right;margin-top:-30px">	 
					<c:if test="${member_level != null}">
						<a href="#this" class="btn_write" id="write">글쓰기</a>
					</c:if>
				</div>		
						<br>
         		<!-- 검색파트 영역3 -->
            	<div id="dataTables-example_filter" class="dataTables_filter" style="text-align: center;margin:0px 0px 0px 0px;">
 					<form  action="">
 						
                     <select class="btn_select" name="searchNum" id="searchNum">
                     	<option value="0">제목</option>
                     	<option value="1">내용</option>
                      	<option value="2">작성자</option>
                      	
                     </select><input  type="text" name="isSearch" id="isSearch" style="margin-left:15px;width:200px;height:24px;border-radius :5px 5px 5px 5px;"/>            
                     
                     <span class="btn_search">
                          <input type="image" src="/TripINN/images/search.jpg" value="검색"  style="font-size: 14px; padding-bottom: 1; vertical-align: middle;height:20px;"/>
                  	 </span>
                  	 
                  	
               	  </form>
               	  
               	
               	  
               </div><!-- 검색파트 영역3 끝 -->
               </div><!-- 검색파트 영역2 끝 -->  
               </div><!-- 검색파트 영역1 끝 -->
  
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
	</div><!-- 우측영역 끝-->

</div><!-- 가운데 전체(좌+우)영역 끝 -->

 

