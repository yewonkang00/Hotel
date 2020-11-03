<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>

	<title>Bespin서비스</title>
	<style>
	input:focus::-webkit-input-placeholder{ /* WebKit browsers */ color:transparent; } 
	input:focus:-moz-placeholder{ /* Mozilla Firefox 4 to 18 */ color:transparent; } 
	input:focus::-moz-placeholder{ /* Mozilla Firefox 19+ */ color:transparent; } 
	input:focus:-ms-input-placeholder{ /* Internet Explorer 10+ */ color:transparent; }
	</style>
	
	<script type="text/javascript">
	var checkEmailID = null;
	$(document).ready(function(){
		
		<%-- var session = "<%=session.getAttribute("loginMemberSession") %>";
		var sessionUID = "<%=session.getAttribute("sessionUID") %>";
		if(sessionUID == null || sessionUID=="" || sessionUID == "null"){
			alert("세션정보가 없습니다.");
			location.href="/";
		} --%>
		
		$('#chargemanagerEmail').keyup(function(){
			var email = $('#chargemanagerEmail').val();
			
			if(email != 0){
				if(isValidEmailAddress(email)){
					$('#validEmail2').text('');
				}else{
					$('#validEmail2').text("(이메일 형식이 아닙니다.)").css('color','red').css('font-size','9pt');
				}
			}else{
				$('#validEmail2').text("(이메일을 입력해주세요)").css('color','red').css('font-size','9pt');
			}
		});
		
		$('#id').keyup(function(){
			
			checkEmailID = null;
			
			var emailId = $('#id').val();
			
			if(emailId != 0){
				if(isValidEmailAddress(emailId)){
					$('#validEmail').text('(이메일 중복체크를 해주세요)').css('color','blue').css('font-size','9pt');
					$('#checkId').css({'pointer-events': 'auto'});
					
				}else{
					$('#validEmail').text('(이메일 형식이 아닙니다.)').css('color','red').css('font-size','9pt');
					$('#checkId').css({'pointer-events': 'none'});
				}
			}else{
				$('#validEmail').text("").css('color','red').css('font-size','9pt');
			}
		});
		
		$('#password').keyup(function(){
			var pw = $('#password').val();
			var charType = 0;
			
			if(pw != 0){
				if(chkLowUp(pw)){
					charType++;
				}
				if(chkNum(pw)){
					charType++;
				}
				if(chkSpecialChar(pw)){
					charType++;
				}
			}
			
			if(charType >= 3){
				if(pw.length < 8){
					$('#validPwd').text('(8자리 이상으로 입력하세요)').css('color','red').css('font-size','9pt');
				}else{
					$('#validPwd').text('').css('color','red').css('font-size','9pt');
				}
			}else if(charType == 2){
				if(pw.length < 10){
					$('#validPwd').text("(10자리 이상으로 입력해주세요.)").css('color','red').css('font-size','9pt');
				}else{
					$('#validPwd').text('').css('color','red').css('font-size','9pt');
				}
			}else if(charType == 1){
				$('#validPwd').text("(영문자+숫자+특수문자 최소 2가지 조합을 사용해야합니다.)").css('color','red').css('font-size','9pt');
			}else{
				$('#validPwd').text('').css('color','red').css('font-size','9pt');
			}
		});
		
		$('#passwordCheck').keyup(function(){
			if($('#password').val() != $('#passwordCheck').val()){
				$('#checkPwd').text("(비밀번호가 일치하지않습니다.)").css('color','red').css('font-size','9pt');
			}else{
				$('#checkPwd').text('');
			}
		});
		
		function chkLowUp(inputPw){ // 대소문자
			var charLowUp = new RegExp(/[a-zA-Z]/);
			return charLowUp.test(inputPw);
		}		
		function chkNum(inputPw){// 숫자
			var charNumber = new RegExp(/[0-9]/);
			return charNumber.test(inputPw);
		}
		function chkSpecialChar(inputPw){// 특수문자
			var charSpecial = new RegExp(/[\@\#\$\%\^\&\*\(\)\_\+\!]/);
			return charSpecial.test(inputPw);
		}

		function isValidEmailAddress(emailAddress) {
			var pattern = new RegExp(/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/);
			return pattern.test(emailAddress);
		}
		
		

		$('#selectType').change(function(){
			if(($('#selectType option:selected').val()) == 'sel2'){ // 개인의 경우
				$('#buisnessNumber').attr('disabled', true);
				$('#buisnessName').attr('disabled', true);
				//  $('#checkTaxInfo').css({'pointer-events' : 'none'});
			}else if(($('#selectType option:selected').val()) == 'sel1'){ //사업자의 경우
				$('#buisnessNumber').attr('disabled', false);
				$('#buisnessName').attr('disabled', false);
			}
		});
		$('#chargemanagerMailnumber').attr('disabled', true);
		$('#chargemanagerAddress').attr('disabled', true);
	});
	
	
	function checkId(){ //이메일 중복체크
		var id=$('#id').val();

		if(id == ''){
			$('#validEmail').text('이메일을 입력해주세요.').css('color','red').css('font-size','9pt');
		}else{
			$.ajax({
				type : "POST",
				url : "/member/checkId",
				data : {'id': id},
				dataType : "text",
				success : function(data) {
					if(data == 'exist'){
						$('#validEmail').text('사용 불가능한 이메일 입니다. ').css('color','red').css('font-size','9pt');
						checkEmailID = 'exist';
					}else if(data == 'not_exist'){
						$('#validEmail').text('사용 가능한 이메일 입니다. ').css('color','blue').css('font-size','9pt');
						checkEmailID = 'not_exist';
					}
				}
			});
		}
	}
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) {
			return;
		} else {
			return false;
		}
	}
	 
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if ( keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) {
			return;
		} else {
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	}
	
	function isKorean(objStr){
		 for (i = 0; i < objStr.length; i++) {
		        if (((objStr.charCodeAt(i) > 0x3130 && objStr.charCodeAt(i) < 0x318F) || (objStr.charCodeAt(i) >= 0xAC00 && objStr.charCodeAt(i) <= 0xD7A3))) {
		            return false;      // 한글 포함이면 false 반환
		        } else {
		            return true;       // 한글 미포함이면 true 반환
		        }
		    }
	}


	function execDaumPostcode() {
		var width = 500;
		var height = 600;
		daum.postcode.load(function(){
			
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					    extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
					   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
					    extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if(fullRoadAddr !== ''){
					    fullRoadAddr += extraRoadAddr;
					}
					
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('chargemanagerMailnumber').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('chargemanagerAddress').value = fullRoadAddr;
					document.getElementById('chargemanagerAddressDetail').focus();
				}
			}).open({
				left : (window.screen.width / 2) - (width / 2),
				top : (window.screen.height / 2) - (height / 2)
			});
		});
	}
	
	function checkedAm(){
		if($('#checkMe').is(":checked")){
			var name = $('#subscriberName').val();
			var tel1 = $('#subscriberTelephone1 option:selected').val();
			var tel2 = $('#subscriberTelephone2').val();
			var tel3 = $('#subscriberTelephone3').val();
			
			$('#chargemanagerName').val(name);
			$('#chargemanagerTelephone1').val(tel1).attr('selected','selected');
			$('#chargemanagerTelephone2').val(tel2);
			$('#chargemanagerTelephone3').val(tel3);

		}else{
			$('#chargemanagerName').val('');
			$('#chargemanagerTelephone1 option:eq(0)').prop('selected', true);
			$('#chargemanagerTelephone2').val('');
			$('#chargemanagerTelephone3').val('');
		}
	}
	
	function registMember(){		
		if($('#agreement').is(":checked")){
			if($('#id').val()=='')
				$('#id').focus();
			else if(checkEmailID == null)
				$('#id').focus();
			else if(checkEmailID == 'exist')
				$('#id').focus();
			else if($('#password').val()=='')
				$('#password').focus();
			else if($('#password').val() != $('#passwordCheck').val())
				$('#passwordCheck').focus();
			else if($('#subscriberName').val()=='')
				$('#subscriberName').focus();
			else if($('#subscriberTelephone1').val()=='01')
				$('#subscriberTelephone1').focus();
			else if($('#subscriberTelephone2').val()=='')
				$('#subscriberTelephone2').focus();
			else if($('#subscriberTelephone3').val()=='')
				$('#subscriberTelephone3').focus();
			else if($('#subscriberCellphone1').val()=='01')
				$('#subscriberCellphone1').focus();
			else if($('#subscriberCellphone2').val()=='')
				$('#subscriberCellphone2').focus();
			else if($('#subscriberCellphone3').val()=='')
				$('#subscriberCellphone3').focus();
			else if($('#buisnessNumber').val()=='')
				$('#buisnessNumber').focus();
			else if($('#buisnessName').val()=='')
				$('#buisnessName').focus();
			else if($('#chargemanagerName').val()=='')
				$('#chargemanagerName').focus();
			else if($('#chargemanagerTelephone1').val()=='01')
				$('#chargemanagerTelephone1').focus();
			else if($('#chargemanagerTelephone2').val()=='')
				$('#chargemanagerTelephone2').focus();
			else if($('#chargemanagerTelephone3').val()=='')
				$('#chargemanagerTelephone3').focus();
			else if($('#chargemanagerMailnumber').val()=='')
				$('#chargemanagerMailnumber').focus();
			else if($('#chargemanagerAddressDetail').val()=='')
				$('#chargemanagerAddressDetail').focus();
			else if($('#chargemanagerEmail').val()=='')
				$('#chargemanagerEmail').focus(); 
			else{
				var id =$("#id").val();
				var password =$("#password").val();
				var subscriberName =$("#subscriberName").val();
				var subscriberTelephone =$("#subscriberTelephone1").val()+'-'+$("#subscriberTelephone2").val()+'-'+$("#subscriberTelephone3").val();
				var subscriberCellphone =$("#subscriberCellphone1").val()+'-'+$("#subscriberCellphone2").val()+'-'+$("#subscriberCellphone3").val();
				var buisnessName =$("#buisnessName").val();
				var buisnessNumber =$("#buisnessNumber").val();
				var chargemanagerName =$("#chargemanagerName").val();
				var chargemanagerTelephone =$("#chargemanagerTelephone1").val()+'-'+$("#chargemanagerTelephone2").val()+'-'+$("#chargemanagerTelephone3").val();
				var chargemanagerFaxnumber =$("#chargemanagerFaxnumber1").val()+'-'+$("#chargemanagerFaxnumber2").val()+'-'+$("#chargemanagerFaxnumber3").val();
				var chargemanagerMailnumber =$("#chargemanagerMailnumber").val();
				var chargemanagerAddress =$("#chargemanagerAddress").val();
				var chargemanagerAddressDetail =$("#chargemanagerAddressDetail").val();
				var chargemanagerEmail =$("#chargemanagerEmail").val();
				
				
				var param = { "id": id, 
							"password": password, 
							"subscriberName": subscriberName,
							"subscriberTelephone" : subscriberTelephone,
							"subscriberCellphone" : subscriberCellphone,
							"buisnessNumber" : buisnessNumber,
							"buisnessName" : buisnessName,
							"chargemanagerName" : chargemanagerName, 
							"chargemanagerTelephone" : chargemanagerTelephone,
							"chargemanagerFaxnumber" : chargemanagerFaxnumber,
							"chargemanagerMailnumber" : chargemanagerMailnumber, 
							"chargemanagerAddress" : chargemanagerAddress, 
							"chargemanagerAddressDetail" : chargemanagerAddressDetail,
							"chargemanagerEmail" : chargemanagerEmail
				};
				
			$.ajax({
						type : "POST",
						url : "/member/registMember",
						data : param,
						dataType : "json",
						success : function(data) {
							alert("성공");
							location.href="/";
						}
				});
			}
		}else{
			alert("개인정보 취급방침에 동의해주세요");
		}
	}

	function idpop() {
		
		$.ajax({
			type : "POST",
			url : "/common/checkIdentity",
			data : "test",
			dataType : 'json',
			success : function(data) {
				alert("~~");
			}
		});
		
		/* window.open("/common/checkIdentity", "name", "option" ) */
	}
	
	
	window.name ="Parent_window";
	
	function fnPopup(){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}
	</script>
