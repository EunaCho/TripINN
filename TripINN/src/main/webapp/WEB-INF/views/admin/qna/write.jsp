<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- 작성자: 이진욱 -->

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
   			<h5>게시글 작성 페이지 입니다.</h5>
  		</div>
  	
  	<!-- 가운데 영역 전체(좌측+우측) -->
  	<div style="width:100%;height:90%;border:1px solid black;">

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
   
   <!-- 가운데 우측 영역 -->
 		<div style="width:80%;height:381px;border:1px solid black;text-align:center; position:absolute;top:170px;left:240px;">
		
		<!-- 글쓰기폼 감싸는 영역 -->
		<div class="row" style="padding-left:15px;width:1100px; text-align:center;">

    <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="15%">
                <col width="*"/>
            </colgroup>
            
     <!-- 글씨 덮는 영역 -->
     <div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   		<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>게시글 작성</strong></font>
	 </div>
				
		<br>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90"></input></td>
                </tr>
                	<!-- 글 작성자값, 회원번호값을 세션으로 받아오고 hidden으로 숨겨서 컨트롤러에 전송 -->
                	<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="<%=session.getAttribute("member_idx") %>" />
                <tr>
                	<th scope="row">비밀번호</th>
                	
                	<td><input type="password" name="QNA_PWD" id="QNA_PWD" class="wdp_90"></input></td>
                </tr>
                <tr>
                	<th scope="row">내용</th>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>          
    </form>
    
    <br> 
   	<a href="#this" class="btn_list" id="list" >목록으로</a> 
   	<a href="#this" class="btn_write" id="write" >작성하기</a>  
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    
    <script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_qnaBoardList();
        });
         
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_qnaInsertBoard();
        });
    });
     
    function fn_qnaBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
        comSubmit.submit();
    }
     
    function fn_qnaInsertBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/qnaInsertPro.do' />");
        comSubmit.submit();
    }
	</script>
	
			</div> <!-- 수정폼 감싸는 영역 끝 -->
		</div><!-- 가운데 우측영역 끝 -->
	</div><!-- 가운데 전체(좌측+우측)영역 끝 -->