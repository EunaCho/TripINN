<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	h3 { color:#000;}
</style>
${list }
<c:forEach var="trip" items="${list }" >
	<h3>${trip.TRIP_NAME }</h3> <br />
	<h3>${trip.TRIP_INTRO }</h3> <br />
</c:forEach>
<h3>test</h3>