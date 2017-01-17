<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
</style>
<script>
function reserDetail(idx, tr_idx){
	document.detailForm.TRIP_IDX.value=idx;
	document.detailForm.TR_IDX.value=tr_idx;
	document.detailForm.submit();
}
</script>
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>
<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left_div">
		<div class="side_list">
			<a href="<%=cp%>/mypage/trip.do" class="side-text">트립목록</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/tripReser.do" class="side-text" style="border-bottom:2px solid #cb4242;">예약관리</a>	
		</div>
		
		<div class="side_list">
				<a href="<%=cp%>/mypage/T_reserDelete.do" class="side-text">예약취소 관리</a>
		</div>	
	</div>

	<div class="right_div">
		<div class="reser_div">
		 	내 트립예약목록  
		</div>
		<div>
			<table class="reser_table">
				<tr>
					<td width="90px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>번호</strong></font></td>
					<td width="120px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>예약자명</strong></font></td>
					<td width="330px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>트립명</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>사진</strong></font>
					<td width="290px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>시작일~마지막일</strong></font></td>
					<td width="150px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>지불가격</strong></font></td>
					<td width="110px" height="30px;" bgcolor="#c8c8c8" align="center"><font color="white" size="2" ><strong>대금지급여부</strong></font></td>
				</tr>
					
				<tr>
					<td colspan="7"><hr/></td>
				</tr>
		<c:choose>
			<c:when test="${fn:length(list)>0}">
			<form method="post" action="<%=cp%>/mypage/tripReserDetail.do" name="detailForm">
			<input type="hidden" name="TRIP_IDX" value=""/>
			<input type="hidden" name="TR_IDX" value=""/>
				<c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${status.index+1}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
							${list.TR_NAME}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<a href="javascript:reserDetail(${list.TRIP_IDX}, ${list.TR_IDX});" style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.TRIP_NAME}
						</a>
					</td>
					<td>
						<img height="80px" width="145px;" src="<%=cp%>/images/trip/${list.TRIP_IMAGE}">
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c;  letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						${list.TR_FIRST_DATE} ~ ${list.TR_LAST_DATE}
						</font>
					</td>
					<td align="center" bgcolor="#f3f3f3">
						<font style="color:#3c3c3c; letter-spacing:1px; font-size:12px; font-style:'바탕체'">
						지불가격
						</font>
					</td>
				
					<td align="center" bgcolor="#f3f3f3">
						<c:if test="${list.TR_MONEY_STATE eq '1'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">완료</font>
						</c:if>
						<c:if test="${list.TR_MONEY_STATE eq '0'}">	
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