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
		border:1px solid black;
	
		margin-left:40px;
		width:820px;
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
		color:#aaaaaa;
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
			<a href="<%=cp%>/mypage/house.do" class="side-text">호스팅 숙소</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/houseReser.do" class="side-text">예약관리</a>	
		</div>
		
		<div class="side_list">
				<a href="<%=cp%>/mypage/H_reserDelete.do" class="side-text">예약취소 관리</a>
		</div>	
	</div>

	<div class="right_div">
		<div class="reser_div">
		 	내 숙소예약목록  
		</div>
		<div>
			<table class="reser_table">
				<tr>
					<td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>번호</strong></font></td>
					<td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약자명</strong></font></td>
					<td width="330px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>숙소명</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>사진</strong></font>
					<td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>입실일~퇴실일</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>지불가격</strong></font></td>
					<td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>대금지급여부</strong></font></td>
				</tr>
					
				<tr>
					<td colspan="7"><hr/></td>
				</tr>
		<c:choose>
			<c:when test="${fn:length(list)>0}">
			<form method="post" action="<%=cp%>/mypage/houseReserDetail.do" name="detailForm">
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
							${list.HR_NAME}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<a href="javascript:reserDetail(${list.HOUSE_IDX}, ${list.HR_IDX});" style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.HOUSE_NAME}
						</a>
					</td>
					<td>
						<img height="80px" width="145px;" src="<%=cp%>/images/house/${list.HOUSE_IMAGE}">
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.HR_FIRST_DATE} ~ ${list.HR_LAST_DATE}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c; letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						지불가격
						</font>
					</td>
				
					<td align="center" bgcolor="#f3f3f3">
						<c:if test="${list.HR_MONEY_STATE eq '1'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">완료</font>
						</c:if>
						<c:if test="${list.HR_MONEY_STATE eq '0'}">	
							<font style="color:#3c3c3c;  letter-spacing:2px; font-size:12px; font-style:'바탕체'">미지급</font>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="7"><hr/></td>
				</tr>
					
				</c:forEach>
				</form>
			</c:when>
			
			<c:otherwise>
				<tr bgcolor="#FFFFFF" align="center">
					<td colspan="7" align="center">예약한 숙소가 없습니다. 지금 숙소를 예약해 보세요~!</td>
				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="1"></td>
				</tr>
			</c:otherwise>
			</c:choose> 
		</table>
		
		</div><!--예약리스트   -->
	</div><!-- 오른쪽 div -->
</div>
<div style="clear:both;"></div>