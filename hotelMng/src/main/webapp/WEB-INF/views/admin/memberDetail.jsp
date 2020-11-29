<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
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
        
         <script type="text/javascript">
			
         	
	       	var sessionLevel = '${member.userLevel}';
	
			if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
				alert("관리자 권한이 없습니다.");
				location.href="/main";
			}

			function dateAdd(sDate, nNum) {
	    		var yyyy = parseInt(sDate.substr(0, 4), 10);
	    		var mm = parseInt(sDate.substr(4, 2), 10) - 1;
	    		var dd = parseInt(sDate.substr(6, 2), 10);

	    		nNum *= 1;
	    		nNum = nNum;
	    		var newDt = new Date(yyyy,mm,dd);
	    		newDt.setDate( newDt.getDate() + nNum );
	    	    var year = newDt.getFullYear();
	    	    var month = newDt.getMonth()+1;
	    	    var day = newDt.getDate();
	    	    if(month < 10){
	    	        month = "0"+month;
	    	    }
	    	    if(day < 10){
	    	        day = "0"+day;
	    	    }
	    	 
	    	    var today = year+""+month+""+day;
				return today;
	        } 

	        function memberDelete(userId) {
				var UserId = userId;
				var confirm_test = confirm("회원을 삭제하시겠습니까?");
				if(confirm_test == true) {
					location.href="/admin/memberDelete?userId=${memberDetail.userId}";
					alert("삭제되었습니다.");
					location.href="/admin/memberList";
				}
				else{
				location.href="/admin/memberDetail.do?userId=${memberDetail.userId}";
				}
		    }
	        
		</script>

    </head>
<body>
	<div class=header>
            <a href="/admin"><img src="/resources/image/moon.png" width="100" height="100">
            <nav>
                <span><a></a></span>
                <span><a href="/admin/memberList">회원 List</a></span>
                <span><a href="/admin/roomList">객실 List</a></span>
                <span><a href="/admin/reservationList">예약 List</a></span>
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
    	<p style="text-align:center;">회원 정보</p>
    	<table border="1">
        <tr>
	        <td>User ID</td>
	        <td>User Name</td>
	        <td>Grade</td>
	        <td>Phone Num</td>
	        <td>Email</td>
	        <td>Mileage</td>
	        <td>Birth</td>
        </tr>
		<tr>
		<td>${memberDetail.userId}</td>
		<td>${memberDetail.userName}</td>
		<td>${memberDetail.userGrade}</td>
		<td>${memberDetail.userPhone}</td>
		<td>${memberDetail.userEmail}</td>
		<td>${memberDetail.userMile}</td>
		<td>${memberDetail.userBirth}</td>
		<%-- <td>${reservationVo.userId}</td>
		<td>${reservationVo.reservationPeopleNumber}</td>
		<td>${reservationVo.reservationCheckIn}</td>
		<td>${reservationVo.reservationDate}</td>
		<td>${reservationVo.reservationDays}</td>
		<td>${reservationVo.reservationMemo}</td>
		<td>${reservationVo.breakfast}</td>
		<td>${reservationVo.totalPrice}</td> --%>
		</tr>
		</table>
		<br>
		<input type="button" value="회원삭제" class="submit-btn" onClick="javaScript:memberDelete('${memberDetail.userId}')">
		<br><br>
		<p style="text-align:center;">예약 정보</p>
		<table border="1">
		<thead>
        <tr>
        	<td>Reservation Code</td>
	        <td>CheckIn</td>
	        <td>CheckOut</td>
	        <td>PeopleNum</td>
	        <td>Days</td>
	        <td>Breakfast</td>
	        <td>Total Price</td>
	        <td>Memo</td>
        </tr>
        </thead>
		<c:forEach items="${resDetail}" var="item" varStatus="idx">
		<tr>
		<td><a href="/admin/reservationDetailAction.do?reservationCode=${item.reservationCode}";>${item.reservationCode}</td>
		<td>${item.reservationCheckIn}</td>
		<td>${item.reservationCheckOut}</td>
		<td>${item.reservationPeopleNumber}</td>
		<td>${item.reservationDays}</td>
		<td>${item.breakfast}</td>
		<td>${item.totalPrice}</td>
		<td>${item.reservationMemo}</td>
		</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>