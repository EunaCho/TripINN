/**
 * 
 */
function openHouseRegister(){
	location.href="houseRegister1.do";
}
function openMain(){
	location.href="http://localhost:8080/TripINN/main.do";
}
function openHouseMain(){
	location.href="houseMain.do";
}

$(function() {
	$("#postcodify_search_button").postcodifyPopUp();
});

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
	}else if(reg.house_img_file.value==""){
		alert("숙소 이미지를 추가 해주세요.");
		reg.house_img_file.focus();
		return false;
	}else if(reg.HOUSE_ZIPCODE.value==""){
		alert("주소를 기입해주세요.");
		reg.HOUSE_ZIPCODE.focus();
		return false;
	}else if(reg.HOUSE_PRICE.value==""){
		alert("숙소 가격을 정해주세요.");
		reg.HOUSE_PRICE.focus();
		return false;
	}else if(reg.HOUSE_PERSON_PRICE.value==""){
		alert("인원당 가격을 정해주세요.");
		reg.HOUSE_PERSON_PRICE.focus();
		return false;
	}else if(reg.HOUSE_TOTAL_PERSONS.value==""){
		alert("숙박 가능한 인원을 정해주세요.");
		reg.HOUSE_TOTAL_PERSONS.focus();
		return false;
	}
}

//img 추가 등록
/*var createNum = 4;*/




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