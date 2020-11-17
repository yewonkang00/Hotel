<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title> 문의사항 </title>
    <style>
        body {
          background-color: #EEEFF1;
        }
        .contain {
            background-color: #EEEFF1;
        }
        #content {
            position: absolute;
            left: 50%;
            transform: translate(-50%);
            width: 460px;
        }
        #btnJoin {
            width: 30%;
        }
        h3.tit_ {
            font-size:15px
        }
        .finish {
            background-color: #EEEFF1;
        }
    </style>
  </head>
  


<body>
  <div class=header>
      <a href="index.html"><img src="/resources/image/moon.png" width="80" height="80s"></a>
      <nav>
        <span><a href="intro.html">호텔 소개</a></span>
        <span><a href="room.html">객실</a></span>
        <span><a href="restaurant.html">레스토랑</a></span>
        <span><a href="res.html">예약</a></span>
        <span><a href="res_confirm.html">예약 확인</a></span>
        <span><a href="qna.html">고객문의</a></span>
        <span><a href="facility.html">편의시설</a></span>
        <span><a href="login.html">로그인</a></span>
      </nav>
  </div>

  <div class=contain>
    <div class=left>
      <div class=banner>
        <h2 class=tit>문의 사항</h2>
          <ul class=menu>
            <li class="m1">
              <a href="qna.html">
                <span>자주 하는 질문</span>
              </a>
            </li>
            <li class="m2">
              <a href="write_qna.html">
                <span>문의하기</span>
              </a>
            </li>
          </ul>
      </div>
    </div>
    <div class=contents>
      <h1>문의하기</h1>
      <form class="nobottommargin" id="template-contactform" name="template-contactform" action="sendemail.jsp" method="post">
          <!-- <div class="form-process"></div> -->
          <h3 class="tit_">● 고객 정보</h3>

          <div class="col_one_third">
              <h3 class="join_title"><label for="name">성함</label></h3>
              <input type="text" id="name" class="d_form large">
          </div>

          <div class="col_one_third">
              <h3 class="join_title"><label for="address">이메일</label></h3>
              <input type="email" id="email" class="d_form large">
          </div>

          <div class="clear"></div>
          <h3 class="tit_">● 문의사항</h3>



          <div class="col_two_third">
              <h3 class="join_title"><label for="subject">제목</label></h3>
              <input name="title" id="title" size="80" placeholder="제묵을 입력하세요">
          </div>



          <div class="col_one_third col_last">
              <h3 class="join_title"><label for="question_type">질문유형</label></h3>
              <span class="box gender_code">
                  <select id="question_type" name="question_type" class="sel">
                      <option value="">-- Select One --</option>
                      <option value="satisfy">만족</option>
                      <option value="compliment">칭찬</option>
                      <option value="requirement">요구</option>
                      <option value="improvement">개선요청</option>
                      <option value="complaint">불만</option>
                      <option value="etc">기타</option>
                  </select>
              </span>
          </div>



          <div class="clear"></div>



          <div class="col_full">
              <h3 class="join_title_write"><label for="message">작성</label></h3>
              <textarea id="content" name="content" rows="3" cols="80"
              placeholder="내용을 입력하세요."></textarea>
          </div>



          <div class="btn_area">
              <button type="button" id="btnSave" onclick="location.href='/qna/insert.do'">
                  <!-- <input type="submit" name="" value="">  나중에 사용-->
                  <span>접수</span>
              </button>
          </div>
      </form>


      <!-- 고객의 소리 // -->
      <!-- <table class="tb-1 tbData">
          <tbody>
              <tr>
                  <th scope="row">제목</th>
                  <td class="fm" colspan="3">
                      <input type="text" class="ipt fw-32" id="sj" name="sj" title="제목" maxlength="200" />
                  </td>
              </tr>
              <tr>
                  <th scope="row">유형</th>
                  <td class="fm">
                      <select id="contactus_type" name="contactus_type" class="slt fw-23" title="유형 1" onchange="javascript:fn_contactus_type_change();">
                          <option value="">선택하세요.</option>
                          <option value="M0001">만족</option>
                          <option value="M0002">칭찬</option>
                          <option value="M0003">요구</option>
                          <option value="M0004">개선요청</option>
                          <option value="M0005">불만</option>
                          <option value="M0009">기타</option>
                      </select>
                  </td>
              </tr>
              <tr>
                  <th scope="row">내용</th>
                  <td class="fm" colspan="3">
                      <textarea class="fw-full fh-2" title="내용을 입력해 주세요." placeholder="내용을 입력해 주세요." id="cn" name="cn" maxlength="4000"></textarea>
                  </td>
              </tr>
          </tbody>
      </table> -->
      <!-- // 고객의 소리 -->

    </div>
    <div class="finish">
        <p> 사업자 번호: 110-10-12345<br/>
            사업장소재지: 경기도 이천시 마장면 장암리<br/>
            대표자: 홍길동<br/>
            Copyright ⓒ 2020 Hotel Group. All rights reserved.
        </p>
    </div>
  </div>

</body>
</html>