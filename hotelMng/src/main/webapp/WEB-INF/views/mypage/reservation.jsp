<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style>
        body {
          background-color: #EEEFF1;
        }
        .contain {
            background-color: #EEEFF1;
        }
        .finish {
            background-color: #EEEFF1;
        }
      textarea {
          overflow:auto;
          vertical-align:top;
          padding:8px;
          box-sizing:border-box;
          border:solid 1px #aaa;
      }

      table {
          border-collapse: collapse;
          border-spacing: 0;
          table-layout: fixed;
          border-spacing: 0;
          width: 100%;
      }
      .tbData td {padding:14px 20px 14px 20px;}
      .tbData tbody th:first-child { border-left:none; }
      .tb-1 td.fm { padding-top:16px; padding-bottom:16px; }

    </style>
    <title> 예약 확인/취소 </title>
    
    <script type="text/javascript">
    	function rescancel(reservationCode) {
    		var reservationCode = reservationCode;
			var data = {"reservationCode" : reservationCode};
			var confirm_test = confirm("예약을 취소하시겠습니까?");
			if(confirm_test == true) {
				location.href="/reservationCancel?rcode="+reservationCode;
				alert("취소되었습니다.");
			}
			location.href="/mypage/reservation";
			
        }
        
    	function dateAdd(sDate, nNum) {
    		var yyyy = parseInt(sDate.substr(0, 4), 10);
    		var mm = parseInt(sDate.substr(4, 2), 10) - 1;
    		var dd = parseInt(sDate.substr(6, 2), 10);

    		nNum *= 1;
    		nNum = nNum -1;
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
    </script>

  </head>

<body>
  <%@include file = "/WEB-INF/views/layout/header.jsp" %>

  <div class=contain>
    <div class=left>
          <h2 class=tit>마이 페이지</h2>
            <ul class=menu>
              <li class="m1">
                <a href="mypage_dbreward.html">
                  <span>DB 리워즈</span>
                </a>
              </li>
              <li class="m2">
                <a href="mypage_reservation.html">
                  <span>예약 확인/취소</span>
                </a>
              </li>
              <li class="m3">
                <a href="mypage_personal.html">
                  <span>개인 정보</span>
                </a>
              </li>
              <li class="m4">
                <a href="mypage_qna.html">
                  <span>문의 내역</span>
                </a>
              </li>
            </ul>
    </div>
    <div class=contents>
      <h1>예약 확인/취소</h1>
      <h5>*당일 취소 불가</h5>
      <table border="1">
      	<tr>
      	<td>No</td>
      	<td>체크인</td>
      	<td>체크아웃</td>
      	<td>숙박일 수</td>
      	<td>예약 날짜</td>
      	<td>예약 호실</td>
      	<td>조식 여부</td>
      	<td>결제 금액</td>
      	<td></td>
      	<c:forEach items="${reservation}" var="item" varStatus="idx"> 
      	<tr>
      		<td>${idx.index+1}</td>
      		<td>${item.reservationCheckIn}</td>
      		<td>
			<script type="text/javascript">
			document.write(dateAdd('${item.reservationCheckOut}',2));
			</script>
			</td>
      		<td>${item.reservationDays}</td>
      		<td>${item.reservationDate}</td>
      		<td>${item.roomCode}</td>
      		<td>${item.breakfast}</td>
      		<td>${item.totalPrice}</td>
      		<jsp:useBean id="today" class="java.util.Date" />
			<fmt:formatDate var="today" value="${today}" pattern="yyyyMMdd"/>
      		<c:set var="CheckIn" value="${item.reservationCheckIn}"/>
      		<c:if test="${CheckIn > today}">
      			<td><input type="button" value="예약취소" class="submit-btn" onClick="javascript:rescancel('${item.reservationCode}')"></td>
			</c:if>
			<c:if test="${CheckIn <= today}">
      			<td><input type="button" value="취소불가" class="submit-btn"></td>
			</c:if>
      	</tr>
      	</c:forEach>
      	</tr>
      </table>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
  </div>

</body>
</html>