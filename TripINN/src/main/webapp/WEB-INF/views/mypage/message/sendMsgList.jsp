<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
<style>
	.side_menu{
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
		margin:5px;
		width:1060px;
		height:450px;
		float:left;
		top:114px; 	
		left:220px;
	}
	.right_div2{
		border:1px solid black;
		margin:5px;
		width:1048px;
		height:435px;
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
	.right_div3{
		border:1px solid black;
		margin:3px;
		height:370px;
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
		<div class="right_div2">
			<div class="selectBox_div">
				<div style="inline-block;">
						<select id="selectbox">
							<option selected="selected">메시지</option>
							<option>숙소</option>
							<option>트립</option>
						</select>
				</div>
			</div>
			
			<div class="right_div3">
			<c:forEach var="list" items="${list}" varStatus="stat">
			<c:url var="viewURL" value="/mypage/messageDetail.do">
				<c:param name="msg_idx" value="${list.MSG_IDX}"/>
			</c:url>
			
				<div class="list_div">
					<div class="msg_check">
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
	
					<div class="msg_menu">
						<div class="msg_title">
						 	<a href="${viewURL}" style="text-decoration:none;">${list.RECEIVE_MEMBER_EMAIL}</a>
						</div>
						<div class="msg_title">
						 	<a href="${viewURL}" style="text-decoration:none;">${list.MSG_TITLE}</a>
						</div>
						<div class="msg_content">
							<a href="${viewURL}" style="text-decoration:none;">${list.MSG_CONTENT}</a>
						</div>
						<div class="msg_title">
							<%-- <p><fmt:formatDate value="${list.send_date}"pattern="yyyy.MM.dd"></fmt:formatDate></p> --%>
						</div>
					</div>
				</div>
			</c:forEach>
			</div><!-- right_div3 End-->
			
			<%-- <c:if test="${totalCount<1 }">
				보낸 메시지가 없습니다.
			</c:if> --%>
			
		</div>
	</div>
</div>
<div style="clear:both;"></div>

