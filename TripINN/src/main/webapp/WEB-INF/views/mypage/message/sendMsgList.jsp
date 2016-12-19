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
	.msg_menu{
		border:1px solid black;
		margin:0px;
		width:879px;
		height:25px;
	}
	.msg_menu1{
		border:1px solid black;
		margin:0px;
		width:90px;
		height:25px;
		font-size:5px;
		float:left;
	}
 	ul{
		list-style:none;
		margin:0px;
		padding:0px;
	}
	li{
		margin:0;
		padding:0 0 0 0;
		border:0;
		float:left;
	
	}
	
	.msg_menu2{
		border:1px solid black;
		margin-left:15px;
		width:769px;
		height:25px;
		font-size:5px;
		float:left;
	}
	.msg_title{
		border:1px solid black;
		margin:0px;
		width:120px;
		height:25px;
		font-size:5px;
		float:left;
	}
	.msg_content{
		border:1px solid black;
		margin:0px;
		width:403px;
		height:25px;
		font-size:5px;
		float:left;
	}

</style>
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
				<div class="msg_menu">
					<div class="msg_menu1">
						<ul list-style="none;">
							<li>
								<input type="checkbox" name="" onclick="">
								<label for="mailcheck_">check</label>
							</li>
							<li>
								<span></span>
							</li>
						</ul>
					</div>
	
					<div class="msg_menu2">
						<div class="msg_title">
						 받는사람 
						</div>
						<div class="msg_title">
						 제목
						</div>
						<div class="msg_content">
						내용 
						</div>
						<div class="msg_title">
						 보낸 날짜
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="clear:both;"></div>

