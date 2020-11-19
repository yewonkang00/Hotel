<%--
  Created by IntelliJ IDEA.
  User: Minji
  Date: 2020-11-18
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>header</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_room.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
    <div class=header>
    <a href="/main"><img src="/resources/image/moon.png" width="100" height="100"></a>
    <nav>
    <span><a href="/intro.do">호텔 소개</a></span>
    <span><a href="/room_main.do">객실</a></span>
    <span><a href="restaurant.html">레스토랑</a></span>
    <span><a href="res.html">예약</a></span>
    <span><a href="res_confirm.html">예약 확인</a></span>
    <span><a href="/qna/list.do">고객문의</a></span>
    <span><a href="facility.html">편의시설</a></span>
    <span>
    <c:choose>
        <c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
        <c:otherwise><a href="/login.do">로그인</a></c:otherwise>
    </c:choose>
    </span>
    </nav>
    </div>
</body>
</html>
