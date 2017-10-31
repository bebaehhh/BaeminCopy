<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문하기</title>
<link rel="stylesheet" href="<c:url value="/css/commons-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/info.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>

<script type="text/javascript">
$().ready(function(){
	$('.btn-show').click(function(){
		var event = $(this).next();
		if(event.css("display") == "none") {
			event.css({display : "block"});
			$(".btn-show-arrow").css({'background-position' : '0 -5px'});
		}
		else{
			event.css({display : "none"});
			$(".btn-show-arrow").css({'background-position' : '0px 0px'});
		}
	});
	

	var event = false;
	$('.btn-safeTel').click(function(){
		if (!event){
			$(".checkbox-dum").css({'background-position' : '0 0px'});
			event = true;
		}
		else {
			$(".checkbox-dum").css({'background-position' : '0 15px'});
			event = false;
		}
		
	});
	

	var event = false;
	$('.btn-safeTel-one').click(function(){
		
		if (!event){
			$(".checkbox-dum-one").css({'background-position' : '0 0px'});
			$(".checkbox-dum-two").css({'background-position' : '0 0px'});
			$(".checkbox-dum-three").css({'background-position' : '0 0px'});
			var resultOne = $('#agreeOne').attr('value','N');
			var resultTwo = $('#agreeTwo').attr('value','N');
			event = true;
		}
		else {
			$(".checkbox-dum-one").css({'background-position' : '0 15px'});
			$(".checkbox-dum-two").css({'background-position' : '0 15px'});
			$(".checkbox-dum-three").css({'background-position' : '0 15px'});
			var resultOne = $('#agreeOne').attr('value','Y');
			var resultTwo = $('#agreeTwo').attr('value','Y');
			event = false;
		}
		
	});
	

	var event = false;
	$('.btn-safeTel-two').click(function(){
		if (!event){
			$(".checkbox-dum-two").css({'background-position' : '0 0px'});
			var result = $('#agreeOne').attr('value','N');
			event = true;
		}
		else {
			$(".checkbox-dum-two").css({'background-position' : '0 15px'});
			var result = $('#agreeOne').attr('value','Y');
			event = false;
		}
		
	});
	

	var event = false;
	$('.btn-safeTel-three').click(function(){
		if (!event){
			$(".checkbox-dum-three").css({'background-position' : '0 0px'});
			var result = $('#agreeTwo').attr('value','N');
			event = true;
		}
		else {
			$(".checkbox-dum-three").css({'background-position' : '0 15px'});
			var result = $('#agreeTwo').attr('value','Y');
			event = false;
		}
		
	});
	

	$('.btn-show-re').click(function(){
		var event = $(this).next();
		if(event.css("display") == "none") {
			event.css({display : "inline-block"});
			$(".btn-show-recently").css({'background-position' : '0px 17px'});
		}
		else{
			event.css({display : "none"});
			$(".btn-show-recently").css({'background-position' : '0px 0px'});
		}
	});
	

	var event = false;
	$('.btn-agreement-before').click(function(){
		var form = $(this);
		if (!event){
			form.removeClass("btn-agreement-after");
			form.addClass("btn-agreement-before");
			event = true;
		}
		else {
			form.removeClass("btn-agreement-before");
			form.addClass("btn-agreement-after");
			event = false;
		}
	});

	$('.btn-look').click(function(){
		var event = $('.btn-look-after');
		var look = $('.btn-look-info');
		var strong = $('.plus-strong');
		var text = $('.btn-text');
		
		if(event.css("display") == "none") {
			event.css({display : "block"});
			look.css({display : "block"});
			text.css({display : "block"});
			strong.addClass("strong");
			$(".btn-show-arrow").css({'background-position' : '0 -5px'});
		}
		else{
			event.css({display : "none"});
			look.css({display : "none"});
			text.css({display : "none"});
			$(".btn-show-arrow").css({'background-position' : '0px 0px'});
		}
	});
	
		$('#pay-meet').click(function() {
			var resultOne = $('#agreeOne').val();
			var resultTwo = $('#agreeTwo').val();
			
			if( resultOne == 'N' || resultTwo == 'N' ) {
				alert("동의항목을 확인해주세요.");
				return;
			}
			if($.trim($('#add').val()).length == 0){
				alert("주소를 입력하세요.");
				return;
			}
			
			if( confirm("만나서 결제 주문금액: 17,000원 \n\n만나서 결제로 주문하시면\n할인 혜택을 받으실 수 없습니다.\n정말 만나서 결제로 주문하시겠어요?")) {
				return;
			}
			
		});
		
		$('#pay-card').click(function() {
			var resultOne = $('#agreeOne').val();
			var resultTwo = $('#agreeTwo').val();
			
			if( resultOne == 'N' || resultTwo == 'N' ) {
				alert("동의항목을 확인해주세요.");
				return;
			}
			if($.trim($('#add').val()).length == 0){
				alert("주소를 입력하세요.");
				return;
			}
			
			if( confirm("만나서 결제 주문금액: 17,000원 \n\n만나서 결제로 주문하시면\n할인 혜택을 받으실 수 없습니다.\n정말 만나서 결제로 주문하시겠어요?")) {
				return;
			}
			
		});
	
});


