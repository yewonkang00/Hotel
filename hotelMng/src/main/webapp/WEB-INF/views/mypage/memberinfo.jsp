<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style_mypage.css" type="text/css">
    <title> 개인 정보 </title>

    
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
                <a href="/mypage/reservation">
                    <span>예약 확인/취소</span>
                </a>
              </li>
              <li class="m2">
                  <a href="/mypage/memberinfo">
                      <span>개인 정보</span>
                  </a>
              </li>
              <li class="m3">
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
      	<td>등급</td>
      	<td>전화번호</td>
      	<td>이메일</td>
      	<td>마일리지</td>
      	<td>생년월일</td>
      	<td>주소</td>
      </tr>
      <tr>
      	<td>${member.userName}</td>
      	<td>${member.userId}</td>
      	<td>${member.userGrade}</td>
      	<td>${member.userPhone}</td>
      	<td>${member.userEmail}</td>
      	<td>${member.userMile}</td>
      	<td>${member.userBirth}</td>
      	<td>${member.userPostCode} ${member.userAddress} ${member.userDetailAddress} ${member.userExtraAddress}</td>
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
