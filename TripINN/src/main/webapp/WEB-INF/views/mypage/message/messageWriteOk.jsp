<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String cp = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޽��� ���  </title>
<script>
	function locationURL(){
		alert("���εǸ� �޽��� �����Ⱑ �Ϸ�˴ϴ�. �޽����� �����ðڽ��ϱ�?");
		location.href='<%=cp%>/mypage/sendMessage.do';
	}
</script>
</head>
<body>
<script>
	locationURL();
</script>
</body>