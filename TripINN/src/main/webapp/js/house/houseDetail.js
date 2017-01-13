/**
 * 
 */

$(document).ready(function() {
	var MEMBER_IDX = $('#member_idx').val();
	
	//리뷰작성 클릭 이벤트 house_reivew_board
	$('#reviewBtn').click(function(){
		alert("asdf");
		var HOUSE_IDX = $('#house_idx').val();
		var HRB_TITLE = $('#HRB_TITLE').val();
		var HRB_PWD = $('#HRB_PWD').val();
		var HRB_CONTENT = $('#HRB_CONTENT').val();
//		alert(HOUSE_IDX + "HOUSE_IDX" + HRB_TITLE + "HRB_TITLE");
		$.ajax({
			type : 'GET',
			url : '/TripINN/house/houseDetail.do',
			async : true,
			dataType : 'text',
			error : function(){
				alert("server error");
			},
			data : {
				"HOUSE_IDX" : HOUSE_IDX,
				"HRB_TITLE" : HRB_TITLE,
				"HRB_CONTENT" : HRB_CONTENT,
				"HRB_PWD": HRB_PWD,
				"MEMBER_IDX" : MEMBER_IDX
			},
			success: function(data){
				
			}
		})
		
	});
	
	//위시 리스트 버튼 클릭
	$('#wishIcon').click(function() {
		var str = $("#wishIcon").css('background-image'); 
		/*alert(str.match("_white"));*/
		var wish_check = 1;
		var HOUSE_IDX = $("#house_idx").val();
		
		if(str.match("white") != null){
			/*alert($("#house_idx").val());*/
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
			/*alert($("#house_idx").val());*/
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
	/*function() {
		
	}*/
	
	
});
/*
 * 
 */