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

<!-- �������� ��Ÿ�� ���� -->
<style>
   .howToUse_div{
      border:2px;
      width:1000px;
      overflow:hidden;
      height:auto;
      border-radius:4px;
      background-color:white;
      margin-left:50px;
      margin-top:10px;
      
   }
   .howToUse{
   border:0px solid black;
   
   width:200px;
   height:30px;
   margin:10px 10px 50px 10px;
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
   .howToUse_title{
   border:0px solid black;c
   border-radius:4px;
   width:99%;
   height:20%;
   margin-left:5px;
   margin-top:10px;
   font-size:19px;
   vertical-align:middle;
	   

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

<!-- �������� ��Ÿ�� ���� -->
<style>
   .howToUse_div{
      border:2px;
      width:1000px;
      overflow:hidden;
      height:auto;
      border-radius:4px;
      background-color:white;
      margin-left:50px;
      margin-top:10px;
      
   }
   .howToUse{
   border:0px solid black;
   
   width:200px;
   height:30px;
   margin:10px 10px 50px 10px;
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
   .howToUse_title{
   border:0px solid black;c
   border-radius:4px;
   width:99%;
   height:20%;
   margin-left:5px;
   margin-top:10px;
   font-size:19px;
   vertical-align:middle;
      

   }
   .howToUse_content{
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


 <!-- ��� �� ���� -->



<div style="width:100%;height:100px;border:0px solid black;text-align:center;">

   <h2>Faq �������� ���Ű� ȯ���մϴ�.</h2>
   </div>

<!-- ��� ���� ��ü(��+��) -->
<div style="width:100%;height:auto;border:0px solid black;">

<!-- ���� ���� -->

   <div style="width:16.8%;height:420px;border:1px solid black;text-align:center;float:left;">	
	   <section>
				<nav style="width:250px;height:400px;margin-top:30px;">

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


<!-- ��� ���� ����-->

<div style="width:82%;height:auto;border:0px solid black;float:left;">


<!-- �̿��� ���� -->   
   <div class="howToUse_div">
  

   	<!-- ���� ���δ� ���� -->
   	<div class="howToUse" style="text-align:center">
   		<h2>���� ������</h2>

      <!-- ���� ���δ� ���� -->
      <div class="howToUse" style="text-align:center">
         <h2>���� ������</h2>

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