<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<link href="/resources/css/common.css" rel="stylesheet" type="text/css">

	<link href="/resources/css/magnific-popup.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script src="/resources/js/bootstrap-3.3.2.min.js"></script>
	<script src="/resources/js/bootstrap-multiselect.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	
	<title>Bespin Login</title>
	<style type="text/css">
aside , footer  { display: block; }
	
html , body , div , span   , h1 , h2 , h3 , h4 , h5 , h6 , p , a , em , q , s , samp , strike , strong , sup , dl , dt , dd , fieldset , form , label , legend { line-height: 1.3em; border: 0 none; }
legend {font-size: 0;  position: absolute; top: -9999px; left: -9999px; visibility: hidden; overflow: hidden; width: 0; height: 0; }
fieldset { -webkit-appearance: none; -moz-appearance: none; appearance: none; }

.layout-popup {position: relative;  display: block; box-sizing: border-box; width: 500px; margin: 0 auto; padding: 44px 48px 50px 48px; border: 2px solid #000; background-color: #fff; }
.layout-popup .mfp-close {position: absolute; top: 50px; right: 50px;  display: block; text-indent: -9999px; }

.layout-popup .layout-popup-title {font-size: 1.25rem; font-weight: 700; line-height: 1.5em; position: relative;  display: block; padding-bottom: 18px;  color: #000; }
.layout-popup .layout-popup-title:before {position: absolute; bottom: 0; left: 0; display: block; width: 60px; height: 3px;  content: '';background-color: #000; }
.layout-popup .layout-popup-footer { margin-top: 50px; text-align: center; }
.layout-popup .layout-popup-footer .btns.top { margin-bottom: 20px; }
.layout-popup .layout-popup-footer .btns.top .button-normal { display: block; margin: 0; }
.layout-popup .layout-popup-footer .btns .button-normal {min-width: 200px;  margin: 0 9px; }

.layout-popup .layout-popup-contents .layout-popup-message {font-size: 1rem; line-height: 1.5em;  margin-top: 37px; color: #000; }
.layout-popup .layout-popup-contents .layout-popup-message[data-state=invalid] { color: #ff4309; }
.layout-popup .layout-popup-contents .layout-popup-message.mobile { display: none; }


.forms-item { margin-top: 33px; }
.forms-item .caution { font-size: .75rem; line-height: 1.5em; margin: 6px 0 0; color: #4a90e2; }
.forms-item .checkbox_wrap {box-sizing: border-box; margin: 8px 0 0;  padding: 15px; padding-bottom: 9px; border: 1px solid #d9d9d9; background: #ebebeb; }
.forms-item .checkbox_wrap a , .forms-item .checkbox_wrap label { color: #666; }
.forms-item .label {font-size: .75rem;  display: block; margin-bottom: 6px; color: #9b9b9b; }
.forms-item .label em {margin: 0 0 0 3px;  color: #1886ff; }
.forms-item .label .lang-message { font-size: .75rem; line-height: 1.5em; margin: 5px 0 0; color: #666; }
.forms-item .txt {font-size: .875rem; font-weight: 500; line-height: 39px;  display: block; color: #000; border-bottom: 1px solid #e6e6e6; }
.forms-item .txt[disabled] { color: #ccc; }
.forms-item .txt-guide {font-size: .75rem; font-weight: 400; line-height: 1.5em;  display: block; margin-top: 5px; text-align: right; color: #666; }
.forms-item .txt-guide.left { text-align: left; }
.forms-item .inline-txt {font-size: .875rem; font-weight: 500;  display: inline-block; color: #000; }
.forms-item .button-normal[data-size=small] { position: absolute; top: 50%; right: 10px; margin-top: -15px; }
.forms-item .list-agreement > li + li { margin-top: 9px; }
.forms-item .line-break { margin-top: 15px; }
.forms-item .multiselect-native-select { width: 100%; }
.forms-item.multi-box { display: -ms-flexbox; display: flex; }
.forms-item.multi-box .multi-box-item { display: inline-block; margin-left: 12px; }
.forms-item.multi-box .multi-box-item:first-child { margin: 0; }

body[data-state=logout] input[type=text] , body[data-state=logout] input[type=email]{ resize: none; transition: box-shadow .2s ease-in-out; }
body[data-state=logout] input[type=text]:focus , body[data-state=logout] input[type=email]:focus  {background-color: #fff;  box-shadow: inset 0 0 0 2px #007aff; }
body[data-state=logout] input[type=text][invalid] , body[data-state=logout] input[type=email][invalid]  {background-color: #fff;  box-shadow: inset 0 0 0 2px #ff2d47; }
body[data-state=logout] input[type=text].small:focus , body[data-state=logout] input[type=email].small:focus {background-color: #fff;  box-shadow: inset 0 0 0 1px #007aff; }
body[data-state=logout] input[type=text].small[invalid] , body[data-state=logout] input[type=email].small[invalid] {background-color: #fff;  box-shadow: inset 0 0 0 1px #ff2d47; }
body[data-state=logout] input[type=text][readonly]:focus , body[data-state=logout] input[type=email][readonly]:focus { box-shadow: inset 0 0 0 2px #e6e6e6; }
body[data-state=logout] input[type=text][data-state=expand] , body[data-state=logout] input[type=email][data-state=expand] { width: 100%; }
body[data-state=logout] input::-webkit-input-placeholder { color: #ccc; }
body[data-state=logout] input:-moz-placeholder {opacity: 1;  color: #ccc; }
body[data-state=logout] input::-moz-placeholder {opacity: 1;  color: #ccc; }
body[data-state=logout] input:-ms-input-placeholder { color: #ccc; }
body[data-state=logout] span:focus {outline: 0px;  box-shadow: 0px; }
body[data-state=logout] input[type=text] ,body[data-state=logout] input[type=email]  {font-size: .875rem; font-weight: 100; line-height: 38px; display: block; box-sizing: border-box; width: 100%; height: 40px; padding: 0 0px 0 10px;  cursor: text; vertical-align: middle; color: #000; background-color: #f2f2f2; box-shadow: inset 0 0 0 0px #e4e4e4; }
body[data-state=logout] input[type=text][disabled] , body[data-state=logout] input[type=email][disabled]  , body[data-state=logout] select[disabled] { color: #999; background-color: #eee; box-shadow: inset 0 0 0 1px #e4e4e4; }
body[data-state=logout] input[type=text][invalid] , body[data-state=logout] input[type=email][invalid] , body[data-state=logout] select[invalid] { box-shadow: inset 0 0 0 2px #ff2d47; }
body[data-state=logout] input[type=text].inline , body[data-state=logout] input[type=email].inline , body[data-state=logout] select.inline { display: inline-block; }
body[data-state=logout] input[type=text].small , body[data-state=logout] input[type=email].small , body[data-state=logout] select.small {font-size: .75rem; line-height: 24px;  display: inline-block; width: auto; height: 24px; }
body[data-state=logout] input[type=text].daterange  , body[data-state=logout] input[type=email].daterange , body[data-state=logout] select.daterange {font-family: 'Montserrat', 'Noto Sans Korean', 'Apple SD Gothic', sans-serif; font-size: .875rem; font-weight: 700; line-height: 24px;  display: inline-block; height: 24px; padding: 0 15px 0 10px; vertical-align: middle; color: #000; background-color: transparent; box-shadow: none; }
.invalid-message {font-size: .875rem;  margin-top: 4px; color: #ff2d47; }
body[data-state=logout] .invalid-message.top-margin { margin-top: 10px; }
body[data-state=logout] .inner input[type=text] , body[data-state=logout] .inner input[type=email] { background-color: #fff; box-shadow: inset 0 0 0 1px #e4e4e4; }
body[data-state=logout] .inner input[type=text][disabled] , body[data-state=logout] .inner input[type=email][disabled] { color: #999; background-color: #eee; box-shadow: inset 0 0 0 1px #e4e4e4; }
body[data-state=logout] .inner input[type=text].inline , body[data-state=logout] .inner input[type=email].inline  { display: inline-block; }
body[data-state=logout] .inner input[type=text]:focus ,body[data-state=logout] .inner input[type=email]:focus {background-color: #fff;  box-shadow: inset 0 0 0 2px #007aff; }
body[data-state=logout] .inner input[type=text][invalid] , body[data-state=logout] .inner input[type=email][invalid] , body[data-state=logout] .inner input[type=number][invalid] , body[data-state=logout] .inner select[invalid] {background-color: #fff;  box-shadow: inset 0 0 0 2px #ff2d47; }
body[data-state=logout] .inner input[type=text].small:focus  , body[data-state=logout] .inner input[type=email].small:focus  {background-color: #fff;  box-shadow: inset 0 0 0 1px #007aff; }
body[data-state=logout] .inner input[type=text].small[invalid] , body[data-state=logout] .inner input[type=email].small[invalid]  {background-color: #fff;  box-shadow: inset 0 0 0 1px #ff2d47; }
body[data-state=logout] .inner input[type=text][readonly]:focus , body[data-state=logout] .inner input[type=email][readonly]:focus{ box-shadow: inset 0 0 0 2px #e6e6e6; }



.button-normal {font-size: .875rem; font-weight: 700; line-height: 36px;  display: inline-block; box-sizing: border-box; min-width: 100px; height: 40px; padding: 0 15px; transition: color .3s ease-in-out; text-align: center; color: #fff; border: 2px solid #000; background-color: #000; }
.button-normal:hover { color: rgba(255, 255, 255, .6); }
.button-normal:hover:before { opacity: .6; }
.button-normal[disabled] { color: rgba(255, 255, 255, .3); border: 2px solid #747474; background-color: #747474; }
.button-normal[data-size=large] {font-size: 1rem; line-height: 44px;  height: 50px; }
.button-normal[data-size=small] {font-size: .75rem; line-height: 24px; min-width: 50px; height: 30px;  padding-right: 10px; padding-left: 10px; }
.button-normal[data-state=etc] { font-size: .875rem; font-weight: 400; line-height: 38px; color: #666; border: 1px solid #ddd; background-color: #fff; }
.button-normal[data-state=bold] { font-size: .875rem; font-weight: 600; line-height: 36px; color: #000; border: 2px solid #000; background-color: #fff; }
.button-normal[data-state=submit] { border: 2px solid #1886ff; background-color: #1886ff; }
.button-normal[data-state=submit][disabled] { border: 2px solid #8fc6fe; background-color: #8fc6fe; }
.popEmail {width : 100%;} 
.popName {width : 100%;}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('.popup-find-btn').magnificPopup({
			items: {
				src: '#popup-forgot-password'
			},
		});	
		
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var userInputId = getCookie("userInputId");
		$("input[name='id']").val(userInputId); 
		
		if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}
		
		$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
			if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
				var userInputId = $("input[name='id']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}else{ // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});
		
		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
			if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
				var userInputId = $("input[name='id']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
	});
	
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	
	function enterkey(){
		if(window.event.keyCode == 13){
			join(); 
		}
	}
	
	function join() {
		//$('#target').submit();
		var id = $('#id').val();
		var password = $('#password').val();
		var data = {"id" : id, "password" : password};
		
		if(id==""){
			alert("아이디를 입력해주세요.");
			return false;
		}else if (password == ""){
			alert("비밀번호를 입력해주세요.");
			$('#password').focus(); 
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "/memeber/join.do",
			data : data,
			dataType : 'json',
			success : function(data) {
				var result = data["resultMsg"];
				var auth = data["auth"];
				if(result == "success"){
					if(auth == "success"){
						location.href="/main";
					}else if(auth == "nomal"){
						location.href="/mypage";
					}
				}else{
					alert("아이디와 비밀번호가 일치하지 않습니다.");
				}
			}
		});
	}
	</script>
</head>

<body>

	<div>
	
	<!-- 비밀번호 찾기 -->
		<aside id="popup-forgot-password" class="layout-popup mfp-hide">
			<h2 class="layout-popup-title">
				FORGOT PASSWORD
			</h2>
		
			<div class="layout-popup-contents">
				<p class="layout-popup-message">
					Enter your email and we will send you a link with a new password.
				</p>
				<p class="layout-popup-message" data-state="invalid">
					No user was found with that email address.<br>
					Enter your other email.
				</p>
				<p class="layout-popup-message mobile" data-state="invalid">
					No user was found with that email address. Enter your other email.
				</p>
		
				<fieldset class="forms">
					<legend>FORGOT PASSWORD</legend>
		
					<div class="forms-item">
						<label for="" class="label">Email</label>
						<input type="email" id="email" name="" data-state="invalid">
						<p class="invalid-message">현재 비밀번호가 틀렸습니다.</p>
					</div>
		
					<div class="forms-item">
						<label for="" class="label">Name</label>
						<input type="text" id="name" name="">
					</div>
				</fieldset>
		
			</div>
		
			<div class="layout-popup-footer">
				<p class="btns">
					<a href="#" class="button-normal" data-size="large">DONE</a>
				</p>
			</div>
		</aside>
	</div>

	<div class="wrap_center mTitle">
		<h2><span class="mTitle">Bespin Membership Login</span></h2>

	</div>

	<div id="contents">


		<div class="service_cont">


			<!-- sub -->
			<div id="sub_wrap">


				<!-- login_container -->
				<div id="login_container">


					<!-- login -->
					<div id="logn_contents">
						
						<form id="target" action="/memeber/join">

						<h4 class="pT20 pB4"> 이메일 아이디 </h4>
						<div class="form_area pR20 pB10">
							<input type="input" id="id" name="id" value="" onkeyup = "enterkey();" class="input_form" style="width:99%;">
						</div>

						<h4 class="pT20 pB4"> 비밀번호 <span class="tx_red">( 영문소문자 4~15자 이내 )</span></h4>
						<div class="form_area pR20">
							<input type="Password" id="password" name="password" onkeyup = "enterkey();" value="" class="input_form" style="width:99%;">
						</div>
						<!-- <div class="pT10 tx_red">비밀번호가 올바르지 않습니다 </div> -->
						</form>
						
						<div class="pR10 pT30">
							<input id="idSaveCheck" type="checkbox" class="list_checkbox" value=""> 이메일 기억하기 
							<span class="fl_right"><a href="#n" class="popup-find-btn"><b>비밀번호 찾기</b></a> </span>
						</div>

						<div class="btn-label_wrap mT20 pB30 al_center">
							<div class="btn-label_blue" onClick="join();">로그인</div>
						</div>

						<div class="txt_account">
							아직 베스핀 계정이 없으신가요? <p>
							클라우드를 한눈에 볼 수 있는 서비스를 시작해보세요.
						</div>

						<!-- login_btn -->
 
							<div class="btn-label_wrap2 mT20">
								<a href="/register"><div class="btn-label_blue3">가입하기</div></a>
							</div>
 
						<!-- //login_btn -->


					</div>
					<!-- //login_contents -->

 
				</div>
				<!-- //sub_container -->
			</div>
			<!-- // sub -->



		</div>
	</div>
	
</body>
</html>