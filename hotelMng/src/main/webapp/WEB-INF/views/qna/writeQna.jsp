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
  </head>
  


<body>
    <%@include file ="../layout/header.jsp" %>

    <div class=contain>
        <div class=left>
            <div class=banner>
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
                    <textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요."></textarea>
                </div>

                <div class="btn_area">
                    <button type="button" id="btnSave" onclick="location.href='/qna/insert.do'">
                        <!-- <input type="submit" name="" value="">  나중에 사용-->
                        <span>접수</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <%@include file ="../layout/final.jsp" %>
    </body>
</html>