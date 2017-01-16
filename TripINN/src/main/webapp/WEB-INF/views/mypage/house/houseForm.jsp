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
	/* 	border-bottom:1px solid #3c3c3c; */
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
</style>
<script>
function houseDetail(idx) {
	document.detailForm.HOUSE_IDX.value = idx;
	document.detailForm.submit();
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
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
				내가 등록한 숙소  
			</div>
		<c:choose>
		<c:when test="${fn:length(list) >0}">
			<form method="post" action="<%=cp %>/mypage/houseDetail.do" name="detailForm">
				<input type="hidden" name="HOUSE_IDX" value=""/>
			<c:forEach var="list" items="${list}" varStatus="status">
				<div class="house_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/house/${list.HOUSE_IMAGE}">
						</div>
						<div class="price_div">
							<font style="color:#3c3c3c; font-weight:solid; font-size:15px; font-style:'바탕체'">
								가격: ${list.HOUSE_TOTAL_PRICE}&nbsp;&nbsp;<strong>\</strong>
							</font>
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div" onclick="houseDetail('${list.HOUSE_IDX}')">
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
							<br>
							${status.index+1}.
							</font>
							<a href="javascript:houseDetail(${list.HOUSE_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
								${list.HOUSE_NAME}
							</a>
						</div>
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:13px; font-style:'바탕체'">${list.HOUSE_ADDR1} ${list.HOUSE_ADDR2} ${list.HOUSE_ADDR3}</font>
							<br>
							<div style="CLEAR: both;   PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/icon_star2.gif) 0px 0px;   FLOAT: left;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 90px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
							   <p style="WIDTH: ${list.HI_TOTAL_STAR * 20}%; PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;"></p>
						   </div>
						   <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
						  	 	(${list.HI_TOTAL_STAR}점)
						   		|&nbsp;후기개수:&nbsp;${list.HCNT}개
						   	</font> 
						</div>
						<div class="h_inp_div">
							<div style="border:0px solid red; margin:17px 20px 15px 155px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/house.jpg" style="width:35px; height:35px; float:center;">
								<br/>
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
								 	kind
								 </font>
								 <br/>	
								<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
									${list.HOUSE_KIND}
								</font>
							</div>
							<div style="border:0px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
							 	<img src="<%= cp %>/images/mypage/people.png" style="width:35px; height:35px; float:center;">
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
								 		persons
								 </font>
								<div style="width:70px; height:20px;">
									<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
									${list.HOUSE_TOTAL_PERSONS}명 
									</font>
								</div>
							</div>
							<div style="border:0px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/bed.jpg" style="width:35px; height:35px; float:center;">	
								<br/>
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
									bed 		
								</font>
								<br/>
								${list.HI_BAD}개
							</div>
						</div>
					</div>		
				</div> <!-- house_menu_div End -->
	
			</c:forEach>
			</form>
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