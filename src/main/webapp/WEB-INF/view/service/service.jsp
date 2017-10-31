<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/common/header.jsp" />
<link rel="stylesheet" href="<c:url value="/css/service-style.css" />" />


	<div class="container">
		<ol class="home">
			<li><a href="http://localhost:8080/BaeminCopy/">홈</a></li>
			<li>> <strong>서비스소개</strong></li>
		</ol>

		<div style="background-color: white">
			<ul class="top">
				<li><a style="color: #000; border-bottom: 6px solid #000; " href="<c:url value="/service/service" />"><span class="service">서비스소개</span></a></li>
				<li><a href="<c:url value="/service/board" />"><span class="service">공지사항/이벤트</span></a></li>
				<li><a href="<c:url value="/service/faq" />"><span class="service">자주묻는질문</span></a></li>
				<li><a href="<c:url value="/service/qna" />"><span class="service">문의하기</span></a></li>
			</ul>

			<div class="event">
				<img src="<c:url value="/img/service-in.png" />" alt="서비스소개">
			</div>
			<div class="intro">
				<div>
					<img class="intro-img" src="<c:url value="/img/baemin.png" />" alt="배민미니로고">
				</div>
				<div class="intro-text">
					<img class="txt-img" src="<c:url value="/img/service-text1.png" />" alt="서비스텍스트이미지1">
					<p>
						업계 최초 2,000만 다운로드 돌파!<br>월간 순 사용자수 1위<br> <span
							id="small">(닐슨 코리안클릭 PC, 모바일 통합 2015년 10월 기준)</span>
					</p>
					<a href="" class="btn">
					<span>모바일앱 다운로드</span></a>
				</div>
			</div>


			<div class="video">
				<iframe id="video-a"
					src="https://www.youtube.com/embed/pLbNcnU4gkc?ecver=2"></iframe>
			</div>


			<div>
				<img class="review" src="<c:url value="/img/photo.png" />"
					alt="서비스소개이미지">
			</div>

			<div id="app-download">
				<p class="service-txt"></p>
				<ul class="down-tab">
					<li  class="active" onclick="fn_click_phone('playstore','android',this)">
						<a href="#andr">
							<span class="android">android 다운로드</span>
						</a>
					</li>
					<li class="last" onclick="fn_click_phone('appstore','iphone',this)">
						<a href="#iphone">
							<span class="ios">iPhone 다운로드</span>
						</a>
					</li>
				</ul>
				<section class="download-info">
					<div class="content">
						<div class="btn-down">
							<a href="https://play.google.com/store/apps/details?id=com.sampleapp" target="_blank" class="playstore">배달의 민족 다운로드</a>
						</div>
						<div class="down-content">
							<input type="text" placeholder="'-'없이 전화번호를 입력하세요.">
						</div>
					</div>
				</section>
			</div>
		</div>
		
		
		<script type="text/javascript">
		//------------------------------------------------------------------------------
		//PURPOSE : 스마트폰 클릭 이벤트
		//CREATE  : 2013-11-10 태승호
		//MODIFY  :
		//------------------------------------------------------------------------------
		function fn_click_phone(val,label,obj)
		{
			var moblie = '';
			var $this = $(obj);
			var $store = $this.closest("#app-download").find(".btn-down > a");
			$this.addClass('active').siblings().removeClass('active');
			
			
			if ( val == "playstore") {
				$store.removeClass('appstore').addClass('playstore');
				$store.attr('href', 'http://stackoverflow.com');
				
				if(moblie =='Android'){
					$store.attr('href', "market://details?id=com.sampleapp");
				}else{
					$store.attr('href', "https://play.google.com/store/apps/details?id=com.sampleapp");
				}
				val = "playstore";
			}
			else if ( val == "appstore" ) {
				$store.removeClass('playstore').addClass('appstore');
				$store.attr('href', "http://itunes.apple.com/kr/app/id378084485");
			}
		
		}
		
		</script>
		
		
	</div>
	
<jsp:include page="/WEB-INF/view/common/footer.jsp" />