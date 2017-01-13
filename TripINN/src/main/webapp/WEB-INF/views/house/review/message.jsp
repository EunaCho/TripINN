<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<title>MESSAGE</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="/TripINN/css/house/message.css?ver=1.0">
</head>
<body>
	<div class="MessageContainer">
		<div class="MessageHead">
		<label class="headSetting">받는사람</label>
		<input class="headSetting" type="text" readonly="readonly" value="받는사람">
		<img class="headSetting" src="/TripINN/images/공유.png"/>
		</div>
		<div class="MessageBody">
		<textarea rows="30" cols="40"></textarea>
		</div>
		<div class="MessageBottom">
		<input type="button" value="확인">
		<input type="button" value="취소">
		</div>
	</div>
</body>
</html>