</head>

<body>

	<div id="wrapper">
		<h1>
			<a class="BI" href="#">  </a>
			<!-- <span style="float:right; font-size:22px;" > -->
			<span class="etc_menu">
				<a href="/">로그인페이지</a>
				<!-- <a href="/register">회원가입페이지</a> -->
			</span>
		</h1>
	</div>

	<div class="wrap_center mTitle">
		<h2><span>베스핀 회원가입 신청</span></h2>
	</div>

	<div id="contents">


		<div class="service_cont">


			<!-- sub -->
			<div id="sub_wrap">


				<!-- sub_container -->
				<div id="sub_container">

					<div class="info_txt mB20">
						<ul>
							<li>* 회원가입은 무료이며, 가입 시 BESPIN GLOBAL이 제공해 드리는 다양하고 차별화된 서비스를 누리실 수 있습니다. </li>
						</ul>
					</div>

					<!-- agreement -->
					<div id="sub_contents">

						<h3>개인정보 수집, 이용에 대한 동의 절차</h3>

							<div class="pT20">
								<textarea class="form_textarea">
1. 개인정보의 수집, 이용 목적 
서비스 제공 및 요금 정보 등 정보 메일 제공

2. 수집하는 개인정보의 항목
아이디, 패스워드
 - 가입자 정보 : 성명, 주민등록번호(사업자등록번호), 전화번호, 휴대전화번호
 - 요금 담당자 정보 : 성명, 전화번호, 팩스번호, 주소, 이메일
 
