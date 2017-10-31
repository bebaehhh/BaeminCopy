<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/commons-style.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>"/>
<script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
<script type="text/javascript">
	$().ready(function() {
		var passwordcheck = false;
		
		$("#checkBtn").click(function() {
			  
			  var password = ${sessionScope._USER_.password};
			  var check = $("#checkpassword").val();
			  
			  /* 아이디 및 비밀번호 입력 체크 */
				 if(password == check) {
					 passwordcheck = true;
					 alert("비밀번호가 일치합니다!\n이제 새로운 비밀번호를 입력해주세요.");
					
					 $(".comment").text("");
					 return false;
				 }
				 else {
					 $(".comment").text("※입력하신 비밀번호가 일치하지 않습니다.");
					 $(".comment").css("display", "block");
					 passwordcheck = false;
					 return false;
				 }
			  
				});
		
				$("#changeBtn").click(function() {
					if (passwordcheck == true ) {
						$("#updateForm").attr({
							method: "post",
							action: "<c:url value='/mypage/doUpdate'/>"
						}).submit();
						alert("회원정보가 수정되었습니다.");
					}
					else {
						alert("현재 비밀번호를 입력하고 확인하세요.");
						return false;
					}
					
				});
				
				$("#emailBtn").click(function() {
					$(".display-one").css("display", "none");
					$(".display-two").css("display", "inline-block");
					$(".phone-input3").css("width", "40%");
					return false;
				});
				
				$("#emailcancelBtn").click(function() {
					$(".display-two").css("display", "none");
					$(".display-one").css("display", "inline-block");
					$(".phone-input3").css("width", "55%");
					return false;
				});
				
				$("#emailsaveBtn").click(function() {
					$("#updateForm").attr({
						method: "post",
						action: "<c:url value='/mypage/doUpdateId'/>"
					}).submit();
					alert("아이디가 수정되었습니다.");
				});
				
			});	
</script>
</head>
<body>
	<div class="container">
		<ol class="nonlistnumberonly paddingbottom5 paddingleft0">
			<li class="homelist homelittlefont">
				<a href="http://localhost:8080/BaeminCopy/">홈</a></li>
			<li class="homelist  homelittlefont">
				> 
				<a href="http://localhost:8080/BaeminCopy/mypage/mypage_m">마이페이지</a>
				> 
			</li>
			<li class="homelist fontweightblack homelittlefont">내 정보</li>
		</ol>
		<div style="background-color: white">
			<ul class="top">
				<li><a href="<c:url value="/mypage/baro_list" />"><span class="service">바로결제 내역</span></a></li>
				<li><a style="color: #000; border-bottom: 6px solid #000;" href="<c:url value="/mypage/myinfo" />"><span class="service">내 정보</span></a></li>
				<li><a href="<c:url value="/mypage/point" />"><span class="service">포인트</span></a></li>
				<li><a href="<c:url value="/mypage/myreview" />"><span class="service">리뷰 관리</span></a></li>
			</ul>
			<div class="margin_left_top">
				<p class="homefont fontweightblack underline">내 정보</p>
			</div>
			<form class="margin_top_zero" id="updateForm">
				<h4>기본정보</h4>
				<div class="padding_under">
					<div>
						<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>배민ID</strong></label>
						<div class="inline-block phone-input3">
							<p name="memberId" id="pmemberId" class="form-control left no-border strong smallfont display-one">${sessionScope._USER_.memberId}</p> 
							<input type="text" class="form-control left display-two" id="tmemberId" name="memberId" value="${sessionScope._USER_.memberId}" maxlength="12">
						</div>
						<button id="emailBtn" class="col-lg-3 strong display-one ">이메일 변경</button>
						<button id="emailsaveBtn" class="col-lg-3 strong display-two background-black">이메일 저장</button>
						<button id="emailcancelBtn" class="col-lg-3 strong display-two">변경 취소</button>
					</div>
					<div>
						<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>휴대폰</strong></label>
						<div class="inline-block phone-input" > 
							<input type="text" class="form-control left" id="phoneNumber" name="phoneNumber" placeholder="휴대폰 번호를 입력해주세요." value="${sessionScope._USER_.phoneNumber}" maxlength="12">
						</div>
					</div>
					<div style="margin-left: 130px; font-size: 12px; color: #808080;">휴대폰 정보를 입력하시면, 바로결제 시 자동으로 연락처란에 입력됩니다.<br/>휴대폰 인증을 하셔야만 포인트 충전을 하실 수 있습니다.</div>
				</div>
				<h4>비밀번호 변경</h4>
					<div class="padding_under">
						<div>
							<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>현재 비밀번호</strong></label>
							<div class="inline-block phone-input" > 
								<input type="password" class="form-control left" id="checkpassword" name="prepassword" placeholder="현재 비밀번호를 입력해주세요."  maxlength="12">
							</div>
							<button class="col-lg-3 strong" id="checkBtn">확인</button>
							<p class="comment">계정 정보를 입력해 주세요.</p>
						</div>
						<div>
							<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>신규 비밀번호</strong></label>
							<div class="inline-block phone-input2" > 
								<input type="password" class="form-control left" id="password" name="password" placeholder="8~20자로 입력해주세요." maxlength="12">
							</div>
						</div>
						<div>
							<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>비밀번호 확인</strong></label>
							<div class="inline-block phone-input2" > 
								<input type="password" class="form-control left" id="newpasswordcheck" name="newpasswordcheck" placeholder="비밀번호를 재입력해주세요." maxlength="12">
							</div>
						</div>
					</div>
				<h4>추가정보</h4>
					<div class="padding_under">
						<label for="inputphone1" class="control-label col-lg-2 strong label-width-height"><strong>닉네임</strong></label>
						<div class="inline-block phone-input2" > 
							<input type="text" class="form-control left" id="nickName" name="nickName" placeholder="휴대폰 번호를 입력해주세요." value="${sessionScope._USER_.nickName}" maxlength="12">
						</div>
						<div style="margin-left: 130px; font-size: 12px; color: #808080;">닉네임을 설정하지 않으면 아이디가 닉네임으로 사용됩니다.</div>
					</div>
				<div>
					<button style="width: 80%; color: #fff;" class="button-padding strong background-black" id="changeBtn">변경하기</button>
					<button style="width: 15%; color: #fff;" class="button-padding strong background-darkgray">취소</button>
				</div>
			</form>
		</div>
	

	</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>