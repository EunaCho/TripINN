function logout() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		return true;
	} else {
	return false;
	}
}
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