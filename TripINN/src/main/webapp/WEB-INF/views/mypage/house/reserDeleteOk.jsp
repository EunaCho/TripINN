<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String cp = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 등록  </title>
<script>
	function locationURL(){
		alert("예약 취소신청을 하시겠습니까? 호스트가 확인하면 취소가 완료 됩니다. ");
		location.href='<%=cp%>/mypage/H_reserDelete.do';
	}
</script>
</head>
<body>
<script>
	locationURL();
</script>
</body>