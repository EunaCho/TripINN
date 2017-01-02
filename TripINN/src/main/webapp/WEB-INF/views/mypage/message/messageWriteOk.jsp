<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String cp = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 등록  </title>
<script>
	function locationURL(){
		alert("승인되면 메시지 보내기가 완료됩니다. 메시지를 보내시겠습니까?");
		location.href='<%=cp%>/mypage/sendMessage.do';
	}
</script>
</head>
<body>
<script>
	locationURL();
</script>
</body>