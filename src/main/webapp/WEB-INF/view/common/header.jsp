<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 1등 배달 어플 배달의 민족</title>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
<link rel="shortcut icon" href="<c:url value="/img/favicon.ico" />">
<link rel="stylesheet" href="<c:url value="/css/commons-style.css" />" />
<script type="text/javascript" src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>
<!-- 다음 지도 API 연동 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0519bb260ad0daa2274080a513624e9c&libraries=services"></script>
<script type="text/javascript">
	/* jQuery ready 시작 */
	$().ready(function() {
		/* 로그인 세션 존재 시 메뉴 변경 시작 */
		<c:if test="${!empty sessionScope._USER_}">
			$(".gnb").html("");
			var user = $("<li><span style ='font-weight: bold; color: #0b0b0b;'>"+"${sessionScope._USER_.nickName}"+"님"+"</span><em>|</em></li>");
			var mypage = $("<li><a href='<c:url value='/mypage/mypage_m' />'>마이페이지</a><em>|</em></li>");
			var logout = $("<li><a href='<c:url value='/oauthmember/doLogout' />'>로그아웃</a><em>|</em></li>");
			var service = $("<li><a href='<c:url value='/service/faq' />'>고객센터</a><em>|</em></li>");
			var bookmark = $("<li><a href='<c:url value='/mypage/mypage_m' />'>즐겨찾기</a></li>");
			
			$(".gnb").prepend(user);
			$(".gnb").append(mypage);
			$(".gnb").append(logout);
			$(".gnb").append(service);
			$(".gnb").append(bookmark);
		</c:if>
		/* 로그인 세션 존재 시 메뉴 변경 끝 */
		
		/* 화면 로드 시 현재 위치 가져오기 */
		getAddress();
		/* Path 가져오기  */
		var uri = $(location).attr("pathname");
		/* 메인화면 일때 메뉴 화면 조정 시작 */
		if(uri == "/BaeminCopy/") {
		
			$("body").css("background-color", "#fff");
			$(".category-set").addClass("main");
		}
		/* 메인화면 일때 메뉴 화면 조정 끝 */
		
		
		var afterUri = uri.replace("/BaeminCopy/baeminboard/list/", "");
		var encodeUri = decodeURI(afterUri, "UTF-8");
		var menuArr = encodeUri.split("/");
		addClass(menuArr[0]);
		
		/* 메뉴 에니메이션 효과  시작*/
		$(".category-set").mouseenter(function() {
			$(".list-unstyled").stop().animate({
				'height' : '208px'
			});
		});
		
		$(".category-set").mouseleave(function() {
			$(".list-unstyled").stop().animate({
				'height' : '110px'
			});
		});
		/* 메뉴 에니메이션 효과  끝*/

		/* 현재 위치 검색 화면 보이기 시작 */
		$(".set-loc").click(function() {

			var viewEvent = $(this).next();

			if (viewEvent.css("display") == "none") {
				viewEvent.css({
					display : "block"
				});
			} else {
				viewEvent.css({
					display : "none"
				});
			}
		});
		/* 현재 위치 검색 화면 보이기 끝*/
		
		/* 현재 위치 검색 toggle 보이기 시작 */
		$("#locationSearch").click(function() {
			if (confirm("지금 계신 지역을 현재위치로 설정하시겠습니까?")) {
				/* geolocation API 사용가능 여부 조회 */
				getAddress();
				
			}
		});
		/* 현재 위치 검색 toggle 보이기 끝 */
		
		/* 업소명 검색 시작 */
		$(".input-group-btn").click(function() {
			
			var keyword = $("#sch_kwd").val();
			var address = $(".addr").text();
			var url='<c:url value="/baeminboard/search/" />' + encodeURI(keyword , "UTF-8") +'/'+ encodeURI(address , "UTF-8");
			location.href=url;
			
		}); 
		/* 업소명 검색 끝 */

	});
	/* jQuery ready 끝 */

	/* 현재 위치 검색 시작 */
	function getAddress() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var latitude = position.coords.latitude; /* 위도 정보  */
				var longitude = position.coords.longitude; /* 경도 정보  */
				console.log(latitude + ", " + longitude);
				/* 다음 지도 라이브러리를 이용한 주소 찾기 */
				console.log('getAddress');

				var geocoder = new daum.maps.services.Geocoder();
				console.log(geocoder);
				/* var coord = new daum.maps.LatLng(latitude, longitude); */
				/* 행정동 불러오기 */
				geocoder.coord2RegionCode(longitude, latitude, function(result,
						status) {
					console.log('coord2Address');
					if (status === daum.maps.services.Status.OK) {

						console.log('지역 명칭 : ' + result[1].address_name);
						var address = result[1].address_name;
						$(".addr").text(address);
						
						/* 텍스트 변경 후 지역 검색 창 닫기 */
						if($(".dong-srch").css("display") == "block") {
							$(".dong-srch").css({display : "none"});
						}

					} else {
						console.log(status);
						$(".addr").text("경남 진주시 하대동");
					}
				});
			}, function(error) {
				alret("위치정보를 가져오던 중 에러가 발생하였습니다.ㅠㅠ");
				$(".addr").text("경남 진주시 하대동");
			}, {
				enableHighAccuracy : true,
				maximumAge : 0,
				timeout : 10000
			});
		} else {
			alret("your browser is geolocation not supperted!!!");
			$(".addr").text(address);
		}
	}
	/* 현재 위치 검색 끝 */
	
	/* 메뉴 이동 시작 */
	function searchMenu(menu) {
		var address = $(".addr").text();
		var url='<c:url value="/baeminboard/list/" />' + encodeURI(menu , "UTF-8") +'/'+ encodeURI(address , "UTF-8");
		location.href=url;
	} 
	/* 메뉴 이동 끝 */
	
	/* 메뉴 클래스 및 스타일 변경 시작 */
	function addClass(path) {
		switch (path) {
			case "치킨" :
				$(".chicken").addClass("over");
				break;
			case "중국집" :
				$(".chinese").addClass("over");
				break;
			case "피자" :
				$(".pizza").addClass("over");
				break;
			case "한식,분식" :
				$(".korean").addClass("over");
				break;
			case "족발,보쌈" :
				$(".jokbal").addClass("over");
				break;
			case "야식" :
				$(".night").addClass("over");
				break;
			case "돈까스,회,일식" :
				$(".japanese").addClass("over");
				break;
			case "찜,탕" :
				$(".tang").addClass("over");
				break;
			case "도시락" :
				$(".dosirak").addClass("over");
				break;
			case "패스트푸드" :
				$(".fastfood").addClass("over");
				break;
			case "바로결제" :
				$(".baro").addClass("over");
				break;
			case "모아보기" :
				$(".all").addClass("over");
				break;
		}
	}
	/* 메뉴 클래스 및 스타일 변경 끝  */
