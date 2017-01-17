<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	window.onload = function(){
		alert("호스트 등록을 마쳤습니다.");
		location.href="http://localhost:8080/TripINN/house/houseMain.do";
	}
</script>