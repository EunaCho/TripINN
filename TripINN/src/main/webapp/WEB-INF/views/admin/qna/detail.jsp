<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

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
        
        
        //문의게시판 리스트 
        function fn_qnaBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
            comSubmit.submit();
        }
         //게시글 수정
        function fn_qnaBoardUpdate(){
            var qna_idx = "${map.QNA_IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaUpdate.do' />");
            comSubmit.addParam("QNA_IDX", qna_idx);
          
            comSubmit.submit();
        }
        
        //게시글 삭제
        function fn_qnaDeleteBoard(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/qnaDelete.do' />");
            comSubmit.addParam("QNA_IDX", $("#QNA_IDX").val());
            comSubmit.submit();
             
        }
        
        //댓글삭제
        function qnaCommDelete(num) {
        	if(confirm("댓글을 삭제 하시겠습니까?") == true){
        		location.href='qnaCommDelete.do?QCO_IDX='+num+'&QNA_IDX=${map.QNA_IDX}';
        	}else {
        		return;
        	}
        }
        
        
          
    </script>
    
    <script type="text/javascript"> 
	//코멘트 입력버튼 누를시
	function onComment(){
		var form = $('.commentForm')[0];
		form.action = '/TripINN/admin/qnaCommWrite.do';
		if(form.QCO_CONTENT.value == ""){
			alert("내용을 입력해주세요");
		}else{
			form.submit();
		}
	
		 //넘기는 부분
		}
	
		//글자수 제한 체크 
		function fnChkByte(obj, maxByte){
			var str = obj.value;
			var str_len = str.length;

			var rbyte = 0;
			var rlen = 0;
			var one_char = "";
			var str2 = "";

			for(var i=0; i<str_len; i++){
				one_char = str.charAt(i);
			if(escape(one_char).length > 4){
	  			rbyte += 2;                                         //한글2Byte
			}else{
    			rbyte++;                                            //영문 등 나머지 1Byte
			}

			if(rbyte <= maxByte){
	 	 	  rlen = i+1;                                          //return할 문자열 갯수
			}
		}

		if(rbyte > maxByte){
			alert("한글 "+(maxByte/2)+"자/영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
    		str2 = str.substr(0,rlen);                                  //문자열 자르기
    		obj.value = str2;
    		fnChkByte(obj, maxByte);
		}else{
    		document.getElementById('byteInfo').innerText = rbyte;
		}
}

</script>
    
        
	




<!-- 스타일 적용2 -->
<style>   
ul{width:172px;height:340px;background:blue;opacity:0.4;list-style:none;padding-top:15px;}

li{margin-right:50px }

.left-ul li a{font-size:12px;color:#fff;font-weight:bold;text-decoration:none}
.tbl { width:1000px; border:1px; }

<!--빨-->
.tbl tr th {  border:1px solid #CD1039;height:30px;text-align:center; background:#eee; }
<!--파-->
.tbl tr td { border:1px solid #0000FF; padding:5px;height:30px; }
<!--녹-->
.tbl tr td a { text-decoration: none; color:#64CD3C; }
<!--주황-->
.tbl tr td a:hover { color: #FF7F50; vertical-align: middle; }
#tbl {}
</style> 

  <br><br>
  
 <!-- 가운데 윗 영역 -->
 <!-- 빨강 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
         <h2>회원관리 페이지에 오신걸 환영합니다.</h2>
</div>

<!-- 좌측  + 중앙 영역,빨강-->
<div style="height:100%; border:1px solid red; margin:0px auto; display:table;">

	<!-- 좌측영역,노랑 -->
	<div style="width:215px;height:380px;border:3px solid yellow;text-align:center; float:left;">
  	 	<ul class="left-ul">
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
	</div><!-- 좌측side div End -->

	<!-- 가운데영역,초록 -->
	<div style="width:1025px;height:100%; border:1px solid green; text-align:center; top:208px;left:400px; margin:10px auto; float:left;">
	<h2>회원 리스트</h2>
		<!-- table div start -->
		<!-- 민트색 -->
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
                <th scope="row">작성자</th>
                <td>${map.MEMBER_NAME }</td>
               
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
            <!-- 임시 테스트용 글작성자의  멤버레벨 출력 -->
            <tr>
                <td colspan="4">${map.MEMBER_LEVEL }</td>
            </tr>
            <!-- 임시 테스트용 글작성자의 멤버IDX 출력 -->
            <tr>
                <td colspan="4">${map.MEMBER_IDX }</td>
            </tr>
            
            <!-- 임시 테스트용 세션멤버레벨 출력 -->
            <tr>
                <td colspan="4">${member_level }</td>
            </tr>
            <!-- 임시 테스트용 세션멤버IDX 출력 -->
            <tr>
                <td colspan="4">${member_idx }</td>
            </tr>
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="list">목록으로</a>
    
    <!-- 글쓴이의 멤버idx와  로그인중인 멤버idx가 같아야만 수정하기 버튼 보이도록 함 -->
	<c:if test="${map.MEMBER_IDX == member_idx}">
		<a href="#this" class="btn" id="update">수정하기</a>
	</c:if>
    
    <!-- 글쓴이의 멤버idx와  로그인중인 멤버idx가 같거나 또는  로그인중인 멤버레벨이 관리자여야 글 삭제하기 버튼이 보이도록 함> -->
    <c:if test="${(map.MEMBER_IDX == member_idx) || (member_level == 1) }">
    	<a href="#this" class="btn" id="delete">삭제하기</a>
    </c:if>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>



<!-- 댓글쓰는 창,파랑-->
	<!-- 댓글영역1 , 댓글폼 , 작성자값-->
	<div class="inner" style ="border:1px solid blue;">
		<form class="commentForm" method="post" onsubmit="return validation();">
			<input type="hidden" name="QNA_IDX" value="${map.QNA_IDX}"/>
			<!--  <input type="hidden" name="commenter" value="${session_member_id}"/> -->


	<!-- 댓글영역2,검정 -->
	<div class="comm_grp" style ="border:1px solid black;" >
		<!-- 댓글영역3,빨강 --> 
    	<div class="comm_form" style ="border:1px solid red;">
    		<!-- 댓글영역4,노랑 -->
        	<div class="comm_write" style ="border:1px solid yellow;">
        		 <!-- 댓글영역5,초록(가로길이 1000) -->
         		 <div class="textarea_grp" style="width: 1000px; border:1px solid green;">
         		 
           			   <!-- 로그인안했을 때 보여주는 댓글 요청 내용 -->
           			   <!-- 테스트용으로 일부러 로그인 안했을때 댓글창 보여주도록 하였음-->
	      				<br/>
	      				<c:if test="${session.getAttribute(member_name) != null}">
	     			 		<input type="text" style="align:center; margin: 10px; width: 950px; height: 55px;" value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly"/>
	     			 	</c:if>
	     			 	
	      			   <!-- 댓글 쓰는 창(일부러 로그인 안했을때 댓글창 보여주도록 함,테스트용) -->
	      			   	<c:if test="${session_member_id == null}">
	      			   	
	      			   		<!-- 글자 수 제한 200?,가로 885,세로55-->
	      					<textarea name="QCO_CONTENT" style="width: 885px; height: 55px;"onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
	      					<button type="button" class="btn1 btn-primary1" onclick="onComment()">입력</button>
	      			
	      					<!-- 댓글영역 6 -->
	      					<div style="margin-bottom:10px; border:1px solid blue;"><br/>&nbsp;&nbsp;&nbsp;<span id="byteInfo">0</span>/200Byte</div>
	      				</c:if>
	      				
				</div><!-- 댓글영역5 끝 -->
			</div><!-- 댓글영역4 끝 -->
				
				
			<!--  <p class="comm_num"> <strong>댓글 총 개수 :   ${comment_count}</strong></p>-->
			
		</div ><!-- 댓글영역3 끝 -->
			
		<!-- 댓글 차례로 보여주는 창 -->
			<c:forEach var="list" items="${commList}">	
				<!-- 댓글영역 7,검정 -->	
				<div style="margin-bottom:50px; border:1px solid black;">
					<!-- 댓글영역 8,빨강 -->
					<div class="comm_view" style = "border:1px solid red;">
						<!-- 댓글영역 9,노랑   댓글작성자,댓글작성일자 -->
						<div class="comm_tit" style = "border:1px solid yellow;">
							  <!--<p class="tit"><strong>${list.commenter}</strong>님  <fmt:formatDate value="${list.reg_date}" pattern="yy.MM.dd"></fmt:formatDate><span class="ip"></span> </p>-->
							
							
							<!-- 입력되어 있는 작성자와 아이디가 같거나, 아이디가 관리자 일때만 삭제  창을 띄운다. -->
							
							<c:if test="${member_level == 1}">
								<td align="left">
									<%-- <a href="qnaCommDelete.do?QCO_IDX=${list.QCO_IDX}&QNA_IDX=${map.QNA_IDX}"> --%>
										<input type="button" onclick="qnaCommDelete(${list.QCO_IDX})"  value="삭제" class="btn btnC_01 btnP_02"/>
									<!-- </a> -->
								</td>			
							</c:if>
						</div><!-- 댓글영역 9 끝 -->
						
						<!-- 댓글영역 10 , 글내용 표시-->
						<div class="comm_cts" style = "border:1px solid green;">
							<p>${list.QCO_CONTENT}</p><br/>
						</div><!-- 댓글영역 10 끝 -->
					</div><!-- 댓글영역 8 끝 -->
				</div><!-- 댓글영역 7 끝 -->
			</c:forEach>
			
			</div><!-- 댓글영역 2 끝 -->
		</form>
				
			<c:if test="${fn:length(commList) le 0}">
	      		<br/><center>등록된 댓글이 없습니다</center><br/>
	      	</c:if>


		</div><!-- 댓글쓰는 창(댓글영역 1) 끝 -->
	</div><!-- 가운데 영역 끝 -->
</div><!-- 전체  -->
 
<!-- 댓글영역 11? -->
<div style="clear:both; border:1px solid green;" ></div>
