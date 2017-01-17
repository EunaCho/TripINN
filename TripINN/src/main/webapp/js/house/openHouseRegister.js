

function optionBtn(i){
	
	if(i==1){
		var htp = (Number)($("#HI_SALE").val()) + 5;
		if(htp<=100){
		$("#HI_SALE").attr('value',htp);
		}else{
			alert("더 이상 값을 증가 할 수 없습니다.");
		}
	}
	if(i==2){
		var htp = (Number)($("#HI_SALE").val()) - 5;
		if(htp>=0){
		$("#HI_SALE").attr('value',htp);
		}else{
			alert("더 이상 값을 감소 할 수 없습니다.");
		}
	}
	
	if(i==3){
		var htp = (Number)($("#HI_CLEAN_PRICE").val()) + 1000;
		$("#HI_CLEAN_PRICE").attr('value',htp);
	}
	if(i==4){
		var htp = (Number)($("#HI_CLEAN_PRICE").val()) - 1000;
		if(htp>=0){
		$("#HI_CLEAN_PRICE").attr('value',htp);
		}else{
			alert("더 이상 값을 감소 할 수 없습니다.");
		}
	}
	
	if(i==5){
		var htp = (Number)($("#HI_DEPOSIT").val()) + 10000;
		$("#HI_DEPOSIT").attr('value',htp);
	}
	if(i==6){
		var htp = (Number)($("#HI_DEPOSIT").val()) - 10000;
		if(htp>=0){
		$("#HI_DEPOSIT").attr('value',htp);
		}else{
			alert("더 이상 값을 감소 할 수 없습니다.");
		}
	}
	
	if(i==7){
		var htp = (Number)($("#HI_ROOM").val()) + 1;
		$("#HI_ROOM").attr('value',htp);
	}
	if(i==8){
		var htp = (Number)($("#HI_ROOM").val()) - 1;
		if(htp>=0){
		$("#HI_ROOM").attr('value',htp);
		}else{
			alert("더 이상 값을 감소 할 수 없습니다.");
		}
	}
	
	if(i==9){
		var htp = (Number)($("#HI_BAD").val()) + 1;
		$("#HI_BAD").attr('value',htp);
	}
	if(i==10){
		var htp = (Number)($("#HI_BAD").val()) - 1;
		if(htp>=0){
		$("#HI_BAD").attr('value',htp);
		}else{
			alert("더 이상 값을 감소 할 수 없습니다.");
		}
	}
	
}


function fnMove(i){
	if(i==1){
		$("#HOUSE_NAME").focus();
	}
	if(i==2){
		$("#addr1").focus();
	}
	if(i==3){
		$("#HOUSE_TOTAL_PERSONS").fucus();
	}
	if(i==4){
		$("#HOUSE_TOTAL_PERSONS").focus();
	}
	if(i==5){
		$("#HOUSE_PRICE").focus();
	}
	if(i==6){
		$("#HOUSE_IMG").focus();
	}
	if(i==7){
		$("#HI_GUEST").focus();
	}
	if(i==8){
		$("#HOUSE_CHECKIN").focus();
	}
	if(i==9){
		$("#HI_SALE").focus();
	}
	if(i==10){
		$("#HI_SPACE").focus();
	}
}

function titleNI2(){
	var hg = $("#HI_GUEST").val();
	if(hg != ""){
		$("#title2").css('color','white');
	}else{
		$("#title2").css('color','#B9B9B9');
	}
	
	var hci = $("#HOUSE_CHECKIN").val();
	var hco = $("#HOUSE_CHECKOUT").val();
	if(hci != "" && hco != ""){
		
	
	var hs = $("#HI_SALE").val();
	var hcp = $("#HI_CLEAN_PRICE").val();
	var hid = $("#HI_DEPOSIT").val();
	if(hs != "" && hcp != "" && hid != ""){
		$("#title4").css('color','white');
	}else{
		$("#title4").css('color','#B9B9B9');
	}
	var his = $("#HI_SPACE").attr("checked");
	if(his !=""){
		$("#title5").css('color','white');
	}else{
		$("#title5").css('color','#B9B9B9');
	}
}
}

