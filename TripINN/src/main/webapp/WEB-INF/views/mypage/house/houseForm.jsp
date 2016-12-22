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
		border:1px solid black;
		margin:5px;
		width:900px;
		height:450px;
		
		float:left;
		top:114px;
		left:220px;
	}
	.house_div{
		border:1px solid black;
		margin:2px;
		width:150px;
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
				내가 등록한 숙소  
			</div>
		<c:choose>
		<c:when test="${fn:length(list) >0}">
			<c:forEach var="list" items="${list}" varStatus="status">
				<div class="house_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/house/${list.HOUSE_IMAGE}">
						</div>
						<div class="price_div">
							${list.HOUSE_TOTAL_PRICE}
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div">
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size=150px; font-style:'바탕체'">
							${status.index+1}.
							${list.HOUSE_NAME}
							</font>
						</div>
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size=12px; font-style:'바탕체'">${list.HOUSE_ADDR1} ${list.HOUSE_ADDR2} ${list.HOUSE_ADDR3}</font>
							<br>
							${list.HI_TOTAL_STAR} (별점)| 후기개수 
						</div>
						<div class="h_inp_div">
							<div style="border:1px solid red; margin:17px 20px 15px 155px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/house_kind.jpg" style="width:35px; height:35px; float:center;">
								<br>
								<span>${list.HI_SPACE}</span> 
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
							 	<img src="<%= cp %>/images/mypage/house_persons.jpg" style="width:35px; height:35px; float:center;">
								<br>
								${list.HOUSE_TOTAL_PERSONS}명 
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/hi_bad.jpg" style="width:35px; height:35px; float:center;">	
								<br>
								${list.HI_BAD}개
							</div>
						</div>
					</div>		
				</div> <!-- house_menu_div End -->
				
			
			</c:forEach>
		</c:when>
		<c:otherwise>
				<div class="h_list_div">
					등록된 숙소가 없습니다. 
					숙소를 등록해 주세요 .
					
				</div>
		</c:otherwise>
	</c:choose>

	
	</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>