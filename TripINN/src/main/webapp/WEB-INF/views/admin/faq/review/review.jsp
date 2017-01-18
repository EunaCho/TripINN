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
   .review_div{
      border:1px;
      width:1000px;
      overflow:hidden;
      height:auto;
      border-radius:4px;
      background-color:white;
      margin-left:50px;
      margin-top:10px;
      
   }
   .review{
   border-bottom:1px solid #ccc;
   
   width:200px;
   height:60px;
   margin:0px 10px 0px -30px;
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
   .review_title{
   border:0px solid black;
   border-radius:4px;
   width:99%;
   height:20%;
   margin-left:5px;
   margin-top:10px;
   font-size:19px;
   vertical-align:middle;
	   
   }
   .review_content{
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
<div style="width:100%;height:100px;border:0px solid black;text-align:center;">
   <h2>Faq 페이지에 오신걸 환영합니다.</h2>
   </div>

<!-- 가운데 영역 전체(좌+우) -->
<div style="width:100%;height:auto;border:0px solid black;">

<!-- 좌측 영역 -->
   <div style="width:16.8%;height:280px;border:0px solid black;text-align:center;float:left;background:#eeeeff;">	
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
<div style="width:82%;height:auto;border:0px solid black;float:left;">

<!-- 이용방법 영역 -->   
   <div class="review_div">
  
   	<!-- 글자 감싸는 영역 -->
   	<div class="review"; style="font-family:'바탕체'">
   		<h2>후기</h2>
   </div>	

    <!-- 리스트 -->
    <table class="board_list2">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="10%"/>
        <col width="15%"/>
        <col width="10%"/>
    </colgroup>
    <thead>
        <tr>
        <c:if test="${member_level == 1}"> 
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
            <th scope="col">도움말 유형</th>
        </c:if>
        </tr>
    </thead>
		
	
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
            
          
           
            	<c:forEach var="row" items="${list}" varStatus="status">
            		<!-- FAQ_TYPE이 해당 숫자인 글만 나오도록 하는 조건 -->
            		<c:if test="${row.FAQ_TYPE == 9}">            
                    <tr>
                    <c:if test="${member_level == 1}"> 
           				<td>${row.FAQ_IDX }</td>
			        </c:if>
                        
                        
                        <td class="title">
                        <!-- a태그를 이용하여 링크 가능하도록 함 -->
                                <a href="#this" name="title" style="font-family:'바탕체'">${row.FAQ_TITLE }</a>
                        <!-- hidden 태그를 이용하여 글번호를 숨겨둠 -->
                                <input type="hidden" id="FAQ_IDX" value="${row.FAQ_IDX }">
                        </td>
                        
                        
                        <c:if test="${member_level == 1}"> 
           					<td>${row.FAQ_READCOUNT }</td>
                        	<td>${row.FAQ_REGDATE }</td>
                        	<td>${row.FAQ_TYPE }</td>
			        	</c:if>
                    </tr>
                    
                    <!-- 관리자인가 아닌가 구분하는 조건 -->
                    <c:url var="writeURL" value="/admin/faqWrite.do">
                    	<c:param name="faq_type" value="${row.FAQ_TYPE }"/>
                    </c:url>
                    
                    </c:if><!--FAQ_TYPE 조건 끝 -->
                </c:forEach>
                
                <c:if test="${member_level == 1}">
    				<div style="text-align:right;margin-top:-50px; margin-right:0px">    
					<a href="${writeURL }" class="btn_write" id="write">글쓰기</a>	
					<!--  <a href="javascript:fn_faqBoardUpdate('${howToUse.FAQ_IDX }');" class="btn_edit" id="update">수정하기</a>-->
					</div>
					<br>
				</c:if>
                
                
            </c:when>
            	<c:otherwise>
                	<tr>
                    	<td colspan="4">조회된 결과가 없습니다.</td>
                	</tr>
            	</c:otherwise>
        	</c:choose>        
    	</tbody>
	</table>
   	</div> <!-- faq 영역 끝 -->
   	<br><br><br>
	
   </div><!-- 가운데 우측영역 끝-->
</div><!-- 가운데영역 전체(좌+우) 끝 -->


	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
    <!--스크립트 정의  -->
	<script type="text/javascript">
	$(document).ready(function(){
    	/*$("#write").on("click", function(e){ //글쓰기 버튼
        	e.preventDefault();
        	fn_faqBoardWrite();
    	});*/
    	
    	$("a[name='title']").on("click", function(e){ //제목 
        	e.preventDefault();
    
     	 //아래의 함수를 실행, 여기서 $(this)가 jQuery 객체를 뜻하며 게시글 제목인 <a>태그를 의미함.
     	   fn_faqBoardDetail($(this));
    	});
    	
	});
    
	//게시글 쓰기
	function fn_faqBoardWrite(type){
		var faq_type = type;
    	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/admin/faqWrite.do' />");
    	comSubmit.addParam("FAQ_TYPE",faq_type);
   		comSubmit.submit();
	}
	
	//상세보기
	function fn_faqBoardDetail(obj){
		//ComSubmit 객체를 만든 이유중 하나가 폼에 동적으로 값을 추가하는 기능을 편하게 사용하기 위함이며 addParam 함수가 그 역할을 담당한다.
    	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/admin/faqDetail2.do' />");
    	//서버로 전송될 키 값
    	//jQuery를 이용하여 선택된 <a> 태그의 부모 노드 내에서 IDX라는 값을 가진 태그를 찾고 그 태그의 값을 가져오도록 한 것 
   	 comSubmit.addParam("FAQ_IDX", obj.parent().find("#FAQ_IDX").val());
    	comSubmit.submit();
	} 
	
</script>

