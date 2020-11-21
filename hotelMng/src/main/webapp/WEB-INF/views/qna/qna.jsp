<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<title>문의사항</title>
<style>
body {
	background-color: #EEEFF1;
}

.contain {
	background-color: #EEEFF1;
}

.finish {
	background-color: #EEEFF1;
}

textarea {
	overflow: auto;
	vertical-align: top;
	padding: 8px;
	box-sizing: border-box;
	border: solid 1px #aaa;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	border-spacing: 0;
	width: 100%;
}

.tbData td {
	padding: 14px 20px 14px 20px;
}

.tbData tbody th:first-child {
	border-left: none;
}

.tb-1 td.fm {
	padding-top: 16px;
	padding-bottom: 16px;
}
</style>
</head>

<body>
<%@include file = "/WEB-INF/views/layout/header.jsp" %>
	<div class=contain>
		<div class=left>
			<div class=banner>
				<h2 class=tit>문의 사항</h2>
				<ul class=menu>
					<li class="m1"><a href="qna.html"> <span>자주 하는 질문</span>
					</a></li>
					<li class="m2"><a href="write_qna.html"> <span>문의하기</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class=contents>
			<h1>자주 하는 질문</h1>
		</div>
		<%@include file = "/WEB-INF/views/layout/final.jsp" %>
	</div>

</body>
</html>