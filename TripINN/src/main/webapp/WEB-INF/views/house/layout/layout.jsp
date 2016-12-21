<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>layout</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/layout.css">
</head>

<body id="houseContainer">
	<div id="header">
		<tiles:insertAttribute name="house_header"/>
	</div>
	
	<div id="body">
		<tiles:insertAttribute name="house_body"/>
	</div>
</body>
</html>