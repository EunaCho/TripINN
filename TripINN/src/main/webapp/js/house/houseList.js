function plusList(){
	var last_index = (Number)($(".plustListBtn").attr("id"));
	$.ajax({
		type : "GET",
		url : "/TripINN/pluseList.do",
		dataType: "Text",
		async:true,
		data : {
			"FIRST_INDEX" : last_index,
			"LAST_INDEX" : last_index+3
		},

		success : function(html) {
			$(".plustListBtn").remove(); 
			$(".pre_List").append(html);
		}
	});
}