function titleNI(){
	var hn = $('#HOUSE_NAME').val();
	var hi = $('#HOUSE_INFO').val();
	
	if(hi != "" && hn != ""){
		$("#title1").css('color','white');
	}else{
		$("#title1").css('color','#B9B9B9');	
	}

	var ha = $('#addr1').val();
	var ha1 = $('#addr2').val();
	var ha2 = $('#addr3').val();
	var ha3 = $('#addr4').val();
	if(ha != "" && ha1 != "" && ha2 != "" && ha3 != ""){
		
		$("#title2").css('color','white');
		
	}else{
		
		$("#title2").css('color','#B9B9B9');
	}
	
	var hk = $('#HOUSE_KIND').val();
	
	if(hk != ""){
		
		$("#title3").css('color','white');
	}else{
		
		$("#title3").css('color','#B9B9B9');
	}
	var hp = $('#HOUSE_TOTAL_PERSONS').val();
	if(hp != ""){
		
		$("#title4").css('color','white');
	}else{
		
		$("#title4").css('color','#B9B9B9');
	}
	
	var hhp = $('#HOUSE_PRICE').val();
	var hprice = $('#HOUSE_PERSON_PRICE').val();
	if(hhp != "" && hprice != ""){
		
		$("#title5").css('color','white');
	}else{
		
		$("#title5").css('color','#B9B9B9');
	}
}
function personPBtn(){
	var htp = (Number)($("#HOUSE_TOTAL_PERSONS").val()) + 1;
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_TOTAL_PERSONS").attr("value",htp);
		}
	});
}
function personMBtn(){
	var htp = (Number)($("#HOUSE_TOTAL_PERSONS").val()) - 1;
	if(htp == 0){
		alert("더 이상 감소 할 수 없습니다.")
	}else{
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_TOTAL_PERSONS").attr("value",htp);
		}
	});
	}
}
function pricePBtn(){
	var htp = (Number)($("#HOUSE_PERSON_PRICE").val()) + 1000;
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_PERSON_PRICE").attr("value",htp);
		}
	});
}
function priceMBtn(){
	var htp = (Number)($("#HOUSE_PERSON_PRICE").val()) - 1000;
	if(htp == 0){
		alert("더 이상 감소 할 수 없습니다.")
	}else{
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_PERSON_PRICE").attr("value",htp);
		}
	});
	}
}
function hpricePBtn(){
	var htp = (Number)($("#HOUSE_PRICE").val()) + 10000;
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_PRICE").attr("value",htp);
		}
	});
}
function hpriceMBtn(){
	var htp = (Number)($("#HOUSE_PRICE").val()) - 10000;
	if(htp == 0){
		alert("더 이상 감소 할 수 없습니다.")
	}else{
	$.ajax({
		type : "GET",
		url : "/TripINN/house/houseRegister1.do",
		dataType: "Text",
		async:true,
		success : function() {
			$("#HOUSE_PRICE").attr("value",htp);
		}
	});
	}
}
function check2(){
	var reg = document.registerFrm;
	
	if(reg.HI_GUEST.value == ""){
		alert("적합한 게스트 유형을 선택 하세요.");
		reg.HI_GUEST.focus();
		return false;
	}else if(reg.HI_CHECKIN.value == ""){
		alert("체크인을 선택해주세요.")
		reg.HI_CHECKIN.focus();
		return false;
	}else if(reg.HI_CHECKOUT.value == ""){
		alert("체크아웃을 선택해주세요.")
		reg.HI_CHECKOUT.focus();
		return false;
	}else if(reg.HI_ROOM.value == ""){
		alert("방 개수를 정해주세요.")
		reg.HI_ROOM.focus();
		return false;
	}else if(reg.HI_BAD.value == ""){
		alert("침대 개수를 정해주세요.")
		reg.HI_BAD.focus();
		return false;
	}else if(reg.HI_SALE.value == ""){
		alert("할인율을 정해주세요.")
		reg.HI_SALE.focus();
		return false;
	}else if(reg.HI_CLEAN_PRICE.value == ""){
		alert("청소비를 정해주세요.")
		reg.HI_CLEAN_PRICE.focus();
		return false;
	}else if(reg.HI_DEPOSIT.value == ""){
		alert("보증금을 정해주세요.")
		reg.HI_DEPOSIT.focus();
		return false;
	}
}
function check(){
	var reg = document.registerFrm;


	if(reg.HOUSE_NAME.value==""){
		alert("이름을 기입해주세요.");
		reg.HOUSE_NAME.focus();
		return false;
	}else if(reg.HOUSE_INFO.value==""){
		alert("숙소 소개를 해주세요.");
		reg.HOUSE_INFO.focus();
		return false;
	}else if(reg.HOUSE_ZIPCODE.value==""){
		alert("주소를 기입해주세요.");
		reg.HOUSE_ZIPCODE.focus();
		return false;
	}else if(reg.HOUSE_ADDR1.value==""){
		alert("주소를 기입해주세요.");
		reg.HOUSE_ADDR1.focus();
		return false;
	}else if(reg.HOUSE_ADDR2.value==""){
		alert("주소를 기입해주세요.");
		reg.HOUSE_ADDR2.focus();
		return false;
	}else if(reg.HOUSE_ADDR3.value==""){
		alert("주소를 기입해주세요.");
		reg.HOUSE_ADDR3.focus();
		return false;
	}else if(reg.HOUSE_KIND.value==""){
		alert("숙소 유형을 선택하세요.");
		reg.HOUSE_KIND.focus();
		return false;
	}else if(reg.HOUSE_TOTAL_PERSONS.value==""){
		alert("숙소 가능 인원을 정해주세요.");
		reg.HOUSE_TOTAL_PERSONS.focus();
		return false;
	}else if(reg.HOUSE_PRICE.value==""){
		alert("숙소 가격을 정해주세요.");
		reg.HOUSE_PRICE.focus();
		return false;
	}else if(reg.HOUSE_PERSON_PRICE.value==""){
		alert("인원당 가격을 정해주세요.");
		reg.HOUSE_PERSON_PRICE.focus();
		return false;
	}
}

//img 추가 등록
/*var createNum = 4;*/


$(function() { $("#postcodify_search_button").postcodifyPopUp(); });


function getHousePhotoPrivew(html, $target){
	if(html.files && html.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
            $target.css('display', '');
            $target.css('background-image', 'url(\"' + e.target.result + '\")');
            $target.css('background-size', '100%');
            $target.css('width', '100px');
            $target.css('height', '100px');
            $target.css('float', 'left');
            $target.css('display', 'inline-block');
            $target.css('background-repeat', 'no-repeat');
            $target.css('margin', '20px');
            $(".")
            //$target.html('<img src="' + e.target.result + '" border="0" alt="" />');
        }
        reader.readAsDataURL(html.files[0]);
	}
}
