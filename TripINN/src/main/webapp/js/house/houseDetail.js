

function house_rsv(){
	var person = $('#person').val();
	var checkin = $('#datepicker_in_reserveBar').val();
	var checkout = $('#datepicker_out_reserveBar').val();
	var house_idx = $("#house_idx").val();
	var house_member_idx = $("#HOUSE_MEMBER_IDX").val();
	var pageLocation = "http://localhost:8080/TripINN/house/houseReserveForm.do?HOUSE_IDX="+ house_idx +
	"&MEMBER_IDX="+ MEMBER_IDX + "&HR_FIRST_DATE="+checkin+"&HR_LAST_DATE="+checkout+"&HR_PERSONS="+person;
	
	if(checkin==""){
		alert("체크 인을 설정 해주세요.");
	}else if(checkout==""){
		alert("체크 아웃을 설정 해주세요.");
	}else if(person=="0"){
		alert("인원수를 입력하세요.");
	}else{
	window.open(pageLocation,"_black");
	}
}

function u_d_btn(index){
	var HOUSE_MEMBER_IDX = $("#HOUSE_MEMBER_IDX").val();
	var HOUSE_IDX = $("#house_idx").val();
	var REVIEW_HRB_IDX = $("#review_hrb_idx"+index).val();
	var REVIEW_HRB_PWD = $("#review_hrb_pwd"+index).val();
	var pageLocation = "http://localhost:8080/TripINN/house/hrbPwdCheck.do?HRB_IDX="+ REVIEW_HRB_IDX +
	"&HRB_PWD="+REVIEW_HRB_PWD + "&HOUSE_MEMBER_IDX="+HOUSE_MEMBER_IDX+"&HOUSE_IDX="+HOUSE_IDX;
	var pageOption = "width=400px, height=200px, resizable=no, scrollbar=no, status=no, toolbar=no";
	
	window.open(pageLocation,'',pageOption);
}

$(document).ready(function() {
	
	var HOUSE_MEMBER_IDX = $("#HOUSE_MEMBER_IDX").val();
	var HOUSE_IDX = $("#house_idx").val();
	var review_size = $("#review_size").val();
	
	$('.my_like').click(function(){
		alert("본인은 '좋아요' 기능을 사용할 수 없습니다.");
	});

	
	$('.report').click(function(){
		window.open('http://localhost:8080/TripINN/house/houseReport.do?HOUSE_IDX='+HOUSE_IDX+'&MEMBER_IDX='+MEMBER_IDX,'','width=500px, height=500px, scrollbar=yes');
	});
	
	//위시 리스트 버튼 클릭
	$('.wishList').click(function() {
		var str = $("#wishIcon").css('background-image');
		var wish_check = 1;
		var HOUSE_IDX = $("#house_idx").val();
		
		if(str.match("white") != null){
		
		$("#wishIcon").css({'background':'url(/TripINN/images/house/icon_heart_red.png) no-repeat','background-size': '100% 100%'});
		
		$.ajax({
			type: 'GET',
			url: '/TripINN/house/houseDetail.do',
			async: true,
			dataType: 'text',
			error: function(){
				alert("server error");
			},
			data : {"HOUSE_IDX": HOUSE_IDX, "HOUSE_WISH": wish_check, "MEMBER_IDX" : MEMBER_IDX},
			success: function(data){
				
			}
		})
		
		}else{
			$("#wishIcon").css({'background':'url(/TripINN/images/house/icon_heart_white.png) no-repeat','background-size': '100% 100%'});
			wish_check = 0;
			
			$.ajax({
				type:'GET',
				url: '/TripINN/house/houseDetail.do',
				async: true,
				dataType: 'text',
				error: function(){
					alert("server error");
				},
				data : {"HOUSE_IDX": HOUSE_IDX, "HOUSE_WISH": wish_check, "MEMBER_IDX" : MEMBER_IDX},
				success: function(data){
					
				}
			})
		}
	});	
});


var cnt = 0;

function review_l_check(index, divTag, hrb_idx, house_idx){
	
	var cnt = 0;
	
	if(divTag.style.backgroundColor == 'rgb(255, 90, 95)'){ //추천 취소
		divTag.style.backgroundColor = '#ffffff';
		divTag.style.color = 'black';
		divTag.style.border = '1px solid #BABABB';
		divTag.style.padding = '2px';
		cnt = -1;
		$.ajax({
			type: 'GET',
			url: '/TripINN/house/hrbLike.do',
			async: true,
			dataType: 'text',
			error: function(){
				alert("server error");
			},
			data : {
				"cnt": cnt,
				"HRB_IDX" : hrb_idx,
				"MEMBER_IDX" : MEMBER_IDX,
				"HOUSE_IDX": house_idx
			},
			success: function(data){
				$("#like_cnt"+index).html(data);
			}
		});
	}else{
		divTag.style.backgroundColor = 'rgb(255, 90, 95)';
		divTag.style.color = 'white';
		divTag.style.border = '1px solid white';
		divTag.style.padding = '2px';
		cnt = 1;
		$.ajax({
			type: 'GET',
			url: '/TripINN/house/hrbLike.do',
			async: true,
			dataType: 'text',
			error: function(){
				alert("server error");
			},
			data : {
				"cnt": cnt,
				"HRB_IDX" : hrb_idx,
				"MEMBER_IDX" : MEMBER_IDX,
				"HOUSE_IDX": house_idx
			},
			success: function(data){
				$("#like_cnt"+index).html(data);
			}
		});
		
	}
	}