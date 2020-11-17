<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
        <style>

            .banner{
                background-image: url("/resources/image/oria-hotel-4636405_1280.jpg");
                background-size: cover;
                margin-top: auto;
                margin-left: 0;
                width: auto;
                height: 700px;
            }
            
            .contents{
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                min-height: 500px;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }

            .index_contents{
                margin-left: 45px;
            }

        </style>
        <title>Welcom Delluna!</title>

    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="100" height="100">
            <nav>
                <span><a href="/intro.do">호텔 소개</a></span>
                <span><a href="/room_main.do">객실</a></span>
                <span><a href="menu.html">레스토랑</a></span>
                <span><a href="menu.html">예약</a></span>
                <span><a href="menu.html">예약 확인</a></span>
                <span><a href="menu.html">고객문의</a></span>
                <span><a href="/login.do">편의시설</a></span>
                <span>
                	<c:choose>
   						<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
   						<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
   					</c:choose>
                </span>
            </nav>
            
        </div>

        <div class=banner>
        </div>
        <div class=contain>
            <div class=index_contents>
                <p> 안녕하세요</p>
                <p> 가나다라</p>
                <p> 마바사아</p>
                <b><p> 브런치 타임: AM 11:30 ~ PM 1:30</p>
                    <p> 영업시간 : AM 10:00 ~ PM 9:00</p></b>
                <p>
                    <img src="/resources/image/hotel2.jpg" width="300">
                <p>

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