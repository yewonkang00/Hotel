<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Customer Service</title>
    <style>
      /* common */

      body {
          /* margin-left:auto;
          margin-right: auto; */
          margin: 0px;
          padding:0px;
          background-color: white;
          font-family:나눔고딕;
          -ms-overflow-style: none;
      }
      ::-webkit-scrollbar {
        display: none;
      }
      a {
          color:#111111;
          text-decoration:none;

      }
      .flex-container {
          height: 100%;
          width: 60%;
          position: absolute;
          display: inline-flex;
          flex-direction: row;
          flex-wrap: wrap;
          justify-content: center;
          align-content: center;
          align-items: center;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          margin-top: 100px;
          margin-bottom: 100px;
      }

          /* button */
      .button-menu {
      	box-shadow:inset 0px 1px 0px 0px #ffffff;
      	background-color: #D4C1A1;
      	border-radius:5px;
      	border:1px solid #dcdcdc;
      	display: inline-block;
      	cursor:pointer;
      	color:#000000;
        width : 300px;
      	font-family:나눔고딕;
      	font-size:30px;
      	font-weight:bold;
      	padding: 90px;
          margin: 20px;
      	text-decoration:none;
          text-align: center;
      }
      .button-menu:hover {
      	background-color:#d1c7b6;
      }
      .button-menu:active {
      	position:relative;
      	top:1px;
      }

    </style>
  </head>
<body>
    <div class="flex-container">
        <input type=button class="button-menu" value="수건">
        <input type=button class="button-menu" value="물">
        <input type=button class="button-menu" value="휴지">
        <input type=button class="button-menu" value="청소 요청">
        <input type=button class="button-menu" value="직원 연결">
        <input type=button class="button-menu" value="직원 호출">
    </div>

</body>
</html>