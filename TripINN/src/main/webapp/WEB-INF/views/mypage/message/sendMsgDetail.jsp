<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
<style>
	.side_menu{
		border:1px solid black;
		margin-bottom:20px;
		margin-left:100px;
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
    	text-decoration:none;
	}
	.side_button{
		color: #fff;
		background-color:#31b0d5;
		border-color:#269abc;
		border-radius:2px;
		width:150px;
		display: inline-block;
    	margin-bottom: 0;
    	font-size: 14px;
    	font-weight: 400;
    	
    	background-image: none;
    	border: 1px solid transparent;
    	border-radius: 4px;
	}
	.button_div{
		border:1px solid black;
		margin-top:50px;
		margin-left:20px;
		width:150px;
		height:30px;
	}
	.right_div1{
		border:1px solid black;
		margin-left:60px;
		width:850px;
		height:450px;
		float:left;
		top:114px; 	
		left:220px;
		padding-left:70p;
		
	}
	.selectBox_div{
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
	.list_div{
		/* border:1px solid black; */
		margin:0px;
		
		height:25px;
	}
	.msg_check{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:50px;
		height:25px;
		font-size:5px;
		float:left;
	}
 	ul{
		list-style:none;
		/* margin:0px;
		padding:0px; */
	}
	li{
		/* /* margin:0; */
		padding:0 0 0 0;
		border:0; */
		float:left;
	}
	
	.msg_menu{
		border:1px solid black;
		margin-left:15px;
		height:25px;
		font-size:5px;
		float:left;
	}
	.msg_title{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:154px;
		height:25px;
		font-size:5px;
		float:left;
	}
	.msg_content{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:500px;
		height:25px;
		font-size:5px;
		float:left;
	}
	
	#joinTable {
		width: 800px;
		height: 380px;
		margin-top: 10px;
		padding: 0px;
	}
	#joinTable tr th {
		background-color: #f7f7f7;
		width: 20%;
	/* 	background-color: #f7f7f7; */
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
		background-size:1700%;
		background-repeat: no-repeat;
		border-bottom: 1px solid #a6a6a6;
	}
	#joinTable tr td {
		width: 80%;
		font-size: 11px;
		font-family : 'NanumGothic';
		vertical-align: middle;
		padding-left:3px;
		border-bottom: 1px solid #a6a6a6;
	}
	#joinTable button {
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable input {
		height: 10px;
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable img {
		height: 20px;
		cursor: pointer;
	}
	#joinTable font {
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	
	#joinDiv {
		width: 820px;
		border: 1px solid #a6a6a6;
		margin:10px;
		margin-bottom: 15px;
	}
	#joinDiv div {
		width:780px; border-bottom:3px solid #f0f0f0;
		text-align: left; 
		padding: 10px;
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
	
</style>

<jsp:include page="../mypage_layout.jsp" flush="falsh"/>

<div style="width:1300px; height:100%; margin:0px auto;">
	<div class="side_menu">
		<div class="side_list">
			<a href="<%=cp%>/mypage/sendMessage.do" class="side-text">보낸메시지</a>
		</div>
	
		<div class="side_list">
			<a href="<%=cp%>/mypage/receiveMessage.do" class="side-text">받은메시지</a>
		</div>
		
		<div class="button_div">
			<input type="button" class="side_button" value="메시지쓰기" onclick="location.href='<%=cp%>/mypage/messageWrite.do'">
		</div>
	</div>

	<div class="right_div1">
		<div id="joinDiv">
		<div><strong>메시지 보기</strong></div>
			<table id="joinTable">
				<tr>	
					<th>제목</th>
					<td style="height:25px;">
						${map.MSG_TITLE} 
					</td>
				</tr>
				<tr >
					<th>받는사람</th>
					<td style="height:25px;">
						${map.RECEIVE_MEMBER_EMAIL}
					</td>
				</tr>
				<tr>
					<th>보낸날짜</th>
					<td style="height:25px;">
						${map.SEND_DATE}
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						${map.MSG_CONTENT}
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="height:60px;border:1px solid white; padding-top:5px;">
						<input type="button" value="답장보내기" onclick="joinConf();" style="height:40px;"/>
						<input type="button" value="삭제하기" onclick="joinConf();" style="height:40px;"/>
					</td>
				</tr>
			</table>
		</div><!-- joinDiv End -->
	</div><!-- right_div End -->
</div>
<div style="clear:both;"></div>

