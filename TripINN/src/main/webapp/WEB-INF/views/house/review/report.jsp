<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/common/login.jsp" %>
<html>
<head>
<title>신고하기</title>
<link rel="stylesheet" href="/TripINN/css/house/houseReport.css?ver=1.0">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/TripINN/js/house/report.js"></script>
<% String cp = request.getContextPath(); %>

</head>
<body>
<div class="reportContainer">
		<input type="hidden" id="HOUSE_IDX" name="HOUSE_IDX" value="<%=request.getParameter("HOUSE_IDX") %>">
		<input type="hidden" id="MEMBER_IDX" name="MEMBER_IDX" value="<%=request.getParameter("MEMBER_IDX")%>">
		
		<label style="font-weight: bold;">신고합니다.</label>
		<div>
		<input type="text" placeholder="제목을 입력하세요." id="report_title">
		<textarea rows="10" cols="30" placeholder="내용을 입력하세요." id="report_content"></textarea>
		</div>
		<div>
		
		<input type="button" id="submitBtn" value="확인">
		<input type="button" value="취소" onclick="self.close();">
		</div>
	</div>
</body>
</html>