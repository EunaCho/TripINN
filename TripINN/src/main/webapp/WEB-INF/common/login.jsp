<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.member_idx == null }">
<script>
	alert("로그인을 먼저 해주세요.");
	location.href='/TripINN/main.do';
</script>
</c:if>