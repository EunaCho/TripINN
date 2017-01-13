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
	
</style>

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
				${map.TRIP_NAME}트립&nbsp;&nbsp;<strong style="font-color:#007a87;">상세보기</strong>
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
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
							<br>
								${index}.
							</font>
							<a href="javascript:houseDetail(${map.TRIP_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
								${map.TRIP_NAME}
							</a>
						</div>
						
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
				
				<div style="border:1px solid #31b0d5; width: 880px; height:230px; margin:5px;">
					<div class="trip_div2">
						${map.TRIP_NAME} 예약현황
					</div>
					<div class="msg_menu">
						<div class="reser_number" style="background-color: #f7f7f7; background-size:700%;">
							예약번호
						</div>
						<div class="reser_div" style="background-color: #f7f7f7; background-size:700%;">
							예약자명
						</div>
						<div class="reser_div" style="background-color: #f7f7f7; background-size:700%;">
							예약인원
						</div>
						<div class="reser_div" style="background-color: #f7f7f7; background-size:700%;">
							예약일자
						</div>
						<div class="reser_date" style="background-color: #f7f7f7; background-size:700%;">
							입실/퇴실일자
						</div>
						<div class="reser_number" style="background-color: #f7f7f7; background-size:700%;">
							대금지급여부
						</div>
					</div>
			<c:choose>
			<c:when test="${fn:length(reserList)>0 }">	
				<c:forEach var="reserList" items="${reserList}" varStatus="status">
					<div class="msg_menu">
						<div class="reser_number">
							${status.index+1}
						</div>
						<div class="reser_div">
							${reserList.TR_NAME}
						</div>
						<div class="reser_div">
							${reserList.TR_PERSONS}
						</div>
						<div class="reser_div">
							${reserList.TR_TIME}
						</div>
						<div class="reser_date" >
							${reserList.TR_FIRST_DATE} ~
							${reserList.TR_LAST_DATE}
						</div>
						<div class="reser_number">
							<c:if test="${reserList.TR_MONEY_STATE eq '1'}">
								<p>지급완료</p>
							</c:if>
							<c:if test="${reserList.TR_MONEY_STATE eq '0'}">
								<p>미지급</p>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<div class="msg_menu">
						현재 예약자가 없습니다.
					</div>
			</c:otherwise>
			</c:choose>
				</div>
				
				
				<div style="border:1px solid blue; width:880px; height:230px; margin:5px;">
					<div class="trip_div2">
						${map.TRIP_NAME} 숙소메시지
					</div>
					<div class="msg_menu">
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 보낸사람
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 제목
						</div>
						<div class="msg_content" style="background-color: #f7f7f7; background-size:700%; text-align:center;">
							내용
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%; border-right:1px solid black;">
							 보낸 날짜
						</div>
					</div>
				<c:choose>
				<c:when test="${fn:length(msgList)>0}">
					<c:forEach var="msgList" items="${msgList}" varStatus="status">
					<div class="msg_menu">
						<div class="msg_title">
							 ${msgList.MEMBER_EMAIL}
						</div>
						<div class="msg_title" >
							 ${msgList.MSG_TITLE}
						</div>
						<div class="msg_content" >
							${msgList.MSG_CONTENT}
						</div>
						<div class="msg_title" >
							${msgList.SEND_DATE}
						</div>
					</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="msg_menu">
						해당 숙소에 받은메시지가 없습니다. 
					</div>
				</c:otherwise>
				</c:choose>
					
				</div>
	
	</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>