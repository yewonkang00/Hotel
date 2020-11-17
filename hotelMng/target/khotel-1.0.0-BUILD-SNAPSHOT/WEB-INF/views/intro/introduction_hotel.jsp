<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
    <head>

    <style>	
       * {
           font-family: 'Noto Sans KR', sans-serif;
         }
	</style>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/image/moon.png" type="text/css">
        <link rel="stylesheet" href="/resources/css/styleintro_hotel.css" type="text/css">
        <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">


        <title>Welcome Delluna!</title>

    </head>
    <body>
        <div class=header>
          <a href="index.html"><img src="/resources/image/moon.png" width="80" height="80s"></a>
          <nav>
              <span><a href="/intro.do">호텔 소개</a></span>
              <span><a href="/room_main.do">객실</a></span>
              <span><a href="restaurant.html">레스토랑</a></span>
              <span><a href="res.html">예약</a></span>
              <span><a href="res_confirm.html">예약 확인</a></span>
              <span><a href="qna.html">고객문의</a></span>
              <span><a href="facility.html">편의시설</a></span>
              <span><a href="/login.do">로그인</a></span>
            </nav>

        </div>
        <div class=contain>
            <div class=left>
              <div class=banner>
                <h2 class=tit>호텔 소개</h2>
                <ul class=menu>
                  <li class="m1">
                    <a href="/intro.do">
                      <span>개요</span>
                    </a>
                  </li>
                  <li class="m2">
                    <a href="/intro_hotel.do">
                      <span>호텔땡땡</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class=contents>
              <img src="/resources/image/room.jpg" width=650px height=400>
              <div class="intro">
                <div class=intro_left>
                  <h3>휴양지 Lifecity Hotel</h3>
                  <p>국내 최고의 휴양지 제주에 위치해<br>
                     있으며 주변엔 중문관광단지, 중문해수욕장<br>
                      등 다양한 관광지들이 있다.</p>
                </div>
                <div class=intro_right>
                  <h3>휴양지 Hotel</h3>
                  <p>국내 최고의 휴양지 제주에 위치해<br>
                     있으며 주변엔 중문관광단지, 중문해수욕장<br>
                      등 다양한 관광지들이 있다.</p>
                </div>
              </div>
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