</script>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
</head>
<body>
<div class="container">
	<div class="area-one">
	
		<div class="header">
		
			<img src="<c:url value="/img/info1.png" />" style="padding-bottom: 15px;">
			<ol class="inline-block right header-area">
				<li class="strong left" style="margin-right: 8px;">1.메뉴선택  </li>
				<li class="left" style="margin-right: 10px;"> > </li>
				<li class="strong left orange" style="margin-right: 8px;"> 2.배달/결제정보</li>
				<li class="left" style="margin-right: 10px;"> > </li>
				<li class="strong left" style="margin-right: 8px;"> 3.결제</li>
				<li class="left" style="margin-right: 10px;"> > </li>
				<li class="strong left" style="margin-right: 8px;"> 4.주문완료</li>
			</ol>
		</div>
		<!-- 03.결제방법선택 -->
		
			<div class="third-area" style="padding: 0px;">
			<span class="position-two" style="margin-top:35px;"></span>
					<div class="pay-total-info small">
						<ul>
							<li>
							무뼈닭발 <span class="strong pull-right">45,800원</span>
							<li>
							가격 : 小 <span class="pull-right">20,000원 x 1</span>
							</li>
							<li>
							서비스 선택 : 생수 <span class="pull-right">+ 0원 x 1</span>
							</li>
						</ul>
					</div>
					<div class="pay-total-info small" style="border-top: 0px;">
						<ul>
							<li>
							수량 <span class="strong pull-right">1개</span>
							</li>
							<li>
							총 상품금액 <span class="orange strong pull-right ">${order.totalPrice}원</span>
							</li>
						</ul>
						
						<button type="button" class="btn btn-default btn-md" style="border-radius:0px; margin-bottom: 20px; height: 44px;">
							<span class="btn-use-plus" id="btn_use_text">주문 추가하기</span>
						</button>
						
					</div>
					
					<div class="pay-total-info small" style="border-top: 0px; border-bottom: 0px;">
						<ul>
							<li>
							배달의민족 포인트 결제 <span class="strong pull-right">-0원</span>
							</li>
							<li>
							쿠폰적용 <span class="strong pull-right ">-0원</span>
							</li>
							<li>
							OK캐시백 할인 <span class="strong pull-right ">-0원</span>
							</li>
						</ul>
						
					</div>
					
					<div class="pay-total-info" style="border-top: 1px solid #ff4200; height: 88px;">
						<ul>
							<li class="small strong pull-right">
							최종 결제 금액
							</li>
						</ul>
						<ul>
							<li class="strong orange big pull-right">
							${order.totalPrice}원
							</li>
						</ul>
						
					</div>
				
					
					
					<!-- 만나서결제 -->
					<div style="padding: 0px;">
					<span class="position-three" style="margin-top:35px;"></span>
					
					<div style="width:100%; margin-left:10px; margin-bottom:10px;">
						<button type="button" class="btn-default" id="pay-meet" style="cursor: pointer; width:250px; height:60px;">
							<span class="btn-meet-pay">만나서 결제</span>
						</button>
					</div>
					<div style="width:100%; margin-left:10px; margin-bottom:10px;">
						<button type="button" class="btn-default" id="pay-card" style="cursor: pointer; width:250px; height:60px;">
							<span class="btn-meet-card">카드 결제</span>
						</button>
					</div>
					
					<div class="pay-total-info small" style="background-color:#fff;">
						<ul>
							<li class="strong">
							 주류 주문 시 유의사항
							<li class="xsmall">
							주류를 함께 주문할 경우, 배달기사님이 신분증<br/>을 요구할 수 있습니다.
							</li>
						</ul>
					</div>
					<div class="pay-total-info small" style="border-top: 0px; background-color:#fff;">
						<ul>
							<li class="xsmall" style="margin-bottom: 4px;">
							구매 및 개인정보 제 3자 제공에 모두 동의하십<br/>니까?
							</li>
							<li>
								<span class="check-label strong">
									<span class="checkbox-dum-one btn-safeTel-one"></span>
										<input type="checkbox" id="agreeAll" name="agreeAll" value="Y">
										모두 동의합니다.
								</span>
								
								<a href="javascript:void(0)" class="ink-info strong btn-look" style="color:#8a8b8f; margin-left: 50px;">내용보기<span class="btn-show-arrow"></span></a>
								
								
							</li>
						</ul>
						
					</div>
					<div class="pay-total-info small" style="border-top: 0px;">
						<ul>
							<li>
								<span class="check-label plus-strong">
									<span class="checkbox-dum-two btn-safeTel-two"></span>
										<input type="checkbox" id="agreeOne" name="agreeAll" value="N">
										구매조건확인
								</span>
								
								<div class="inline-block btn-look-info xsmall" style="margin-top: 10px;">
									주문할 상품의 구매조건을 확인하였으며, 결제<br/>진행에 동의합니다.
								</div>
							
							</li>
						</ul>
						
					</div>
					<div class="pay-total-info small" style="border-top: 0px;">
						<ul>
							<li>
								<span class="check-label plus-strong">
									<span class="checkbox-dum-three btn-safeTel-three"></span>
										<input type="checkbox" id="agreeTwo" name="agreeAll" value="N">
										개인정보 제 3자 제공동의
								</span>
								
								<div class="btn-look-after">
