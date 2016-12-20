

/*header.jsp*/
function logout() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		return true;
	} else {
	return false;
	}
}

// 회원가입 체크
function joinCheck() {
	   if($("#member_email").val() == "") {
	      alert("이메일주소를 입력해주세요.");
	      return;
	   } else if($("#member_name").val() == "") {
	      alert("이름를 입력해주세요.");
	      return;
	   } else if($("#member_pwd").val() == "") {
		      alert("비밀번호를 입력해주세요.");
		      return;
	    } else if($("#member_phone").val() == "") {
		      alert("전화번호를 입력해주세요.");
		      return;
		}
	   alert("회원가입이 완료되었습니다.");
	   document.joinForm.submit();
	}

//로그인 체크
function loginCheck() {
	   if($("#member_email_log").val() == "") {
	      alert("이메일주소를 입력해주세요.");
	      return;
	   } else if($("#member_pwd_log").val() == "") {
	      alert("비밀번호를 입력해주세요.");
	      return;
	   }
	   
	   document.loginForm.submit();
	}

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






/*main.jsp*/

//숙박일 선택
$(function () {
    $("#datepicker_in").datepicker({
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         minDate: new Date(),
         altField: "#datepicker",
         altFormat: "yy-mm-dd"
  });
});
$(function () {
    $("#datepicker_out").datepicker({
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         minDate: new Date(),
         altField: "#datepicker2",
         altFormat: "yy-mm-dd"
  });
});

//메인 롤링 스크립트

$(document).ready(function(){
$("#rolling").Scroll({
	line:1, 
	speed:3000, 
	timer:5000, 
	up:"#topbtnid",
	down:"#btmbtnid",
	autoplay:'#bannerplay',
	autostop:'#bannerstop'
});

});
