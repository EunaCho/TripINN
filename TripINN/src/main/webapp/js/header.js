/*header.jsp*/
function logout() {
	if(confirm("로그아웃을 하시겠습니까?")) {
		return true;
	} else {
	return false;
	}
}


//회원가입 체크


function joinCheck() {
	var form = document.joinForm;
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
	 /*  memberEmailCheck();*/
	   
	   
	   form.submit();
	}

/*//이메일 중복 체크
function memberEmailCheck() {

	$.ajax({
		url: "/TripINN/member/memberEmailCheck.do",
		type: "POST",
		async:true,
		dataType: "int", 
		data: {"member_email": form.member_email.value},
		success: function(data) {
			alert(data);
			if(data == 0) {
				return true;
			} else {
				alert("<font color='red'>이미 사용중인 이메일입니다.</font>");
				return false;
			}
		}
		
	});
}
*/

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



