<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>

<style>
  .left_div{
      border:1px solid #b0bdbe;
      background-color:rgba(219, 219, 219, 0.22);
      border-radius:5px;
      margin-bottom:20px;
      margin-left:50px;
      width: 200px;
      height:210px;
      float:left;
   }
   .side_list{
      border:2px solid rgb(224, 224, 224);
      background-color:#fff;
      border-radius:8px;
      margin:20px;
       width:150px;
       height:27px;
       text-align:center;   
   } 
   .side-text{
      padding: 6px 0;
          font-size: 15px;
       color:#6a6c6d;
       text-decoration:none;
   }
   
   .right_div{
   /*    border:1px solid #31b0d5; */
      margin-left:40px;
      width:900px;
      overflow:hidden;
      height:auto;
   
      float:left;
      top:114px;
      left:220px;
   }
   .house_div{
      margin:2px;
      width:98%;
      height:25px;
      font-size:16px;
      color:#FFF;
      font-weight: 400;
      text-align:center;
      padding-top:5px;
      font-style:'바탕체'
      letter-spacing:2px;
      
      border-bottom:2px solid #828282;
      margin:2px;
      width:98%;
      height:25px;
      color:#aaaaaa;
      text-align:center;
      padding-top:5px;
   }
   .poto_div1{
      margin:2px;
      width:225px;
      height:188px;
   }
   .poto_div{
       /* border:1px solid black;  */
      margin:2px;
      width:230px;
      height:193px;
   }
   .name_div{
      /* border-t:1px solid #3c3c3c; */
      border-bottom:1px solid #3c3c3c;
      margin:2px;
      width:615px;
      height:55px;
      padding-left:5px;
   }
   .price_div{
      border-top:1px solid black; 
   /*    border-bottom:1px solid #3c3c3c; */
      margin-top:2.5px;
      width:230px;
      height:20px;
      padding-left:3px;
      padding-bottom:3px;
   }
   
   .h_list_div{
      /* border:1px solid black;   */
      width: 885px; 
      height:396px;
      margin:2px;
   }
   .house_menu_div{
      border-bottom:2px solid #d2d2d2;  
      border-top:2px solid #d2d2d2;  
      width: 880px; 
      height:225px;
      margin-top:13px;
      margin-left:4px;
   }
   .menu_div{
      margin:2px;
      width: 236px; 
      float:left
   }
   .menu_div2{
      width:632px;
      float:left;
   }
   .position_div{
      border-top:1px solid #3c3c3c;
      border-bottom:1px solid #3c3c3c;
      margin:2px;
      width:620px;
      height:45px;
   }
   .h_inp_div{
      border-top:1px solid #3c3c3c;
      
      margin:2px;
      width:620px;
      height:113px;
   }
   .msg_menu{
      border: 1px solid ;
     
      margin:0px;
      height:25px;
      font-size:5px;
      float:left;
   }
   .msg_title{
      border-bottom:1px solid black;
      border-left:1px solid black;
      margin:0px;
      width:152px;
      height:25px;
      font-size:10px;
      padding-left:3px;
      float:left;
      text-overflow:ellipsis; 
      overflow:hidden;
      white-space:nowrap;
      text-align:center;
      font-style:'바탕체'
   }
   .msg_content{
      border-bottom:1px solid black;
      border-left:1px solid black;
      margin:0px;
      width:402px;
      height:25px;
      font-size:10px;
      padding-left:3px;
      float:left;
      text-overflow:ellipsis; 
      overflow:hidden;
      white-space:nowrap;
      font-style:'바탕체'
   
   }
   .reser_number{
      border-bottom:1px solid black;
      border-left:1px solid black;
      margin:0px;
      width:63px;
      height:25px;
      font-size:10px;
      padding-left:3px;
      float:left;
      white-space:nowrap;
      text-align:center;
      font-style:'바탕체'
   }
   .reser_div{
      border-bottom:1px solid black;
      border-left:1px solid black;
      margin:0px;
      width:166px;
      height:25px;
      font-size:10px;
      padding-left:3px;
      float:left;
      white-space:nowrap;
      text-align:center;
      font-style:'바탕체'
   }
   .reser_date{
      border-bottom:1px solid black;
      border-left:1px solid black;
      margin:0px;
      width:228px;
      height:25px;
      font-size:10px;
      padding-left:3px;
      float:left;
      white-space:nowrap;
      text-align:center;
      font-style:'바탕체'
   }
   .right-con { width:98%; height:45%;  margin:5px ; display: block;min-height: 300px; }
   .list-right { width:99%; height:100%; border: 5px solid #a6a6a6; float:left; }
   .top_div { width:50%; text-align:center; height:30px; float:left; padding-top:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;font-weight:bold; }
   .top_div:hover {border-bottom:5px solid #1E6198;cursor:pointer;}
   .on {border-bottom:5px solid #1E6198;cursor:pointer; background-color: #f8f8f8;}
   
</style>
<script>
   function searchKind(wish_kind) {
    if(wish_kind == 2) { // 메세지 현황 클릭 시
      $("#reserDiv").css("display", "none");
      $("#msgDiv").css("display", "block"); 
      $("#reser").attr("class", "top_div"); // id가 reser인 태그의 class명을 top_div로 변경
      $("#msg").attr("class", "top_div on");
    } else { // 예약 현황 클릭 시
      $("#msgDiv").css("display", "none"); 
      $("#reserDiv").css("display", "block");
      $("#reser").attr("class", "top_div on");
      $("#msg").attr("class", "top_div");
    }
   }
   
   function contentView(msg_idx) {
      if($("#m_content"+msg_idx).css("display") == "none") {
            $("#m_content"+msg_idx).css("display", "block");
      } else {
         $("#m_content"+msg_idx).css("display", "none");
      }
   }
function deleteHouse(house_idx){
   
   document.houseForm.HOUSE_IDX = house_idx;
   
   document.houseForm.action="/TripINN/house/deleteHouse.do";
   document.houseForm.submit();
}
function modifyHouse(house_idx){
   
   document.houseForm.HOUSE_IDX = house_idx;
   
   document.houseForm.action="/TripINN/house/houseModifyForm.do";
   document.houseForm.submit();
}

function reserDetail(idx, hr_idx){
   document.detailForm.HOUSE_IDX.value=idx;
   document.detailForm.HR_IDX.value=hr_idx;
   document.detailForm.submit();
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
   <div class="left_div">
      <div class="side_list">
         <a href="<%=cp%>/mypage/house.do" class="side-text" style="border-bottom:2px solid #cb4242;">호스팅 숙소</a>
      </div>
   
      <div class="side_list">
         <a href="<%=cp%>/mypage/houseReser.do" class="side-text">예약관리</a>
      </div>
   </div>

   <div class="right_div">
      
         <div class="house_div">
           <strong style="font-color:#007a87;"> ${houseMap.HOUSE_NAME} 숙소</strong>
         </div>
               <div class="house_menu_div">
               <div class="menu_div">
                  <div class="poto_div">
                  <img class="poto_div1" src="<%= cp %>/images/house/${houseMap.HOUSE_IMAGE}">
                  </div>
                  <div class="price_div">
                     <font style="color:#3c3c3c; font-weight:solid; font-size:15px; font-style:'바탕체'">
                        가격: ${houseMap.HOUSE_TOTAL_PRICE}&nbsp;&nbsp;<strong>\</strong>
                     </font>
                  </div>
               </div>
               
               <div class="menu_div2">
               <form name="houseForm" method="post">
               <input type="hidden" name="HOUSE_IDX" value=""/>
                  <div class="name_div">
                     <div style="width:200px; height:auto; float:left;">
                        <font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
                        <br>
                        ${status.index+1}.
                        </font>
                        <a href="javascript:houseDetail(${houseMap.HOUSE_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
                           ${houseMap.HOUSE_NAME}
                        </a>
                     </div>
         
                    <div style= " width:250px; height:auto; float:left; margin-left:370px; margin-top:-35px; border:0px solid red;">
                        <input type="button" value="호스팅 수정하기" onclick="javascript:modifyHouse${houseMap.HOUSE_IDX});" style="height:35px; border-radius:5px; border:2px solid blue; background-color:#fff; float:left; margin-right:25px;"/>
                       <input type="button" value="호스팅 삭제하기" onclick="javascript:deleteHouse(${houseMap.HOUSE_IDX});" style="height:35px; border-radius:5px; border:2px solid blue; background-color:#fff; float:left; "/>
                    </div>
                     
                  </div><!-- name_div -->
                  
                  <div class="position_div">
                     <font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:13px; font-style:'바탕체'">${houseMap.HOUSE_ADDR1} ${houseMap.HOUSE_ADDR2} ${houseMap.HOUSE_ADDR3}</font>
                     <br>
                     <div style="CLEAR: both;   PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/icon_star2.gif) 0px 0px;   FLOAT: left;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 90px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
                        <p style="WIDTH: ${houseMap.HI_TOTAL_STAR * 20}%; PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;"></p>
                     </div>
                     <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
                           (${houseMap.HI_TOTAL_STAR}점)
                           |&nbsp;후기개수:&nbsp;${list.HCNT}개
                        </font> 
                  </div>
                  <div class="h_inp_div">
                     <div style="border:0px dotted black; margin:17px 20px 15px 155px; width:75px; height:75px; float:left; text-align:center;">
                        <img src="<%= cp %>/images/mypage/house.jpg" style="width:35px; height:35px; float:center;">
                        <br/>
                        <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
                            kind
                         </font>
                         <br/>   
                        <font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
                           ${houseMap.HOUSE_KIND}
                        </font>
                     </div>
                     <div style="border:0px dotted black; margin:17px 20px 15px 35px; width:75px; height:75px; float:left; text-align:center;">
                         <img src="<%= cp %>/images/mypage/people.png" style="width:35px; height:35px; float:center;">
                        <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
                               persons
                         </font>
                        <div style="width:70px; height:20px;">
                           <font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
                           ${houseMap.HOUSE_TOTAL_PERSONS}명 
                           </font>
                        </div>
                     </div>
                     <div style="border:0px dotted black; margin:17px 20px 15px 35px; width:75px; height:75px; float:left; text-align:center;">
                        <img src="<%= cp %>/images/mypage/bed.jpg" style="width:35px; height:35px; float:center;">   
                        <br/>
                        <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
                           bed       
                        </font>
                        <br/>
                        ${houseMap.HI_BAD}개
                     </div>
                  </div>
               </form>
               </div>      
            </div> <!-- house_menu_div End -->
            
      
     <div class="right-con">
               <form name="form_kind" method="post">
                  <div class="right-top" style="border:1px solid #828282;">
                     <div id="reser" class='top_div <c:if test="${Type eq 'reser'}">on</c:if>' onclick="searchKind(1)">
                                 예약현황
                     </div>
                     <div id="msg" class=top_div <c:if test="${Type == 'msg'}">on</c:if> onclick="searchKind(2)">
                                 메시지 현황
                     </div>
                  </div>
               </form>
               <hr style="border:1px solid #828282;"/>
<style>
   #reserDiv { display: block; }
    .reserDiv { width:90%;height:30px; margin:0px auto; }
    .reserDiv .r_num { width:9%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px; }
    .reserDiv .r_name { width:16%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px;  }
    .reserDiv .r_person { width:9%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px;}
    .reserDiv .r_date { width:20%; float:left; border:1px solid black; text-align:center; padding:3px; height:25px; }
    
    #msgDiv { display: none; }
    .msgDiv { width:90%;height:30px; margin:0px auto; }
    .msgDiv .m_num { width:9%; float:left; border:1px solid black; text-align:center; padding:3px; }
    .msgDiv .m_email { width:25%; float:left; border:1px solid black; text-align:center; padding:3px;  }
    .msgDiv .m_title { width:45%; float:left; border:1px solid black; text-align:center; padding:3px; cursor:pointer;   }
    .msgDiv .m_date { width:17%; float:left; border:1px solid black; text-align:center; padding:3px;  }
    .msgDiv .m_content { width:98%; float:left; border:1px solid black; text-align:center; padding:3px;  }
</style>

   <div id="reserDiv">
         <table class="reser_table">
            <tr>
               <td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>번호</strong></font></td>
               <td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약 상태</strong></font></td>
               <td width="330px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약자명</strong></font></td>
               <td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>인원</strong></font></td>
               <td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약일</strong></font>
               <td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>입실일</strong></font></td>
               <td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>퇴실일</strong></font></td>
            </tr>
   
            <tr>
               <td colspan="7"><hr/></td>
            </tr>
         <form method="post" action="<%=cp%>/mypage/houseReserDetail.do" name="detailForm">
         <input type="hidden" name="HOUSE_IDX" value=""/>
         <input type="hidden" name="HR_IDX" value=""/>
         
         <c:if test="${empty reserList}">
               <div style="height:50%;background-color:#F8F8F8; padding-top:120px; text-align:center;">
               <font style="color:#000;font-size:20px;margin-top:100px; ">조회된 결과가 없습니다.</font>
            </div>
            </c:if>
            
         <c:forEach var="rList" items="${reserList}" varStatus="status">
            <tr>
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                  ${status.index+1} 
                  </font>
               </td>
               <td align="center" bgcolor="#f3f3f3">
                  <c:if test="${rList.HR_DELETE_STATE == 0}">
                     <font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">예약</font>
                  </c:if>
                  <c:if test="${rList.HR_DELETE_STATE == 1}">   
                     <font style="color:red;  letter-spacing:2px; font-size:12px; font-style:'바탕체'">취소신청</font>
                  </c:if>
               </td>
               <td align="center" bgcolor="#f3f3f3">
                  
                  <a href="javascript:reserDetail(${rList.HOUSE_IDX}, ${rList.HR_IDX});" style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                     ${rList.HR_NAME }
                  </a>

               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                      ${rList.HR_PERSONS} 명
                  </font>

               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                       <fmt:formatDate value="${rList.HR_TIME }" pattern="yyyy-MM-dd HH:mm"/>
                  </font>   
               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c; letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                     <fmt:formatDate value="${rList.HR_FIRST_DATE }" pattern="yyyy-MM-dd HH:mm"/>
                  </font>

               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c; letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                     <fmt:formatDate value="${rList.HR_LAST_DATE }" pattern="yyyy-MM-dd HH:mm"/>
                  </font>
               </td>
            </tr>
            <tr>
               <td colspan="7"><hr/></td>
            </tr>
               
            </c:forEach>
         </form>
         </table>
   </div><!-- reserDiv -->
   
   <!-- ///////////////////// 메세지 -->
   
   <!-- msg_idx, receive_member_email, msg_state, msg_type, msg_content, send_date, msg_title  -->
   <div id="msgDiv">
         
         <table class="reser_table">
      <c:choose>
         <c:when test="${fn:length(list)>0}">
            <tr>
               <td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>번호</strong></font></td>
               <td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>보낸사람</strong></font></td>
               <td width="330px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>제목</strong></font></td>
               <td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>보낸날짜</strong></font></td>
            </tr>
            
            <tr>
               <td colspan="4"><hr/></td>
            </tr>
         <form method="post" action="<%=cp%>/mypage/receiveMsgDetail.do" name="msg_detailForm">
         <input type="hidden" name="msg_idx" value=""/>
         
         
         <c:forEach var="mList" items="${msgList}" varStatus="status">
            <tr>
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                  ${status.index+1}
                  </font>
               </td>
               <td align="center" bgcolor="#f3f3f3">
                  
                  <a href="javascript:contentView('${mList.MSG_IDX }');" style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                     ${mList.MEMBER_EMAIL}
                  </a>
               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                       <fmt:formatDate value="${mList.SEND_DATE }" pattern="yyyy-MM-dd"/>
                  </font>
               </td>
               
               <td align="center" bgcolor="#f3f3f3">
                  <font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
                       <fmt:formatDate value="${rList.HR_TIME }" pattern="yyyy-MM-dd HH:mm"/>
                  </font>   
               </td>
            </tr>
            <tr>
               <td colspan="4"><hr/></td>
            </tr>
            </c:forEach>
         </form>
            </form>
         </c:when>
            
         <c:otherwise>
            <div style="height:50%;background-color:#F8F8F8; padding-top:120px; text-align:center;">
               <font style="color:#000;font-size:20px;margin-top:100px; ">조회된 결과가 없습니다.</font>
            </div>
         </c:otherwise>
      </c:choose>
         </table>
   </div>
</div><!-- right_div End -->
   
   
</div>
<div style="clear:both;"></div>