<pre class="agree-block" style="width:200px; height:80px;">
㈜우아한형제들 개인정보 제3자 제공
동의
회사는 회원님께서 주문하신 상품의 결
제 및 배달 서비스의 원활한 제공을 위
해 최소한의 범위 내에서 아래와 같이
제3자에게 정보를 제공합니다.
</pre>
								</div>
							</li>
						</ul>
						
					</div>
					
					<div class="pay-total-info small btn-text" style="border-top: 0px;">
						<ul>
							<li>
							<span class="strong">개인정보를 제공받는 자</span><br/>
							본가옹고집족발보쌈 / 엔에이치엔페이코㈜
							</li>
							<li style="margin-top: 5px;">
							<span class="strong">제공목적</span><br/>
							배달서비스이용 계약이행(서비스 제공, 수<br/>취인 확인, 배달정보 확인) / 결제서비스 처<br/>리
							</li>
							<li style="margin-top: 5px;">
							<span class="strong">제공항목</span><br/>
							주문한 정보(ID, 결제수단) 및 배달서비스<br/>의 배달 정보(수취인의 주소, 휴대전화번<br/>호, 안심번호 적용시 휴대전화번호 제외) /<br/> 상품명, 상품결제금액, 결제인증값
							</li>
							<li style="margin-top: 5px;">
							<span class="strong">보유 이용기간</span><br/>
							배달서비스 제공 완료 후 6개월 / 목적달성<br/> 후 즉시파기(단, 관련법령에 따라 별도 보<br/>관되는 정보는 예외)
							</li>
						</ul>
					</div>
					<div class="pay-total-info small btn-text" style="border-top: 0px;">
						<div class="inline-block btn-look-info xsmall" style="padding:13px; color: #8a8b8f;">
							개인정보 제공에 동의하지 않으실 수 있으며,<br/> 동의하지 않으실 경우 결제서비스 등의 이용이<br/> 제한 될 수 있습니다.
						</div>
					</div>
				</div>
			</div>
			
			
				
				
		<div style="width:552px;">
			
			<section class="delivery-info">

				<div class="header">
					<img src="<c:url value="/img/info2.png" />" >
				</div>
				<fieldset>
					<div>
					<label for="inputphone1" class="control-label col-lg-2">휴대폰</label>

						<div class="inline-block phone-input">
								<input type="text" class="form-control left" id="Tel_No" name="tel" placeholder="휴대폰 번호를 입력해주세요." value="${sessionScope._USER_.phoneNumber}" maxlength="12">
						</div>
					</div>
					
					
					<div class="inline-block" style="margin-left: 16.7%; margin-top: 5px;">
						<span class="check-label">
							<span class="checkbox-dum btn-safeTel"></span>
								<input type="checkbox" id="useSafeTel" name="useSafeTel" value="Y">
								안심번호 사용할래요.
						</span>
							<a href="javascript:void(0)" class="ink-info btn-show">안심번호?<span class="btn-show-arrow"></span></a>
								
							<div class="btn-word safe-number-info">
							고객님의 개인정보 보호를 위해 실제 연락처 대신 가상의 안심번호를 생성하여 사용하는 서비스로 일정 시간(최대 3시간)이 지난 후 고객님의 안심번호는 자동으로 해지됩니다.
							</div>
					</div>
					
					<div class="form-group">
						<ul>
							<li>
								<label for="inputAddr1" class="control-label col-lg-3">주소</label>
							</li>
							
							<li>
								<div class="inline-block">
									<select name="address" id="address" class="form-control add-input" style="font-size: 11.9px; width: 190px;">
										<option value="001">무악동</option>
										<option value="002">교남동</option>
										<option value="003">소공동</option>
										<option value="004">회현동</option>
										<option value="005">명동</option>
										<option value="006">필동</option>
										<option value="007">을지로동</option>
										<option value="008">중림동</option>
										<option value="009">후암동</option>
										<option value="010">용산2가동</option>
										<option value="011">남영동</option>
										<option value="012">청파동</option>
										<option value="013">원효로1동</option>
										<option value="014">원효로2동</option>
										<option value="015">효창동</option>
										<option value="016">용문동</option>
										<option value="017">한강로동</option>
										<option value="018">이촌1동</option>
										<option value="019">이촌2동</option>
										<option value="020">이태원1동</option>
										<option value="021">이태원2동</option>
										<option value="022">한남동</option>
										<option value="023">서빙고동</option>
										<option value="024">보광동</option>
										<option value="025">천연동</option>
										<option value="026">북아현동</option>
										<option value="027">충현동</option>
										<option value="028">신촌동</option>
										<option value="029">연희동</option>
										<option value="030">아현동</option>
										<option value="031">공덕동</option>
										<option value="032">도화동</option>
										<option value="033">용강동</option>
										<option value="034">대흥동</option>
										<option value="035">염리동</option>
										<option value="036">신수동</option>
										<option value="037">서강동</option>
										<option value="038">서교동</option>
										<option value="039">합정동</option>
										<option value="040">연남동</option>
									</select>
								</div>
							</li>
							
							<li>
								<div class="inline-block" style="height: 34px; width: 242px; margin-left: 8px;">
									<input type="text" class="form-control left" id="add" name="add" placeholder="나머지 주소를 입력해주세요." maxlength="130px;">
								</div>
							</li>
						</ul>
					</div>	
					<div class="recently">
						<a href="javascript:void(0)" class="btn-show-re strong black" style="margin-right: 180px;">최근배송주소<span class="btn-show-recently"></span></a>
						<div class="re-block">
							<ul class="recent-addr" style="padding: 15px; width: 430px;">
								<li class="strong">
								
								${oldOrderListVO.orderAddress} 
								
								</li>
							</ul>
						</div>
					</div>	
					
					
					<div class="form-group" style="margin-top: 20px;">
						<ul>
							<li>
								<label for="inputMsg" class="control-label col-lg-4">요청사항</label>
							</li>
							<li >
								<div class="inline-block">
									<input style="width: 445px;"type="text" class="form-control left" id="ordMsg" name="ordMsg" placeholder="예) 벨 누르시기 전에 전화해주세요.">
								</div>
							</li>
						</ul>
					</div>
				</fieldset>
			</section>
			
			
			<!-- 02.할인적용 -->
			<div>
				<div class="header">
					<span class="position-one"></span>
					<span class="ment" style="padding-bottom: 10px;">만나서결제로 주문하시면 포인트, 이벤트 등의 혜택은 받을 수 없습니다.</span>
				</div>
			</div>
			
			<div class="use-point">
				<ul class="list-unstyled-info small">
					<li class="strong">
					주문금액 <span style="float: right;">${order.totalPrice}</span>
					</li>
				</ul>
				
				<ul class="list-unstyled-info small" style="padding-top:0px;">
					<li>
					<span class="strong">배달의민족 포인트 결제</span>
						<div style="margin-top:12px; padding: 15px; background-color: #f4f2ee;">
							<p style="width:160px; margin-right:0px;">
								가용포인트<span class="orange strong">${oldOrderListVO.pointsavePrice} P</span>
								<span class="gray ment" style="display: block;"> 1,000P이상, 100P단위로 사용가능</span>
							</p>
							<div class="inline-block" style="height: 34px;">
						
									<input type="text" class="form-control left" id="point" name="point" placeholder="0" style="width: 217px; margin-right: 10px;">
									<button type="button" class="btn btn-default" style="border-radius:0px;" >
										<span class="btn-use-u" id="btn_use_text" >사용하기</span>
									</button>
							
									<dl class="ment">
										<dt> 배달의민족 포인트란?</dt>
										<dd> 바로결제 이용 시 결제금액의 일부를 적립해드리는 무상포인트 혜택입니다. 배달완료 후 24시간이 지난 후 부터 사용이 가능하며, 포인트는 최소 1,000P 이상, 100P단위로 사용 가능합니다. 적립 후 1년간 사용 가능하며 이후 자동 소멸됩니다.</dd>
									</dl>
							</div>
						</div>
					</li>
				</ul>
				
				<ul class="list-unstyled-info small" style="padding-top:0px;">
					<li>
					<span class="strong">할인쿠폰</span>
						<div style="margin-top:12px; padding: 15px; background-color: #f4f2ee;">
							<p>
								내 쿠폰함에서 고르기
							</p>
							<div class="inline-block">
									<select name="address" id="address" class="form-control add-input"  style="margin-top:5px; font-size: 11.9px; width: 500px;">
										<option value="001">베베쿠폰</option>
									</select>
							</div>
							<p style="margin-top: 20px;">
								직접 입력하기
							</p>
							<p style="margin-top: 5px;" class="ment">
								가지고 계신 쿠폰 코드를 입력하신 후 <span class="strong">쿠폰사용</span>을 눌러주세요.
							</p>
							<div class="inline-block" style="height: 34px; margin-bottom:10px;">
									<input type="text" class="form-control left" id="coupon" name="coupon" placeholder="쿠폰코드입력" style="width: 420px; margin-right: 5px; margin-top:5px;">
									<button type="button" class="btn btn-default" style="border-radius:0px;">
										<span class="btn-use" id="btn_use_text" >쿠폰적용</span>
									</button>	
							</div>
							<a href="#" class="ment" style="text-decoration: underline;">할인 쿠폰 코드 알아내기</a>
						</div>
					</li>
				</ul>
				
				<ul class="list-unstyled-info small" style="padding-top:0px;">
					<li>
					<span class="strong">OK캐쉬백 결제</span>
						<div style="margin-top:12px; padding: 15px; background-color: #f4f2ee;">
							<p>
								OK캐쉬백 카드 번호
							</p>
							
							<div class="inline-block" style="height: 34px; margin-bottom:10px;">
									<input type="text" class="form-control left" id="okone" name="okone" style="width:116px; margin-right: 10px; margin-top:5px; margin-bottom: 5px;">
									<input type="text" class="form-control left" id="oktwo" name="oktwo" style="width:116px; margin-right: 10px; margin-top:5px; margin-bottom: 5px;">
									<input type="text" class="form-control left" id="okthree" name="okthree" style="width:116px; margin-right: 10px; margin-top:5px; margin-bottom: 5px;">
									<input type="text" class="form-control left" id="okfour" name="okfour" style="width:116px; margin-right: 10px; margin-top:5px; margin-bottom: 5px;">
									<input type="text" class="form-control left" id="okfour" name="okfour" style="width:410px; margin-right: 8px; margin-top:5px; margin-bottom: 5px;" placeholder="오프라인 비밀번호(4자리)를 입력해주세요">
						
									<button type="button" class="btn btn-default" style="border-radius:0px; margin-right:8px; margin-top: 6px; margin-bottom: 40px;" >
										<span class="btn-use-search" id="btn_use_text">조회하기</span>
									</button>
									
							</div>
							<div class="ord-box xsmall" >
								<p>
								2014년 8월 14일부터 오프라인 비밀번호(숫자 4자리)를 입력하여 사용하실 수 있습니다.<br/>
								오프라인 비밀번호는 초기설정 생년월일 4자리 또는 OK캐쉬백홈페이지<br/> (www.okcashbag.com) 및 OK캐쉬백 모바일 App에서 재설정 하실 수 있습니다
								</p>
							</div>
							
							<div style="margin-top: 20px;">
							<p>
								개인정보 수집 및 이용동의
							</p>
							
							<div class="ord-box xsmall" style="height:100px;">
								<p>
								- 개인정보 수집·이용 목적: OK캐쉬백 포인트 적립, 사용 시 본인 확인<br/>
								- 수집하는 개인정보의 항목: OK캐쉬백 카드번호<br/>
								- 개인정보 보유·이용기간: OK캐쉬백 포인트 적립 및 사용 마감시까지<br/>
								- 동의하지 않을 경우 OK캐쉬백 포인트 적립 및 사용 불가능<br/>
								</p>
							</div>
							<button type="button" class="btn btn-agreement-before" style="width:488.66px; height:43px; border-radius: 0px; margin-bottom: 18px;">
								<span class="btn-agree-be">동의합니다.</span>
							</button>
							
							<p>
								개인정보 제 3자 제공동의
							</p>
							
							<div class="ord-box xsmall" style="height:225px;">
				
								회사는 회원님께서 주문하신 상품의 결제 및 배달 서비스의 원활한 제공을 위해 최소한의 범<br/>
								위 내에서 아래와 같이 제 3자에게 정보를 제공합니다.
								<table>
									<thead>
										<tr>
											<td>개인정보를 제공받는 자</td>
											<td>제공목적</td>
											<td>제공항목</td>
											<td>보유·이용기간</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>SK플래닛㈜</td>
											<td>OK캐쉬백 결제 처리</td>
											<td>OK캐쉬백 카드번호,<br/> OK캐쉬백 온라인 비밀번호</td>
											<td>OK캐쉬백 포인트 사용<br/> 마감시까지</td>
										</tr>
									</tbody>
								</table>
								개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 결제서비스 등의 이용이<br/> 
								제한 될 수 있습니다.
							</div>
							<button type="button" class="btn btn-agreement-before" style="width:488.66px; height:43px; border-radius: 0px;">
								<span class="btn-agree-be">동의합니다.</span>
							</button>
							</div>
							
						</div>
						
						
					</li>
				</ul>
				
			</div>
			
			
		</div>
		
	</div>
</div>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />

