<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<script src="/house/common.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/houseMain.css">


</head>
<body>
<div id="header_container">
	<form id="house_searchForm">

	<div>
		<label>위치</label>
		<input class="location" type="text" placeholder="목적지, 도시명, 주소">
	</div>
	<div>
		<div>
		<label>체크인</label>
		<input class="checkinout" type="text" name="periodToStay_startDate" id="datepicker_in" placeholder="체크인" >
		</div>
		<div><img src="/TripINN/images/arrow.png"  style="width:30px;"></div>
		<div>
		<label>체크아웃</label>
		<input class="checkinout" type="text" name="periodToStay_startDate" id="datepicker_out" placeholder="체크아웃">
		</div>
	</div>

	<div style="margin-left:30px;">
		<label>인원</label>
		<select name="person" placeholder="인원 1명">	
			<option value="인원 1명">인원 1명</option>
			<option value="1" <c:if test="${person eq 1}">selected="selected"</c:if> >인원 1명</option>
			<option value="2" <c:if test="${person eq 2}">selected="selected"</c:if> >인원 2명</option>
			<option value="3" <c:if test="${person eq 3}">selected="selected"</c:if> >인원 3명</option>
			<option value="4" <c:if test="${person eq 4}">selected="selected"</c:if> >인원 4명</option>
			<option value="5" <c:if test="${person eq 5}">selected="selected"</c:if> >인원 5명</option>
		</select>
		<!-- <div class="searchForm_input">
			<div class="div_person">
			<span class="span_person">
			<input type="text" readonly="readonly" value="인원 1명" class="input_person">
			</span>
			<span>
			<input type="button" class="personBtn">
			</span>
			</div>
		</div> -->
	</div>
	
	<a href="/TripINN/house/searchHouse.do">
		<img id="searchBtn" src="/TripINN/images/searchBtn.png">
	</a>

	</form>

<div style="clear:both"></div>

	<div id="dropPerson">
		<ul class="dropInfo">
			<li><label>인원</label>
				<ul>
				<li><h1>성인 1명<input type="button" value="+"> <input type="button" value="-"></h1>  </li>
				<li><h1>어린이 0명<input type="button" value="+"> <input type="button" value="-"></h1></li>
				<li><h1>유아 0명<input type="button" value="+"> <input type="button" value="-"></h1></li>
				</ul>
			</li>
			
		</ul>
	</div>
	
	
</div>
</body>
<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
	$(document).ready(function() {
		$("#houseRegister").on("click", function(e) {
			e.preventDefault();
			openHouseRegister();
		});
	});

	function openHouseRegister() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/house/openHouseRegister.do' />");
		comSubmit.submit();
	}
</script>

</html>