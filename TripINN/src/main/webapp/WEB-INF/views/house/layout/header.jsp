<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>header</title>


</head>
<body>
<div id="header_container">
	<form id="house_searchForm" method="POST" action="/TripINN/house/houseMain.do">
 
	<div>
		<label>검색 키워드</label>
		<input class="location" type="text" name="preSearch_keyword" placeholder="숙소 이름, 도시명, 주소" value="${search.preSearch_keyword}">
	</div>
	<div>
		<div>
		<label>체크인</label>
		<input class="checkinout" type="text" name="hri_first_date" id="datepicker_in" value="${search.hri_first_date}" placeholder="체크인" >
		</div>
		<div><img src="/TripINN/images/arrow.png"  style="width:30px;"></div>
		<div>
		<label>체크아웃</label>
		<input class="checkinout" type="text" name="hri_last_date" id="datepicker_out" value="${search.hri_last_date}" placeholder="체크아웃">
		</div>
	</div>

	<div style="margin-left:30px;">
		<label>인원</label>
		<select name="person" placeholder="">	
			<option value="0">인원 1명</option>
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
	<!-- <button type="submit"> <img src="/TripINN/images/searchBtn.png"><!-- </button> -->
		<input type="image" id="searchBtn" src="/TripINN/images/searchBtn.png">
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