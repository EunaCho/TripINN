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
         .board_view{
         width:80%;
         }
</style>

  <br><br>
  
 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:0px solid black;text-align:center;">
         <h2>QNA 페이지에 오신걸 환영합니다.</h2>
</div>

<!-- 가운데 영역 전체(좌측+우측) -->
     <div style="width:100%;height:auto;">
   <!--
   <div style="height:100%; border:1px solid black; margin:0px auto; display:table;">
   -->
   
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
   

   <!-- 가운데 우측영역 -->
   <!--  
   <div style="width:1050px;height:100%; border:1px; text-align:center; top:208px;left:400px; margin:auto;">
    -->
    <!-- 가운데 우측 영역-->
<div style="width:82%;height:auto;border:0px solid black;float:left;margin-left:10px;">  

      <!-- 상세보기,편집 할 수 없도록 <input> 태그를 사용하지 않았음. -->
     <table class="board_view" >
         <colgroup>
           <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <br>
      
        <!-- Qna게시판 글씨 덮는 영역 -->
   <div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
         <font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게시글 상세보기</strong></font>
   </div>
        
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
        </tbody>
    </table>  
    
    <!-- 목록으로,수정하기,삭제하기 버튼 감싸는 영역 -->
    <div style="text-align:center;">
    <br>
       <a href="#this" class="btn_list" id="list">목록으로</a>
    
       <!-- 글쓴이의 멤버idx와  로그인중인 멤버idx가 같아야만 수정하기 버튼 보이도록 함 -->
      <c:if test="${map.MEMBER_IDX == member_idx}">
         <a href="#this" class="btn_edit" id="update">수정하기</a>
      </c:if>
    
       <!-- 글쓴이의 멤버idx와  로그인중인 멤버idx가 같거나 또는  로그인중인 멤버레벨이 관리자여야 글 삭제하기 버튼이 보이도록 함> -->
       <c:if test="${(map.MEMBER_IDX == member_idx) || (member_level == 1) }">
          <a href="#this" class="btn_del" id="delete">삭제하기</a>
          </c:if>
       <%@ include file="/WEB-INF/include/include-body.jspf" %>
       
       <br>
   </div><!-- 목록으로,수정하기,삭제하기 버튼 감싸는 영역  끝-->


<!-- 댓글쓰는 창,파랑-->
   <!-- 댓글영역1 , 댓글폼 , 작성자값-->
   <div class="inner" style ="border:1px; margin-left:20px">
      <form class="commentForm" method="post" onsubmit="return validation();">
         <input type="hidden" name="QNA_IDX" value="${map.QNA_IDX}"/>
         


   <!-- 댓글영역2 -->
   <div class="comm_grp" style ="border:1px;" >
      <!-- 댓글영역3--> 
       <div class="comm_form" style ="border:1px;">
          <!-- 댓글영역4,노랑 -->
           <div class="comm_write" style ="border:1px;">
               <!-- 댓글영역5, -->
                <div class="textarea_grp" style="width: 950px; border:1px;">
                
                       <!-- 로그인안했을 때 보여주는 댓글 요청 내용 -->
                     <br/>
                     <c:if test="${member_level == null}">
                        <input type="text" style="align:center; margin: 10px; width: 900px; height: 60px;" value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly"/>
                     </c:if>
                     
                     <!-- 댓글 쓰는 창 -->
                        <c:if test="${member_level == 1}">
                           <!-- 글자 수 제한 200?,가로 885,세로55-->
                        <textarea name="QCO_CONTENT" style="border-radius:3px; width: 880px; height: 60px; vertical-align:middle;"onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
                        <button type="button" class="btn_write_2" onclick="onComment()">댓글입력</button>
   
                        <!-- 댓글영역 6 -->
                        <div style="margin-bottom:1px; border:1px;"><span id="byteInfo">0</span>/200Byte</div>
                        <br><br>
                     </c:if>
                     
            </div><!-- 댓글영역5 끝 -->
         </div><!-- 댓글영역4 끝 -->
         
         <!-- 댓글목록 글씨 감싸는 영역 -->      
         <div style="text-align:left;">
            댓글목록<br><br>
         </div>
      
      </div ><!-- 댓글영역3 끝 -->
         
      <!-- 댓글 차례로 보여주는 창 -->
      
         <c:forEach var="list" items="${commList}">
         
         <!-- Admin글씨와 댓글창을 감싸는 영역 -->
         <div>
            <!-- Admin글씨 감싸는 영역 -->
            <div style="width:100%;text-align:left;float:left">
               Admin:
            </div>   
               <!-- 댓글영역 7 -->   
            <div style="border:1px;width:830px;float:left;margin-bottom:20px">   
               <div style="border:1px;margin-bottom:0px;width:95%;">
                  <div class="comm_cts" style = "border:1px solid black;border-radius:3px; width: 800px; height: 70px;margin:0px;margin-right:0px;">
                     ${list.QCO_CONTENT}
                  </div>
               </div>
            </div><!-- 댓글영역 7 끝 -->
            
         </div><!-- Admin글씨와 댓글창을 감싸는 영역 끝 -->
            <!-- 댓글영역8(댓글삭제버튼 감쌈) -->
            <c:if test="${member_level == 1}">
            <div style="width:120px; height:40px; float:left;margin-top:0px;margin-left:-30px">
               
                  <input type="button" class="btn_del_2" onclick="qnaCommDelete(${list.QCO_IDX})" value="댓글삭제"/>
            </div>
               </c:if>
         </c:forEach>
         
         </div><!-- 댓글영역 2 끝 -->
      </form>
            
         <c:if test="${fn:length(commList) le 0}">
               <br/><center>등록된 댓글이 없습니다</center><br/>
            </c:if>


      </div><!-- 댓글쓰는 창(댓글영역 1) 끝 -->
   </div><!-- 가운데 우측 영역 끝 -->
</div><!-- 전체  -->
 
<!-- 댓글영역 11? -->
<div style="clear:both;" ></div>