<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin-left:auto;
                margin-right: auto;
                padding:0px;
                background-color: white;
                font-family:나눔고딕;
            }
            a {
                color:#111111;
            }
            a { text-decoration:none } 
            .header{
                margin-left:auto;
                margin-right: auto;
                background-color: #D4C1A1;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                height: 50px;
                text-align: center;
                padding: 8px;
                color: #111111;
                font-size: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header nav {
                list-style-type: none;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .header nav span {
                display:inline-block;
                font-size: 15px;
                padding: 20px;
            }
            .banner{
                background-image: url("/resources/image/oria-hotel-4636405_1280.jpg");
                background-size: cover;
                margin-top: auto;
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
            .finish {
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }

        </style>
        <title>Welcom Delluna!</title>

    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="100" height="100">
            <nav>
                <span><a href="menu.html">호텔 소개</a></span>
                <span><a href="menu.html">객실</a></span>
                <span><a href="menu.html">레스토랑</a></span>
                <span><a href="menu.html">예약</a></span>
                <span><a href="menu.html">예약 확인</a></span>
                <span><a href='/qna/list.do'>고객문의</a></span>
                <span><a href="/login.do">편의시설</a></span>
                <span><a href="/login.do">로그인</a></span>
            </nav>
            
            
        </div>

        <div class=banner>
        </div>
        <div class=contents>
            <p> 안녕하세요</p>
            <p> 가나다라</p>
            <p> 마바사아</p>
            <b><p> 브런치 타임: AM 11:30 ~ PM 1:30</p>
            <p> 영업시간 : AM 10:00 ~ PM 9:00</p></b>
            <p>
                <img src="/resources/image/hotel2.jpg" width="300">
        
        <p>
            <a href="reservationqa.html">호텔 예약 문의하기</a></div>
        <div class="finish">
            <p> 사업자 번호: 110-10-12345<br/>
                사업장소재지: 경기도 이천시 마장면 장암리<br/>
                대표자: 홍길동<br/>
                Copyright ⓒ 2020 Hotel Group. All rights reserved.
            </p>
        </div>
    </body>
</html>