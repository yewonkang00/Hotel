<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
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
            a {
                color:#111111;
            }
            a { text-decoration:none } 
            .header{
                margin-left:auto;
                margin-right: auto;
                background-color: #D4C1A1;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                height: 50px;
                text-align: center;
                padding: 8px;
                color: #111111;
                font-size: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header nav {
                list-style-type: none;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .header nav span {
                display:inline-block;
                font-size: 15px;
                padding: 20px;
            }
            .banner{
                background-image: url("/resources/image/oria-hotel-4636405_1280.jpg");
                background-size: cover;
                margin-top: auto;
                width: auto;
                height: 700px;
            }
            
            .contents{
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                min-height: 500px;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .finish {
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }

        </style>
        <title>Welcom Delluna!</title>
         
  
    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="100" height="100">
            <nav>
                <span><a href="/admin/memberList">회원리스트</a></span>
                <span><a href="/admin/roomList">객실List</a></span>
                <span>
		        	<c:choose>
		  				<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
		   				<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
		   			</c:choose>
       			</span>
            </nav>
            
        </div>
        <p>

		<p>
        <div class=contents>
                <p style="text-align:center;">Room LIST</p>
        <table border="1">
        <tr><td>No</td><td>RoomNO</td><td>RoomType</td><td>RoomMaxPeople</td><td>RoomFee</td><td></td>
			<c:forEach items="${roomList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.roomNo}</td>
				<td>${item.roomType}</td>
				<td>${item.roomMaxPeople}</td>
				<td>${item.roomFee}</td>
				<td><input type="button" value="예약" class="submit-btn" onClick="javaScript:location.href='/admin/reservation.do?rno=${item.roomNo}';">	</td>
			</tr>
			</c:forEach>
		</table>
        </div>
 

	</div>
	



</body>

</html>