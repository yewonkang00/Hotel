<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
		* {
			font-family: 'Noto Sans KR', sans-serif;
		}
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
			overflow:auto;
			vertical-align:top;
			padding:8px;
			box-sizing:border-box;
			border:solid 1px #aaa;
		}

		table {
			border-collapse: collapse;
			border-spacing: 0;
			table-layout: fixed;
			border-spacing: 0;
			width: 100%;
		}
	</style>

		<meta charset="UTF-8">
		<title>Qna</title>
		<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
		<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

	<script type="text/javascript">
	function list(page){
		location.href="/qna/list.do?curPage="+page
	}
	</script>

</head>
<body>
	<div class=header>
		<a href="/main"><img src="/resources/image/moon.png" width="100" height="100"></a>
<%--		<div class=logo></div>--%>
<%--		<span class=topmenu>--%>
<%--			<a href="login.html">로그인</a>--%>
<%--			<a>마이페이지</a>--%>
<%--			<a href="res_confirm.html">예약 확인</a>--%>
<%--		</span>--%>
		<nav>
			<span><a href="intro.html">호텔 소개</a></span>
			<span><a href="room.html">객실</a></span>
			<span><a href="restaurant.html">레스토랑</a></span>
			<span><a href="res.html">예약</a></span>
			<span><a href="res_confirm.html">예약 확인</a></span>
			<span><a href="qna.html">고객문의</a></span>
			<span><a href="facility.html">편의시설</a></span>
			<span><a href="login.html">로그인</a></span>
		</nav>
	</div>

	<div class=contain>
		<div class=left>
			<div class=banner>
				<h2 class=tit>문의 사항</h2>
				<ul class=menu>
					<li class="m1">
						<a href="qna.html">
							<span>자주 하는 질문</span>
						</a>
					</li>
					<li class="m2">
						<a href="write_qna.html">
							<span>문의하기</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class=contents>
			<h1>자주 하는 질문</h1>
			<h2>게시판</h2>
			<button type="button" id="btnWrite" onclick="location.href='/qna/write.do'">글쓰기</button>
			${map.count}개의 문의사항이 있습니다.

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

						<td><a href = "/qna/view.do?QNACODE=${row.QNACODE}&curPage=${map.pager.curPage}">${row.QNATITLE}</a></td>

						<td>${row.QNAWRITER}</td>
						<td><fmt:formatDate value="${row.QNAREGISTERDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${row.QNAVIEWCOUNT}</td>
					</tr>
				</c:forEach>
				<!-- 페이지 네비게이션 -->
				<tr>
					<td colspan="5" align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="javascript:list('1')">[처음]</a>
						</c:if>

						<c:if test = "${map.pager.curBlock > 1}">
							<a href= "javascript:list('${map.pager.blockBegin}')">[이전]</a>
						</c:if>

						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num==map.pager.curPage}">
									<span style="color:red;">${num}</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="javascript:list('${num}')">${num}</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
							<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curPage <= map.pager.totPage}">
							<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>


	<div class="finish">
		<p> 사업자 번호: 110-10-12345<br/>
			사업장소재지: 경기도 이천시 마장면 장암리<br/>
			대표자: 홍길동<br/>
			Copyright ⓒ 2020 Hotel Group. All rights reserved.
		</p>
	</div>

</body>
</html>