<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TripINN</title>
<style>html {height:100%;}</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body style="width:100%;height:100%;margin:0px;padding:0px;">
	<div id="header" style="height:55px;" >
		<tiles:insertAttribute name="header"/>
	</div>
	<div style="clear:both;"></div>
	<div id="main" style="display:table;height:100%;width:100%;margin:0px auto;">
		<tiles:insertAttribute name="body"/>
	</div>
	
	<div id="bottom" style="display:block;">
		<tiles:insertAttribute name="bottom"/>
	</div>
</body>
</html>