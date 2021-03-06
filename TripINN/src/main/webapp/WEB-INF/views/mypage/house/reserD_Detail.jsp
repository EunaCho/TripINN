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
	/* 	border:1px solid black; */
	
		margin-left:40px;
		width:825px;
		height:80%;
		float:left;
		top:114px;
		left:220px;
	}
	.right_div2{
		width:800px; border-bottom:3px solid #f0f0f0;
		text-align: left; padding: 10px;
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
	.reser_div{
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
	#reser_table{
		width: 800px;
		height: 380px;
		margin-top: 10px;
		padding-left:18px;
	}
	#reser_table tr th {
		width: 20%;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
		border-bottom: 2px solid #a6a6a6;
	}
	#reser_table tr td {
		width: 80%;
		font-size: 11px;
		font-family : 'NanumGothic';
		vertical-align: middle;
		padding-left:3px;
		border-bottom: 1px solid #a6a6a6;
	}
</style>
<script>
	function mySubmit(idx){
		if(idx==1){
			document.detail.action="<%=cp%>/mypage/H_reserDelete.do";
		}
		
		if(idx==2){
			if(confirm("예약취소 목록에서 해당 목록을 삭제 하시겠습니다.? 삭제하게되면 목록에서 사라집니다.")) {
				document.detail.action="<%=cp%>/mypage/H_reserD_DeleteOk.do";
			}
		}
	document.detail.submit();
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
				<a href="<%=cp%>/mypage/H_reserDelete.do" class="side-text" style="border-bottom:2px solid #cb4242;">예약취소목록</a>
		</div>	
	</div>

	<div class="right_div">
		<div class="right_div2"><strong>숙소</strong>취소예약 내역</div>
		
		<form name="detail" method="post">
		<input type="hidden" name="HOUSE_IDX" value="${map.HOUSE_IDX}">
		<input type="hidden" name="HR_IDX" value="${map.HR_IDX}">
		<table id="reser_table">
			<tr>
				<th>숙소이름</th>
				<td>
					${map.HOUSE_NAME}
				</td>
			</tr>
			
			<tr>
				<th>위치</th>
				<td>
					${map.HOUSE_ADDR1} &nbsp;&nbsp; ${map.HOUSE_ADDR2} &nbsp;&nbsp; ${map.HOUSE_ADDR3}
				</td>
			</tr>
			
			<tr>
				<th>에약일시</th>
				<td>
					${map.HR_TIME}
				</td>
			</tr>
			
			<tr>
				<th>에약취소 일시</th>
				<td>
					${map.HR_DELETE_DATE}
				</td>
			</tr>
			
			<tr>
				<th>이용일</th>
				<td>
					${map.HR_FIRST_DATE} ~ ${map.HR_LAST_DATE}
				</td>
			</tr>
			
			<tr>
				<th>취소마감일</th>
				<td>
					<%-- ${map.HR_FIRST_DATE-1} --%>
				</td>
			</tr>
			
			<tr>
				<th>예약인원</th>
				<td>
					${map.HR_PERSONS}
				</td>
			</tr>
			
			<tr>
				<th>숙소가격</th>
				<td>
					${map.HOUSER_PRICE}
				</td>
			</tr>
			
			<tr>
				<th>환불가격</th>
				<td>
					${map.HOUSE_PRICE*countDate.count_date}
				</td>
			</tr>
			
			<tr>
				<th>예약취소 신청상태 </th>
				<td>
					<c:choose>
						<c:when test="${map.HR_DELETE_STATE eq '1'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">요청중</font>
						</c:when>
						
						<c:otherwise>
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">신청완료</font>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>환불여부</th>
				<td>
					<c:choose>
						<c:when test="${map.HR_DELETE_STATE eq '3'}">
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">완료</font>
						</c:when>
						<c:otherwise>
							<font style="color:#3c3c3c; letter-spacing:2px; font-size:12px; font-style:'바탕체'">미지급</font>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<th>주의사항</th>
				<td>
					-호스트가 예약취소 요청을 확인하게되면 예약취소가 완료됩니다. <br>
					-예약취소가 완료된 이후에도 환불이 안된경우 호스트에게 문의해 주세요~!
				</td>
			</tr>
			
		</table>
		
		<div style="width:810px; border-bottom:3px solid #f0f0f0; margin-top:5px; text-align:center; padding:5px;">
				<input type="button" value="확인" onclick="mySubmit(1)" style="height:35px; align:center;"/>
				<input type="button" value="삭제" onclick="mySubmit(2)" style="height:35px; vartical-align:middle;"/> 
		</div>
		</form>
	</div>

</div>