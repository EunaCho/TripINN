<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<% String cp = request.getContextPath(); %>
<!-- jQuery -->
<link rel="stylesheet" href="/TripINN/css/login/layout.css" />
<style>

</style>

<script>
/* function logout() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		location.href="memberLogout.action";
	}
	return;
} */
</script>


<script>
jQuery(function($){
	 var login_layerWindow = $('.login_layerWindow');
	 var login_layer = $('#login_layer');
	 var join_layerWindow = $('.join_layerWindow');
	 var join_layer = $('#join_layer');
	 
	 
	 // Show Hide - join
	 $('.layer_trigger_join').click(function(){
		 join_layerWindow.addClass('open');
	 });
	 $('#join_layer .close').click(function(){
		 join_layerWindow.removeClass('open');
	 });

	 
	 // Show Hide - login
	 $('.layer_trigger_login').click(function(){
		 login_layerWindow.addClass('open');
	 });
	 $('#login_layer .close').click(function(){
		 login_layerWindow.removeClass('open');
	 });



	 // ESC Event - login
	 $(document).keydown(function(event){
	  if(event.keyCode != 27) return true;
	  if (login_layerWindow.hasClass('open')) {
		  login_layerWindow.removeClass('open');
	  }
	  return false;
	 });
	 
	 // ESC Event - join
	 $(document).keydown(function(event){
		  if(event.keyCode != 27) return true;
		  if (join_layerWindow.hasClass('open')) {
			  join_layerWindow.removeClass('open');
		  }
		  return false;
		 });
	 
	 
	 //Hide Window - login
	 login_layerWindow.find('>.bg').mousedown(function(event){
		 login_layerWindow.removeClass('open');
	  return false;
	 });
	 
	// Hide Window - join
	 join_layerWindow.find('>.bg').mousedown(function(event){
		 join_layerWindow.removeClass('open');
	  return false;
	 });
	 
	 
	});
	
function loginCheck() {
	if($("#member_id").val() == "") {
		alert("아이디를 입력해주세요.");
		return;
	} else if($("#member_pwd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		return;
	}
	
	document.loginForm.submit();
}
</script>

<div class="header_menu">
	<div class="inner">	
		
		<c:if test="${session.member_id != null}">
			<span><a href="<%=cp %>/">로그아웃</a></span>
			<span><a href="<%=cp %>/hosting.do">호스팅하기</a></span>	
			<span><a href="<%=cp %>/qnaList.do">도움말</a></span>
			<span><a href="<%=cp %>/mypage/main.do">마이페이지</a></span>
			<span><a href="<%=cp %>/qnaWrite.do">1:1문의</a></span>
		</c:if>
		
		<c:if test="${session.member_id == null}">
			<span><a href="#login_layer" class="layer_trigger_login">로그인</a></span>
			<span><a href="#join_layer" class="layer_trigger_join">회원가입</a></span>
			<span><a href="<%=cp %>/hosting.do">호스팅하기</a></span>
			
			
		</c:if>
		
		<c:if test="${session.member_level == 1}">
			<span><a href="<%=cp %>/admin/main.do">관리자 홈</a></span>
		</c:if>
	
	</div>

</div>

<!-- 로그인 -->
<form method="post" action="<%=cp %>/memberLogin.do" name="loginForm">
	<div class="login_layerWindow">
	 <div class="bg"></div>
	 <div id="login_layer">
	 	<h2 style="border-bottom:1px solid black;">로그인하기</h2>
		 <div class="login_line">
		 	<div class="box_in">
		 		<input type="text" name="member_id" id="member_email"  size="23" placeholder="이메일 주소">
				<input type="password" name="member_pwd" id="member_pwd" size="23" placeholder="비밀번호">
			</div>
			<span class="btn_login" onclick="loginCheck();">로그인</span>
		 </div>
	    
	    <div class="close" >
		    <table width="100%" id="loginTbl">
		    	<tr>
		    		<td width="30%" align="left" onclick="#join_layer" class="layer_trigger_join">회원가입</td>
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



<!-- 회원가입 -->
<form method="post" action="<%=cp %>/memberJoin.do" name="joinForm">
	<div class="join_layerWindow">
	 <div class="bg"></div>
	 <div id="join_layer">
	 	<h2 style="border-bottom:1px solid black;">회원가입하기</h2>
		 <div class="join_line">
		 	<div class="box_in_j">
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
