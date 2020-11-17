<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <title>Suite room</title>

    </head>
    <body>
        <div class=header>
            <a href="/main"><img src="/resources/image/moon.png" width="100" height="100"></a>
            <nav>
              <span><a href="/intro.do">호텔 소개</a></span>
              <span><a href="/room.do">객실</a></span>
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
            <h1>Suite Room</h1>
            <img src="/resources/image/suiteroom.jpg" width="800" height="500">
            <p> 스위트룸은 프라이빗한 휴식을 즐길 수 있는 객실입니다.<br/>
                스위트룸과 함께 최고의 휴식을 경험해보십시오.<br/>
                문의전화 02-0000-0000<br/>
                전망 : 시티 뷰 | 침대 : 더블(킹 사이즈) | 크기 : 159m<br/>
                룸 구성 : 침실 1, 욕실 1, 화장실 2, 응접실 1, 집무실 1, 다이닝 룸 1<br/>
            </p>
            <table class=roomtb>
              <thead>
                <tr>
                  <th scope="row">객실이용</th>
                  <td>65인치 스마트 TV<br/>
                      50~100Mbps 초고속 유무선(wifi) 인터넷 무료<br/>
                      220V, 110V 전압 사용 가능<br/>
                      커피, 차 티백 무료 제공<br/>
                      엑스트라 베드 1개 추가 30,000원/1박<br/>
                  </td>
                </tr>
                <tr>
                  <th scope="row">부대시설</th>
                  <td>피트니스 클럽 이용 안내<br/>
                      -체육관 무료 이용<br/>
                      -실내 수영장 무료 이용<br/>
                      -사우나 무료 이용<br/>
                      -피트니스 클럽은 매월 둘 째 월요일 정기휴일입니다.<br/>
                      투숙 기간 내 무료 주차 가능<br/>
                  </td>
                </tr>
                <tr>
                  <th scope="row">룸서비스</th>
                  <td>객실에서 즐기실 수 있는 다양한 룸서비스가 준비되어 있습니다.<br/>
                      식사 및 음료 : 24시간 서비스<br/>
                  </td>
                </tr>
            </table>
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