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
	.right_div2{
		border:1px solid black;
		margin:5px;
		width:890px;
		height:435px;
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
	.poto_div{
		border:1px solid black;
		margin:2px;
		width:230px;
		height:200px;
	}
	.name_div{
		border:1px solid black;
		margin:2px;
		width:620px;
		height:70px;
	}
	.price_div{
		border:1px solid black;
		margin:2px;
		width:230px;
		height:40px;
	}
	
	.h_list_div{
		border:1px solid black;  
		width: 885px; 
		height:396px;
		margin:2px;
	}
	.house_menu_div{
		border:1px solid black;  
		width: 880px; 
		height:260px;
		margin:2px;
	}
	.menu_div{
		border:1px solid black; 
		margin:2px;
		width: 236px; 
		float:left
	}
	.menu_div2{
		border:1px solid black;
		width:632px;
		float:left;
	}
	.position_div{
		border:1px solid black;
		margin:2px;
		width:620px;
		height:45px;
	}
	.h_inp_div{
		border:1px solid black;
		margin:2px;
		width:620px;
		height:123px;
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
		<div class="right_div2">
			<div class="house_div">
				내가 등록한 숙소  
			</div>
			
			<div class="h_list_div">
				<div class="house_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						사진
						</div>
						<div class="price_div">
						 가격
						</div>
					</div>
					
					<div class="menu_div2">
						<div class="name_div">
							이름
						</div>
						<div class="position_div">
							위치, 별점, 후시개수 
						</div>
						<div class="h_inp_div">
							개인실, 인원, 침대 
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<div style="clear:both;"></div>