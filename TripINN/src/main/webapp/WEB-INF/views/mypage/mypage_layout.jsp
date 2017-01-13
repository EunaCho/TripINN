<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<style>
	.m_ul{	
		width:100%; 
		height:30px;
		list-style:none;
	}
	.m_ul li{
		float:left;
		margin-right:50px;
		text-color: #fff;
	}
	.m_ul li a{
		font-size:12px;
		color:#fff;
		font-weight:bold;
		text-decoration:none;
	}
</style>
<div style="width:100%; background-color:gray;"  >
	<div style="width:1200px;margin:0px auto;">
	<ul class="m_ul">
		<li><a href="<%=cp %>/mypage/notice.do">알림판</a></li>
		<li><a href="<%=cp %>/mypage/sendMessage.do">메시지</a></li>
		<li><a href="<%=cp %>/mypage/house.do">숙소목록</a></li>
		<li><a href="<%=cp %>/mypage/trip.do">트립목록</a></li>
		<li><a href="<%=cp %>/mypage/houseWishList.do">위시리스트</a></li>
	</ul>
	</div>
</div>