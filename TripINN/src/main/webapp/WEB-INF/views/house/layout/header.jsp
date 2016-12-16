<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/houseUtils/common.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/TripINN/Utils/house/css/layout.css">

</head>
<body>
<div id="header_container">
<div id="house_searchForm">
	
	<form>
	<div id="searchForm_location">
		<div>
		<label class="searchForm_label">위치</label>
		</div>
		
		<div class="searchForm_input">
		<span>
		<input type="text" placeholder="목적지, 도시명, 주소" id="input_location">
		</span>
		</div>
	</div>
	
	<div id="searchForm_date">
		<div>
		<label class="searchForm_label">날짜</label>
		</div>
		
		<div class="searchForm_input">
		<span>
		<input type="text" value="체크인" class="input_date" readonly="readonly">
		<img src="/TripINN/images/arrow.png" width="30px">
		<input type="text" value="체크아웃" class="input_date" readonly="readonly">
		</span>
		</div>
	</div>
	
	<div id="searchForm_person">
		<div>
		<label class="searchForm_label">인원</label>
		
		</div>
		
		<div class="searchForm_input">
			<div class="div_person">
			<span class="span_person">
			<input type="text" readonly="readonly" value="인원 1명" class="input_person">
			</span>
			<span>
			<input type="button" class="personBtn">
			</span>
			</div>
		</div>
		
	</div>
	
	<div id="searchForm_search">
		<input type="image" width="80px" src="/TripINN/images/searchBtn.png">
		<a href="/TripINN/house/openHouseRegister.do" class="btn" id="houseRegister">숙소 등록하기</a>
	</div>
	
	
	</form>
</div>
	

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
	
	function 
</script>
</html>