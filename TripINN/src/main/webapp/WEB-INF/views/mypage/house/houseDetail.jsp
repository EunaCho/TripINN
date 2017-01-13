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
		border:1px solid #31b0d5;
		margin-left:40px;
		width:900px;
		height:100%;
	
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
		
		/* background-color:#31b0d5; */

		color:#aaaaaa;
		text-align:center;
		padding-top:5px;
	}
	.house_div2{
		border:2px solid #31b0d5;
		margin:2px;
		width:100%;
		height:20px;
		border-radius:4px;
		font-size:14px;
		font-weight: 400;
		text-align:center;
		padding-top:5px;
		font-style:'바탕체'
		letter-spacing:2px;
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
		border-bottom:1px solid #3c3c3c;
		margin:2px;
		width:620px;
		height:55px;
		padding-left:5px;
	
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
		border-bottom:2px solid #d2d2d2;  
		border-top:2px solid #d2d2d2;  
		width: 880px; 
		height:230px;
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
			<a href="<%=cp%>/mypage/house.do" class="side-text">숙소목록</a>
		</div>
	
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
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:12px; font-style:'바탕체'">${list.HOUSE_ADDR1} ${list.HOUSE_ADDR2} ${list.HOUSE_ADDR3}</font>
							<br>
							<div style="CLEAR: both;   PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/icon_star2.gif) 0px 0px;   FLOAT: left;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 90px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
						   		<p style="WIDTH: ${houseMap.HI_TOTAL_STAR *20}%; PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;"></p>
						   	</div>
							<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
						   		(${houseMap.HI_TOTAL_STAR}점)
						   		|&nbsp;후기개수:&nbsp;${houseMap.HCNT}개
						   	</font> 
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
					<div class="house_div2">
						${houseMap.HOUSE_NAME} 예약현황
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
							${reserList.HR_NAME}
						</div>
						<div class="reser_div">
							${reserList.HR_PERSONS}
						</div>
						<div class="reser_div">
							${reserList.HR_TIME}
						</div>
						<div class="reser_date" >
							${reserList.HR_FIRST_DATE} ~
							${reserList.HR_LAST_DATE}
						</div>
						<div class="reser_number">
							<c:if test="${reserList.HR_MONEY_STATE eq '1'}">
								<p>지급완료</p>
							</c:if>
							<c:if test="${reserList.HR_MONEY_STATE eq '0'}">
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
					<div class="house_div2">
						${houseMap.HOUSE_NAME} 숙소메시지
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