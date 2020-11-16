<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>    
 * {
    font-family: 'Noto Sans KR', sans-serif;
   }
</style>

<meta charset="utf-8">
<link rel="stylesheet" href="/resources/css/styleintro.css"
	type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">


<title>Welcome Delluna!</title>

</head>

<body>
	<div class=header>
		<img src="/resources/image/moon.png" width="100" height="100">
		<nav>
			<span><a href="/intro.do">호텔 소개</a></span> <span><a
				href="/suite_room.do">객실</a></span> <span><a href="menu.html">레스토랑</a></span> <span><a
				href="menu.html">예약</a></span> <span><a href="menu.html">예약 확인</a></span> <span><a
				href="menu.html">고객문의</a></span> <span><a href="/login.do">편의시설</a></span>
			<span><a href="/login.do">로그인</a></span>
		</nav>

	</div>

	<div class=contain>
		<div class=left>
			<div class=banner>
				<h2 class=tit>호텔 소개</h2>
				<ul class=menu>
					<li class="m1"><a href="/intro.do"> <span>개요</span>
					</a></li>
					<li class="m2"><a href="/intro_hotel.do"> <span>호텔땡땡</span>
					</a></li>
				</ul>
			</div>
		</div>

		<div class=contents>
			<h2 id=gaeyo>개요</h2>
			<img src="/resources/image/hotel.jpg" width=650px height=400>
			<h3>
				<b>DB다이렉트 GROUP AFFILIATE</b>
			</h3>
			<p>
				호텔 DB다이렉트는 수많은 국빈의 방문과 국제행사를 치러내며 ‘DB 그룹을 대표하는 얼굴’, ‘한국을 대표하는 호텔’<br>로서
				자부심과 책임감을 가지고 우리나라 서비스 산업의 견인차 역할을 해오고 있습니다.<br> 호텔 DB 다이렉트는 천년
				역사와 함께 가장 찬란한 문화예술의 꽃을 피웠던 신라 왕조의 이름에서 유래하였으며,<br> 홍길동 회장의 뜻에
				따라 2000년 0월 개관하였습니다.<br> <br>
			</p>
			<h3>
				<b>THE BEST HOSPITALITY COMPANY</b>
			</h3>
			<p>
				호텔 DB다이렉트는 ‘최고의 호스피탈리티 기업’을 목표로 오랜 세월동안 품위와 전통을 유지하며<br> 고객들의
				마음을 사로잡아 왔습니다.<br> <br>
			</p>
			<h3>
				<b>VISION</b>
			</h3>
			<p>
				최고의 품격과 신뢰를 바탕으로 고객이 꿈꾸는 라이프스타일을 제공하는 글로벌 선도기업<br> <br>
			</p>
			<h3>
				<b>MISSION</b>
			</h3>
			<p>
				우리는 최고의 라이프스타일 전문가로서 더 많은 인류에게 품격과 자부심을 경험케 한다.<br> <br>
			</p>
		</div>
	</div>
	<div class="finish">
		<p>
			사업자 번호: 110-10-12345<br /> 사업장소재지: 경기도 이천시 마장면 장암리<br /> 대표자: 홍길동<br />
			Copyright ⓒ 2020 Hotel Group. All rights reserved.
		</p>
	</div>
</body>
</html>