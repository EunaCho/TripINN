<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<% String cp = request.getContextPath(); %>
<style>
* { font-family: 'Nanum Gothic',malgun Gothic,dotum;  }
	.side_menu{
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
	.side_button{
		color: #fff;
		background-color:#b0bdbe;
		border-color:#269abc;
		border-radius:2px;
		width:150px;
		height:30px;
		display: inline-block;
    	margin-bottom: 0;
    	font-size: 14px;
    	font-weight: 400;
    	
    	background-image: none;
    	border: 1px solid transparent;
    	border-radius: 4px;
	}
	.button_div{
		border:0px solid black;
		margin-top:50px;
		margin-left:20px;
		width:150px;
		height:30px;
	}
	.right_div1{
		border:0px solid black;
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
			<a href="<%=cp%>/mypage/receiveMessage.do" class="side-text" style="border-bottom:2px solid #cb4242;">받은메시지</a>
		</div>
		
		<div class="button_div">
			<input type="button" class="side_button" value="메시지쓰기" onclick="location.href='<%=cp%>/mypage/messageWrite.do'">
		</div>
	</div>

	<div class="right_div1" style="border:0px;">
			<h3 style="margin:10px;">받은 메세지</h3>
			<hr style="margin:0px;padding:0px;border:1px solid #dedede;"/>
			<div class="right_div2">
			
					<div class="msg_menu" style="padding: 5px;">
						
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
			<c:url var="viewURL" value="/mypage/receiveMsgDetail.do">
				<c:param name="msg_idx" value="${list.MSG_IDX}"/>
				<c:param name="msgType" value="r"/>
			</c:url>
			
				
					<div class="msg_menu" style="padding: 5px;">
						<div class="msg_check">
					<c:if test="${list.MSG_STATE eq '1'}">
						<img src="<%=cp%>/images/mypage/Mail-Open-icon.png" alt="" style="width:20px; height:20px; padding:5px;"/>
					</c:if>
					<c:if test="${list.MSG_STATE eq '0'}">
						<img src="<%=cp%>/images/mypage/mail-icon1.png" alt="" style="width:20px; height:20px; padding:5px;"/>
					</c:if>
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
							 <a><fmt:formatDate value="${list.SEND_DATE}" pattern="yyyy-MM-dd"></fmt:formatDate></a> 
						</div>
					</div>
				
			</c:forEach>
			
			<c:if test="${not empty paginationInfo}">
			<div style="clear:both;"></div>
			<div class="trDiv" style="width:100%;margin-top:20px;">
				<div class="tdDiv-col" id="pagingDiv" style="text-align:center;height:30px;margin-top:10px;">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
        		</div>
        	</div>
    		</c:if>
    		
    		
			</div><!-- right_div2 End-->
			<!-- ///////////////페이징처리/////////////// -->
			<form name="listForm" >
			 <input type="hidden" name="currentPageNo" value="" />
			</form>	
			<style>
			#pagingDiv {height:40px;}
			#pagingDiv a { font-size:12px;width:20px; height:20px; border:1px solid #a6a6a6; margin-right:5px; border-radius:7px;padding:7px;}
			#pagingDiv a:hover {background-color:rgb(255, 235, 240);}
			#pagingDiv strong { font-size:12px;border:1px solid #a6a6a6;border-radius:7px;padding:7px;color:#cb4646;margin-right:5px;}
			</style>			
			<script>
			function fn_search(pageNo){
			    var listForm = document.listForm;
			    listForm.action = "/TripINN/mypage/receiveMessage.do";
			    listForm.currentPageNo.value = pageNo;
			    listForm.submit();
			}
			</script>
     		<!-- ///////////////페이징처리/////////////// -->
			
			
		</div><!-- right_div1 -->
</div><!-- 전체-->
<div style="clear:both;"></div>
