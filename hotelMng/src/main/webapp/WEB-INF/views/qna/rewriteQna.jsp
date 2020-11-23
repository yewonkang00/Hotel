<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<script type="text/javascript">
CKEDITOR.replace("content", {
	height:"150px"
});

</script>
<script src="/ckeditor/ckeditor.js"></script>



</head>
<body>
<h2>게시물 보기</h2>
<form id="form1" name = "form1" method="post">
<div>조회수 : ${dto.QNAVIEWCOUNT}</div>
<div>작성일자 : ${dto.QNAREGISTERDATE}</div>
<div>작성자 : ${dto.QNAWRITER}</div>
<div>제목 : <input name="QNATITLE" id="QNATITLE" value = "${dto.QNATITLE}"></div>
<div style ="width:80%">내용 :
<textarea rows="3" cols="80" name="QNACONTENT" 
id="QNACONTENT">${dto.QNACONTENT}</textarea>
</div>
</form>
<div>
	<input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
	<c:if test="{sessionScope.userid == dto.QNAWRITER}">
	</c:if>
	<button type ="button" id = "btnUpdate" onclick="location.href='/qna/update.do?QNACODE=${dto.QNACODE}'">수정</button>
	<button type ="button" id = "btnDelete" onclick="location.href='/qna/delete.do?QNACODE=${dto.QNACODE}'">삭제</button>
	<button type ="button" id = "btnList" onclick="location.href='/qna/list.do'">목록</button> 
</div>



</table>
</body>
</html>