</script>
</head>
<body>
	<div id="wrap">
		<header>
			<section class="basic-tp-area">
				<section class="tp-area">
					<h1>
						<a href="<c:url value='/' />" class="ir-el">배달의 민족</a>
					</h1>
					<div class="gnb-wrap">
						<div class="navigation visibleicon">네비게이션</div>
						<ul class="list-inline gnb">
							<li><a href="<c:url value='/oauthmember/login' />">로그인</a><em>|</em></li>
							<li><a href="<c:url value='/oauthmember/signup_step1' />">회원가입</a><em>|</em></li>
							<li><a href="<c:url value='/service/faq' />">고객센터</a></li>
						</ul>
					</div>
					<fieldset class="header-loc">
						<legend class="sr-only">위치설정</legend>
						<div class="set-loc">
							<em>내위치 :</em> <span class="addr text-ellipsis"></span> <span
								class="drop-down">위치설정</span>
						</div>
						<div class="dong-srch visible" style="display: none;">
							<fieldset style="border: 0;">
								<p class="noti">
									현재 설정된 주소가 맞지 않으신가요?<br> 동명을 검색해서 다시 설정해주세요.
								</p>
								<input type="search" class="form-control" id="sch_addr"
									placeholder="동명을 입력해주세요">
								<button type="button">찾기</button>
							</fieldset>
							<!-- 결과 출력 div -->
							<div id="addrlist" class="small"></div>
							<div class="set-current-loc">
								<button type="button" id="locationSearch" class="btn btn-block btn-set-loc"
									onclick="">
									<em>-</em> 현재위치 자동 검색
								</button>
							</div>
						</div>
					</fieldset>
					<filedset class="header-search cate-srch"> <legend
						class="sr-only">검색</legend>
					<div class="input-group srch">
						<input type="text" class="form-control" id="sch_kwd"
							style="ime-mode: inactive" placeholder="업소명을 검색해주세요">
						<div class="input-group-btn">
							<button type="button" class="btn">검색</button>
						</div>
					</div>
					</filedset>
				</section>
				<div class="category-set">
					<dl class="dl-horizontal">
						<dt class="dt-category">카테고리</dt>
						<dd class="cate-srch">
							<div class="cate-area">
								<ul class="list-inline list-unstyled" style="height: 110px;">
									<li class="chicken" onclick="searchMenu('치킨')">치킨<em>|</em></li>
									<li class="chinese" onclick="searchMenu('중국집')">중국집<em>|</em></li>
									<li class="pizza" onclick="searchMenu('피자')">피자<em>|</em></li>
									<li class="korean" onclick="searchMenu('한식,분식')">한식,분식<em>|</em></li>
									<li class="jokbal" onclick="searchMenu('족발,보쌈')">족발,보쌈<em>|</em></li>
									<li class="night" onclick="searchMenu('야식')">야식<em>|</em></li>
									<li class="japanese" onclick="searchMenu('돈까스,회,일식')">돈까스,회,일식<em>|</em></li>
									<li class="tang" onclick="searchMenu('찜,탕')">찜,탕<em>|</em></li>
									<li class="dosirak" onclick="searchMenu('도시락')">도시락<em>|</em></li>
									<li class="fastfood" onclick="searchMenu('패스트푸드')">패스트푸드<em>|</em></li>
									<li class="baro" onclick="searchMenu('바로결제')">바로결제<em>|</em></li>
									<li class="all" onclick="searchMenu('모아보기')">모아보기<em>|</em></li>
								</ul>
							</div>
						</dd>
					</dl>
				</div>
			</section>
		</header>