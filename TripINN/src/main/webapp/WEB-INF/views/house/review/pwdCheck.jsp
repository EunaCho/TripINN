<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>비밀번호 체크</title>
	<link rel="stylesheet" href="/TripINN/css/house/houseDetail.css?ver=1.0">
	<script src="http://code.jquery.com/jquery.min.js"></script>
<% String cp = request.getContextPath(); %>
</head>
<script>
	$(document).ready(function(){
		$("#submitBtn").click(function(){
		
		var hrbIdx = $("#HRB_IDX").val();
		var hrbPwd = $("#HRB_PWD").val();
		var inputPwd = $("#INPUT_PWD").val();
		var pwdCheck = $("#pwdCheck").val();
		var house_member_idx = $("#HOUSE_MEMBER_IDX").val();
		var house_idx = $("HOUSE_IDX").val();
		
			if(hrbPwd==inputPwd){
				pwdCheck = "1";
				$.ajax({
					type: 'GET',
					url: '/TripINN/house/hrbPwdCheck.do',
					async: true,
					dataType: 'text',
					error: function(){
						alert("server error");
					},
					data : {
						"pwdCheck":pwdCheck,
						"HRB_IDX":hrbIdx,
						"HRB_PWD":hrbPwd,
						"INPUT_PWD":inputPwd,
						"HOUSE_MEMBER_IDX" : house_member_idx,
						"HOUSE_IDX": house_idx
					},
					success: function(){
						window.opener.location.reload();
						window.close();
					}
				})
				
				alert("삭제 되었습니다.");
			}else{
				alert("비밀번호가 틀립니다.");
			}
		});
		

	});
</script>
<body>
	<div style="width: 300px; height: 100px; text-align: center; margin: 0 auto;">
		<form action="<%=cp %>/house/hrbPwdCheck.do" method="GET">
		<input type="hidden" id="HRB_IDX" name="HRB_IDX" value="<%=request.getParameter("HRB_IDX")%>">
		<input type="hidden" id="HRB_PWD" name="HRB_PWD" value="<%=request.getParameter("HRB_PWD")%>">
		<input type="hidden" id="HOUSE_MEMBER_IDX" name="HOUSE_MEMBER_IDX" value="<%=request.getParameter("HOUSE_MEMBER_IDX") %>">
		<input type="hidden" id="HOUSE_IDX" name="HOUSE_IDX" value="<%=request.getParameter("HOUSE_IDX")%>">
		<input type="hidden" id="pwdCheck" name="pwdCheck" value="0">
		
		
		<label style="font-weight: bold;">비밀번호를 입력해주세요</label>
		<div>
		<input type="password" style="width: 80%; height: 28px; margin: 10px;" value=""
		id="INPUT_PWD" placeholder="password" name="INPUT_PWD">
		</div>
		<div>
		
		<input type="button" id="submitBtn" class="hrb_pwd_check_btn" value="확인">
		<input type="button" class="hrb_pwd_check_btn" value="취소" onclick="self.close();">
		</div>
		</form>
	</div>
</body>
</html>