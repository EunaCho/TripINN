<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String cp = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޽��� ���  </title>
<script>
	function locationURL(){
		alert("���� ��ҽ�û�� �Ͻðڽ��ϱ�? ȣ��Ʈ�� Ȯ���ϸ� ��Ұ� �Ϸ� �˴ϴ�. ");
		location.href='<%=cp%>/mypage/H_reserDelete.do';
	}
</script>
</head>
<body>
<script>
	locationURL();
</script>
</body>