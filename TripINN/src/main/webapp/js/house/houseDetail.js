var cnt = 0;
			
	function review_l_check(index, divTag, hrb_idx, house_idx){
		
		var cnt = 0;
//		alert(index);
//		alert(divTag.style.backgroundColor == 'rgb(255, 90, 95)');
//		alert(hrb_idx);
//		alert(house_idx);
		
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

$(document).ready(function() {
	var REVIEW_HRB_IDX = $("#review_hrb_idx").val();
	var REVIEW_HRB_PWD = $("#review_hrb_pwd").val();
	var HOUSE_MEMBER_IDX = $("#HOUSE_MEMBER_IDX").val();
	var pageLocation = "http://localhost:8080/TripINN/house/hrbPwdCheck.do?HRB_IDX="+REVIEW_HRB_IDX+
	"&HRB_PWD="+REVIEW_HRB_PWD + "&HOUSE_MEMBER_IDX="+HOUSE_MEMBER_IDX;
	var pageOption = "width=400px, height=200px, resizable=no, scrollbar=no, status=no, toolbar=no";
	$('.my_like').click(function(){
		alert("본인은 '좋아요' 기능을 사용할 수 없습니다.");
	});
	
	
//	review update delete btn
	$('.u_d_btn_delete').click(function(){
		window.open(pageLocation,'',pageOption);
	});
	
	//위시 리스트 버튼 클릭
	$('#wishIcon').click(function() {
		var str = $("#wishIcon").css('background-image');
		
		/*alert(str.match("_white"));*/
		var wish_check = 1;
		var HOUSE_IDX = $("#house_idx").val();
		
//		alert(MEMBER_IDX);
		
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