<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            ::-webkit-scrollbar {
                display: none;
            }
            a {
                color:#111111;
                text-decoration:none
            }
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }
            
            .contain{
                width: 1200px;
				margin-top:30px;
                min-height: 500px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .index_contents {
                margin-left: 45px;
            }

        </style>
        <title>Welcome Delluna!</title>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <div class=banner_main></div>
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
	            	<a href="reservationqa.html">호텔 예약 문의하기</a>
	    	</div>
        </div>
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>
    </body>
</html>