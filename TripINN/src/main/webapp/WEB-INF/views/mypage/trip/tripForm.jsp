<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %> 
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
</style>
<script>
function tripDetail(idx) {
	document.detailForm.TRIP_IDX.value = idx;
	document.detailForm.submit();
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/trip.do" class="side-text" style="border-bottom:2px solid #cb4242;">트립목록</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text">예약관리</a>
		</div>
	</div>

	<div class="right_div">
		
			<div class="trip_div">
				내가 등록한 트립
			</div>
		<c:choose>
		<c:when test="${fn:length(list) >0}">
			<form method="post" action="<%=cp %>/mypage/tripDetail.do" name="detailForm">
				<input type="hidden" name="TRIP_IDX" value=""/>
 				<input type="hidden" name="index" value="${status.index+1}"/>
			<c:forEach var="list" items="${list}" varStatus="status">
			<c:set var="fullImg" value="${list.TRIP_IMAGE }"/>
			<c:set var="tripImg" value="${fn:substring(fullImg, 0, fn:indexOf(fullImg, '|')) }"/>
				<div class="trip_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/trip/${tripImg}">
						</div>
						<div class="price_div">
							<font style="color:#3c3c3c; font-weight:solid; font-size:15px; font-style:'바탕체'">
								가격: ${list.TRIP_PPRICE}&nbsp;<strong>\</strong>
							</font>
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div" onclick="tripDetail('${list.TRIP_IDX}')">
							<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
							<br>
								${status.index+1}.
							</font>
							<a href="javascript:tripDetail(${list.TRIP_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
								${list.TRIP_NAME}
							</a>
						</div>
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:13px; font-style:'바탕체'; padding-left:8px;">
								${list.TRIP_ADDR1} ${list.TRIP_ADDR2} ${list.TRIP_ADDR3}</font>
							<br>
						   <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'; padding-left:8px;">
						   		<strong>language:</strong> ${list.TRIP_LANGUAGE} &nbsp;| &nbsp; <strong> trip date:</strong>  ${list.TRIP_FIRST_DATE} ~${list.TRIP_LAST_DATE}
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
						
						</div>
					</div>		
				</div> <!-- trip_menu_div End -->
	
			</c:forEach>
			</form>
		</c:when>
		<c:otherwise>
				<div class="t_list_div">
					등록된 숙소가 없습니다. 
					숙소를 등록해 주세요 .
					
				</div>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${not empty paginationInfo}">
		<div style="clear:both;"></div>
		<div class="trDiv" style="width:100%;margin-top:20px;">
			<div class="tdDiv-col" id="pagingDiv" style="text-align:center;height:30px;margin-top:10px;">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
        	</div>
        </div>
    </c:if>

	
	</div><!-- right_div End -->
	
	<!-- ///////////////페이징처리/////////////// -->
			<form name="listForm" >
			 <input type="hidden" name="currentPageNo" value="" />
			</form>	
			<style>
			#pagingDiv {height:40px;}
			#pagingDiv a { font-size:12px;width:20px; height:20px; border:1px solid #a6a6a6; margin-right:5px; border-radius:7px;padding:7px;}
			#pagingDiv a:hover {background-color:rgb(255, 235, 240);}
			#pagingDiv strong { font-size:12px;border:1px solid #a6a6a6;border-radius:7px;padding:7px;color:#cb4646;margin-right:5px;}
			</style>			
			<script>
			function fn_search(pageNo){
			    var listForm = document.listForm;
			    listForm.action = "/TripINN/mypage/trip.do";
			    listForm.currentPageNo.value = pageNo;
			    listForm.submit();
			}
			</script>
     		<!-- ///////////////페이징처리/////////////// -->
	
	
</div>
<div style="clear:both;"></div>