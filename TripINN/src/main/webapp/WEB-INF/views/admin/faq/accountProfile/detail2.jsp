<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

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
			.board_view2{
			width:80%;
			}
</style>

  <br><br>
  
 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:0px solid black;text-align:center;">
         <h2>FAQ 페이지에 오신걸 환영합니다.</h2>
</div>

<!-- 가운데 영역 전체(좌측+우측) -->
  	<div style="width:100%;height:90%;border:0px solid black;">
	<!--
	<div style="height:100%; border:1px solid black; margin:0px auto; display:table;">
	-->
	
	<!-- 가운데 좌측 영역 -->
   <div style="width:16.8%;height:240px;border:0px solid black;text-align:center;float:left;background:#eeeeff;">	
	   <section>
				<nav style="width:250px;height:400px;margin-top:30px;">

					<ul id="dropdown2">
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
	

	<!-- 가운데 우측영역 -->
	<div style="width:1050px;height:100%; border:0px; text-align:center; top:208px;left:400px; margin:auto;">
      

      <!-- 상세보기,편집 할 수 없도록 <input> 태그를 사용하지 않았음. -->
	  <table class="board_view2" >
      	<colgroup>
        	<col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <br>
      
        <!-- faq게시판 글씨 덮는 영역 -->
        <!--  
	<div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   		<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>게시글 상세보기</strong></font>
	</div>-->
        
        <tbody>
           <c:if test="${member_level == 1}">
            	<tr>
                	<th scope="row">글 번호</th>
                		<td>${map.FAQ_IDX }
                        	<input type="hidden" id="FAQ_IDX" name="FAQ_IDX" value="${map.FAQ_IDX }"></td>
                	<th scope="row">조회수</th>
                		<td>${map.FAQ_READCOUNT }</td>
            	</tr>
            
            	<tr>               
                	<th scope="row">작성시간</th>
                	<td>${map.FAQ_REGDATE }</td>
                	<!--  <td><input type="text" id="FAQ_TYPE" name="FAQ_TYPE" value="${map.FAQ_TYPE}" /></td>--> 	
                	<th scope="row">작성자</th>
                	<td>${map.MEMBER_NAME }</td>
                
            	</tr>
            </c:if>	
            	<tr>
            		<c:if test="${member_level == 1}">
                		<th scope="row">제목</th> 
                	</c:if>
             
                	<td style="height:80px;font-size:28px;border-bottom:2px solid #ccc" colspan="3">${map.FAQ_TITLE }</td>                	
           		</tr>
            <tr>
                <td style="height:180px;font-size:20px;" colspan="4">${map.FAQ_CONTENT }</td>   
            </tr>
            
        </tbody>
    </table>  
    
    <!-- 목록으로,수정하기,삭제하기 버튼 감싸는 영역 -->
    <div style="text-align:center;">
    <br><!--<td><input type="text" id="FAQ_TYPE" name="FAQ_TYPE" value="${map.FAQ_TYPE}" /></td>-->
    	<c:if test="${map.FAQ_TYPE == '1'}">
			<a href="#this" class="btn_list" id="list" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '2'}">
			<a href="#this" class="btn_list" id="list1" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '3'}">
			<a href="#this" class="btn_list" id="list2" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '4'}">
			<a href="#this" class="btn_list" id="list3" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '5'}">	
			<a href="#this" class="btn_list" id="list4" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '6'}">
			<a href="#this" class="btn_list" id="list5" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '7'}">
			<a href="#this" class="btn_list" id="list6" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '8'}">
			<a href="#this" class="btn_list" id="list7" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '9'}">
			<a href="#this" class="btn_list" id="list8" >목록으로</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '10'}">
			<a href="#this" class="btn_list" id="list9" >목록으로</a>
		</c:if>
		
    
    	<!-- 글쓴이의 멤버idx와  로그인중인 멤버idx가 같아야만 수정하기 버튼 보이도록 함 -->
				<c:if test="${member_level == '1'}">
					<a href="#this" class="btn_edit" id="update">수정하기</a>
				</c:if>
    	
    	
    	<!--  관리자여야 글 삭제하기 버튼이 보이도록 함 -->
    	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '1'}">
    		<a href="#this" class="btn_del" id="delete">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '2'}">
    		<a href="#this" class="btn_del" id="delete1">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '3'}">
    		<a href="#this" class="btn_del" id="delete2">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '4'}">
    		<a href="#this" class="btn_del" id="delete3">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '5'}">
    		<a href="#this" class="btn_del" id="delete4">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '6'}">
    		<a href="#this" class="btn_del" id="delete5">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '7'}">
    		<a href="#this" class="btn_del" id="delete6">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '8'}">
    		<a href="#this" class="btn_del" id="delete7">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '9'}">
    		<a href="#this" class="btn_del" id="delete8">삭제하기</a>
   	 	</c:if>
   	 	<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '10'}">
    		<a href="#this" class="btn_del" id="delete9">삭제하기</a>
   	 	</c:if>
   	 	
    	<%@ include file="/WEB-INF/include/include-body.jspf" %>
    	
    	<br>
	</div><!-- 목록으로,수정하기,삭제하기 버튼 감싸는 영역  끝-->

	
	<script type="text/javascript">
    
        $(document).ready(function(){
        	 $(document).ready(function(){
        	        $("#list").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList();
        	        });
        	        $("#list1").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList1();
        	        });
        	        $("#list2").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList2();
        	        });
        	        $("#list3").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList3();
        	        });
        	        $("#list4").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList4();
        	        });
        	        $("#list5").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList5();
        	        });
        	        $("#list6").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList6();
        	        });
        	        $("#list7").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList7();
        	        });
        	        $("#list8").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList8();
        	        });
        	        $("#list9").on("click", function(e){ //목록으로 버튼
        	            e.preventDefault();
        	            fn_faqBoardList9();
        	        });
        	        
            
            $("#update").on("click", function(e){//수정하기 버튼
                e.preventDefault();
                fn_faqBoardUpdate();
            });
            
            
            
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard();
            });
            $("#delete1").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard1();
            });
            $("#delete2").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard2();
            });
            $("#delete3").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard3();
            });
            $("#delete4").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard4();
            });
            $("#delete5").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard5();
            });
            $("#delete6").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard6();
            });
            $("#delete7").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard7();
            });
            $("#delete8").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard8();
            });
            $("#delete9").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                fn_faqDeleteBoard9();
            });
            
        });
        }); 
        
        //게시판 리스트 
        	 function fn_faqBoardList(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList1(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList1.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList2(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList2.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList3(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList3.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList4(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList4.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList5(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList5.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList6(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList6.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList7(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList7.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList8(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList8.do' />");
        	        comSubmit.submit();
        	    }
        	    function fn_faqBoardList9(){
        	        var comSubmit = new ComSubmit();
        	        comSubmit.setUrl("<c:url value='/admin/faqList9.do' />");
        	        comSubmit.submit();
        	    }
        	    
         //게시글 수정
        function fn_faqBoardUpdate(){
            var faq_idx = "${map.FAQ_IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqUpdate.do' />");
            comSubmit.addParam("FAQ_IDX", faq_idx);
          
            comSubmit.submit();
        }
      
        
        //게시글 삭제
        function fn_faqDeleteBoard(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard1(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete1.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard2(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete2.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard3(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete3.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard4(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete4.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard5(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete5.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard6(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete6.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard7(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete7.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard8(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete8.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
        function fn_faqDeleteBoard9(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/faqDelete9.do' />");
            comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
            comSubmit.submit();
        }
      
    </script>


	</div><!-- 가운데 영역 끝 -->
</div><!-- 전체  -->
 
<!-- 무슨영역? -->
<div style="clear:both; border:1px solid green;" ></div>


