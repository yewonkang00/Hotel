<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
 		<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
  		<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Welcom Delluna!</title>
        
        <script type="text/javascript">

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

        
        function reservation() {
        	var Id = '${UserId}';
        	var ReservationDate = $('#ReservationDate').val();
        	var ReservationDays = $('#ReservationDays').val();
        	var ReservationPeopleNumber = $('#ReservationPeopleNumber').val();
        	var ReservationCheckIn = '${resdate}';
        	var RoomCode = '${roomNo}';
        	var ReservationMemo = $('#ReservationMemo').val();
			var ReservationCheckOut = dateAdd(ReservationCheckIn, ReservationDays);
			
        	var data = {"UserId" : Id,
                	"ReservationDate" : ReservationDate,
                	"ReservationDays" : ReservationDays,
                	"ReservationPeopleNumber" : ReservationPeopleNumber,
                	"ReservationCheckIn" : ReservationCheckIn,
                	"ReservationCheckOut" : ReservationCheckOut,
                	"RoomCode" : RoomCode,
                	"ReservationMemo" : ReservationMemo
        	};

        	if(ReservationDays == "") {
        		alert("숙박일 수를 입력해주세요.");
    			$('#ReservationDays').focus();
    			return false;
            } else if (ReservationPeopleNumber == "") {
            	alert("숙박 인원을 입력해주세요.");
    			$('#ReservationPeopleNumber').focus();
    			return false;
            }


            $.ajax({
            	type : "POST",
    			url : "/admin/reservateAction.do",
    			data : data,
    			datatype : 'json',
    			success : function(data) {
    				var result = data["resultMsg"];
    				if(result == "success"){
        				
    					alert("예약되었습니다!");
    					location.href="/admin/reservation.do?rno=${roomNo}";
    				}else {
    					alert("이미 예약된 날짜입니다.");
    				}
        		}
                
            })
        	
				
                

        	
        }
        </script>
    </head>
    <body>
        <div class=header>
            <img src="/resources/image/moon.png" width="80" height="80s"></a>
            <nav>
                <span><a href="intro.html">호텔 소개</a></span>
                <span><a href="room.html">객실</a></span>
                <span><a href="restaurant.html">레스토랑</a></span>
                <span><a href="res.html">예약</a></span>
                <span><a href="res_confirm.html">예약 확인</a></span>
                <span><a href="qna.html">고객문의</a></span>
                <span><a href="facility.html">편의시설</a></span>
                <span>
		        	<c:choose>
		  				<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
		   				<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
		   			</c:choose>
		        </span>
            </nav>

        </div>
        <div class=res_content>
          <div class=res_search>
            <form method="get" action="write_action.php" enctype="multipart/form-data"> <!--예약 작성하는 폼-->
              <table class="res2_form" cellpadding=0 cellspacing=15 width=600>
                <tbody>
                  <tr>
                    <td id="res2_tit" width="150">요청사항</td>
                    <td width="450"><textarea name="content" id="ReservationMemo" cols="70" rows="3"></textarea></td>
                  </tr>
                  <tr>
                    <td id="res2_tit">예약자 정보</td>
                  </tr>
                  <tr>
                    <td id="res2_tit">아이디</td>
                    <td id="UserId"><input type="text" readonly value='${UserId}' name="title" size="20"></td>
                  </tr>
                   <tr>
                    <td id="res2_tit">숙박일</td>
                    <td id="ReservationCheckIn"><input type="text" readonly value='${resdate}' name="title" size="20"></td>
                  </tr>
                  <tr>
                    <td id="res2_tit">숙박일 수</td>
                    <td class="box_reservationDays">
                    	<select id ="ReservationDays" class="sel">
                    		<option>-박</option>
                    		<option value="1">1박</option>
                    		<option value="2">2박</option>
                    		<option value="3">3박</option>
                    		<option value="4">4박</option>
                    		<option value="5">5박</option>
                    	</select>
                    </td>
                  </tr>
                  <tr>
                    <td id="res2_tit">Room</td>
                    <td id="RoomCode"><input type="text" readonly value='${roomNo}' size="20"></td>
                  </tr>
                  <tr>
                    <td id="res2_tit">인원</td>
                    <td class="box_reservationDays">
                    	<select id ="ReservationPeopleNumber" class="sel">
                    		<option>-인</option>
                    		<option value="1">1인</option>
                    		<option value="2">2인</option>
                    		<option value="3">3인</option>
                    		<option value="4">4인</option>
                    	</select>
                  </tr>
                  <!-- <tr>
                    <td id="UserBirth">생년월일</td>
                    <td><input type="text" name="title" size="20"></td>
                    <td>연락처</td>
                    <td><input type="text" name="title" size="20"></td>
                  </tr>
                  <tr>
                    <td id="UserEmail">이메일</td>
                    <td><input type="text" name="title" size="20"></td>
                    <td><input type="text" name="title" size="20"></td>
                  </tr> -->
                  <tr>
                    <td id="res2_tit">결재금액</td>
                  </tr>
                  <tr>
                    <td>객실 가격</td>
                    <td>240,000원</td>
                  </tr>
                  <tr>
                    <td>추가 금액</td>
                    <td>0원</td>
                  </tr>
                  <tr>
                    <td>부과세</td>
                    <td>24,000원</td>
                  </tr>
                  <tr>
                    <td>최종 결재 금액</td>
                    <td>264,000원</td>
                  </tr>
                </tbody>
              </table>
              <div class="btn_area">
              	<button type="button" id="res_btn" onClick="reservation();">
              	<span>결재하기</span>
              </button>
              </div>
            </form>
          </div>
        </div>
        <div class="finish">
            <p> 사업자 번호: 110-10-12345<br/>
                사업장소재지: 경기도 이천시 마장면 장암리<br/>
                대표자: 홍길동<br/>
                Copyright ⓒ 2020 Hotel Group. All rights reserved.
            </p>
        </div>
    </body>
</html>