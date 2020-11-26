<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>



</head>
<body>

<h2>게시물 보기</h2>

<form action="/qna/update.do" method="get">
<div>조회수 : ${dto.QNAVIEWCOUNT}</div>
<div>작성일자 : ${dto.QNAREGISTERDATE}</div>
<div>작성자 : ${dto.QNAWRITER}</div>
<div>제목 : <input name="QNATITLE" id="QNATITLE" value = "${dto.QNATITLE}"></div>
<div style ="width:80%">내용 :<textarea rows="3" cols="80" name="QNACONTENT" id="QNACONTENT">${dto.QNACONTENT}</textarea></div>



<div>
	<input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
	<button type ="submit" id = "btnUpdate" onclick="location.href='/qna/update.do?QNACODE=${dto.QNACODE}'">수정</button>
	<button type ="button" id = "btnDelete" onclick="location.href='/qna/delete.do?QNACODE=${dto.QNACODE}'">삭제</button>
	<button type ="button" id = "btnList" onclick="location.href='/qna/list.do'">목록</button> 
</div>
</form>



</table>
</body>
</html>