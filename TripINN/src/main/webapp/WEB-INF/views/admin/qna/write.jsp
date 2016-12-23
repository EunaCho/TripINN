<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 작성자: 이진욱 -->
<!-- 이 파일엔 화면의 메타정보, 스타일 시트 및 화면 호출이 완료되기 전에 가져와야하는 스크립트 등이 선언되어 있음-->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <form id="frm">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="4" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
         
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    
    
    <script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_qnaBoardList();
        });
         
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_qnaInsertBoard();
        });
    });
     
    function fn_qnaBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
        comSubmit.submit();
    }
     
    function fn_qnaInsertBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/admin/qnaInsertPro.do' />");
        comSubmit.submit();
    }
	</script>
 
</body>
</html>