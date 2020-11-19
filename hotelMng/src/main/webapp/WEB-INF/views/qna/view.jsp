<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">



</head>
<body>
<h2>게시물 보기</h2>
<form id="form1" name = "form1" method="post">
<div>조회수 : ${dto.QNAVIEWCOUNT}</div>
<div>작성일자 : ${dto.QNAREGISTERDATE}</div>
<div>작성자 : ${dto.QNAWRITER}</div>
<div>제목 : ${dto.QNATITLE}</div>
<div>내용 : ${dto.QNACONTENT}</div>
</form>
<div>
	<input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
	<c:if test="{sessionScope.userid == dto.QNAWRITER}">
	<button type ="button" id = "btnUpdate" onclick="location.href='/qna/rewrite.do?QNACODE=${dto.QNACODE}'">수정</button>
	<button type ="button" id = "btnDelete">삭제</button>
	<button type ="button" id = "btnList" onclick="location.href='/qna/list.do'">목록</button>
	</c:if>
 
</div>



</table>
</body>
</html>