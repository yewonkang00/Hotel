<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>
<h2>게시판</h2>
<button type="button" id="btnWrite" onclick="location.href='/qna/write.do'">글쓰기</button>

<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.QNACODE}</td>
		<td>${row.QNATITLE}</td>
		<td>${row.QNAWRITER}</td>
		<td><fmt:formatDate value="${row.QNAREGISTERDATE}" 
		pattern="yyyy-mm-dd HH:mm:ss"/></td>
		<td>${row.QNAVIEWCOUNT}</td>
	</tr>
</c:forEach>

</table>
</body>
</html>