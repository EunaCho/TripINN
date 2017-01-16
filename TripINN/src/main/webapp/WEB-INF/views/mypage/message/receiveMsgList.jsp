<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
<style>
* { font-family: 'Nanum Gothic',malgun Gothic,dotum;  }
	.side_menu{
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
		margin-left:40px;
		width:970px;
		height:100%x;
		float:left;
		top:114px; 	
		left:220px;
	}
	.right_div2{
		/* border:1px solid black; */
		margin:3px;
		height:100%;
	}

	.msg_check{
		border-bottom:1px solid #dedede;
		border-left:1px solid #dedede;
		margin:0px;
		width:40px;
		height:25px;
		font-size:12px;
		float:left;
		padding:5px;
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
		margin:0px;
		height:25px;
		font-size:12px;
		float:left;
	}
	.msg_menu div {text-align:center;}
	.msg_title{
		border-bottom:1px solid #dedede;
		border-left:1px solid #dedede;
		border-right:1px solid #dedede;
		margin:0px;
		width:154px;
		height:25px;
		font-size:12px;
		padding-left:3px;
		float:left;
		text-align:center;
		padding:5px;
	}
	.msg_content{
		border-bottom:1px solid #dedede;
		border-left:1px solid #dedede
		margin:0px;
		width:380px;
		height:25px;
		font-size:12px;
		padding-left:3px;
		float:left;
		text-overflow:ellipsis; 
		overflow:hidden;
		white-space:nowrap;
		text-align:center;
		padding:5px;
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

	<div class="right_div1" style="border:0px;">
			<h3 style="margin:10px;">받은 메세지</h3>
			<hr style="margin:0px;padding:0px;border:1px solid #dedede;"/>
			<div class="right_div2">
			
					<div class="msg_menu" style="padding:5px;">
						
						<div class="msg_check" style="background-color: #f7f7f7; background-size:700%;">
							상태
						</div>

						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 보낸사람
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 제목
						</div>
						<div class="msg_content" style="background-color: #f7f7f7; background-size:700%;">
							내용
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%; border-right:1px solid #dedede;">
							 보낸 날짜
						</div>
					</div>
			<c:forEach var="list" items="${list}" varStatus="stat">
			<c:url var="viewURL" value="/mypage/c">
				<c:param name="msg_idx" value="${list.MSG_IDX}"/>
			</c:url>
			
				
					<div class="msg_menu">
						<div class="msg_check">
							상태
						</div>
						<div class="msg_title">
						 	<a href="${viewURL}" style="text-decoration:none;">${list.MEMBER_EMAIL}</a>
						</div>
						<div class="msg_title">
						 	<a href="${viewURL}" style="text-decoration:none;">${list.MSG_TITLE}</a>
						</div>
						<div class="msg_content">
							<a href="${viewURL}" style="text-decoration:none;">${list.MSG_CONTENT}</a>
						</div>
						<div class="msg_title" style="border-right:1px solid black;">
							<%-- <p><fmt:formatDate value="${list.send_date}"pattern="yyyy.MM.dd"></fmt:formatDate></p> --%>
						</div>
					</div>
				
			</c:forEach>
			</div><!-- right_div2 End-->
			
			<%-- <c:if test="${totalCount<1 }">
				보낸 메시지가 없습니다.
			</c:if> --%>
			
			
		</div><!-- right_div1 -->
</div><!-- 전체-->
<div style="clear:both;"></div>