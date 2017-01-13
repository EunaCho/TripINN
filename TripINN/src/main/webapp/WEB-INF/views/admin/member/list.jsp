<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 스타일 적용2 -->
<style>   

 
 #dropdown2 li a{
 font-size:19px;
 color:black;
 }
 
 #dropdown2{
            
			list-style-type: none;
			margin-left:-40px;
			position:absolute;
			max-width:300px;
			margin-top:5px;
			margin-left:-45px;
			}

			#dropdown2 li{
			    
				width: 200px;
				height: 28px;
				border: 0px;
				border-style: solid dashed;
				margin: 2px;
				overflow:hidden;
				background: #eeeeff;
				display:inline-block;
				transition: all 0.4s ease-out;
				float:left;
				text-align:center;
				font-weight: 800;
				padding-left: 10px;
				font-size:14pt;
				
				
			}

			#dropdown2 > li > ul > li{
		     	
				height: 30px;
				border: 2px;
				list-style-type: none;
				margin-left:-50px;
				background:#c2e4e7;
				text-align:center;
				font-weight: 800;
				font-size: 16pt;
				padding-left: 10px;
				opacity: 0.3;
				transition: text-shadow 0.25s ease, opacity 0.8s ease;
			}
			#dropdown2 > li > ul > li:hover{
				opacity: 1;
				text-shadow: 1px 1px 1px #ffffff, -1px -1px 1px #8888ff;
			}
			#dropdown2 > li:hover{
				height:90px;
			}
			section{
				display: block;
				border: 0px solid gray;
			}
			hr{ width:95%; color:#eee;}



.left-ul li a{font-size:12px;color:#fff;font-weight:bold;text-decoration:none}
.tbl { width:1000px; border:1px; }
.tbl tr th {  border:1px solid #a6a6a6;height:30px;text-align:center; background:#eee; }
.tbl tr td { border:1px solid #a6a6a6; padding:5px;height:30px; text-align:center;}
.tbl tr td a { text-decoration: none; color:#000; }
.tbl tr td a:hover { color: #ff3300; vertical-align: middle; }
#tbl {}
.paging{
   font-size:17px;
   margin-left:400px;
   }
</style> 

  <br><br>
  
 <!-- 가운데 윗 영역 -->
<div style="width:100%;height:70px;border:0px solid black;text-align:center;">
         <h2>회원관리 페이지에 오신걸 환영합니다.</h2>
</div>

<div style="height:100%; margin:0px auto; display:table;"> <!-- 좌측+리스트 -->
<!-- 좌측영역 -->
<div style="width:210px;height:400px;border:0px solid black;text-align:center; float:left;">
   <section>
				<nav style="height:400px;width:250px;">

<<<<<<< HEAD
					<ul id="dropdown2">
						<li><a href="http://localhost:8080/TripINN/admin/main.do">관리자 홈</a>
						<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/memberList.do">회원관리</a></li>
						</ul>
						</li>
						
						<li><a href="http://localhost:8080/TripINN/admin/houseList.do">숙소관리</a>
							<ul>
							<li><a href = "http://localhost:8080/TripINN/admin/houseReportList.do">신고하기</a></li>
							</ul>
						</li>
						
						<li><a href = "http://localhost:8080/TripINN/admin/adminTripList.do">투어관리</a>
							<ul>
						<li><a href = "http://localhost:8080/TripINN/admin/adminTripReportList.do">신고하기</a></li>
							
							</ul>
						</li>
						
						<li>문의게시판
							<ul>
						<li><a href = "http://localhost:8080/TripINN/admin/qnaList.do">Q&A</a></li>
						<li><a href = "http://localhost:8080/TripINN/admin/faqList.do">FAQ</a></li>
							
							</ul>
						</li>
						
					</ul>
				</nav>
		</section>
	
</div><!-- side div End -->
   
<div style="width:1045px;height:63%; border:1px solid black; text-align:left; top:208px;left:300px; margin:10px auto; float:left;">

        <h2>&nbsp;회원 리스트</h2>
        <div style="width:1028px; height:0px; border-bottom:2px solid #dcdcdc; margin-bottom:5px; margin-top:10px;vertical-align:middle; padding-left:9px; padding-top:10px;">
        </div>
     <div style="width:1001px; height:80%; margin:10px; border:0px solid blue;"> <!-- table div start -->
=======
   <!-- 회원 테이블 영역 -->
        <h2>회원 리스트</h2>
     <div style="width:1001px; height:75%; margin:10px; border:1px solid red;"> <!-- table div start -->
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
 
       <form name="frm" method="post" action="/TripINN/admin/memberView.do">
          <input type="hidden" value="" name="MEMBER_IDX"/>
          
 
         <table class="tbl" cellspacing="0" cellpadding="0" >
      
            <tr>
               <th width="100px">번호</th>
               <th width="500px">이메일</th>
               <th width="1300px">주소</th>
               <th width="350px">가입일</th>   
            </tr>
      
         <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach items="${list}" var="member">
               <tr>
                  <td align="center">${member.MEMBER_IDX}</td>
                  
                  <td class="MEMBER_EMAIL">
                                <a href="javascript:formSubmit('${member.MEMBER_IDX}');" >${member.MEMBER_EMAIL }</a>
                        </td>
                        <td align="center">${member.MEMBER_ADDR}</td>
                  <td align="center" >${member.MEMBER_JOINDATE}</td>
               </tr>
               </c:forEach>
            </c:when>
         <c:otherwise>
               <tr>
                  <td>회원가입한 멤버가 없습니다.</td>
               </tr>
         </c:otherwise>
         </c:choose>
         </table>
       </form>
   </div><!-- table div End -->
   
   <!-- 현재 페이지 번호를 저장 -->
    <div class="paging">
       ${pagingHtml}
    </div>
    
</div><!-- list div End -->


<<<<<<< HEAD

</div><!-- 전체  --> 
=======
<!-- 이건 도대체 뭐냐? -->
>>>>>>> branch 'master' of https://github.com/EunaCho/TripINN.git
<div style="clear:both;"></div>


   
   <!--스크립트 정의  -->
<script type="text/javascript">

   function formSubmit(MEMBER_IDX) {
      document.frm.MEMBER_IDX.value = MEMBER_IDX;
      document.frm.submit();
   }
   
   //게시판 목록을 호출할 때 currentPageNo 값을 같이 전송해줌
    function fn_search(pageNo){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/MemberList.do' />");
        comSubmit.addParam("currentPageNo", pageNo);
        comSubmit.submit();
    }
</script>