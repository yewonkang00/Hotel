<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style_room.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
          * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        </style>
        <title>Welcom Delluna!</title>
         
  
    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <p>

		<p>
        <div class=contents>
        <p>Room LIST</p>
        <table border="1">
        <tr><td>No</td><td>RoomNO</td><td>RoomType</td><td>RoomMaxPeople</td><td>RoomFee</td><td></td>
			<c:forEach items="${roomList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.roomNo}</td>
				<td>${item.roomType}</td>
				<td>${item.roomMaxPeople}</td>
				<td>${item.roomFee}</td>
				<td><input type="button" value="예약" class="submit-btn" onClick="javaScript:location.href='/reservation.do?rno=${item.roomNo}';">	</td>
			</tr>
			</c:forEach>
		</table>
        </div>
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>

</body>

</html>