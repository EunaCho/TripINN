<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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


 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>FAQ 페이지에 오신걸 환영합니다.</h2>
</div>

<!-- 가운데 영역(좌+우) 전체 -->
<div style="width:100%;height:auto;border:1px solid black;">

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


<!-- 가운데 우측 영역 , height 380 , 포지션 left: 230 대체할수 있는 퍼센트-->
<div style="width:82%;height:50%;float:left;border:1px solid black;margin-left:3px">

<!-- 이용방법 영역 -->   
   <div class="howToUse_div" style="margin-left:10px">
  
      <!-- 글자 감싸는 영역 -->
      <div class="howToUse" style="text-align:center">
         <h1>글쓰기 페이지</h1>
   </div>
   
   <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="15%">
                <col width="*"/>
            </colgroup>
            
     <!-- 글씨 덮는 영역 -->
     <div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
         <font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>Faq 글작성</strong></font>
    </div>
            
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90"></input></td>
                </tr>
                   <!-- 회원번호값, FAQ유형값을 세션으로 받아오고 hidden으로 숨겨서 컨트롤러에 전송 -->
                   <input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="<%=session.getAttribute("member_idx") %>" />
                   <input type="hidden" id="FAQ_TYPE" name="FAQ_TYPE" value="${faq_type}" />
                <tr>
                   <th scope="row">내용</th>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="내용" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    
       <c:if test="${faq_type == '1'}">
         <a href="#this" class="btn_list" id="list" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '2'}">
         <a href="#this" class="btn_list" id="list1" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '3'}">
         <a href="#this" class="btn_list" id="list2" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '4'}">
         <a href="#this" class="btn_list" id="list3" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '5'}">
         <a href="#this" class="btn_list" id="list4" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '6'}">
         <a href="#this" class="btn_list" id="list5" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '7'}">
         <a href="#this" class="btn_list" id="list6" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '8'}">
         <a href="#this" class="btn_list" id="list7" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '9'}">
         <a href="#this" class="btn_list" id="list8" >목록으로</a>
      </c:if>
      <c:if test="${faq_type == '10'}">
         <a href="#this" class="btn_list" id="list9" >목록으로</a>
      </c:if>
      
       
      
   <!-- 작성하기버튼 감싸는 영역 -->
      <div style="text-align:right; margin-right:280px;margin-top:-20px">
         <c:if test="${faq_type == '1'}">
         <a href="#this" class="btn_write" id="write" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '2'}">
         <a href="#this" class="btn_write" id="write1" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '3'}">
         <a href="#this" class="btn_write" id="write2" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '4'}">
         <a href="#this" class="btn_write" id="write3" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '5'}">
         <a href="#this" class="btn_write" id="write4" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '6'}">
         <a href="#this" class="btn_write" id="write5" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '7'}">
         <a href="#this" class="btn_write" id="write6" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '8'}">
         <a href="#this" class="btn_write" id="write7" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '9'}">
         <a href="#this" class="btn_write" id="write8" >작성하기</a>
      </c:if>
      <c:if test="${faq_type == '10'}">
         <a href="#this" class="btn_write" id="write9" >작성하기</a>
      </c:if>
          
      <br><br><br><br>
           
    </div>
    
   
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    <script type="text/javascript">
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
        
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard();
        });
        $("#write1").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard1();
        });
        $("#write2").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard2();
        });
        $("#write3").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard3();
        });
        $("#write4").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard4();
        });
        $("#write5").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard5();
        });
        $("#write6").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard6();
        });
        $("#write7").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard7();
        });
        $("#write8").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard8();
        });
        $("#write9").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_faqInsertBoard9();
        });

        
    });
     
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
    
     
    function fn_faqInsertBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard1(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert1.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard2(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert2.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard3(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert3.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard4(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert4.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard5(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert5.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard6(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert6.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard7(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert7.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard8(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert8.do' />");
        comSubmit.submit();
    }
    function fn_faqInsertBoard9(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqWriteInsert9.do' />");
        comSubmit.submit();
    }
   </script>
   
   
       </div> <!-- faq 영역 끝 -->
   </div><!-- 가운데 우측영역 끝-->
</div><!-- 가운데영역 전체(좌+우) 끝 -->