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
<div id="house_header">
	<form>
	<div>
		<h1>위치 목적지, 도시명, 주소</h1>
	</div>
	
	<div>
		<h1>날짜 체크인 -> 체크아웃</h1>
	</div>
		<h1>인원 인원 1명</h1>
	<div>
		<input type="submit" value="숙소 검색">
		<a href="#this" class="btn" id="houseRegister">숙소 등록</a>
	</div>
	</form>
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