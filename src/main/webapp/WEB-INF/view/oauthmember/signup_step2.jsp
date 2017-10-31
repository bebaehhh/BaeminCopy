<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value="/css/newSign2.css"/>" />
<script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
<script type="text/javascript">
	var resultNumber = 0 ;
	$(function() {
		$("#finishBtn").click(function() {
			$("#signUpForm").attr({
				method : "post",
				action : "<c:url value='/oauthmember/doSignUp'/>"
			}).submit();
		});

		$('.birth-refer').click(function() {
			var event = $(this).next();
			console.log(event);
			if (event.css("display") == "none") {
				event.css({
					display : "block"
				});
				$(".birth-refer-show").css({
					'background-position' : '0 -5px'
				});
			} else {
				event.css({
					display : "none"
				});
				$(".birth-refer-show").css({
					'background-position' : '0px 0px'
				});
			}
		});

		$("input[type='radio']:last").prop("checked", true);
		radioCheck();

		// 라디오 버튼 성별 체크
		$(".gender").click(
				function() {
					$(this).closest(".person-area").find("input[type='radio']")
							.prop("checked", true);
					radioCheck();
				});

		function radioCheck() {
			$("input[type='radio']").each(
					function(index) {
						if ($(this).is(":checked")) {
							$(this).closest(".person-area").find("label").css(
									"background-position", "0px -87px");
						} else {
							$(this).closest(".person-area").find("label").css(
									"background-position", "0px -122px");
						}
					});
		}
		//취소 버튼
		$("#cancelBtn").click(function() {
			window.open("<c:url value='/' />", "취소 버튼");
		});
		//이메일인증  	
		$(".emailBtn").click(function() {
			var memberId = $("#memberId").val();
			$.post("<c:url value='/oauthmember/emailCert' />", {
				memberId : memberId
			}, function(response) {
				alert("이메일로 인증번호를 보냈습니다.헤헷");
				resultNumber = response;
			});
		});		  
		 $(".successBtn").click(function() {	  
			 	var inputNumber = $("#inputNumber").val();
			 	
			 	if(inputNumber.length < 1){
			 		alert("인증번호를 입력하세요");
			 		return;
			 	}
			 	if(inputNumber != resultNumber) {
			 		alert("틀린 인증번호입니다. 인증번호를 다시입력하세요 ");
			 		$("#inputNumber").val("");
			 		return;
			 	}
			 	if(inputNumber == resultNumber) {
			 		alert("인증이 완료되었습니다.");
			 	}
	   		});
		 
//	 		var allCheckBtn = false;
//	 		$(".check-all label").click(function() {
//	 			if (!allCheckBtn) {
//	 				allCheckBtn = !allCheckBtn;
//	 				$(this).css("background-position", "-8px 0");
//	 				$(".check-choice a").css("background-position", "-8px 0");
//	 				$("#signUpForm").find(".hiddenSelector").val("Y");
//	 			}

//	 			else {
//	 				allCheckBtn = !allCheckBtn;
//	 				$(this).css("background-position", "-8px -27px");
//	 				$(".check-choice a").css("background-position", "-8px -27px");
//	 				$("#signUpForm").find(".hiddenSelector").val("N");
//	 			}
//	 		});

		// 전체 체크박스
		$("#allCheckBtnLabel").click(function(e) {
			var allCheckBtn = $(this).closest(".check-all").find("#allCheckBtn");
			
			if (allCheckBtn.prop("checked") == false) {
				$(this).css("background-position", "-8px 0");
				allCheckBtn.prop("checked", true);
				$(".checkBtn").each(function(index) {
					$(this).prop("checked", true);
					$(this).closest(".check-choice").find(".agree-btn").css("background-position", "-8px 0");
				});
			}
			else {
				$(this).css("background-position", "-8px -27px");
				allCheckBtn.prop("checked", false);
				$(".checkBtn").each(function(index) {
					$(this).prop("checked", false);
					$(this).closest(".check-choice").find(".agree-btn").css("background-position", "-8px -27px");
				});
			}
		});
		 
	 	// 체크박스
	 	$(".agree-btn").click(function(e) {
	 		$("#allCheckBtn").prop("checked", false);
	 		$("#allCheckBtnLabel").css("background-position", "-8px -27px");
			var checkBox = $(this).closest(".check-choice").find(".checkBtn");
			
			if (checkBox.prop("checked") == false) {
				checkBox.prop("checked", true);
				$(this).css("background-position", "-8px 0");
			}
			else {
				checkBox.prop("checked", false);
				$(this).css("background-position", "-8px -27px");
			}
		});

	});
