<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
        </style>
        <title>Reservation List</title>


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

        <div class=contents>
			<p style="text-align:center;">예약 LIST</p>
			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="text-align: center">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="RoomNo">호실</option>
						<option value="Resdate">날짜</option>
					</select>
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
				<br>
			</div>
			<!-- search{e} -->
        	<table class="table table-hover">
			<thead>
				<tr>
					<td>No</td>
					<td>Room Code</td>
					<td>USER ID</td>
					<td>Reservation Check IN</td>
					<td>Reservation Check OUT</td>
					<td>People Num</td>
					<td>Reservation Date</td>
				</tr>
			</thead>

			<c:forEach items="${reservationList}" var="item" varStatus="idx">
			<tr>
				<td>${item.reservationCode}</td>
				<td>${item.roomCode}</td>
				<td><a href="/admin/memberDetail.do?userId=${item.userId}">${item.userId}</td>
				<td>${item.reservationCheckIn}</td>
				<td>${item.reservationCheckOut}</td>
				<td>${item.reservationPeopleNumber}</td>
				<td>${item.reservationDate}</td>
			</tr>
			</c:forEach>
		</table>
        </div>
    <!-- pagination{e} -->

</body>

</html>
