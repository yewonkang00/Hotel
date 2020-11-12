<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
      <title>회원가입</title>
      <style>

        body {
            margin: 0;
            height: 100%;
            background: #D4C1A1;
            font-family: 나눔고딕;
        }

        ::-webkit-scrollbar {
          display: none;
        }

        #header {
            padding-top: 62px;
            padding-bottom: 20px;
            text-align: center;
        }
        #wrapper {
            position: relative;
            height: 100%;
        }
        #content {
            position: absolute;
            left: 50%;
            transform: translate(-50%);
            width: 460px;
        }
        /* 입력폼 */
        h3 {
            margin: 19px 0 8px;
            font-size: 14px;
            font-weight: 700;
        }
        .box {
            display: block;
            width: 100%;
            height: 51px;
            border: solid 1px #dadada;
            padding: 10px 14px 10px 14px;
            box-sizing: border-box;
            background: #fff;
            position: relative;
        }
        .int {
            display: block;
            position: relative;
            width: 100%;
            height: 29px;
            border: none;
            background: #fff;
            font-size: 15px;
        }
        input {
            font-family: 나눔고딕;;
        }
        .box.int_id {
            padding-right: 110px;
        }
        .box.int_pass {
            padding-right: 40px;
        }
        .box.int_pass_check {
            padding-right: 40px;
        }
        .step_url {
            /*@naver.com*/
            position: absolute;
            top: 16px;
            right: 13px;
            font-size: 15px;
            color: #8e8e8e;
        }

        #bir_wrap {
            display: table;
            width: 100%;
        }
        #bir_yy {
            display: table-cell;
            width: 147px;
        }
        #bir_mm {
            display: table-cell;
            width: 147px;
            vertical-align: middle;
        }
        #bir_dd {
            display: table-cell;
            width: 147px;
        }

        #bir_mm, #bir_dd {
            padding-left: 10px;
        }

        select {
            width: 100%;
            height: 29px;
            font-size: 15px;
            background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
            background-size: 20px 8px;
            -webkit-appearance: none;
            display: inline-block;
            text-align: start;
            border: none;
            cursor: default;
            font-family: 나눔고딕;
        }

        /* 버튼 */

        .btn_area {
            margin: 30px 0 91px;
        }

        #btnJoin {
            width: 100%;
            padding: 21px 0 17px;
            border: 0;
            cursor: pointer;
            color: #fff;
            background-color: #333333;
            font-size: 20px;
            font-weight: 400;
            font-family: 나눔고딕;
        }

      </style>
	
	<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>
	
	<script type="text/javascript">

	function register() {
		var UserId = $('#UserId').val();
		var UserPassword = $('#UserPassword').val();
		var UserName = $('#UserName').val();
		var UserBirth = $('#bir_yy').val()+$('#bir_mm').val()+$('#bir_dd').val();
		var UserPhone = $('#UserPhone').val();
		var UserAddressState = $('#UserAddressState').val();
		var UserAddressCity = $('#UserAddressCity').val();
		var UserAddressStreet = $('#UserAddressStreet').val();
		var UserAddressDetail = $('#UserAddressDetail').val();
		var passwordCheck = $('#passwordCheck').val();
		var UserGender = $('#UserGender').val();
		var UserEmail = $('#UserEmail').val();

		var data = {"UserId" : UserId, 
				"UserPassword" : UserPassword,
				"UserName" : UserName,
				"UserBirth" : UserBirth,
				"UserPhone" : UserPhone,
				"UserEmail" : UserEmail,
				"UserAddressState" : "",
				"UserAddressCity" : "",
				"UserAddressStreet" : "",
				"UserAddressDetail" : "",
				"UserLevel" : "1",
				"UserGrade" : "0",
				"UserMile" : "0",
				"UserGender" : UserGender
		};

		if(UserId == "") {
			alert("아이디를 입력해주세요.");
			$('#UserId').focus();
			return false;
		} else if (UserPassword == "") {
			alert("비밀번호를 입력해주세요.");
			$('#UserPassword').focus();
			return false;
		} else if (UserPassword != passwordCheck) {
			alert("비밀번호를 다시 확인해주세요.")
			$('#passwordCheck').focus();
		} else if (UserName == "") {
			alert("이름을 입력해주세요.");
			$('#UserName').focus();
			return false;
		} /* else if (UserBirth == "") {
			alert("생일을 입력해주세요.");
			$('#UserBirth').focus();
			return false; 
		} */else if (UserPhone == "") {
			alert("핸드폰 번호를 입력해주세요.");
			$('#UserPhone').focus();
			return false;
		} /* else if (UserAddressState == "" || UserAddressCity == "" || UserAddressStreet == "" || UserAddressDetail == "") {
			alert("주소를 입력해주세요.");
			return false;
		} */

		$.ajax({
			type : "POST",
			url : "/memeber/regist.do",
			data : data,
			datatype : 'json',
			success : function(data) {
				var result = data["resultMsg"];
				if(result == "Success"){
					location.href="/login.do";
				}else if(result == "IDDup"){
					alert("이미 사용중인 아이디입니다.");
					$('#UserId').focus();
				}
			}
		})
	}
		
	</script>