</script>
<title>Document</title>
</head>
<body>
	<div id="signWapper2">

		<form id="signUpForm">
			<input type="hidden" name="password" value="<%=request.getParameter("password")%>" /> 
			<input type="hidden" name="nickName" value="<%=request.getParameter("memberId")%>" />
			<input type="hidden" class="hiddenSelector" id="useAgreementYn" name="useAgreementYn" value="N"/>
			<input type="hidden" class="hiddenSelector" id="elecFinaceAgreementYn" name="elecFinaceAgreementYn" value="N"/>
			<input type="hidden" class="hiddenSelector" id= "infoCorrectYn" name="infoCorrectYn" value="N"/>
			<input type="hidden" class="hiddenSelector" id= "infoThirdAgreementYn" name="infoThirdAgreementYn" value="N"/>
			<input type="hidden" class="hiddenSelector" id="mailSmsYn" name="mailSmsYn" value="N"/>



			<div id="content-b">
				<!--STEP 2.1 -->
				<div id="step2">
					<img alt="step로고" src="<c:url value="/img/step2.png" />" />
				</div>

				<!--아래 정보를 추가 입력해야 회원가입이 완료됩니다.-->
				<p class="jointxt">아래 정보를 추가 입력해야 회원가입이 완료됩니다.</p>
				<!--휴대폰인증-->
				<div id="phone">
					이메일인증 <span class="phone1">배달시 정확한 주문정보가 필요합니다.</span>
				</div>
				<div class="emailOrId2">
					<label for=>이메일 또는 아이디</label> <input type="email" maxlength="40"
						id="memberId" name="memberId" placeholder="이메일 또는 아이디"
						value="<%=request.getParameter("memberId")%>">
				</div>
				<div class="emailButton1">

					<button type="button" name="authnum" class="emailBtn"
						value="submit">인증번호 전송</button>

				</div>
				<div class="emailOrId2">
					<label for=>인증번호</label>
					<input type="text" maxlength="40" name="id" id="inputNumber" placeholder="인증번호를 입력하세요">
				</div>
				<div class="emailButton1">
					<button type="button" name="authnum" class="successBtn" value="submit" onSubmit="return check();">인증</button>
				</div>
				
			</div>
			<div id="mobileNumber">휴대폰번호</div>
			<div id="mobileNumberCheck" style="display: inline-block;">
				<div class="mobilenumberCheck1" style="display: inline-block; float: left; margin-top: 11px;">
					<input type="tel" maxlength="3" name="phoneNumber" id="number1">
				</div>
				<div class="mobilenumberCheck1" style="display: inline-block; float: left; margin-top: 11px;">
					<input type="tel" maxlength="4" name="phoneNumber" id="number2">
				</div>
				<div class="mobilenumberCheck1" style="display: inline-block; margin-top: 11px;">
					<input type="tel" maxlength="4" name="phoneNumber" id="number3">
				</div>
			</div>
			<!--생년월일-->
			<div id="birthDate">
				생년월일 <span class="birth0">회원가입은 만 14세 이상 고객만 가능합니다.</span>
			</div>
			<div class="birthBox">
				<input type="tel" name="birthday" maxlength="8" placeholder="예:19800321">
			</div>
			<a href="#" class="birth-refer">주의사항 안내<span
				class="birth-refer-show"></span></a>
			<div class="birth-refer-text">
				<p>1.배달의민족 서비스는 만 14세 미만의 아동의 회원가입을 제한하고 있습니다</p>
				<p>2.정보통신망 이용촉진 및 정보보호 등에 관한 법률에는 만 14세미만 아동의 개인정보 수집 시 법정대리의
					동의를 받도록 규정하고 있으며, 생년월일을 허위로 기재하여 법정대리인의 동의없이 회원가입을 하는 경우 회원탈퇴 또는
					서비스 이용이 제한 될 수 있음을 안내해 드립니다.</p>
			</div>
			<!--성별-->
			<div id="person">
				성별 <span class="choice">(선택)</span> <span class="personText">선택하시면
					더 많은 혜택을 받아보실 수 있습니다.</span>
			</div>
			<ul class="person-list">
				<li class="person-area"><input type="radio" name="genderFlag"
					id="persona" value="M"> <label class="gender" for="man">남성</label>
				</li>
				<li class="person-area"><input type="radio" name="genderFlag"
					id="persona1" value="W"> <label class="gender"
					for="woman">여성</label></li>
				<li class="person-area"><input type="radio" name="genderFlag"
					id="persona2" value="N"> <label class="gender"
					for="none">선택 안함</label></li>
			</ul>
			<div class="agree">약관동의</div>
			<div class="all-check">
				<span class="check-all"> 
					<input type="checkbox" id="allCheckBtn" name="check"> 
					<label for="all-check-one" id="allCheckBtnLabel">아래 약관에 모두 동의합니다.</label>
				</span>
				<ul class="checking">
					<li class="checking2">
						<span class="check-choice">
							<input type="checkbox" class="checkBtn" name="check" onclick="agreeCheck">
							<a href="javascript:void(0)" class="agree-btn" id="useAgreementYn">이용약관 동의 (필수)</a> <br>
						</span>
						<span class="check-choice">
							<input type="checkbox" class="checkBtn" name="check"> 
							<a href="javascript:void(0)" class="agree-btn" id="elecFinaceAgreementYn">전자금융거래 이용약관 동의 (필수)</a> <br> 
						</span>
						<span class="check-choice">
							<input type="checkbox" class="checkBtn" name="check">
							<a href="javascript:void(0)" class="agree-btn" id="infoCorrectYn">개인정보 수집이용 동의 (필수)</a> <br> 
						</span>
						<span class="check-choice">
							<input type="checkbox" class="checkBtn" name="check">
							<a href="javascript:void(0)" class="agree-btn" id="infoThirdAgreementYn">개인정보 제 3자 제공 동의 (선택)</a>
							<p class="share">배달의민족 제휴사에 마케팅정보를 제공합니다.</p> <br> 
						</span>
						<span class="check-choice">
							<input type="checkbox" class="checkBtn" name="check"> 
							<a href="javascript:void(0)" class="agree-btn" id="mailSmsYn">마케팅 정보 메일, SMS 수신 (선택)</a>
							<p class="share">수신동의 여부 및 자세한 설정은 환경설정에서 확인할 수 있습니다.</p>
						</span>
					</li>
				</ul>
			</div>
		</form>
		<div class="btn-group">
			<button class="cancel" id="cancelBtn">취소</button>
			<button class="finish" id="finishBtn">완료</button>
		</div>
	</div>
</body>
</html>
