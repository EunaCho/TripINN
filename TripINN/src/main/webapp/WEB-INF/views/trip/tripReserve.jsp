<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/TripINN/css/trip/trip.css" />
<style>
	#container { width:1100px; height:100%; border:1px solid black; margin:0px auto;  }
	p {height: auto;} 
	.trDiv { width:100%;overflow: hidden; height: auto;}
	.trDiv .tdDiv-col { width:98%;height:auto;float:left; padding-left: 40px;}
	.trDiv .tdDiv-left { width:15%;height:auto;float:left;border:0px solid red;text-align:center;vertical-align:middle; }
	.trDiv .tdDiv-col p, .trDiv .tdDiv-col span { font-size:13px; }
	.trDiv .tdDiv-left p { font-size:15px;font-weight:bold; }
	.trDiv .tdDiv-right { width: 75%;height:auto;float:left;border:0px solid black; }
	.trDiv .tdDiv-right p {font-size:15px;}
	.select-short { width: 80px; height:25px; margin-right:30px; }
	.hostImg {width: 120px !important;height: 120px !important;border-radius: 120px !important;}
	.tit {    font-size: 18px; color: #323232; font-family: NanumGothicBold;}
	.subtit {font-size: 12px; color: #727272; margin-top: 5px;}
	.subtit p {line-height: 1.5px;font-size: 12px; font-size:12px; color: #727272; margin-top: 5px;}
	.fc_blue1 {color: #0186c4 !important;}
	.icon .req { padding-left: 23px; background: url(/TripINN/images/table_req.png) no-repeat;
    color: #323232; font-size: 13px; line-height: 18px; font-family: NanumGothicBold; float:left;}
    .trDiv input[type=text] { border:1px solid #a6a6a6; width:150px; height:25px; padding:3px; }
    .rInfo { font-family: 'Nanum Gothic',malgun Gothic,dotum; font-size: 12px; }
    .reserve_line .trDiv .tdDiv-left { border-bottom: 2px solid #a6a6a6; font-weight: bold; padding: 12px; color:#000;}
    .reserve_line .trDiv .tdDiv-right { border-bottom: 1px solid #a6a6a6; text-align:left; padding: 13px; margin-left:20px;}
    .reserve_layerWindow { display:none; }
</style>
<script>
function tripReserve() {
	document.rform.submit();
	alert("예약이 완료되었습니다.");
} 
function checkInfo() {
	if($("#sameInfo").prop("checked")) {
		var email = "${sessionScope.member_email}";
		var phone = "${sessionScope.member_phone}"
		
		$("#tr_name").val("${sessionScope.member_name}");
		$("#tr_email1").val(email.split("@")[0]);
		$("#tr_email2").val(email.split("@")[1]);
		$("#tr_phone1").val(phone.split("-")[0]);
		$("#tr_phone2").val(phone.split("-")[1]);
		$("#tr_phone3").val(phone.split("-")[2]);
	} else {
		$("#tr_name").val("");
		$("#tr_email1").val("");
		$("#tr_email2").val("");
		$("#tr_phone1").val("");
		$("#tr_phone2").val("");
		$("#tr_phone3").val("");
	}
}
</script>
<script>
	function calc(price, person) {
		var total_price = price * person;
		//$("#price").html(insertComma(total_price));
		document.rform.tr_pprice.value = price;
		$("#total_price").html(insertComma(total_price));
		$("#total_price2").html(insertComma(total_price));
		$("#total_person").html(person + "명 ");
	}
	
	function insertComma(number) {
	    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<div id="wrap">
<form name="rform" action="/TripINN/tripReserve.do" method="post">
<input type="hidden" name="trip_idx" value="${tripInfo.TRIP_IDX }" />
<input type="hidden" name="tr_phone" value=""/>
<input type="hidden" name="tr_email" value=""/>
<input type="hidden" name="tr_pprice" id="tr_pprice" value="${tripInfo.TRIP_PPRICE }" />
<input type="hidden" name="tr_first_date" value="<fmt:formatDate value='${tripInfo.TRIP_FIRST_DATE }' pattern='yyyy-MM-dd HH:mm'/>" />
<input type="hidden" name="tr_last_date" value="<fmt:formatDate value='${tripInfo.TRIP_LAST_DATE }' pattern='yyyy-MM-dd HH:mm'/>" />
<input type="hidden" name="member_idx" value="${sessionScope.member_idx}" />
	<div id="container">
			<div class="trDiv">
				<div class="tdDiv-col" style="height:auto;">
					<p><b><font style="font-size:20px;">${tripInfo.TRIP_NAME }</font> - ${tripInfo.TRIP_AREA }</b></p> 
				</div>
				
			</div>
			<div class="trDiv">
				<div class="tdDiv-col">
				<p>
				<fmt:formatDate value='${tripInfo.TRIP_FIRST_DATE }' pattern='yyyy-MM-dd HH:mm'/> - 
				<fmt:formatDate value='${tripInfo.TRIP_LAST_DATE }' pattern='yyyy-MM-dd HH:mm'/> 
				 일정의 <font color="#1E6198">${tripInfo.TRIP_TYPE }</font> 트립</p>
				
				<p style="width:350px;float:left;">호스트 : <font color="#1E6198">${tripInfo.MEMBER_NAME }</font> 님
					<div style="width:300px;height:auto;float:right;margin-top:-75px;">
						<img src="/TripINN/images/공유.png" class="hostImg" style="position:absolute;"/>
					</div>
				</p>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>집합 장소</p></div>
				<div class="tdDiv-right"><p>
					[${tripInfo.TRIP_ZIPCODE}] ${tripInfo.TRIP_ADDR1 } ${tripInfo.TRIP_ADDR2 } ${tripInfo.TRIP_ADDR3 }
				</p></div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>예약 인원</p></div>
				<div class="tdDiv-right"><p style="float:left;font-size:15px;">
				<c:if test="${tripInfo.TRIP_PERSONS - tripInfo.RESERVED_NUM > 0}">
					<select name="tr_persons" id="" class="select-short" onchange="calc('${tripInfo.TRIP_PPRICE}', this.value);">
					<c:forEach var="person" begin="1" end="${tripInfo.TRIP_PERSONS - tripInfo.RESERVED_NUM }">
						<option value="${person}">${person } 명</option>
					</c:forEach>
					</select>
				</c:if>
				<c:if test="${tripInfo.TRIP_PERSONS - tripInfo.RESERVED_NUM <= 0}">
					<input type="hidden" name="tr_persons" id="tr_persons" value=""/>
					<b><font color="#cb4242">예약이 가득찼습니다. 다른 트립을 이용해주세요.</font></b>
				</c:if>
				</p>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>총 결제 금액</p></div>
				<div class="tdDiv-right">
					<p>
						<img style="width:11px;height:11px;"
							src="http://openimage.interpark.com/tourpark/tour/common/icon/icon_won_pink.gif" />
						<font color="#cb4242" id="total_price"><fmt:formatNumber>${tripInfo.TRIP_PPRICE }</fmt:formatNumber></font>
						<font>원</font>
					</p>
				</div>
			</div>
			<hr />
			<div class="trDiv">
				<div class="tdDiv-left"><p>예약자 정보</p></div>
				<div class="tdDiv-right">
					<div class="subTit"> 
						<p style="line-height:1.5; height:10px;font-size:12px;">예약자의 이메일과 휴대폰번호를 정확하게 입력해주세요.
						 <span class="icon req" style="float:right;margin-right:100px;">
							<img src="/TripINN/images/table_req.png" alt="" /><b>필수입력 항목</b>
							&nbsp;&nbsp;
							<input type="checkbox" name="sameInfo" id="sameInfo" onchange="checkInfo()" />회원 정보와 동일
						</span>
						</p>
						<p style="line-height:1.5; height:10px;font-size:12px;">예약자의 정보로 SMS와 이메일이 발송됩니다.
						 예약확인 및 결제서비스를 이용할 때 <span class="fc_blue1">반드시 예약자명과 이메일주소가  일치</span>해야 합니다.
						 </p>
					</div>
					<hr />
					<div style="width:48%;height:40px;float:left;">
						<div class="rInfo" style="width:25%;height:100%;float:left;padding-top:10px;">
						<span><img src="/TripINN/images/table_req.png" alt="" /><b>예약자 명</b></span></div>
						<div class="rInfo" style="width:73%;height:100%;float:left;padding-top:5px;">
							<input type="text" name="tr_name" id="tr_name"  /> 
						</div>
					</div>
					<div style="width:48%;height:40px;float:left;">
						<div class="rInfo" style="width:25%;height:100%;float:left;padding-top:10px;">
						<span><img src="/TripINN/images/table_req.png" alt="" /><b>휴대폰 번호</b></span></div>
						<div class="rInfo" style="width:73%;height:100%;float:left;padding-top:5px;">
							<input type="text" name="tr_phone1" id="tr_phone1" maxlength="3" style="width:50px;"/> -
							<input type="text" name="tr_phone2" id="tr_phone2" maxlength="4" style="width:70px;"/> -
							<input type="text" name="tr_phone3" id="tr_phone3" maxlength="4" style="width:70px;"/> 
						</div>
					</div>
					<div style="width:98%;height:40px;float:left;">
						<div class="rInfo" style="width:12%;height:100%;float:left;padding-top:10px;">
						<span><img src="/TripINN/images/table_req.png" alt="" /><b>이메일</b></span></div>
						<div class="rInfo" style="width:*;height:100%;float:left;padding-top:5px;">
							<input type="text" name="tr_email1" id="tr_email1" /> @ 
							<input type="text" name="tr_email2" id="tr_email2" />
							<select name="sel_email" id="sel_email" class="select-short" style="width:100px;"
								 onchange="javascript:document.rform.tr_email2.value = this.value;">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="trDiv">
				<div class="tdDiv-col" style="margin:20px auto;text-align:center;">
				<div style="width:400px;height:80px;margin:10px auto;">
					<div style="width:40%;height:25px;background:#cb4242;color:#fff;
						text-align:center;  border-radius: 15px; padding:6px; margin:20px auto; float:left;
						cursor:pointer" onclick="history.back();">
							<b>이전으로</b>
					</div>
					<div style="width:40%;height:25px;background:#00A2E8;color:#fff;
						text-align:center;  border-radius: 15px; padding:6px; margin:20px auto; float:left;
						cursor:pointer;margin-left:50px;" onclick="r_confirm('open');">
							<b>트립 신청</b>
					</div>
				</div>
				</div>
			</div>
	</div>
</form>
</div>

	<div class="reserve_layerWindow">
	 <div class="bg" onclick="r_confirm('close')"></div>

	 <div id="reserve_layer">
	 	<h2 style="border-bottom:1px solid black;">최종 예약 확인</h2>
		 <div class="reserve_line">
		 	<div class="trDiv">
		 		<div class="tdDiv-left">상품 명</div>
		 		<div class="tdDiv-right">${tripInfo.TRIP_NAME }
		 			<span class="fc_blue1">(<fmt:formatDate value='${tripInfo.TRIP_FIRST_DATE }' pattern='yyyy-MM-dd HH:mm'/> - 
					<fmt:formatDate value='${tripInfo.TRIP_LAST_DATE }' pattern='yyyy-MM-dd HH:mm'/>) </span>
		 		</div>
		 	</div>
		 	<div class="trDiv">
		 		<div class="tdDiv-left">도시/장소/언어</div>
		 		<div class="tdDiv-right">${tripInfo.TRIP_AREA } 
		 							<span class="fc_blue1">(${tripInfo.TRIP_LANGUAGE })</span>
		 		</div>
		 	</div>
		 	<div class="trDiv">
		 		<div class="tdDiv-left">집합 장소</div>
		 		<div class="tdDiv-right">[${tripInfo.TRIP_ZIPCODE}] ${tripInfo.TRIP_ADDR1 } ${tripInfo.TRIP_ADDR2 } 
		 						<span class="fc_blue1">${tripInfo.TRIP_ADDR3 }</span>
		 		</div>
		 	</div>
		 	<div class="trDiv">
		 		<div class="tdDiv-left">인원/상품가격</div>
		 		<div class="tdDiv-right"> 
		 			<font id="total_person">1명 </font>
		 			(<font color="#cb4242" id="total_price2"><fmt:formatNumber>${tripInfo.TRIP_PPRICE }</fmt:formatNumber></font>
						<font>원</font>)
		 		</div>
		 	</div>
		 	<div class="trDiv">
		 		<div class="tdDiv-left">제공사항</div>
		 		<div class="tdDiv-right"> 
		 			${fn:replace(tripInfo.TRIP_INCLUDE, "|", ",")}
		 		</div>
		 	</div>
		 	<div class="trDiv">
		 		<div class="tdDiv-left">호스트 연락처</div>
		 		<div class="tdDiv-right"> 
		 			${tripInfo.MEMBER_PHONE }  /  ${tripInfo.MEMBER_EMAIL }
		 		</div>
		 	</div>
			<div class="trDiv">
		 		<div class="tdDiv-left">예약자 정보</div>
		 		<div class="tdDiv-right"> 
		 			<font id="r_tr_name"></font> /
		 			<font id="r_tr_phone"></font> /
		 			<font id="r_tr_email"></font>
		 		</div>
		 	</div>
		 	
		 	<div class="trDiv">
		 		<div class="tdDiv-col" style="margin-top:20px;">
		 		<div style="width:400px;height:80px;margin:10px auto;">
		 			<div style="width:30%;height:25px;background:#00A2E8;color:#fff;
						text-align:center;  border-radius: 15px; padding:6px; float:left;
						cursor:pointer" onclick="tripReserve();">
						<b>트립 신청</b>
					</div>
					<div style="width:30%;height:25px;background:#363636;color:#fff; margin-left:30px;
						text-align:center;  border-radius: 15px; padding:6px; float:left;
						cursor:pointer" onclick="r_confirm('close');">
						<b>닫기</b>
					</div>
		 		</div>
		 		</div>
		 	</div>
		 </div>

	 </div>

	</div>
	<script>
	function r_confirm (confirm) {
		var rform = document.rform;
		var tr_name = rform.tr_name.value;
		var tr_phone1 = rform.tr_phone1.value;
		var tr_phone2 = rform.tr_phone2.value;
		var tr_phone3 = rform.tr_phone3.value;
		var tr_email1 = rform.tr_email1.value;
		var tr_email2 = rform.tr_email2.value;
		
		if(tr_name == "" || tr_name == null) {
			alert("이름을 입력해주세요.");
			return;
		} else if (tr_phone1 == "" || tr_phone2 == "" || tr_phone3 == "") {
			alert("휴대폰 번호를 입력해주세요.");
			return;
		} else if (tr_email1 == "" || tr_email2 == "") {
			alert("이메일을 입력해주세요.");
			return;
		} else if (rform.tr_persons.value == "") {
			alert("예약 인원이 초과되었습니다. 다른 트립을 이용해주세요.");
			return;
		} 
		
		var tr_phone = tr_phone1 + "-" + tr_phone2 + "-" + tr_phone3;
		var tr_email = tr_email1 + "@" + tr_email2;
		rform.tr_phone.value = tr_phone;
		rform.tr_email.value = tr_email;
		
		confirm == "open" ? 
				$(".reserve_layerWindow").css("display", "block") :
					$(".reserve_layerWindow").css("display", "none");
		$("#r_tr_name").html(tr_name);
		$("#r_tr_phone").html(tr_phone);
		$("#r_tr_email").html(tr_email);
	}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	