<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>register layout</title>
<link rel="stylesheet" type="text/css" href="/TripINN/css/house/layout/houseRegister.css">
</head>

<body id="hrContainer">
	<div id="hrLeft">
		<tiles:insertAttribute name="left"/>
	</div>
	
	<div id="hrRight">
		<tiles:insertAttribute name="right"/>
	</div>
</body>
</html>