<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>

<style>
	.left_div{
		border:1px solid black;
		margin-bottom:20px;
		margin-left:50px;
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
/* 		border:1px solid black; */
		margin-left:40px;
		width:900px;
		
		overflow:hidden;
		height:auto;
		float:left;
		top:114px;
		left:220px;
	}
	.trip_div{
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
		/* border-top:2px solid #828282; */
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
	/* 	border-bottom:1px solid #3c3c3c; */
		margin-top:2.5px;
		width:230px;
		height:20px;
		padding-left:3px;
		padding-bottom:3px;
	}
	
	.t_list_div{
		/* border:1px solid black;   */
		width: 885px; 
		height:396px;
		margin:2px;
	}
	.trip_menu_div{
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
		border-bottom:1px solid #3c3c3c;
		border-top:1px solid #3c3c3c;
		margin:2px;
		width:620px;
		height:45px;
	}
	.t_inp_div{
		border-top:1px solid #3c3c3c;
	/* 	border-bottom:1px solid #3c3c3c; */
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
   .right-con { width:98%; height:45%; border: 2px solid green; margin:5px ; display: block;min-height: 300px; }
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
function deleteTrip(trip_idx){
	
	document.houseForm.TRIP_IDX = trip_idx;
	
	document.tripForm.action="/TripINN/trip/deleteTrip.do";
	document.tripForm.submit();
}
function modifyTrip(trip_idx){
	
	document.tripForm.TRIP_IDX = trip_idx;
	
	document.tripForm.action="/TripINN/trip/tripModifyForm.do";
	document.tripForm.submit();
}

</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/trip.do" class="side-text">트립목록</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text">예약관리</a>
		</div>
	</div>

	<div class="right_div">
		
			<div class="trip_div">
				<strong style="font-color:#007a87;">${map.TRIP_NAME} 트립</strong>
			</div>
				<div class="trip_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/trip/${map.TRIP_IMAGE}">
						</div>
						<div class="price_div">
							<font style="color:#3c3c3c; font-weight:solid; font-size:15px; font-style:'바탕체'">
								가격: ${map.TRIP_PPRICE}&nbsp;<strong>\</strong>
							</font>
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div" onclick="tripDetail('${map.TRIP_IDX}')">
						<div style="width:200px; height:auto; float:left;">
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
							<br>
								${index}.
							</font>
							<a href="javascript:houseDetail(${map.TRIP_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
								${map.TRIP_NAME}
							</a>
						</div>
						
					 	<div style= " width:250px; height:auto; float:left; margin-left:370px; margin-top:-35px; border:1px solid red;">
                        	<input type="button" value="호스팅 수정하기" onclick="javascript:modifyTrip${houseMap.HOUSE_IDX});" style="height:35px; border-radius:5px; border:2px solid blue; background-color:#fff; float:left; margin-right:25px;"/>
                    		<input type="button" value="호스팅 삭제하기" onclick="javascript:deleteTrip(${houseMap.HOUSE_IDX});" style="height:35px; border-radius:5px; border:2px solid blue; background-color:#fff; float:left; "/>
                    	</div>
                     
					</div><!-- name_div -->
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:13px; font-style:'바탕체'; padding-left:8px;">
								${map.TRIP_ADDR1} ${map.TRIP_ADDR2} ${map.TRIP_ADDR3}</font>
							<br>
						   <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'; padding-left:8px;">
						   		<strong>language:</strong> ${map.TRIP_LANGUAGE} &nbsp;| &nbsp; <strong> trip date:</strong>  ${map.TRIP_FIRST_DATE} ~${map.TRIP_LAST_DATE}
						   	</font> 
						</div>
						<div class="t_inp_div">
							<%-- <div style="border:1px solid red; margin:17px 20px 15px 155px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/house_kind.jpg" style="width:35px; height:35px; float:center;">
								<br>
								<span>${list.TRIP_INCLUDE}</span> 
							</div>--%>
							<div style="margin:17px 20px 15px 160px; width:70px; height:70px; float:left; text-align:center;">
							 	<img src="<%= cp %>/images/mypage/people.png" style="width:35px; height:33px; float:center; ">
								 	<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
								 		persons
								 	</font>
								<div style="width:70px; height:20px;">
									<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
										${list.TRIP_PERSONS}명 
									</font>
								</div>
							</div>
							
							<div style="margin:17px 20px 15px 120px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/active.png" style="width:33px; height:33px; float:center; padding-top:3px;">	
									<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
										active
									</font> 
									
								<div style="margin:0px; width:70px; height:20px; text-align:center;">
									<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
										${list.TRIP_TYPE}
									</font>
								</div>
							</div>
						
						</div> <!-- t_inp_div -->
					</div><!-- menu_div2 -->		
				</div> <!-- trip_menu_div End -->
				
			
            <div class="right-con">
               <form name="form_kind" method="post">
                  <div class="right-top" style="border:1px solid red;">
                     <div id="reser" class='top_div <c:if test="${Type eq 'reser'}">on</c:if>' onclick="searchKind(1)">
                      			  예약현황
                     </div>
                     <div id="msg" class=top_div <c:if test="${Type == 'msg'}">on</c:if> onclick="searchKind(2)">
                      			  메시지 현황
                     </div>
                  </div>
               </form>
               <hr/>
<style>
   #reserDiv { display: block; }
    .reserDiv { width:90%;height:30px; margin:0px auto; }
    .reserDiv .r_num { width:9%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px; }
    .reserDiv .r_name { width:16%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px;  }
    .reserDiv .r_person { width:9%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px;}
    .reserDiv .r_date { width:20%; float:left; border:1px solid black; text-align:center; padding:3px; height:25px; }
    
    #msgDiv { display: none; }
    .msgDiv { width:90%;height:30px; margin:0px auto; }
    .msgDiv .m_num { width:9%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px; }
    .msgDiv .m_email { width:25%; float:left; border:1px solid black; text-align:center; padding:3px;height:25px;  }
    .msgDiv .m_title { width:45%; float:left; border:1px solid black; text-align:center; padding:3px; cursor:pointer;  height:25px; }
    .msgDiv .m_date { width:17%; float:left; border:1px solid black; text-align:center; padding:3px; height:25px; }
    .msgDiv .m_content { width:98%; float:left; border:1px solid black; text-align:center; padding:3px; height:25px; }
</style>

   <div id="reserDiv">
      <div class="reserDiv" >
         <div class="r_num" style="background-color:#dedede;">번호</div>
         <div class="r_name" style="background-color:#dedede;">예약자 명</div>
         <div class="r_person" style="background-color:#dedede;">인원</div>
         <div class="r_date" style="background-color:#dedede;">예약일</div>
         <div class="r_date" style="background-color:#dedede;">입실일</div>
         <div class="r_date" style="background-color:#dedede;">퇴실일</div>
      </div>
      <c:if test="${empty reserList}">
      	<div style="height:50%;background-color:#F8F8F8; padding-top:120px; text-align:center;">
			<font style="color:#000;font-size:20px;margin-top:100px; ">조회된 결과가 없습니다.</font>
		</div>
      </c:if>
      <c:forEach items="${reserList}" var="rList" varStatus="stat">
      <div class="reserDiv">
         <div class="r_num">${stat.index + 1 }</div>
         <div class="r_name">${rList.HR_NAME }</div>
         <div class="r_person">${rList.HR_PERSONS } 명</div>
         <div class="r_date">
            <fmt:formatDate value="${rList.HR_TIME }" pattern="yyyy-MM-dd HH:mm"/>
         </div>
         <div class="r_date">
            <fmt:formatDate value="${rList.HR_FIRST_DATE }" pattern="yyyy-MM-dd HH:mm"/>
         </div>
         <div class="r_date">
            <fmt:formatDate value="${rList.HR_LAST_DATE }" pattern="yyyy-MM-dd HH:mm"/>
         </div>
      </div>
      </c:forEach>
   </div>
   
   <!-- ///////////////////// 메세지 -->
   <!-- msg_idx, receive_member_email, msg_state, msg_type, msg_content, send_date, msg_title  -->
   <div id="msgDiv">
      <div class="msgDiv" >
         <div class="m_num" style="background-color:#dedede;">번호</div>
         <div class="m_email" style="background-color:#dedede;">이메일</div>
         <div class="m_title" style="background-color:#dedede;">제목</div>
         <div class="m_date" style="background-color:#dedede;">보낸 날짜</div>
      </div>
       <c:if test="${empty msgList}">
      	<div style="height:50%;background-color:#F8F8F8; padding-top:120px; text-align:center;">
			<font style="color:#000;font-size:20px;margin-top:100px; ">조회된 결과가 없습니다.</font>
		</div>
      </c:if>
      <c:forEach items="${msgList}" var="mList" varStatus="stat">
      <div class="msgDiv">
         <div class="m_num">${stat.index + 1 }</div>
         <div class="m_email">${mList.MEMBER_EMAIL }</div>
         <div class="m_title" onclick="contentView('${mList.MSG_IDX }');" style="color:red; font-weight:bold;">
            ${mList.MSG_TITLE }
         </div>
         <div class="m_date">
            <fmt:formatDate value="${mList.SEND_DATE}" pattern="yyyy-MM-dd"/>
         </div>
      </div>
      <div class="msgDiv" style="display:none;" id="m_content${mList.MSG_IDX }">
         <div class="m_content" style="padding:10px;min-height:150px;background-color:#ededed;">${mList.MSG_CONTENT }</div>
      </div>
      </c:forEach>
   </div>
   
  
   </div><!-- right-con -->
</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>