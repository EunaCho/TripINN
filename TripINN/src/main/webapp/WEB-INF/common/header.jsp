<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!-- jQuery -->
<link rel="stylesheet" href="/TripINN/css/login/layout.css" />
<script>
function logout() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		location.href="memberLogout.action";
	}
	return;
}
</script>
<div class="top_module">
  <div class="menu_container">
    <div class="" style="width:140px;height:70px;float:left; margin:0px;">
    	<img src="/Taster/images/logo2.png"	onclick="location.href='main.action'" 
    		width="138px" height="68px" style="cursor:pointer"/>
    </div>
    
    <div class="btn_category" onclick="logout();">로그아웃</div>
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1문의</div>
    <div class="btn_category" onclick="location.href='memberMypage.action'">마이페이지</div>
    
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1문의</div>
    <div class="btn_category" onclick="location.href='memberJoin.action'" >회원가입</div>
    <div class="btn_category"  onclick="">
    	<a href="#layer" class="layer_trigger">로그인</a>
    </div>
    
    <div class="btn_category" onclick="location.href='approvalRequestList.action'" style="background:#ff792a;" >신규식당 승인</div>
    <div class="btn_category" onclick="location.href='adminMemberList.action'" style="background:#ff792a;">회원 관리</div>
   
  </div>
  <div style="width:100%; height:100px; text-align:center; color:#fff;">
  	<h3>솔직한 리뷰, 믿을 수 있는 평점!</h3>
  	<h3>맛객에 오신 것을 환영합니다.</h3>
  	
  	<select name="" id="selectbox" class="selectbox">
  		<option value="">식당명</option>
  		<option value="">지역</option>
  	</select>
  	
  	<input type="text" name="keyword" id="keyword" placeholder="검색 목록을 선택해 주세요."/>
  	<input type="button" value="검  색" class="btn_search" style="margin-right:30px;font-size:13px;font-weight:bold;"/>
  	<input type="button" value="상세검색" class="btn_search" style="font-size:13px;font-weight:bold;"/>
  </div>
</div>
<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='foodsMenuList.action'">업종별 맛집</td>
		<td onclick="location.href='foodsAreaList.action'">지역별 맛집</td>
		<td onclick="location.href='foodsHotList.action'">뜨는 맛집</td>
		<td onclick="location.href='#'">신규 맛집</td>
		<td onclick="location.href='foodsRecommendList.action'">추천 맛집</td>
		<td onclick="">전체 보기</td>
	</tr>
</table>

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

<form method="post" action="memberLogin.action" name="loginForm">
	<div class="mw_layer">
	 <div class="bg"></div>
	 <div id="layer">
	 	<h2 style="border-bottom:1px solid black;">LOGIN</h2>
		 <div class="login_line">
		 	<div class="box_in">
		 		<input type="text" name="member_id" id="member_id"  size="23" placeholder="아이디">
				<input type="password" name="member_pwd" id="member_pwd" size="23" placeholder="비밀번호">
			</div>
			<span class="btn_login" onclick="loginCheck();">LOGIN</span>
		 </div>
	    
	    <div class="close" >
		    <table width="100%" id="loginTbl" >
		    	<tr>
		    		<td width="30%" align="left" onclick="memberJoin.action">회원가입</td>
		    		<td width="50%;" align="left">아이디/비밀번호 찾기</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="레이어 닫기" class="close">닫기</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>


















