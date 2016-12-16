<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
<style>
	.left-menu{
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
	.msg_list{
		border:1px solid black;
		margin:5px;
		width:900px;
		height:450px;
		float:left;
		top:114px;
		left:220px;
	}
	.pro_menu2{
		border:1px solid black;
		margin:5px;
		width:890px;
		height:435px;
	}
	.select_box{
		border:1px solid black;
		margin:3px;
		width:190px;
		height:50px;
	}
	
	.selectBox {
		width: 500px;
		height:500px;
		border:1px solid #46AAFF;
		border-radius:6px;
		background:#fff;
	}
	.message_list{
	
		border:1px solid black;
		margin:3px;
		width:880px;
		height:370px;
	}

</style>
<!-- jQuery(document).ready(function(){

	var select = $('.select-box select');
	select.change(function(){
		var select_name = $(this).children('option:selected').text();
		$(this).siblings("label").text(select_name);
	});

});
 -->
<jsp:include page="../mypage_layout.jsp" flush="falsh"/>

<div style="width:1200px; height:100%; margin:0px auto;">
	<div class="left-menu">
		<div class="side_list">
			<a href="<%=cp%>/mypage/sendMessage.do" class="side-text">보낸메시지</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/receiveMessage.do" class="side-text">받은메시지</a>
		</div>
	</div>

	<div class="msg_list">
		<div class="pro_menu2">
			<div class="select_box">
				<div style="inline-block;">
						<select id="selectbox">
							<option selected="selected">메시지</option>
							<option>숙소</option>
							<option>트립</option>
						</select>
				</div>
			</div>
			
			<div class="message_list">
				받은 메시지 리스트
			</div>
		</div>
	</div>
</div>
<div style="clear:both;"></div>

