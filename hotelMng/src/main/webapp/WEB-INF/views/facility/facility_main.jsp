<%--
  Created by IntelliJ IDEA.
  User: Minji
  Date: 2020-11-25
  Time: 오후 6:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_facility.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

    <title>Facility</title>
</head>
<body>
<%@include file = "/WEB-INF/views/layout/header.jsp" %>
<div class=contain>
    <div class=left>
        <h2 class=tit><a href="/facility_main.do">시설 소개</a></h2>
        <ul class=menu>
            <li class="m1">
                <a href="rounge.html">
                    <span>The Executive Rounge</span>
                </a>
            </li>
            <li class="m2">
                <a href="pool.html">
                    <span>Outdoor Pool</span>
                </a>
            </li>
            <li class="m3">
                <a href="fitness.html">
                    <span>Fitness</span>
                </a>
            </li>
            <li class="m4">
                <a href="banquet_hall.html">
                    <span>Banquet Hall</span>
                </a>
            </li>
        </ul>
    </div>
    <div class=contents>
        <h2 id=gaeyo>DB호텔은 당신의 완벽한 휴식을 책입집니다.</h2>
        <div class=intbox>
            <div class=lbox>
                <h3><b>The Executive Rounge</b></h3>
                <a href="rounge.html"><img src="/resources/image/rounge.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>DB호텔만의 차별화된 품격이 돋보이는 이그제큐티브 라운지에서 특별한 다이닝 경험을 만들 수 있습니다. <br></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Outdoor Pool</b></h3>
                <a href="pool.html"><img src="/resources/image/pool.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>탁 트인 전망을 즐기며 여유로운 휴식을 취할 수 있습니다.<br></p>
                </div>
            </div>
            <div class=lbox>
                <h3><b>Fitness</b></h3>
                <a href="fitness.html"><img src="/resources/image/indoor pool.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>실내 수영장, 실내 체육관, 실내 골프장, 사우나를 즐길 수 있습니다.<br></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Banquet Hall</b></h3>
                <a href="banquet_hall.html"><img src="/resources/image/banquet hall.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>웨딩뿐 아니라 기업연회, 가족연회까지 DB호텔만의 품격있는 연회장과 함께 하십시오.<br></p>
                </div>
            </div>
        </div>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>