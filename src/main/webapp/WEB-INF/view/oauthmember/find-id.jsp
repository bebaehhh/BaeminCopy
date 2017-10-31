<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ID 찾기</title>
<link rel="stylesheet" href="<c:url value="/css/find-id.css" />" />
<script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
<script type="text/javascript">
	var resultNumber = 0 ;
	$(function() {
		$(".idFind").click(function(e) {
			$(".findList").removeClass("on");
			$(".findList:first").addClass("on");
			$(".ipfind").removeClass("on");
			$(this).addClass("on");
		});
		
		$(".pwFind").click(function(e) {
			console.log("aaaaa");
			$(".findList").removeClass("on");
			$(".findList:last").addClass("on");
			$(".ipfind").removeClass("on");
			$(this).addClass("on");
		});
		
		$(".emailBtn").click(function() {
			var memberId = $("#memberId").val();
			$.post("<c:url value='/oauthmember/emailCert' />", {
				memberId : memberId
			}, function(response) {
				alert("이메일로 인증번호를 보냈습니다.크크");
				resultNumber = response;
			});
		});
		 $(".certNoBtn").click(function() {	  
			 	var certNo = $("#certNo").val();
			 	
			 	if(certNo.length < 1){
			 		alert("인증번호를 입력하세요");
			 		return;
			 	}
			 	if(certNo != resultNumber) {
			 		alert("틀린 인증번호입니다. 인증번호를 다시입력하세요 ");
			 		$("#certNo").val("");
			 		return;
			 	}
			 	if(certNo == resultNumber) {
			 		alert("인증이 완료되었습니다.");
			 	}
	   		});
		 
		 $(".btnConfirm").click(function(){
			self.close();
		 });
	});
</script>
</head>
<body>
	<div id="loginWrapper3">
		<div class="contentFind">
			<ul class="idpwType">
				<li class="idFind ipfind on"><a id="idfind" href="#">ID 찾기</a></li>
				<li class="pwFind ipfind"><a id="pwfind" href="#">비밀번호 찾기</a></li>
			</ul>
		</div>

		<ul class="loginFindUl">
			<li class="findList on">
				<div class="emailAndId">
					<div class="emailCheck">
						이메일 또는 아이디
						<p>ID 조회를 위해 이메일 인증이 필요합니다.</p>
					</div>
				</div>
				<div class="emailOrId">
					<label for=>이메일 또는 아이디</label> 
					<input type="text" maxlength="40" name="memberId" id="memberId" placeholder="이메일 또는 아이디">
				</div>
				<div class="emailButton">
					<button type="button" class="emailBtn">인증번호 전송</button>
				</div>
				<div class="certNumber">
					<div class="certNumber1">
						<input type="text" name="certNo" id="certNo" placeholder="인증번호 입력">
					</div>
					<button type="button" class="certNoBtn" value="submit" onSubmit="return check();">인증</button>
				</div>
			</li>

			<li class="findList">
				<div class="emailCheck1">이메일 또는 아이디</div>
				<div class="emailOrId1">
					<label for=>이메일 또는 아이디</label> <input type="email" maxlength="40"
						name="id" placeholder="이메일 또는 아이디">
				</div>
				<div id="phoneNumber">휴대폰번호</div>
				<div id="phoneNumberCheck" style="display: inline-block;">
					<div class="phonenumberCheck1"
						style="display: inline-block; margin-top: 11px;">
						<input type="tel" maxlength="4" name="number" id="number">
					</div>
					<div class="phonenumberCheck1"
						style="display: inline-block; float: left; margin-top: 11px;">
						<input type="tel" maxlength="3" name="number1" id="number1">
					</div>
					<div class="phonenumberCheck1"
						style="display: inline-block; float: left; margin-top: 11px;">
						<input type="tel" maxlength="4" name="number2" id="number2">
					</div>
				</div>
				<div class="confirmBtn">
					<button type="button" class="btnConfirm">확인</button>
				</div>
			</li>
		</ul>

		
	</div>

</body>
</html>
