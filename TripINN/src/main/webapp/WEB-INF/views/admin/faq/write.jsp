<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>


<!-- �ۼ���: ������ -->
<!-- �������� ��Ÿ������1 -->
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


 <!-- ��� �� ���� -->
<div style="width:100%;height:100px;border:1px solid black;text-align:center;">
   <h2>FAQ �������� ���Ű� ȯ���մϴ�.</h2>
</div>

<!-- ��� ����(��+��) ��ü -->
<div style="width:100%;height:auto;border:1px solid black;">

   <!-- ���� ���� -->
   <div style="width:16.8%;height:280px;border:0px solid black;text-align:center;float:left;background:#eeeeff;">   
      <section>
            <nav style="width:250px;height:400px;margin-top:30px;">

               <ul id="dropdown2">
               <c:if test="${member_level == 1}">
                  <li><a href="http://localhost:8080/TripINN/admin/main.do">������ Ȩ</a></li>
               </c:if>   
                  <li><a>�����ϱ�</a>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList.do">�̿���</a></li>
                     </ul>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList1.do">������</a></li>
                     </ul>
                  </li>
                  <li><a>������ ������</a>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList2.do">�� ����</a></li>
                     </ul>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList3.do">���Ȱ� ��й�ȣ</a></li>
                     </ul>
                  </li>
                  <li><a>����</a>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList4.do">���� ã��</a></li>
                     </ul>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList5.do">���� ����</a></li>
                     </ul>
                  </li>
                  <li><a>Ʈ��</a>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList6.do">Ʈ�� ����</a></li>
                     </ul>
                     <ul>
                     <li><a href = "http://localhost:8080/TripINN/admin/faqList7.do">Ʈ�� ȣ����</a></li>
                     </ul>
                  </li>
                  <li><a href = "http://localhost:8080/TripINN/admin/faqList8.do">�ı�</a></li>
                  <li><a href="http://localhost:8080/TripINN/admin/qnaList.do">�����ϱ�</a></li>
                  
               </ul>
            </nav>
      </section>
   
   </div>


<!-- ��� ���� ���� , height 380 , ������ left: 230 ��ü�Ҽ� �ִ� �ۼ�Ʈ-->
<div style="width:82%;height:50%;float:left;border:1px solid black;margin-left:3px">

<!-- �̿��� ���� -->   
   <div class="howToUse_div" style="margin-left:10px">
  
      <!-- ���� ���δ� ���� -->
      <div class="howToUse" style="text-align:center">
         <h1>�۾��� ������</h1>
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
         <font style="font-family:'Noto Sans', sans-serif; font-size:17px; font-color:#3b3a3a; "><strong>Faq ���ۼ�</strong></font>
    </div>
            
            <tbody>
                <tr>
                    <th scope="row">����</th>
                    <td><input type="text" id="FAQ_TITLE" name="FAQ_TITLE" class="wdp_90"></input></td>
                </tr>
                   <!-- ȸ����ȣ��, FAQ�������� �������� �޾ƿ��� hidden���� ���ܼ� ��Ʈ�ѷ��� ���� -->
                   <input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="<%=session.getAttribute("member_idx") %>" />
                   <input type="hidden" id="FAQ_TYPE" name="FAQ_TYPE" value="${faq_type}" />
                <tr>
                   <th scope="row">����</th>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="����" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    
       <c:if test="${faq_type == '1'}">
         <a href="#this" class="btn_list" id="list" >�������</a>
      </c:if>
      <c:if test="${faq_type == '2'}">
         <a href="#this" class="btn_list" id="list1" >�������</a>
      </c:if>
      <c:if test="${faq_type == '3'}">
         <a href="#this" class="btn_list" id="list2" >�������</a>
      </c:if>
      <c:if test="${faq_type == '4'}">
         <a href="#this" class="btn_list" id="list3" >�������</a>
      </c:if>
      <c:if test="${faq_type == '5'}">
         <a href="#this" class="btn_list" id="list4" >�������</a>
      </c:if>
      <c:if test="${faq_type == '6'}">
         <a href="#this" class="btn_list" id="list5" >�������</a>
      </c:if>
      <c:if test="${faq_type == '7'}">
         <a href="#this" class="btn_list" id="list6" >�������</a>
      </c:if>
      <c:if test="${faq_type == '8'}">
         <a href="#this" class="btn_list" id="list7" >�������</a>
      </c:if>
      <c:if test="${faq_type == '9'}">
         <a href="#this" class="btn_list" id="list8" >�������</a>
      </c:if>
      <c:if test="${faq_type == '10'}">
         <a href="#this" class="btn_list" id="list9" >�������</a>
      </c:if>
      
       
      
   <!-- �ۼ��ϱ��ư ���δ� ���� -->
      <div style="text-align:right; margin-right:280px;margin-top:-20px">
         <c:if test="${faq_type == '1'}">
         <a href="#this" class="btn_write" id="write" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '2'}">
         <a href="#this" class="btn_write" id="write1" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '3'}">
         <a href="#this" class="btn_write" id="write2" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '4'}">
         <a href="#this" class="btn_write" id="write3" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '5'}">
         <a href="#this" class="btn_write" id="write4" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '6'}">
         <a href="#this" class="btn_write" id="write5" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '7'}">
         <a href="#this" class="btn_write" id="write6" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '8'}">
         <a href="#this" class="btn_write" id="write7" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '9'}">
         <a href="#this" class="btn_write" id="write8" >�ۼ��ϱ�</a>
      </c:if>
      <c:if test="${faq_type == '10'}">
         <a href="#this" class="btn_write" id="write9" >�ۼ��ϱ�</a>
      </c:if>
          
      <br><br><br><br>
           
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
        
        $("#write").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard();
        });
        $("#write1").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard1();
        });
        $("#write2").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard2();
        });
        $("#write3").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard3();
        });
        $("#write4").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard4();
        });
        $("#write5").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard5();
        });
        $("#write6").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard6();
        });
        $("#write7").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard7();
        });
        $("#write8").on("click", function(e){ //�ۼ��ϱ� ��ư
            e.preventDefault();
            fn_faqInsertBoard8();
        });
        $("#write9").on("click", function(e){ //�ۼ��ϱ� ��ư
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
   
   
       </div> <!-- faq ���� �� -->
   </div><!-- ��� �������� ��-->
</div><!-- ������� ��ü(��+��) �� -->