<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            ::-webkit-scrollbar {
                display: none;
            }
            a {
                color:#111111;
                text-decoration:none
            }
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }

            .contain{
                width: 1200px;
				margin-top:30px;
                min-height: 500px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .index_contents {
                margin-left: 45px;
            }

        </style>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin : auto;
                padding:0px;
                background-color: white;
                font-family:나눔고딕;
            }
            ::-webkit-scrollbar {
                display: none;
            }
            a {
                color:#111111;
                text-decoration:none
            }
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }

            .contain{
                width: 1200px;
				margin-top:30px;
                min-height: 500px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .index_contents {
                margin-left: 45px;
            }

        </style>
        <style>
          button{
            cursor: pointer;
          }
          table{
            border-collapse: collapse;
          }
          .res_romm b{
            font-size: 22px;
          }
          .res_search{
            margin-top: 50px;
            border-top:30pt solid  #D4C1A1;
            width:90%;
            border-radius:10px;
            border-bottom:6pt solid #f1f1f1;
            margin:0 auto;
            padding-left:30%;
          }
          .res_res{
            display: inline-block;
            text-align: center;
          }
          .res_table td{
            text-align:center;
          }
          #count{
            border-style:none;
            padding-left: 9px;
            width:20px;
          }
          #minus{
            margin-left:50px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #pl_m{
            margin-left:7px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #test{
            background-color: #D4C1A1;
          }
          #reservationCheckIn{
            margin-left:30px;
            border-style:none;
            width:80px;
          }
          #res_checkout{
            margin-left:40px;
            border-style:none;
            width:80px;
          }
          #res_tit{
            font-size:30px;
            margin-top: 200px;
            margin-bottom:70px;
            font-weight: 10;
            text-align: center;
          }
          #res_btn{
            margin-left:70px;
            border-style:none;
            height:55px;
            width:70px;
            border-radius:5px;
            background-color: #D4C1A1;
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

         function searchRoom(room) {
           var SearchRoom = room;
           var SearchFrom = $('#reservationCheckIn').val();
           var SearchTo = $('#res_checkout').val();
           if(SearchFrom >= SearchTo){
             alert("체크아웃을 확인하세요.");
             return;
           }
         	SearchFrom = SearchFrom.substr(0,4) + SearchFrom.substr(5,2) + SearchFrom.substr(8,2);
         	SearchTo = SearchTo.substr(0,4) + SearchTo.substr(5,2) + SearchTo.substr(8,2);
         	SearchTo = dateAdd(SearchTo, 0);

         	location.href="/searchRoomAction.do?searchFrom="+SearchFrom+"&searchTo="+SearchTo+"&searchRoom="+SearchRoom;
       	}

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
        <script type="text/javascript">
          var err = document.getElementById("error");
          function plus(){
            cnt = count.value;
            if (cnt<4){
              cnt++;
              count.value = cnt;
            }
            else{
              err.style.display = "block";
            }
          }
          function minus(){
            cnt = count.value;
            if (cnt > 1) {
              cnt--;
              count.value = cnt;
            }
          }
          function datediff(input, output) {
		  	var diff = output - input;
		  	var currDay = 24 * 60 * 60 * 1000;
		  	return parseInt(diff/currDay);
          }
    </script>
        <title>Welcome Delluna!</title>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <div class=banner_main></div>
        <div class=res_search>
        	<div class=res_res>
                <form name="srchRoomFrm" id="res_form" method="post">
                  <table class="res_table">
                    <tr>
                      <td><b>객실</b></td>
                      <td><b>&emsp;체크인</b></td>
                      <td><b>&emsp;&emsp;&emsp;숙박일 수</b></td>
                      <td><b>&emsp;&emsp;체크아웃</b></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>
                    	   <select name="room_name" style="cursor:pointer;" id="selectRoom">
                    	   <c:choose>
                    	   <c:when test="${param.searchRoom eq 'all' || param.searchRoom eq null}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                    	   <c:when test="${param.searchRoom eq 'standard'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard" selected>Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'deluxe'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe" selected>Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'executive'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive" selected>Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'suite'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite" selected>Suite Room</option>
                  		   </c:when>

                  		   </c:choose>
                    	   </select>
                      </td>
                      <td>
                        <input type="text" id="reservationCheckIn" value="">
                      </td>
                      <td>
                      	&emsp;&emsp;&emsp;
                      	<script type="text/javascript">
                      	document.write(datediff(${param.searchFrom},${param.searchTo})+1);
                      	</script>
                      	박
                      </td>
                      <td>
              		  	<input type="text" id="res_checkout" value="">
                      </td>
                      <!-- <td>
                        <button type="button" name="button" id="minus"onclick="minus()">-</button>
                        <input type="text" value="2" id="count">
                        <button type="button" name="button" id="pl_m" onclick="plus()">+</button>
                      </td> -->
                      <td><button type="button" id="res_btn" onclick="javaScript:searchRoom($('#selectRoom').val());">검색</button></td>
                    </tr>
                  </table>
                </form>
              </div>
            </div>
        <div class=contain>
        	<div class=index_contents>

        		<p> 안녕하세요</p>
	            <p> 가나다라</p>
	            <p> 마바사아</p>
	            <b><p> 브런치 타임: AM 11:30 ~ PM 1:30</p>
	            <p> 영업시간 : AM 10:00 ~ PM 9:00</p></b>
	            <p>
	            	<img src="/resources/image/hotel2.jpg" width="300">
	            <p>
	            	<a href="reservationqa.html">호텔 예약 문의하기</a>
	    	</div>
        </div>
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>
    </body>
</html>
