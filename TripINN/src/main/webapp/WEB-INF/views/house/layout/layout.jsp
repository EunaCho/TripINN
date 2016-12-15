<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<title>layout</title>
<link rel="stylesheet" type="text/css" href="/TripINN/Utils/house/css/layout.css">
</head>

<body id="hbody">
	<div id="header">
		<tiles:insertAttribute name="house_header"/>
	</div>
	
	<div id="body">
		<tiles:insertAttribute name="house_body"/>
	</div>
</body>
</html>