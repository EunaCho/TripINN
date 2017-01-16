
function message(){
//	var HOUSE_IDX = $("#house_idx").val(); 
	var receive_member_email = $("#receiveEmail").val();
	var msg_content = document.getElementById('msg_content').value;
	var msg_title = document.getElementById('msg_title').value;
	var house_idx = $("#house_idx").val();
	var house_member_idx = $("#house_member_idx").val();

	$.ajax({
		type:'GET',
		url: '/TripINN/house/sendMssg.do',
		async : true,
		error: function(){
			alert("server error");
		},
		data : {
			"RECEIVE_MEMBER_EMAIL" : receive_member_email,
			"HOUSE_IDX" : house_idx,
			"MSG_TITLE" : msg_title,
			"MSG_CONTENT" : msg_content,
			"HOUSE_MEMBER_IDX" : house_member_idx
		},
		success: function(data){
			alert("메시지 보내기 성공");
			$(".modal-backdrop").attr("class", " ");
			$(".fade").attr("style", "display:none");
			$("body").attr("class","");
			$("body").attr("style","width:100%; height:100%; margin: 0 px; padding:0px;");
		}
	});
}