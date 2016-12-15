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
	<!-- 
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#houseRegister").on("click",function(e){
				e.preventDefault();
				openHouseRegister();
			});
		});
		
		

		function gfn_isNull(str) {
			if (str == null) return true;
			if (str == "NaN") return true;
			if (new String(str).valueOf() == "undefined") return true;    
		    var chkStr = new String(str);
		    if( chkStr.valueOf() == "undefined" ) return true;
		    if (chkStr == null) return true;    
		    if (chkStr.toString().length == 0 ) return true;   
		    return false; 
		}
		
		function ComSubmit(opt_formId) {
			this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
			this.url = "";
			
			if(this.formId == "commonForm"){
				$("#commonForm")[0].reset();
			}
			
			this.setUrl = function setUrl(url){
				this.url = url;
			};
			
			this.addParam = function addParam(key, value){
				$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
			};
			
			this.submit = function submit(){
				var frm = $("#"+this.formId)[0];
				frm.action = this.url;
				frm.method = "post";
				frm.submit();	
			};
		}
		function openHouseRegister(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/house/openHouseRegister.do' />");
			comSubmit.submit();
		}
		 -->
	</script>
</body>
</html>