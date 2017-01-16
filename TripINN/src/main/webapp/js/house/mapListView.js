
window.onload = function() {
	var addr = $("#map_addr").val();
	var addrArr = new Array(map_list.lengh);
	for(var i=0; i<addrArr.length; i++ ){
		addr
	}
	alert(addr);
	$.ajax({
		url: "/TripINN/house/houseMapListView.do",
		type: "GET",
		async:true,
		dataType: "Text", 
		data: {"addr": addr},
		success: function(data) {
			$("#mapView").html(data);
		}
	});
}