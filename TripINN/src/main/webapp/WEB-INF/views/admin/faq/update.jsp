<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- 작성자: 이진욱 -->
<!-- 스타일적용1 -->
<style>   
ul{width:172px;height:720px;background-color:#c2e4e7;list-style:none;padding-top:1px;}
li{margin-right:50px }
a{font-size:12px;color:#008489;font-weight:bold;text-decoration:none}
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
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ여행방법</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ호스팅 방법</h2></a></li>
      
       <a><h1>계정과&nbsp;프로필</h1></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h2>ㄴ보안,비밀번호</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ알&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;림</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>ㄴ문제해결</h2></a></li>
       
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
  
   	<!-- 글자 감싸는 영역 -->
   	<div class="howToUse" style="text-align:center">
   		<h1>수정 페이지</h1>
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
   		<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>Faq 글수정</strong></font>
	 </div>
				
		<br>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    	<td>
                        	<input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90" value="${map.FAQ_TITLE }"/>
                		</td>
                </tr>	
                	<!--  hidden으로 숨겨서 컨트롤러에 전송 -->
                	<input type="hidden" id="FAQ_IDX" name="FAQ_IDX" value="${map.FAQ_IDX }">
                	<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="${map.MEMBER_IDX}" />
                	<input type="hidden" id="FAQ_TYPE" name="FAQ_TYPE" value="${map.FAQ_TYPE}" />
                	<!--  <input type="text" id="MEMBER_LEVEL" name="MEMBER_LEVEL" value="${member_level}" />-->
                <tr>
                	<th scope="row">내용</th>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="내용" id="FAQ_CONTENT" name="FAQ_CONTENT">${map.FAQ_CONTENT}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>          
    </form>
    
    <br> 
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
		
		
   	<!-- 수정하기 버튼 감싸는 영역 -->
   	<div style="text-align:right; margin-right:280px; margin-top:-30px">  
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '1'}">
   			<a href="#this" class="btn_edit" id="edit" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '2'}">
   			<a href="#this" class="btn_edit" id="edit1" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '3'}">
   			<a href="#this" class="btn_edit" id="edit2" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '4'}">
   			<a href="#this" class="btn_edit" id="edit3" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '5'}">
   			<a href="#this" class="btn_edit" id="edit4" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '6'}">
   			<a href="#this" class="btn_edit" id="edit5" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '7'}">
   			<a href="#this" class="btn_edit" id="edit6" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '8'}">
   			<a href="#this" class="btn_edit" id="edit7" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '9'}">
   			<a href="#this" class="btn_edit" id="edit8" >수정하기</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '10'}">
   			<a href="#this" class="btn_edit" id="edit9" >수정하기</a>  
   		</c:if>
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
         
        
        
        $("#edit").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard();
        });
        $("#edit1").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard1();
        });
        $("#edit2").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard2();
        });
        $("#edit3").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard3();
        });
        $("#edit4").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard4();
        });
        $("#edit5").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard5();
        });
        $("#edit6").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard6();
        });
        $("#edit7").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard7();
        });
        $("#edit8").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard8();
        });
        $("#edit9").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_faqUpdateBoard9();
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
     
    
    function fn_faqUpdateBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard1(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro1.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard2(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro2.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard3(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro3.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard4(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro4.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard5(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro5.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard6(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro6.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard7(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro7.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard8(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro8.do' />");
        comSubmit.submit();
    }
    function fn_faqUpdateBoard9(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/faqUpdatePro9.do' />");
        comSubmit.submit();
    }
    
	</script>
   
   
   	 </div> <!-- faq 영역 끝 -->
   </div><!-- 가운데 우측영역 끝-->
</div><!-- 가운데영역 전체(좌+우) 끝 -->
