<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <title> 문의사항 </title>
    <style>
    	* {
            font-family: 'Noto Sans KR', sans-serif;
        }
        body {
          background-color: #EEEFF1;
        }
        #content {
            position: absolute;
            left: 50%;
            transform: translate(-50%);
            width: 460px;
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
    </style>
    
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>
  </head>
  


<body>
  <%@include file = "/WEB-INF/views/layout/header.jsp" %>

  <div class=contain>
    <div class=left>
        <h2 class=tit>문의 사항</h2>
          <ul class=menu>
            <li class="m1">
              <a href="/qna/list.do">
                <span>게시판</span>
              </a>
            </li>
            <li class="m2">
              <a href="/qna/write.do">
                <span>문의하기</span>
              </a>
            </li>
          </ul>
    </div>
    <div class=contents>
      <h1>문의하기</h1>
       <form  id="form1" name="form1" action="/qna/insert.do" method="post">
          <!-- <div class="form-process"></div> -->
          <h3 class="tit_">● 고객 정보</h3>

          <div class="clear"></div>
          <h3 class="tit_">● 문의사항</h3>



          <div class="col_two_third">
              <h3 class="join_title"><label for="subject">제목</label></h3>
			  <input name="qnatitle" id="qnatitle" size="80" placeholder="제목을 입력하세요">
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
              <textarea id="qnacontent" name="qnacontent" rows="3" cols="80"
              placeholder="내용을 입력하세요."></textarea>
          </div>



          <div class="btn_area">
              <input type="submit" id="btnSave" value = "접수" onclick="location.href='/qna/insert.do'">
          </div>
      </form>
      </div>


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
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>

</body>
</html>