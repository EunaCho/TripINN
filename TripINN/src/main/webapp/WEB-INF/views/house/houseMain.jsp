<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>

<title>HOUSE LIST</title>

</head>

<body>
	<H2>HOUSE LIST</H2>
	<div id="header">
	
	<!-- <a href="#this" class="btn" id="houseRegister">숙소 등록</a> -->
	</div>
	
	<div>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>소개</td>
		</tr>
		
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="house">
					<tr>
						<td>${house.HOUSE_IDX}</td>
						<td>${house.HOUSE_NAME}</td>
						<td>${house.HOUSE_INFO}</td>
						<td>${house.HOUSE_PRICE }</td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
			<tr>
				<td>등록된 숙소가 없습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
		
	</table>
	</div>
	
</body>
</html>