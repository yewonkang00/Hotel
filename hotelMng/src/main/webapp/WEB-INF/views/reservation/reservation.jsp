<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
  		<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
  		<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
        <title>Welcome Delluna!</title>

    </head>
    <body>
    <%@include file = "/WEB-INF/views/layout/header.jsp" %>
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
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>
    </body>
</html>