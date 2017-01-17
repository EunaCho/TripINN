<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- �ۼ���: ������ -->
<!-- ��Ÿ������1 -->
<style>   
ul{width:172px;height:720px;background-color:#c2e4e7;list-style:none;padding-top:1px;}
li{margin-right:50px }
a{font-size:12px;color:#008489;font-weight:bold;text-decoration:none}
</style>


 <!-- ��� �� ���� -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>FAQ �������� ���Ű� ȯ���մϴ�.</h2>
</div>

<!-- ��� ����(��+��) ��ü -->
<div style="width:100%;height:auto;border:1px solid black;">

<!-- ��� �������� -->
<!-- height 380 -->
<div style="width:15%; height:380px;float:left;">
   <ul>
   	  <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>������ Ȩ</h1></a></li>
	  <li> <a><h1>��&nbsp;��&nbsp;��&nbsp;��</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h2>���̿���</h2></a></li> 
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>��������</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>��ȣ���� ���</h2></a></li>
      
       <a><h1>������&nbsp;������</h1></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h2>������,��й�ȣ</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</h2></a></li>
       <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>�������ذ�</h2></a></li>
       
       <a><h1>ȣ&nbsp;��&nbsp;��</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>��ȣ��Ʈ �Ǳ�</h2></a></li>
      
       <a><h1>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>������ã��</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>�����ҿ���</h2></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>������</h2></a></li>
      
      <a><h1>Ʈ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</h1></a></li>
      <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>��Ʈ������</h2></a></li>
	  <li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>��Ʈ��ȣ����</h2></a></li>

   </ul>
</div>


<!-- ��� ���� ���� , height 380 , ������ left: 230 ��ü�Ҽ� �ִ� �ۼ�Ʈ-->
<div style="width:82%;height:50%;float:left;border:0px solid black;">

<!-- �̿��� ���� -->   
   <div class="howToUse_div">
  
   	<!-- ���� ���δ� ���� -->
   	<div class="howToUse" style="text-align:center">
   		<h1>���� ������</h1>
   </div>
   
   <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="15%">
                <col width="*"/>
            </colgroup>
            
     <!-- �۾� ���� ���� -->
     <div class="row" style="width:1100px; height:35px; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
   		<font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>Faq �ۼ���</strong></font>
	 </div>
				
		<br>
            <tbody>
                <tr>
                    <th scope="row">����</th>
                    	<td>
                        	<input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90" value="${map.FAQ_TITLE }"/>
                		</td>
                </tr>	
                	<!--  hidden���� ���ܼ� ��Ʈ�ѷ��� ���� -->
                	<input type="hidden" id="FAQ_IDX" name="FAQ_IDX" value="${map.FAQ_IDX }">
                	<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="${map.MEMBER_IDX}" />
                	<input type="hidden" id="FAQ_TYPE" name="FAQ_TYPE" value="${map.FAQ_TYPE}" />
                	<!--  <input type="text" id="MEMBER_LEVEL" name="MEMBER_LEVEL" value="${member_level}" />-->
                <tr>
                	<th scope="row">����</th>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="����" id="FAQ_CONTENT" name="FAQ_CONTENT">${map.FAQ_CONTENT}</textarea>
                    </td>
                </tr>
            </tbody>
        </table>          
    </form>
    
    <br> 
   	<c:if test="${map.FAQ_TYPE == '1'}">
			<a href="#this" class="btn_list" id="list" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '2'}">
			<a href="#this" class="btn_list" id="list1" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '3'}">
			<a href="#this" class="btn_list" id="list2" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '4'}">
			<a href="#this" class="btn_list" id="list3" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '5'}">
			<a href="#this" class="btn_list" id="list4" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '6'}">
			<a href="#this" class="btn_list" id="list5" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '7'}">
			<a href="#this" class="btn_list" id="list6" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '8'}">
			<a href="#this" class="btn_list" id="list7" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '9'}">
			<a href="#this" class="btn_list" id="list8" >�������</a>
		</c:if>
		<c:if test="${map.FAQ_TYPE == '10'}">
			<a href="#this" class="btn_list" id="list9" >�������</a>
		</c:if>
		
		
   	<!-- �����ϱ� ��ư ���δ� ���� -->
   	<div style="text-align:right; margin-right:280px; margin-top:-30px">  
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '1'}">
   			<a href="#this" class="btn_edit" id="edit" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '2'}">
   			<a href="#this" class="btn_edit" id="edit1" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '3'}">
   			<a href="#this" class="btn_edit" id="edit2" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '4'}">
   			<a href="#this" class="btn_edit" id="edit3" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '5'}">
   			<a href="#this" class="btn_edit" id="edit4" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '6'}">
   			<a href="#this" class="btn_edit" id="edit5" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '7'}">
   			<a href="#this" class="btn_edit" id="edit6" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '8'}">
   			<a href="#this" class="btn_edit" id="edit7" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '9'}">
   			<a href="#this" class="btn_edit" id="edit8" >�����ϱ�</a>  
   		</c:if>
   		<c:if test="${ member_level eq 1 && map.FAQ_TYPE eq '10'}">
   			<a href="#this" class="btn_edit" id="edit9" >�����ϱ�</a>  
   		</c:if>
    </div>   	
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    <script type="text/javascript">
    $(document).ready(function(){
    	$("#list").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList();
        });
        $("#list1").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList1();
        });
        $("#list2").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList2();
        });
        $("#list3").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList3();
        });
        $("#list4").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList4();
        });
        $("#list5").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList5();
        });
        $("#list6").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList6();
        });
        $("#list7").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList7();
        });
        $("#list8").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList8();
        });
        $("#list9").on("click", function(e){ //������� ��ư
            e.preventDefault();
            fn_faqBoardList9();
        });
         
        
        
        $("#edit").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard();
        });
        $("#edit1").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard1();
        });
        $("#edit2").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard2();
        });
        $("#edit3").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard3();
        });
        $("#edit4").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard4();
        });
        $("#edit5").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard5();
        });
        $("#edit6").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard6();
        });
        $("#edit7").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard7();
        });
        $("#edit8").on("click", function(e){ //�����ϱ� ��ư
            e.preventDefault();
            fn_faqUpdateBoard8();
        });
        $("#edit9").on("click", function(e){ //�����ϱ� ��ư
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
   
   
   	 </div> <!-- faq ���� �� -->
   </div><!-- ��� �������� ��-->
</div><!-- ������� ��ü(��+��) �� -->
