<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
 <head>
 	<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style_room.css" type="text/css">
        <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<<<<<<< HEAD
		<style>
        .room_button {
    		background-color: #D4C1A1;
   			border-radius: 3px;
    		border: 1px solid #D4C1A1;
    		display: inline-block;
    		cursor: pointer;
    		color: #ffffff;
    		font-size: 15px;
    		font-weight: bold;
    		padding: 8px 24px;
    		text-decoration: none;
    		text-align: center;
   		 	justify-content: center;
    		align-items: center;
    		margin-left: 350px;
    		position: absolute;
    		top: 830px;
    		right: 550px;
		}
		.room_button:hover {
     		background-color:#dbb790;
 		}
		.room_button:active {
     		position:relative;
	 		top:1px;
  		}
        </style>
=======
>>>>>>> 0d90439c11f74314fde3665a99ef76c38cd5e782
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
		function today() {
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var date = today.getDate();
	
			var day = String(year) + String(month) + String(date);
			return day;
			
		}
		function search() {
			location.href="/searchRoomAction.do?searchFrom=" + today() + "&searchTo=" + dateAdd(today(),1) + "&searchRoom=standard";
		}
	    </script>        
        <title>Standard room</title>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <div class=contain>
          <div class=left>
              <h2 class=tit><a href="/room_main.do">객실 소개</a></h2>
                <ul class=menu>
                    <li class="m1">
                        <a href="/room_standard.do">
                            <span>Standard Room</span>
                        </a>
                    </li>
                    <li class="m2">
                        <a href="/room_deluxe.do">
                            <span>Deluxe Room</span>
                        </a>
                    </li>
                    <li class="m3">
                        <a href="/room_executive.do">
                            <span>Executive Room</span>
                        </a>
                    </li>
                    <li class="m4">
                        <a href="/room_suite.do">
                            <span>Suite Room</span>
                        </a>
                    </li>
                </ul>
          </div>
          <div class=contents>
            <h2 id=gaeyo>Standard Room</h2>
            <img src="/resources/image/standardroom.jpg" width="800" height="500">
<<<<<<< HEAD
            <p> 스탠다드룸은 혼자 또는 친구와 함께 할 수 있는 방입니다.
            	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	        	<td>
	        	<button type="button" id="res_btn" onclick="javaScript:search()">예약하기</button>
	        	</td>
            	<br/>
                스탠다드룸의 세련된 인테리어와 디자인 소품이 조화를 즐기며 아늑한 휴식을 취하십시오.<br/>
                문의전화 02-0000-0000<br/>
                전망 : 시티 뷰 | 침대 : 더블(킹 사이즈) / 트윈 | 크기 : 30m^2<br/>
                룸 구성 : 침실 1, 욕실 1, 화장실 1<br/>
            </p>
=======
            <div class=explain>
            	스탠다드룸은 혼자 또는 친구와 함께 할 수 있는 방입니다.<br/>
            	세련된 인테리어와 디자인 소품이 조화를 즐기며 아늑한 휴식을 취하십시오.<br/>
            	문의전화 02-0000-0000<br/>
            	 전망 : 시티 뷰 | 침대 : 더블(킹 사이즈) / 트윈 | 크기 : 30m^2<br/>
            	 룸 구성 : 침실 1, 욕실 1, 화장실 1<br/>
            </div>
            <button type="button" id="res_btn" onclick="javaScript:search()">예약하기</button>
>>>>>>> 0d90439c11f74314fde3665a99ef76c38cd5e782
            <table class=roomtb>
              <thead>
                <tr>
                  <th scope="row">객실이용</th>
                  <td>55인치 스마트 TV<br/>
                      50~100Mbps 초고속 유무선(wifi) 인터넷 무료<br/>
                      220V, 110V 전압 사용 가능<br/>
                      커피, 차 티백 무료 제공<br/>
                      엑스트라 베드 1개 추가 30,000원/1박<br/>
                  </td>
                </tr>
                <tr>
                  <th scope="row">부대시설</th>
                  <td>피트니스 클럽 이용 안내<br/>
                      -체육관 무료 이용<br/>
                      -실내 수영장 무료 이용<br/>
                      -사우나 무료 이용<br/>
                      -피트니스 클럽은 매월 둘 째 월요일 정기휴일입니다.<br/>
                      투숙 기간 내 무료 주차 가능<br/>
                  </td>
                </tr>
                <tr>
                  <th scope="row">룸서비스</th>
                  <td>객실에서 즐기실 수 있는 다양한 룸서비스가 준비되어 있습니다.<br/>
                      식사 및 음료 : 24시간 서비스<br/>
                  </td>
                </tr>
            </table>
          </div>
          <%@include file = "/WEB-INF/views/layout/final.jsp" %>
        </div>
    </body>
</html> 