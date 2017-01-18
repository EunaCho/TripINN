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
	/* 	border:1px solid black; */
	
		margin-left:40px;
		width:830px;
		height:100%;
		float:left;
		top:114px;
		left:220px;
	}
	.reser_div{
		border-bottom:2px solid #828282;
		margin:2px;
		width:98%;
		height:25px;
		
		/* background-color:#31b0d5; */
		font-size:16px;
		color:#cb4242;
		font-weight: 400;
		text-align:center;
		padding-top:5px;
	}
	.reser_table{
		margin:10px;
		width:800px; 
	    border:0;
	    cellspacing:0;
	    cellpadding:0;
	}
	#drop_bar ul li:hover {
		diaplay:none;
		float:none;
	}

</style>
<script>
function reserD_Detail(idx, hr_idx){
	document.detailForm.HOUSE_IDX.value=idx;
	document.detailForm.HR_IDX.value=hr_idx;
	document.detailForm.submit();
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left_div" style="float:left;">
		<div class="side_list">
			<a href="<%=cp%>/mypage/house.do" class="side-text">호스팅 숙소</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/houseReser.do" class="side-text">예약관리</a>	
		</div>
		
		<div class="side_list">
				<a href="<%=cp%>/mypage/H_reserDelete.do" class="side-text" style="border-bottom:2px solid #cb4242;">예약취소 관리</a>
		</div>	
	</div>

	<div class="right_div">
		<div class="reser_div">
		 	내 <font style="font-color:red;">예약취소</font> 목록 
		</div>
		<div>
			<table class="reser_table">
				<tr>
					<td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>번호</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약자명</strong></font></td>
					<td width="330px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>숙소명</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>사진</strong></font>
					<td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>취소신청 날짜</strong></font></td>
					<td width="170px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>환불가격</strong></font></td>
					<td width="100px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>신청상태</strong></font></td>
					<td width="100px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>환불여부</strong></font></td>
				</tr>
					
				<tr>
					<td colspan="8"><hr/></td>
				</tr>
		<c:choose>
			<c:when test="${fn:length(list)>0}">
			<form method="post" action="<%=cp%>/mypage/houseReserD_Detail.do" name="detailForm">
			<input type="hidden" name="HOUSE_IDX" value=""/>
			<input type="hidden" name="HR_IDX" value=""/>
				<c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${status.index+1}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
							${list.HR_NAME} / ${list.HR_IDX}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<a href="javascript:reserD_Detail(${list.HOUSE_IDX}, ${list.HR_IDX});" style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.HOUSE_NAME}
						</a>
					</td>
					<td>
						<img height="80px" width="145px;" src="<%=cp%>/images/house/${list.HOUSE_IMAGE}">
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.HR_DELETE_DATE}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c; letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						환불가격
						</font>
					</td>
				
					<td align="center" bgcolor="#f3f3f3">
					<c:choose>
						<c:when test="${list.HR_DELETE_STATE eq '1'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">요청중</font>
						</c:when>
						
						<c:otherwise>
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">신청완료</font>
						</c:otherwise>
					</c:choose>
					</td>
					
					<td align="center" bgcolor="#f3f3f3">
					<c:choose>
						<c:when test="${list.HR_DELETE_STATE eq '3'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">완료</font>
						</c:when>
						<c:otherwise>
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">미지급</font>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="8"><hr/></td>
				</tr>
					
				</c:forEach>
				</form>
			</c:when>
			
			<c:otherwise>
				<tr bgcolor="#FFFFFF" align="center">
					<td colspan="8" align="center">예약취소 신청한 숙소가 없습니다.</td>
				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="8"></td>
				</tr>
			</c:otherwise>
			</c:choose> 
		</table>
		
		
		<c:if test="${not empty paginationInfo}">
		<div style="clear:both;"></div>
		<div class="trDiv" style="width:100%;margin-top:20px;">
			<div class="tdDiv-col" id="pagingDiv" style="text-align:center;height:30px;margin-top:10px;">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
        	</div>
        </div>
    	</c:if>
		
		</div><!--예약리스트   -->
	</div><!-- 오른쪽 div -->
	
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
			    listForm.action = "/TripINN/mypage/H_reserDelete.do";
			    listForm.currentPageNo.value = pageNo;
			    listForm.submit();
			}
			</script>
     		<!-- ///////////////페이징처리/////////////// -->
</div>
<div style="clear:both;"></div>