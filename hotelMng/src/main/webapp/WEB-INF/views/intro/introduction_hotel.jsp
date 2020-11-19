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
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
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
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>
    </body>
</html>