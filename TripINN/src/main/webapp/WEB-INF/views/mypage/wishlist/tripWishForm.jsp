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
		width:900px;
		
		overflow:hidden;
		height:auto;
		float:left;
		top:114px;
		left:220px;
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
			<a href="<%=cp%>/mypage/houseWishList.do" class="side-text">숙소 위시리스트</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/tripWishList.do" class="side-text">트립위시리스트</a>
		</div>
	</div>

	<div class="right_div">
		
			<div class="trip_div">
				
			</div>
	
	</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>