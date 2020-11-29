<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>

            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }

        </style>
        <title>Welcom Delluna!</title>
        
         <script type="text/javascript">
        	var sessionLevel = '${member.userLevel}';
	
			if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
				alert("관리자 권한이 없습니다.");
				location.href="/main";
			}
		</script>

    </head>
    <body>
    <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
        <div class=banner_main></div>
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
    <%@include file = "/WEB-INF/views/admin/admin_final.jsp" %>
    </body>
</html>