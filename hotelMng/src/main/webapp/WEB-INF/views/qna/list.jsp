<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<title>Insert title here</title>

<style>
        body {
          background-color: #EEEFF1;
        }
        .contain {
            background-color: #EEEFF1;
        }
        #content {
            position: absolute;
            left: 50%;
            transform: translate(-50%);
            width: 460px;
        }
        #btnJoin {
            width: 30%;
        }
        h3.tit_ {
            font-size:15px
        }
        .finish {
            background-color: #EEEFF1;
        }
    </style>
  </head>



<body>
  <div class=header>
      <img src="/resources/image/moon.png" width="80" height="80s"></a>
      <nav>
        <span><a href="/intro.do">호텔 소개</a></span>
        <span><a href="/room.do">객실</a></span>
        <span><a href="menu.html">레스토랑</a></span>
        <span><a href="menu.html">예약</a></span>
        <span><a href="menu.html">예약 확인</a></span>
        <span><a href="/qna/list.do">고객문의</a></span>
        <span><a href="/login.do">편의시설</a></span>
        <span>
        	<c:choose>
			<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
			<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
			</c:choose>
        </span>
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