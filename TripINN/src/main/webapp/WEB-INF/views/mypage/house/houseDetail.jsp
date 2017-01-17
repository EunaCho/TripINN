<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>

<style>
	.left_div{
		border:1px solid black;
		margin-bottom:20px;
		width: 200px;
		height:450px;
		float:left;
	}
	.side_list{
		border:1px solid black;
		margin:20px;
    	width:150px;
    	height:27px;	
	} 
	
	.side-text{
		padding: 6px 0;
   	 	font-size: 16px;
    	color: #767676;
    	text-decoration:none
	}
	
	.right_div{
		border:1px solid #31b0d5;
		margin:5px;
		width:900px;
		height:100%;
		
		float:left;
		top:114px;
		left:220px;
	}
	.house_div{
		border:1px solid black;
		margin:2px;
		width:98%;
		height:25px;
		border-radius:4px;
		background-color:#31b0d5;
		font-size:16px;
		color:#FFF;
		font-weight: 400;
		text-align:center;
		padding-top:5px;
	}
	.poto_div1{
		margin:2px;
		width:225px;
		height:188px;
	}
	.poto_div{
	 	border:1px solid black; 
		margin:2px;
		width:230px;
		height:193px;
	}
	.name_div{
		border:1px solid #3c3c3c;
		margin-top:10px;
		width:326px;
		height:40px;
		padding-left:5px;
		text:center;
	
	}
	.price_div{
		border-top:1px solid black;
		border-bottom:1px solid black;
		margin:2px;
		width:230px;
		height:20px;
	}
	
	.h_list_div{
		/* border:1px solid black;   */
		width: 885px; 
		height:396px;
		margin:2px;
	}
	.house_menu_div{
		border:1px solid #31b0d5;  
		width: 880px; 
		height:230px;
		margin:2px;
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
		margin:2px;
		width:620px;
		height:45px;
	}
	.h_inp_div{
		border-top:1px solid #3c3c3c;
		border-bottom:1px solid #3c3c3c;
		margin:2px;
		width:620px;
		height:113px;
	}
	.msg_menu{
		border: 1px solid red;
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
	}
	
	
</style>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
<<<<<<< HEAD
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/house.do" class="side-text">숙소목록</a>
		</div>
=======
   <div class="left_div">
      <div class="side_list">
         <a href="<%=cp%>/mypage/house.do" class="side-text">호스팅 숙소</a>
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
                           |&nbsp;후기개수:&nbsp;${houseMap.HCNT}개
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
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
	
<<<<<<< HEAD
		<div class="side_list">
			<a href="<%=cp%>/mypage/houseReser.do" class="side-text">예약관리</a>
		</div>
	</div>

	<div class="right_div">
		
			<div class="house_div">
				${houseMap.HOUSE_NAME}&nbsp;&nbsp;상세보기
			</div>
				<div class="house_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/house/${houseMap.HOUSE_IMAGE}">
						</div>
						<div class="price_div">
							${houseMap.HOUSE_TOTAL_PRICE}
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div" onclick="houseDetail('${houseMap.HOUSE_IDX}')">
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
							<br>
							${status.index+1}.
							${houseMap.HOUSE_NAME}
							</font>
						</div>
=======
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
							<b><font style="color:red;  letter-spacing:2px; font-size:12px; font-style:'바탕체'">
								<a href="javascript:house_rsv_del('${rList.HR_IDX }');" style="color:red">취소신청</a></font>
							</b>
						</c:if>
					</td>
					<td align="center" bgcolor="#f3f3f3">
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:12px; font-style:'바탕체'">${list.HOUSE_ADDR1} ${list.HOUSE_ADDR2} ${list.HOUSE_ADDR3}</font>
							<br>
							${houseMap.HI_TOTAL_STAR} (별점)| 후기개수 
						</div>
						<div class="h_inp_div">
							<div style="border:1px solid red; margin:17px 20px 15px 155px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/house_kind.jpg" style="width:35px; height:35px; float:center;">
								<br>
								<span>${houseMap.HI_SPACE}</span> 
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
							 	<img src="<%= cp %>/images/mypage/house_persons.jpg" style="width:35px; height:35px; float:center;">
								<br>
								${houseMap.HOUSE_TOTAL_PERSONS}명 
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/hi_bad.jpg" style="width:35px; height:35px; float:center;">	
								<br>
								${houseMap.HI_BAD}개
							</div>
						</div>
					</div>		
				</div> <!-- house_menu_div End -->
				
				<div style="border:1px solid #31b0d5; width: 880px; height:230px; margin:5px;">
					<div style="width:500px; height:70px; margin:10px; border:1px solid red">
					예약 
					</div>
				</div>
				<div style="border:1px solid blue; width:880px; height:230px; margin:5px;">
					<div class="msg_menu">
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 보낸사람
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 제목
						</div>
						<div class="msg_content" style="background-color: #f7f7f7; background-size:700%;">
							내용
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%; border-right:1px solid black;">
							 보낸 날짜
						</div>
					</div>
				</div>
	
	</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>
<form action="/TripINN/mypage/house_rsv_del.do" method="post" name="rform">
	<input type="hidden" name="hr_idx" value="" />
	<input type="hidden" name="HOUSE_IDX" value="${houseMap.HOUSE_IDX }" />
</form>
<script>
function house_rsv_del(hr_idx) {
	if(confirm("확인을 누르시면 예약이 취소됩니다.")) {
		var form = document.rform;
		form.hr_idx.value = hr_idx;
		form.submit();
	}
}
</script>