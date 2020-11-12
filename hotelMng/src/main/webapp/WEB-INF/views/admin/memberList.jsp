<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
            <img src="moon.png" width="100" height="100">
            <nav>
                <span><a href="memberList.do">회원리스트</a></span>
                <span><a href="room.do">객실List</a></span>
                <span><a href="/login.do">로그인</a></span>
            </nav>
            
        </div>
        <p>

		<p>
        <div class=contents>
                <p style="text-align:center;">회원 LIST</p>
        <table border="1">
        <tr><td>No</td><td>USER ID</td><td>NAME</td><td>LEVEL</td></tr>
			<c:forEach items="${memberList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.userId}</td>
				<td>${item.userName}</td>
				<td>${item.userLevel} <br> 
			<input type="submit" value="Update" class="submit-btn" onClick="join();">
			</td>			
			</tr>
			</c:forEach>
		</table>
        </div>
    </body>
</html>