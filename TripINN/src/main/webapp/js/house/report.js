	$(document).ready(function(){
		var house_idx = $("#HOUSE_IDX").val();
		var member_idx = $("#MEMBER_IDX").val();
		
		$("#submitBtn").click(function(){
			
			if($("#report_title").val() == ""){
				alert("제목을 입력하세요.");
			}else if($("#report_content").val()==""){
				alert("내용을 입력하세요.");
			}else{
			var report_title = $("#report_title").val();
			var report_content = $("#report_content").val();
			$.ajax({
				type: 'GET',
				url: '/TripINN/house/houseReport.do',
				async: true,
				dataType: 'text',
				error: function(){
					alert("server error");
				},
				data : {
					"HOUSE_IDX": house_idx,
					"MEMBER_IDX" : member_idx,
					"REPORT_TITLE" : report_title,
					"REPORT_CONTENT": report_content
						},
				success: function(data){
					alert("접수 되었습니다.");
					window.opener.location.reload();
					window.close();
				}
			})
			}
		});
		
	})