<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title> 개인 정보 </title>
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
    
    <script type="text/javascript">
	function memberdelete() {
		var confirm_test = confirm("회원 탈퇴하시겠습니까?");
		if(confirm_test == true) {
			location.href="/mypage/memberDelete";
			alert("탈퇴되었습니다.");
		}
		location.href="/main";
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
                <a href="/mypage/reservation">
                  <span>예약 확인/취소</span>
                </a>
              </li>
              <li class="m3">
                <a href="/mypage/memberinfo">
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
      <h1>개인 정보</h1>
      <table border="1">
      <tr>
      	<td>이름</td>
      	<td>아이디</td>
      	<td>이메일</td>
      	<td>마일리지</td>
      	<td>등급</td>
      	<td>생년월일</td>
      	<td>전화번호</td>
      	<td>주소</td>
      </tr>
      <tr>
      	<td>${member.userName}</td>
      	<td>${member.userId}</td>
      	<td>${member.userEmail}</td>
      	<td>${member.userMile}</td>
      	<td>${member.userGrade}</td>
      	<td>${member.userBirth}</td>
      	<td>${member.userPhone}</td>
      	<td>${member.userAddressState}${member.userAddressCity}${member.userAddressStreet}${member.userAddressDetail}</td>
    </table>
    <div class="btn_area">
              	<button type="button" id="res_btn" onClick="memberdelete();">
              	<span>회원 탈퇴하기</span>
              </button>
              </div>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
  </div>

</body>
</html>
