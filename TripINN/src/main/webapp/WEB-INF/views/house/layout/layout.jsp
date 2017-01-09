<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>layout</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> <!-- 달력ui -->
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/layout.css">
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/house.css">

<script src="/TripINN/js/house/common.js" charset="utf-8"></script>
</head>

<body id="houseContainer">
	<div id="header" style="border:1px solid black;">
		<tiles:insertAttribute name="house_header"/>
	</div>
	
	<div id="body" style="border:1px solid black;">
		<tiles:insertAttribute name="house_body"/>
	</div>
</body>
</html>