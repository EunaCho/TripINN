<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String cp = request.getContextPath(); %>
<!-- jQuery -->
<link rel="stylesheet" href="/TripINN/css/login/layout.css" />
<style>

</style>

<script>
/*function memberJoinOk() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		location.href="memberLogout.action";
	}
	return;
} */
</script>


<script>
jQuery(function($){
	 var layerWindow = $('.mw_layer');
	 var layer = $('#layer');
	 
	 // Show Hide
	 $('.layer_trigger').click(function(){
	  layerWindow.addClass('open');
	 });
	 $('#layer .close').click(function(){
	  layerWindow.removeClass('open');
	 });


	 // ESC Event
	 $(document).keydown(function(event){
	  if(event.keyCode != 27) return true;
	  if (layerWindow.hasClass('open')) {
	   layerWindow.removeClass('open');
	  }
	  return false;
	 });
	 // Hide Window
	 layerWindow.find('>.bg').mousedown(function(event){
	  layerWindow.removeClass('open');
	  return false;
	 });
	});
	
function loginCheck() {
	if($("#member_email_log").val() == "") {
		alert("아이디를 입력해주세요.");
		return;
	} else if($("#member_pwd_log").val() == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	document.loginForm.submit();
}


function joinCheck() {
	if($("#member_email").val() == "") {
		alert("이메일주소를 입력해주세요.");
		return;
	} else if($("#member_pwd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	alert("회원가입이 완료되었습니다.");
	document.joinForm.submit();
}
</script>

<div class="header_menu">
	<div class="inner">	
	
		

		<!-- 로그인상태 -->
		<c:if test="${sessionScope.member_email != null}">
			<span><a href="<%=cp %>/">로그아웃</a></span>
			<span><a href="<%=cp %>/hosting.do">호스팅하기</a></span>	
			<span><a href="<%=cp %>/qnaList.do">도움말</a></span>
			<span><a href="<%=cp %>/mypage/main.do">마이페이지</a></span>
			<span><a href="<%=cp %>/qnaWrite.do">1:1문의</a></span>
		</c:if>
		

		<!-- 로그인하지 않은 상태 -->
		<c:if test="${sessionScope.member_email == null}">
			<span><a href="#login_layer" class="layer_trigger_login">로그인</a></span>
			<span><a href="#layer" class="layer_trigger">로그인</a></span>
			<span><a href="<%=cp %>/memberJoin.do">회원가입</a></span>
			<span><a href="<%=cp %>/hosting.do">호스팅하기</a></span>
		</c:if>
		
		<!-- 관리자 로그인 -->
		<c:if test="${sessionScope.member_level == 1}">
			<span><a href="<%=cp %>/admin/main.do">관리자 홈</a></span>
		</c:if>
	
	</div>

</div>


<!-- 로그인 -->
<form method="post" action="member/memberLogin.do" name="loginForm">
	<div class="login_layerWindow">

	 <div class="bg"></div>
	 <div id="layer">
	 	<h2 style="border-bottom:1px solid black;">LOGIN</h2>
		 <div class="login_line">
		 	<div class="box_in">

		 		<input type="text" name="member_email" id="member_email_log"  size="23" placeholder="이메일 주소">
				<input type="password" name="member_pwd" id="member_pwd_log" size="23" placeholder="비밀번호">

			</div>
			<span class="btn_login" onclick="loginCheck();">LOGIN</span>
		 </div>

	    <div class="close">
		    <table width="100%" id="loginTbl">
		    	<tr>
		    		<td width="30%" align="left" onclick="memberJoin.action">회원가입</td>
		    		<td width="50%;" align="left">비밀번호 재설정</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="레이어 닫기" class="close">닫기</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>

<
<!-- 회원가입 폼-->
<form method="post" action="member/memberJoin.do" name="joinForm">
	<div class="join_layerWindow">
	 <div class="bg"></div>
	 <div id="join_layer">
	 	<h2 style="border-bottom:1px solid black;">회원가입하기</h2>
		 <div class="join_line">
		 	<div class="box_in_j">
		 		<input type="hidden" name="member_idx"/>
		 		<input type="hidden" name="MEMBER_JOINDATE"/>
		 		<input type="hidden" name="MEMBER_LEVEL"/>
		 		<input type="text" name="member_email" id="member_email"  size="23" placeholder="이메일 주소">
		 		<input type="text" name="member_name" id="member_name"  size="23" placeholder="이름">
				<input type="password" name="member_pwd" id="member_pwd" size="23" placeholder="비밀번호">
				<input type="text" name="member_phone" id="member_phone" size="23" placeholder="전화번호">
			</div>
			<span class="btn_join" onclick="joinCheck();">회원가입</span>
		 </div>
	  
	    <div class="close" >
		    <table width="100%" id="loginTbl" >
		    	<tr>
		    		<td width="30%" align="left" onclick="#login_layer" class="layer_trigger_login">로그인</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="레이어 닫기" class="close">닫기</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>