</head>


  <body>
      <!-- wrapper -->
      <div id="wrapper">

          <!-- content-->
          <div id="content">

              <!-- ID -->
              <div>
                  <h3 class="join_title">
                      <label for="UserId">아이디</label>
                  </h3>
                  <span class="box int_id">
                      <input type="text" id="UserId" class="int" maxlength="20">
                      <span class="step_url"></span>
                  </span>
              </div>

              <!-- PW1 -->
              <div>
                  <h3 class="join_title"><label for="UserPassword">비밀번호</label></h3>
                  <span class="box int_pass">
                      <input type="password" id="UserPassword" class="int" maxlength="20">
                  </span>
              </div>

              <!-- PW2 -->
              <div>
                  <h3 class="join_title"><label for="passwordCheck">비밀번호 재확인</label></h3>
                  <span class="box int_pass_check">
                      <input type="text" id="passwordCheck" class="int" maxlength="20">
                  </span>
              </div>

              <!-- NAME -->
              <div>
                  <h3 class="join_title"><label for="UserName">이름</label></h3>
                  <span class="box int_name">
                      <input type="text" id="UserName" class="int" maxlength="20">
                  </span>
              </div>

              <!-- BIRTH -->
              <div>
                  <h3 class="join_title"><label for="yy">생년월일</label></h3>

                  <div id="bir_wrap">
                      <!-- BIRTH_YY -->
                      <div id="bir_yy">
                          <span class="box">
                              <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                          </span>
                      </div>

                      <!-- BIRTH_MM -->
                      <div id="bir_mm">
                          <span class="box">
                              <select id="mm" class="sel">
                                  <option>월</option>
                                  <option value="01">1</option>
                                  <option value="02">2</option>
                                  <option value="03">3</option>
                                  <option value="04">4</option>
                                  <option value="05">5</option>
                                  <option value="06">6</option>
                                  <option value="07">7</option>
                                  <option value="08">8</option>
                                  <option value="09">9</option>
                                  <option value="10">10</option>
                                  <option value="11">11</option>
                                  <option value="12">12</option>
                              </select>
                          </span>
                      </div>

                      <!-- BIRTH_DD -->
                      <div id="bir_dd">
                          <span class="box">
                              <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                          </span>
                      </div>
                  </div>
              </div>

              <!-- GENDER -->
              <div>
                  <h3 class="join_title"><label for="UserGender">성별</label></h3>
                  <span class="box gender_code">
                      <select id="UserGender" class="sel">
                          <option>성별</option>
                          <option value="M">남자</option>
                          <option value="F">여자</option>
                      </select>
                  </span>
              </div>


              <!-- MOBILE -->
              <div>
                  <h3 class="join_title"><label for="UserPhone">휴대전화</label></h3>
                  <span class="box int_mobile">
                      <input type="tel" id="UserPhone" class="int" maxlength="16" placeholder="전화번호 입력">
                  </span>
              </div>


              <!-- EMAIL -->
              <div>
                  <h3 class="join_title"><label for="UserEmail">이메일 주소</label></h3>
                  <span class="box int_email">
                      <input type="text" id="UserEmail" class="int" maxlength="100" placeholder="이메일 주소 입력">
                  </span>
              </div>

                <!-- ADDRESS -->
              <div>
                  <h3 class="join_title"><label for="address">주소</label></h3>

                  <div id="bir_wrap">
                      <!-- postcode -->
                      <div id="bir_yy">
                          <span class="box">
                              <input type="text" id="UserAddressState" class="int" maxlength="16"placeholder="우편번호">
                          </span>
                      </div>


                      <!-- postcode_button-->
                      <div id="btn_area">
                          <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                      </div>

                  </div>
                  <span class="box address">
                      <input type="text" id="address" class="int" maxlength="200" placeholder="주소"><br>
                  </span>
                  <span class="box detailAddress">
                      <input type="text" id="UserAddressStreet" class="int" maxlength="200" placeholder="상세주소">
                  </span>
                  <span class="box extraAddress">
                      <input type="text" id="UserAddressDetail" class="int" maxlength="100" placeholder="참고항목">
                  </span>
              </div>


              <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
              <script>
                  function sample6_execDaumPostcode() {
                      new daum.Postcode({
                          oncomplete: function(data) {
                              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                              var addr = ''; // 주소 변수
                              var extraAddr = ''; // 참고항목 변수

                              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                  addr = data.roadAddress;
                              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                  addr = data.jibunAddress;
                              }

                              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                              if(data.userSelectedType === 'R'){
                                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                      extraAddr += data.bname;
                                  }
                                  // 건물명이 있고, 공동주택일 경우 추가한다.
                                  if(data.buildingName !== '' && data.apartment === 'Y'){
                                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                  }
                                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                  if(extraAddr !== ''){
                                      extraAddr = ' (' + extraAddr + ')';
                                  }
                                  // 조합된 참고항목을 해당 필드에 넣는다.
                                  document.getElementById("sample6_extraAddress").value = extraAddr;

                              } else {
                                  document.getElementById("sample6_extraAddress").value = '';
                              }

                              // 우편번호와 주소 정보를 해당 필드에 넣는다.
                              document.getElementById('sample6_postcode').value = data.zonecode;
                              document.getElementById("sample6_address").value = addr;
                              // 커서를 상세주소 필드로 이동한다.
                              document.getElementById("sample6_detailAddress").focus();
                          }
                      }).open();
                  }
              </script>



              <!-- JOIN BTN-->
              <div class="btn_area">
                  <button type="button" id="btnJoin" onClick="register();">
                      <span>가입하기</span>
                  </button>
              </div>



          </div>
          <!-- content-->

      </div>
        <!-- wrapper -->
  </body>							