3. 개인정보의 보유 및 이용기간
 - 서비스를 받으시는 동안 안전하게 보유되며, 이용 목적에 부합하는 경우에만 이용, 서비스 해지 시 해당 정보를 파기합니다. 
 - 단, 전자상거래등에서의 소비자보호에 관한 법률 등 관계법령이 정하는 경우, 서비스 이용의 혼선 방지, 불법적 사용자에 대한 수사기관 수사 협조 등을 위해, 회원탈퇴 후에도 고객님의 정보를 6개월간 보유하게 됩니다.

4. (자동이체 신청 고객 해당) 개인정보 수집 및 이용 동의
    1. 수집 및 이용목적 : CMS 자동이체를 통한 요금 수납
    2. 수집항목 : 성명, 생년월일, 연락처, 은행명, 예금주명, 계좌번호, 예금주 휴대전화번호
    3. 보유 및 이용기간 : 수집/이용 동의 일부터 자동이체 종료일(해지일)까지
    4. 신청자는 개인정보의 수집 및 이용을 거부할 수 있습니다. 단, 거부 시 자동이체 신청이 처리되지 않습니다. </textarea>
							</div>
							
							<div class="pT10 ft_14">
								<label><input id="agreement" type="checkbox" class="list_checkbox" value=""> 개인정보 취급방침에 동의합니다. </label>
							</div>
 
							<h3 class="pT30 fl_left">계정 생성 및 등록</h3>
							
							<div class="fl_right pT30 ft_15">
								<span class="bullet">■</span> 필수 입력 사항입니다.
							</div>
							
							<div class="fl_clear"></div>

							<h4 class="pT10"> 이메일 <span class="bullet">■</span><span id="validEmail"></span></h4>
							<div class="form_area mR10 mB10">
								<input type="input" id="id" name="id" value="" class="input_form fl_left" style="width:40%;" placeholder="test@test.com">
								
								
								<div class="btn-label_wrap3">
									<a href="javascript:void(0);" id="checkId" class="btn-label_bgray" onclick="checkId(); return false"><span>이메일 중복체크</span></a>
								</div>
							</div>
							
							<div class="fl_clear"></div>
							
							<h4 class="pT10"> 비밀번호 <span class="bullet" >■</span><span id="validPwd" ></span></h4>
							<div class="form_area pR20">
								<input type="Password" id="password" name="password" value="" class="input_form" placeholder="영문자+숫자+특수문자 2가지 조합 10자리, 3가지 조합 8자리 이상" onkeyup="isKorean(event);">
							</div>

							<h4 class="pT10"> 비밀번호확인<span class="bullet">■</span><span id="checkPwd"></span></h4>
							<div class="form_area pR20">
								<input type="Password" id="passwordCheck" name="passwordCheck" value="" class="input_form">
							</div>
							
							<div class="partition_line"></div>

						<h3 class="pT20 fl_left">가입자 정보</h3>
							<div class="fl_right pL20 pT20">
								<select class="form_select"  title="" id="selectType">
									<option value="sel1" selected="selected">사업자의경우</option>
									<option value="sel2">개인의경우</option>
								</select>
							</div>
							<div class="fl_clear"></div>

							<h4 class="pT10"> 대표자 성명 <span class="bullet">■</span></h4>
							<div class="form_area pR20">
								<input type="input" id="subscriberName" name="subscriberName" value="" class="input_form">
							</div>

							<h4 class="pT10"> 전화번호 <span id="validTel" class="bullet">■</span></h4>
							<div class="form_area">
								<select class="form_select title" id="subscriberTelephone1" style="width:18%; onchange="changeSelect()">
									<option value="01" selected="selected">선택</option>
									<option value="02">02 </option>
									<option value="031">031 </option>
									<option value="032">032</option>
									<option value="033">033 </option>
									<option value="041">041 </option>
									<option value="042">042 </option>
									<option value="043">043 </option>
									<option value="051">051 </option>
									<option value="052">052 </option>
									<option value="053">053 </option>
									<option value="054">054 </option>
									<option value="054">054 </option>
									<option value="055">055 </option>
									<option value="061">061 </option>
									<option value="062">062 </option>
									<option value="063">063 </option>
									<option value="064">064 </option>
								</select>
								<input type="input" id="subscriberTelephone2" name="subscriberTelephone2" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:37%;">
								<input type="input" id="subscriberTelephone3" name="subscriberTelephone3" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:36%;">
							</div>

							<h4 class="pT10"> 휴대전화 (SMS발송용) <span class="bullet">■</span></h4>
							<div class="form_area">
								<select class="form_select" title="구분" id="subscriberCellphone1" style="width:18%;">
									<option value="01" selected="selected">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								
								<input type="input" id="subscriberCellphone2" name="subscriberCellphone2" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:37%;">
								<input type="input" id="subscriberCellphone3" name="subscriberCellphone3" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:36%;">
							</div>

							<h4 class="pT10"> 사업자등록번호 <span class="bullet">■</span></h4>
							<div class="form_area mR10 mB10">
								<input type="input" id="buisnessNumber" name="buisnessNumber" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form fl_left" style="width:40%;">
								
								<div class="btn-label_wrap3">
									<a href="#n" id="checkTaxInfo" class="btn-label_bgray"><span>세금계산서 정보 확인</span></a>
								</div>
							</div>
							
							<div class="fl_clear"></div>
							
							<h4 class="pT10"> 사업자명  <span class="bullet">■</span></h4>
							<div class="form_area pR20">
								<input type="input" id="buisnessName" name="buisnessName" value="" class="input_form">
							</div>
							
							<div class="partition_line fl_clear"></div>
							
							<h3 class="pT20 fl_left">요금 담당자 정보</h3>
							<div class="fl_right pL30 pT20 ft_14">
								<label><input type="checkbox" id="checkMe" class="list_checkbox" onclick="checkedAm();" value=""> 가입자와 요금관련 담당자가 동일</label>
							</div>

							<div class="fl_clear"></div>
							<h4 class="pT10"> 담당자 성명 <span class="bullet">■</span></h4>
							<div class="form_area pR20 pB10">
								<input type="input" id="chargemanagerName" name="chargemanagerName" value="" class="input_form">
							</div>

							<h4 class="pT10 fl_left"> 본인인증 <span class="bullet">■</span> <span class="tx_red">(담당자와 이름이 일치해야 합니다.)</span></h4>
							<div class="btn-label_wrfl_leap fl_left pT10 pL20">
								 <a href="javascript:fnPopup();" class="btn-label_bgray" style="float: left;"><span>본인인증</span></a> 
							</div>
							<div class="fl_clear"></div>
							
							<h4 class="pT20"> 전화번호 <span class="bullet">■</span></h4>
							<div class="form_area">
								<select class="form_select" title='구분' id='chargemanagerTelephone1' style='width:18%;'>
									<option value="01" selected="selected">선택</option>
									<option value="02">02 </option>
									<option value="031">031 </option>
									<option value="032">032</option>
									<option value="033">033 </option>
									<option value="041">041 </option>
									<option value="042">042 </option>
									<option value="043">043 </option>
									<option value="051">051 </option>
									<option value="052">052 </option>
									<option value="053">053 </option>
									<option value="054">054 </option>
									<option value="054">054 </option>
									<option value="055">055 </option>
									<option value="061">061 </option>
									<option value="062">062 </option>
									<option value="063">063 </option>
									<option value="064">064 </option>
								</select>
								
								<input type="input" id="chargemanagerTelephone2" name="chargemanagerTelephone2" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:37%;">
								<input type="input" id="chargemanagerTelephone3" name="chargemanagerTelephone3" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:36%;">
							</div>


							<h4 class="pT10"> 팩스번호</h4>
							<div class="form_area">
								<select class="form_select" title="" id="chargemanagerFaxnumber1" style="width:18%;">
									<option value="" selected="selected">선택</option>
									<option value="02">02 </option>
									<option value="031">031 </option>
									<option value="032">032</option>
									<option value="033">033 </option>
									<option value="041">041 </option>
									<option value="042">042 </option>
									<option value="043">043 </option>
									<option value="051">051 </option>
									<option value="052">052 </option>
									<option value="053">053 </option>
									<option value="054">054 </option>
									<option value="054">054 </option>
									<option value="055">055 </option>
									<option value="061">061 </option>
									<option value="062">062 </option>
									<option value="063">063 </option>
									<option value="064">064 </option>

								</select>
								<input type="input" id="chargemanagerFaxnumber2" name="chargemanagerFaxnumber2" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:37%;">
								<input type="input" id="chargemanagerFaxnumber3" name="chargemanagerFaxnumber3" onkeydown="return onlyNumber(event);" onkeyup="removeChar(event);" value="" class="input_form" style="width:36%;">
							</div>

							<h4 class="pT16 pB4"> 주소 <span class="bullet">■</span> <span class="tx_red">(우편물 받으실 곳의 주소를 입력하여 주십시요)</span></h4>
								<div class="form_area mR10 ">
									<input type="input" id="chargemanagerMailnumber" name="chargemanagerMailnumber" value="" class="input_form fl_left" style="width:20%;">
									
									<div class="btn-label_wrap3">
										 <a href="#n" class="btn-label_bgray" onclick="execDaumPostcode();"><span>우편번호</span></a> 
									</div>
								</div>
								<div class="form_area pR20">
									<input type="input" id="chargemanagerAddress" name="chargemanagerAddress" value="" class="input_form mT10">
									<input type="input" id="chargemanagerAddressDetail" name="chargemanagerAddressDetail" value="" class="input_form mT10">
								</div>
								
							<h4 class="pT10"> 이메일 <span class="bullet">■</span><span id="validEmail2"></span></h4>
							<div class="form_area pR20 pB20">
								<input type="input" id="chargemanagerEmail" name="chargemanagerEmail" value="" class="input_form">
							</div>
							
							<div class="btn-label_wrap pT30 pB30 al_center">
								 <a href="#n" class="btn-label_gray2"><span>취소</span></a>
								 <a href="javascript:registMember();" class="btn-label_blue2"><span>확인</span></a> 
							</div>

					</div>
					<!-- //sub_contents -->
				</div>
				<!-- //sub_container -->
			</div>
			<!-- // sub -->
		</div>
	</div>
	
	
	<%-- 업체정보 암호화 데이타 : [${sEncData}]<br><br> --%>

	<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value=${sEncData}>		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    
		<!-- <a href="javascript:fnPopup();"> CheckPlus 안심본인인증 Click</a> -->
	</form>
	
	<div id="footer">
		<div id="footer_wrap">
			<div id="footer_contents">
				<span class="black_area">
				상호 : 베스핀글로벌 주식회사 ㅣ 대표자명 : 이해민, LEE JOHN HANJOO ㅣ 유선전화번호 : 1668 - 1280 <br>
				사업자등록증번호 : 638-87-00223 ㅣ 통신판매번호 : 2019-서울서초-0347<br>
				사업장주소지 : 서울특별시 서초구 강남대로 327, 13,14,15,16층(서초동,대륭서초타워)<br>
				</span>
			</div>
		</div>
	</div>
	
</body>
</html>