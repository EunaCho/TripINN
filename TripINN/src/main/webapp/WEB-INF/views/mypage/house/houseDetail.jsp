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
		border:1px solid #31b0d5;
		margin:5px;
		width:900px;
		height:100%;
		
		float:left;
		top:114px;
		left:220px;
	}
	.house_div{
		border:1px solid black;
		margin:2px;
		width:98%;
		height:25px;
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
		border-radius:4px;
		background-color:#31b0d5;
=======
>>>>>>> 7cc560a 마이페이지 
		font-size:16px;
		color:#FFF;
		font-weight: 400;
		text-align:center;
		padding-top:5px;
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
=======
		font-style:'바탕체'
		letter-spacing:2px;
		
		border-bottom:2px solid #828282;
		margin:2px;
		width:98%;
		height:25px;
		color:#aaaaaa;
		text-align:center;
		padding-top:5px;
>>>>>>> 7cc560a 마이페이지 
	}
	.poto_div1{
		margin:2px;
		width:225px;
		height:188px;
	}
	.poto_div{
	 	/* border:1px solid black;  */
		margin:2px;
		width:230px;
		height:193px;
	}
	.name_div{
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
		border:1px solid #3c3c3c;
		margin-top:10px;
		width:326px;
		height:40px;
=======
		/* border-t:1px solid #3c3c3c; */
		border-bottom:1px solid #3c3c3c;
		margin:2px;
		width:615px;
		height:55px;
>>>>>>> 7cc560a 마이페이지 
		padding-left:5px;
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
		text:center;
	
=======
>>>>>>> 7cc560a 마이페이지 
	}
	.price_div{
		border-top:1px solid black; 
	/* 	border-bottom:1px solid #3c3c3c; */
		margin-top:2.5px;
		width:230px;
		height:20px;
		padding-left:3px;
		padding-bottom:3px;
	}
	
	.h_list_div{
		/* border:1px solid black;   */
		width: 885px; 
		height:396px;
		margin:2px;
	}
	.house_menu_div{
		border:1px solid #31b0d5;  
		width: 880px; 
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
		height:230px;
		margin:2px;
=======
		height:225px;
		margin-top:13px;
		margin-left:4px;
>>>>>>> 7cc560a 마이페이지 
	}
	.menu_div{
		margin:2px;
		width: 236px; 
		float:left
	}
	.menu_div2{
		width:632px;
		float:left;
	}
	.position_div{
		border-top:1px solid #3c3c3c;
		border-bottom:1px solid #3c3c3c;
		margin:2px;
		width:620px;
		height:45px;
	}
	.h_inp_div{
		border-top:1px solid #3c3c3c;
		
		margin:2px;
		width:620px;
		height:113px;
	}
	.msg_menu{
		border: 1px solid red;
		margin:0px;
		height:25px;
		font-size:5px;
		float:left;
	}
	.msg_title{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:152px;
		height:25px;
		font-size:10px;
		padding-left:3px;
		float:left;
		text-overflow:ellipsis; 
		overflow:hidden;
		white-space:nowrap;
	}
	.msg_content{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:402px;
		height:25px;
		font-size:10px;
		padding-left:3px;
		float:left;
		text-overflow:ellipsis; 
		overflow:hidden;
		white-space:nowrap;
	}
	
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
=======
	}
	.reser_number{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:63px;
		height:25px;
		font-size:10px;
		padding-left:3px;
		float:left;
		white-space:nowrap;
		text-align:center;
		font-style:'바탕체'
	}
	.reser_div{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:166px;
		height:25px;
		font-size:10px;
		padding-left:3px;
		float:left;
		white-space:nowrap;
		text-align:center;
		font-style:'바탕체'
	}
	.reser_date{
		border-bottom:1px solid black;
		border-left:1px solid black;
		margin:0px;
		width:228px;
		height:25px;
		font-size:10px;
		padding-left:3px;
		float:left;
		white-space:nowrap;
		text-align:center;
		font-style:'바탕체'
	}
	.right-con { width:98%; height:100%; border: 2px solid green; margin:5px ; display: block; }
	.list-right { width:99%; height:100%; border: 5px solid #a6a6a6; float:left; }
	.top_div { width:50%; text-align:center; height:30px; float:left; padding-top:5px;font-family:'나눔 고딕 볼드',Nanum Gothic-Bold,'맑은 고딕',Malgun Gothic,sans-serif;font-weight:bold; }
	.top_div:hover {border-bottom:5px solid #1E6198;cursor:pointer;}
	.on {border-bottom:5px solid #1E6198;cursor:pointer; background-color: #f8f8f8;}
>>>>>>> 7cc560a 마이페이지 
	
</style>
<script>
   function searchKind(wish_kind) {
	   var form = document.form_kind;
	   if(wish_kind == 1){
	   		form.action="/TripINN/mypage/houseDetail.do";
   		}
	   
	   if(wish_kind == 2){
	   		form.action="/TripINN/mypage/houseDetail_2.do";
  		}
	   form.submit();
   }
   
function joinConf(){
	
	var form=document.houseForm;
	
	form.action="/TripINN/house/houseModify.do";
	
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
	</div>

	<div class="right_div">
		
			<div class="house_div">
				${houseMap.HOUSE_NAME}&nbsp;&nbsp;
			</div>
					<div class="house_menu_div">
					<div class="menu_div">
						<div class="poto_div">
						<img class="poto_div1" src="<%= cp %>/images/house/${houseMap.HOUSE_IMAGE}">
						</div>
						<div class="price_div">
							<font style="color:#3c3c3c; font-weight:solid; font-size:15px; font-style:'바탕체'">
								가격: ${houseMap.HOUSE_TOTAL_PRICE}&nbsp;&nbsp;<strong>\</strong>
							</font>
						</div>
					</div>
					
					<div class="menu_div2">
					<form name="houseForm" method="post">
						<div class="name_div" onclick="houseDetail('${houseMap.HOUSE_IDX}')">
							<div style="width:200px; height:auto; float:left;">
								<font style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
								<br>
								${status.index+1}.
								</font>
								<a href="javascript:houseDetail(${houseMap.HOUSE_IDX});"  style="color:#3c3c3c; font-weight:bold; letter-spacing:2px; font-size:18px; font-style:'바탕체'">
									${houseMap.HOUSE_NAME}
								</a>
							</div>
							<div style= " width:100px; height:auto; float:left; margin-left:307px;margin-top:14px;">
								<input type="button" value="호스팅 수정하기" onclick="joinConf()" style="height:35px; border-radius:5px; border:2px solid blue; background-color:#fff; "/>
							</div>
						</div>
						
						<div class="position_div">
							<font style="color:#3c3c3c; font-weight:bolder; letter-spacing:2px; font-size:13px; font-style:'바탕체'">${houseMap.HOUSE_ADDR1} ${houseMap.HOUSE_ADDR2} ${houseMap.HOUSE_ADDR3}</font>
							<br>
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
							${houseMap.HI_TOTAL_STAR} (별점)| 후기개수 
=======
							<div style="CLEAR: both;   PADDING-RIGHT: 0px;   PADDING-LEFT: 0px;   BACKGROUND: url(/TripINN/images/icon_star2.gif) 0px 0px;   FLOAT: left;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   WIDTH: 90px;   PADDING-TOP: 0px;   HEIGHT: 18px;">
							   <p style="WIDTH: ${houseMap.HI_TOTAL_STAR * 20}%; PADDING-RIGHT:0px;   PADDING-LEFT:0px;   BACKGROUND: url(/TripINN/images/icon_star.gif) 0px 0px;   PADDING-BOTTOM: 0px;   MARGIN: 0px;   PADDING-TOP: 0px;   HEIGHT: 18px;"></p>
						   </div>
						   <font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
						  	 	(${houseMap.HI_TOTAL_STAR}점)
						   		|&nbsp;후기개수:&nbsp;${list.HCNT}개
						   	</font> 
>>>>>>> 7cc560a 마이페이지 
						</div>
						<div class="h_inp_div">
							<div style="border:1px solid red; margin:17px 20px 15px 155px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/house.jpg" style="width:35px; height:35px; float:center;">
								<br/>
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
								 	kind
								 </font>
								 <br/>	
								<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
									${houseMap.HOUSE_KIND}
								</font>
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
							 	<img src="<%= cp %>/images/mypage/people.png" style="width:35px; height:35px; float:center;">
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
								 		persons
								 </font>
								<div style="width:70px; height:20px;">
									<font style="color:#484848; font-weight:solid; font-size:13px; font-style:'바탕체'">
									${houseMap.HOUSE_TOTAL_PERSONS}명 
									</font>
								</div>
							</div>
							<div style="border:1px solid red; margin:17px 20px 15px 35px; width:70px; height:70px; float:left; text-align:center;">
								<img src="<%= cp %>/images/mypage/bed.jpg" style="width:35px; height:35px; float:center;">	
								<br/>
								<font style="color:#3c3c3c; font-weight:solid; font-size:13px; font-style:'바탕체'">
									bed 		
								</font>
								<br/>
								${houseMap.HI_BAD}개
							</div>
						</div>
					</form>
					</div>		
				</div> <!-- house_menu_div End -->
				
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
				<div style="border:1px solid #31b0d5; width: 880px; height:230px; margin:5px;">
					<div style="width:500px; height:70px; margin:10px; border:1px solid red">
					예약 
					</div>
=======
		
				<div class="right-con">
					<form name="form_kind" method="post">
						<div class="right-top" style="border:1px solid red;">
							<div class='top_div <c:if test="${Type eq 'reser'}">on</c:if>' onclick="searchKind(1)">예약현황</div>
							<div class=top_div <c:if test="${Type == 'msg'}">on</c:if> onclick="searchKind(2)">메시지 현황</div>
						</div>
					</form>
					
					<hr/>
					
>>>>>>> 7cc560a 마이페이지 
				</div>
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
				<div style="border:1px solid blue; width:880px; height:230px; margin:5px;">
=======
	
				
				
				<%-- <div style="border:1px solid blue; width:880px; height:230px; margin:5px;">
					<div class="house_div2">
						${houseMap.HOUSE_NAME} 숙소메시지
					</div>
>>>>>>> 7cc560a 마이페이지 
					<div class="msg_menu">
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 보낸사람
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%;">
							 제목
						</div>
						<div class="msg_content" style="background-color: #f7f7f7; background-size:700%;">
							내용
						</div>
						<div class="msg_title" style="background-color: #f7f7f7; background-size:700%; border-right:1px solid black;">
							 보낸 날짜
						</div>
					</div>
<<<<<<< Upstream, based on branch 'master' of https://github.com/EunaCho/TripINN.git
				</div>
=======
				<c:choose>
				<c:when test="${fn:length(msgList)>0}">
					<c:forEach var="msgList" items="${msgList}" varStatus="status">
					<div class="msg_menu">
						<div class="msg_title">
							 ${msgList.MEMBER_EMAIL}
						</div>
						<div class="msg_title" >
							 ${msgList.MSG_TITLE}
						</div>
						<div class="msg_content" >
							${msgList.MSG_CONTENT}
						</div>
						<div class="msg_title" >
							${msgList.SEND_DATE}
						</div>
					</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="msg_menu">
						해당 숙소에 받은메시지가 없습니다. 
					</div>
				</c:otherwise>
				</c:choose>
					
				</div> --%>
>>>>>>> 7cc560a 마이페이지 
	
	</div><!-- right_div End -->
	
	
</div>
<div style="clear:both;"></div>