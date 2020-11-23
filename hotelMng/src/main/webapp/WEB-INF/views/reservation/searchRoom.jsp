<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
 
 <script type="text/javascript">
  var sessionUserId = '${member.userId}';
  var sessionLevel = '${member.userLevel}';
  if(sessionUserId == null || sessionUserId == 'null' || sessionUserId=="" || sessionUserId == "1"){
		alert("로그인 후 이용해주세요.");
		location.href="/login.do";
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
    
  function searchRoom() {
  	var SearchFrom = $('#reservationCheckIn').val();
	var SearchTo = $('#res_checkout').val(); 
	if(SearchFrom >= SearchTo){
		alert("체크아웃을 확인하세요.");
		return;
	}
	SearchFrom = SearchFrom.substr(0,4) + SearchFrom.substr(5,2) + SearchFrom.substr(8,2);
	SearchTo = SearchTo.substr(0,4) + SearchTo.substr(5,2) + SearchTo.substr(8,2);
	SearchTo = dateAdd(SearchTo, 0);

	location.href="/searchRoomAction.do?searchFrom="+SearchFrom+"&searchTo="+SearchTo;
}      
  </script>        
        <title>Welcom Delluna!</title>
         
  
    </head>
    <body>
    
<%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <p>

		<p>
        <div class=contents>
          <div class=res_search>
            <h2>예약</h2>
            <div class=res_res>
              <form name="srchRoomFrm" id="res_form" method="post">
                <p>Direct Hotel</p>
                <p>날짜</p>
					체크인<input type="text" id="reservationCheckIn" value="">
					체크아웃<input type="text" id="res_checkout" value="">
                <!-- <p>성인</p>
					<input type="text" id="res_adult" value="1" title="성인">
				<p>어린이</p>
					<input type="text" id="res_child" value="0" title="어린이"> -->
					<button type="button" id="res_btn" onclick="javaScript:searchRoom();">검색</button>
			</form>
	
            </div>
          </div>
        <div class=contents>
                <p style="text-align:center;">Room LIST</p>
        <table border="1">
        <tr>
        <td>No</td>
        <td>RoomNO</td>
        <td>RoomType</td>
        <td>BedType</td>
        <td>RoomMaxPeople</td>
        <td>RoomFee</td>
			<c:forEach items="${roomList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.roomNo}</td>
				<td>${item.roomSize}</td>
				<td>${item.roomType}</td>
				<td>${item.roomMaxPeople}</td>
				<td>${item.roomFee}</td>
				<td><input type="button" value="예약" class="submit-btn" onClick="javaScript:location.href='/roomReservationView.do?rno=${item.roomNo}';">	</td>
			</tr>
			</c:forEach>
		</table>
        </div>
        </div>
        <div class="finish">
            <p> 사업자 번호: 110-10-12345<br/>
                사업장소재지: 경기도 이천시 마장면 장암리<br/>
                대표자: 홍길동<br/>
                Copyright ⓒ 2020 Hotel Group. All rights reserved.
            </p>
        </div>		
	
    <script>
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언
            $("#reservationCheckIn").datepicker();                    
            $("#res_checkout").datepicker();

            var checkIn = '${searchFrom}';
            var checkOut = dateAdd('${searchTo}',2);

            if(checkIn == null || checkIn == 'null' || checkIn == ""){
                //From의 초기값을 오늘 날짜로 설정
                $('#reservationCheckIn').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                //To의 초기값을 내일로 설정
                $('#res_checkout').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

            } else {
                checkIn = checkIn.substr(0,4) + "-" + checkIn.substr(4,2) + "-" + checkIn.substr(6,2);
                checkOut = checkOut.substr(0,4) + "-" + checkOut.substr(4,2) + "-" + checkOut.substr(6,2);
            	$('#reservationCheckIn').datepicker('setDate', checkIn); 
            	$('#res_checkout').datepicker('setDate', checkOut); 
            }

        });
    </script>


</body>

</html>