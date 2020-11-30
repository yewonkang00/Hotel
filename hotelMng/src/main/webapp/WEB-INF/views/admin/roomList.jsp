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
        <title>Room List</title>
       	<script type="text/javascript">
       	function standard() {
			
        } 
        </script>

    </head>
	<script type="text/javascript">
			
		var sessionLevel = '${member.userLevel}';
		
		if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
			alert("관리자 권한이 없습니다.");
			location.href="/main";
		}
	</script>
    <body>
        <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>

        <div class=contents>
            <p style="text-align:center;">ROOM LIST</p>
            <!-- <button type="button" id="standard" onClick="standard()">standard</button>
            <button type="button" id="deluxe" onClick="deluxe()">deluxe</button>
            <button type="button" id="executive" onClick="executive()">executive</button>
            <button type="button" id="suite" onClick="suite()">suite</button>
            <br><br> -->
            <div class="form-group row justify-content-center">
				<div class="w100" style="text-align: center">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="RoomNo">호수</option>
					</select>
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
                    <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
				<br>

			</div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <td>No</td>
                        <td>RoomNo</td>
                        <td>RoomType</td>
                        <td>BedType</td>
                        <td>RoomMaxPeople</td>
                        <td>RoomFee</td>
                        <td> </td>
                    </tr>
                </thead>

                <c:forEach items="${roomList}" var="item" varStatus="idx">

                <tr>
                    <td>${idx.index+1}</td>
                    <td><a href="/admin/roomDetail.do?rno=${item.roomNo}">${item.roomNo}</a></td>
                    <td>${item.roomType}</td>
                    <td>${item.bedType}</td>
                    <td>${item.roomMaxPeople}</td>
                    <td>${item.fee}</td>
                    <td><input type="button" value="예약" class="submit-btn" onClick="javaScript:location.href='/admin/reservation.do?rno=${item.roomNo}';">	</td>
                </tr>

                </c:forEach>
            </table>
        </div>


</body>

</html>