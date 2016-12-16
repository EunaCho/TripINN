
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <link rel="stylesheet" href="/TripINN/resources/bootstrap/css/bootstrap-theme.min.css">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>	
	ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:10px;}
	li{margin-right:50px }
	a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
    </style>

  </head>
  <body>
  <br><br>
    <div style="width:100%;height:100px;border:1px solid blue;text-align:center;">
	<h2>회원관리 페이지에 오신걸 환영합니다.</h2>
   </div>

   
   
   <!-- 좌측 영역 -->
   <div style="width:15%;height:380px;border:1px solid black;text-align:center;">	
	   <ul>   
        <li> <a href = "http://localhost:8080/TripINN/admin/main.do"><h1>관리자 홈</h1></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/memberList.do"><h2>회원관리</h2></a></li>
		<li><a href = "http://localhost:8080/TripINN/admin/houseList.do"><h2>숙소관리</h2></a></li>
		<li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
		<li><a href = "http://www.daum.net"><h2>투어관리</h2></a></li>
		<li><a href = "http://www.naver.com"><h3>ㄴ신고하기</h3></a></li>
		<li><a><h2>문의게시판</h2></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/qnaList.do"><h3>ㄴQ&A</h3></a></li>
        <li><a href = "http://localhost:8080/TripINN/admin/faqList.do"><h3>ㄴFAQ</h3></a></li>

	</ul>
   
   </div>
   
   <!-- 가운데 영역 -->
   <div style="color:black;width:64%;height:381px;border:1px solid black;text-align:left; position:absolute;top:200px;left:222px;">
	
	
   </div>
   
   <!-- 우측영역 -->
   <div style="color:black;width:20%;height:380px;border:1px solid black;text-align:left; position:absolute;top:200px;left:1133px;">
   <img src="/TripINN/images/풍차.jpg" style="width: 290px; height:381px;">

   

  
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>

<!-- 스크립트 동작 -->
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>

<!-- 스타일 -->
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>

<!-- 스타일 적용2 -->
<style>	
ul{width:172px;height:340px;background:blue;opacity:0.45;list-style:none;padding-top:15px;}
li{margin-right:50px }
a{font-size:12px;color:white;font-weight:bold;text-decoration:none}

</style> 
</head>

<!-- 가운데 윗 영역-->
<body>
  <br><br>
    <div style="width:100%;height:100px;border:1px solid black;text-align:center;">
	<h2>Q&A 페이지에 오신걸 환영합니다.</h2>
   </div>
<div style="width:66%;height:381px;border:1px solid black;text-align:center; position:absolute;top:192px;left:213px;">

<!-- 가운데영역 -->
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">회원목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading" style="text-align:center;">
                         회원목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="text-align:left;">
						<div class="col-sm-6">
							<a href="/TripINN/admin/memberList.do?searchNum=0&isSearch="><button type="button" class="btn btn-outline btn-default">전체보기</button></a>													
						</div>
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 회원수 : ${totalCount}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 5%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">ID</th>
										<th style="width: 7%; text-align:center;">이름</th>										
										<th style="width: 9%; text-align:center;">전화번호</th>
										<th style="width: 14%; text-align:center;">E-Mail</th>
										<th style="width: 29%; text-align:center;">주소</th>
										<th style="width: 10%; text-align:center;">가입일자</th>
										<th style="width: 13%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<!-- 삭제예정 -->
								<c:forEach var="memberlist"  items="${memberlist}" varStatus="stat">
								<c:url var="viewURL" value="memberModify.do" >
									<c:param name="id" value="${memberlist.id }" />
								</c:url>									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${memberlist.num}</td>
										<td style="text-align:center;vertical-align:middle;">${memberlist.id}</td>
										<td style="text-align:center;vertical-align:middle;">${memberlist.name}</td>
										<td style="text-align:center;vertical-align:middle;">${memberlist.phone}</td>
										<td style="text-align:center;vertical-align:middle;">${memberlist.email}</td>
										<td style="text-align:center;vertical-align:middle;">${memberlist.addr}</td>										
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${memberlist.join_date}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">
											<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;
										<c:url var="viewURL2" value="memberDelete.do" >
											<c:param name="id" value="${memberlist.id }" />							
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
								</c:forEach>
								<!-- 삭제예정 -->
								<!--  등록된 회원이 없을때 -->
									<c:if test="${fn:length(memberlist) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 회원이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="0">전체</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>




