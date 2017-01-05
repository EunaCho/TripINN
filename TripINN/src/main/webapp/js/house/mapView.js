function mapView() {
	var addr = $("#addr2").val();
	if(addr == "") {
		alert("주소 검색을 먼저 해주세요.");
		return;
	}
	$.ajax({
		url: "/TripINN/house/houseMapView.do",
		type: "GET",
		async:true,
		dataType: "Text", 
		data: {"addr": addr},
		success: function(data) {
			$("#mapView").html(data);
		}
	});
}