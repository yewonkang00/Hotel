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
    <link rel="stylesheet" href="/resources/image/moon.png" type="text/css">
    <link rel="stylesheet" href="/resources/css/style_room.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

    <title>rooms</title>
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
<div class=contain>
    <div class=left>
        <div class=banner>
            <h2 class=tit><a href="/room_main.do">객실 소개</a></h2>
            <ul class=menu>
                <li class="m1">
                    <a href="/room_standard.do">
                        <span>Standard Room</span>
                    </a>
                </li>
                <li class="m2">
                    <a href="/room_deluxe.do">
                        <span>Deluxe Room</span>
                    </a>
                </li>
                <li class="m3">
                    <a href="/room_executive.do">
                        <span>Executive Room</span>
                    </a>
                </li>
                <li class="m4">
                    <a href="/room_suite.do">
                        <span>Suite Room</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class=contents>
        <h3>감각적인 인테리어와 함께한 DB다이렉트 객실은 품격있는 라이프스타일 공간입니다.</h3>
        <div class=intbox>
            <div class=lbox>
                <h3><b>Standard Room</b></h3>
                <a href="/room_standard.do"><img src="/resources/image/standardroom.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>아늑하고 깔끔한 분위기로 편안한 휴식을 취할 수 있습니다.<br></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Deluxe Room</b></h3>
                <a href="/room_deluxe.do"><img src="/resources/image/deluxe room.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>여유로운 휴식을 취할 수 있습니다.<br></p>
                </div>
            </div>
            <div class=lbox>
                <h3><b>Executive Room</b></h3>
                <a href="/room_executive.do"><img src="/resources/image/executive room.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>이그제큐티브 라운지 이용으로 특별한 여유를 즐길 수 있습니다.<br></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Suite Room</b></h3>
                <a href="/room_suite.do"><img src="/resources/image/suiteroom.jpg" width="300" height="220"></a>
                <div class=topexp>
                    <p>DB다이렉트만의 품격을 갖춘 공간으로 특별한 경험을 누릴 수 있습니다.<br></p>
                </div>
            </div>
        </div>
    </div>
    <div class="finish">
        <p> 사업자 번호: 110-10-12345<br/>
            사업장소재지: 경기도 이천시 마장면 장암리<br/>
            대표자: 궈닌돌<br/>
            Copyright ⓒ 2020 Hotel Group. All rights reserved.
        </p>
    </div>
</div>
</body>
</html>