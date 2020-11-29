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
        <title>Room Detail</title>

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

			function rescancel(reservationCode) {
				var reservationCode = reservationCode;
				var data = {"reservationCode" : reservationCode};
				var confirm_test = confirm("예약을 취소하시겠습니까?");
				if(confirm_test == true) {
					location.href="/reservationCancel?rcode="+reservationCode;
					alert("취소되었습니다.");
					location.href="/admin/reservation.do?rno="+${reservationVo.roomCode};
				}
				else{
				location.href="/admin/reservationDetailAction.do?reservationCode=" + reservationCode;
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
    	<p style="text-align:center;">객실 상세</p>
    	<table border="1">
        <tr>
	        <td>Room No</td>
	        <td>Room Type</td>
	        <td>Bed Type</td>
	        <td>Max People</td>
	        <td>Room View</td>
	        <td>Composition</td>
	        <td>Things</td>
	        <td>Fee</td>
	        <td>Manager</td>
        </tr>
		<tr>
		<td>${roomDetail.roomNo}</td>
		<td>${roomDetail.roomType}</td>
		<td>${roomDetail.bedType}</td>
		<td>${roomDetail.roomMaxPeople}</td>
		<td>${roomDetail.roomView}</td>
		<td>${roomDetail.composition}</td>
		<td>${roomDetail.things}</td>
		<td>${roomDetail.fee}</td>
		<td>${roomDetail.managerCode}</td>
		</tr>
		</table>


    </div>

</body>
</html>
