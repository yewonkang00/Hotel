<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
  		<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
  		<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
        <title>Welcom Delluna!</title>

    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="80" height="80s">></a>
            <nav>
                <span><a href="intro.html">호텔 소개</a></span>
                <span><a href="room.html">객실</a></span>
                <span><a href="restaurant.html">레스토랑</a></span>
                <span><a href="res.html">예약</a></span>
                <span><a href="res_confirm.html">예약 확인</a></span>
                <span><a href="qna.html">고객문의</a></span>
                <span><a href="facility.html">편의시설</a></span>
                <span>
		        	<c:choose>
		  				<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
		   				<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
		   			</c:choose>
		        </span>
            </nav>

        </div>
        <div class=res_content>
          <div class=res_search>
            <h2>객실</h2>
            <div class=res_res>
              <form name="srchRoomFrm" id="res_form" method="post">
                <p>Direct Hotel</p>
                <p>객실</p>
                <input type="text" id="res_adult" value="Deluxe" title="성인">
                <p>기간</p>
								<input type="text" id="res_period" value="2020.12.16 - 2020.12.17">
                <p>성인</p>
								<input type="text" id="res_adult" value="1" title="성인">
								<p>어린이</p>
								<input type="text" id="res_child" value="0" title="어린이">
							  <button type="button" id="res_btn" onclick="location.href='res2.html'">검색</button>
				    	</form>
            </div>
          </div>
          <p>201호</p>
          <img src="hotel.jpg" width=200px height=150>
          <button type="button" id="res_btn" onclick="location.href='res2.html'">이 방 선택</button>
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