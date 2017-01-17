/**
 * 
 */

$(document).ready(function() {
	
	$('#wishIcon').click(function() {
		
		/*$.ajax({
			type:'post',
			data:  
			dataType: 'text',
			error: function(){
				alert("xhdtls error");
			}
			success: funcion
		})*/
		var str = $("#wishIcon").css('background-image'); 
		/*alert(str.match("_white"));*/
		if(str.match("white") != null){
		$("#wishIcon").css({'background':'url(/TripINN/images/house/icon_heart_red.png) no-repeat','background-size': '100% 100%'});
		}else{
			$("#wishIcon").css({'background':'url(/TripINN/images/house/icon_heart_white.png) no-repeat','background-size': '100% 100%'});	
		}
		
		
	});
});
/*
 * 
 */