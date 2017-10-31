<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/commons-style.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/main-style.css" />" />

<link rel="stylesheet" href="<c:url value="/css/w3.css" />" />

<script type="text/javascript" src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>
	
<script type="text/javascript">
	$().ready(function() {
		
		//      $(".conts > div:eq(0)").mouseenter(function(event) {
		$(".cover").hide();
		$(".cover").css({
			"border-radius" : "100%",
			top : "-=20px",
			left : "-=20px"
		});
		$(".default").mouseenter(function(event) {

			var left = event.pageX;
			var top = event.pageY;
			/* console.log($(this).offset().top, $(this).offset().left);
			console.log(top, left);
			console.log(($(this).offset().left + 190)) */

			if (($(this).offset().left + 190) > left) {
				//console.log("AA");
				top -= ($(this).offset().top + 70);
				left -= ($(this).offset().left + 200);
			} else if (($(this).offset().left + 190) <= left) {
				//console.log("BB");
				top -= ($(this).offset().top + 70);
				left = 220;
			}

			//$(this).text(pageX);
			//$(this).find(".cover").text(pageX+","+pageY);
			var cover = $(this).closest(".cutter").find(".cover")
			//var x = cover.offset({top: (pageY)});
			//var y = cover.offset({left: (pageX)});
			//cover.offset({top: pageY, left: pageX});
			//cover.text(cover.offset().top+","+cover.offset().left);
			cover.css({
				'background-position-x' : left,
				'background-position-y' : top
			});

			cover.stop().animate({
				'background-position-x' : '0px',
				'background-position-y' : '0px'
			});
			//cover.css("background-position", "cover.offset({top: pageY}) cover.offset({left: pageX})");
			//$(cover).css("background-position", "pageX pageY");

			//$(.chicken .cover).css("background-color","red");
			cover.show();
		});

		$(".default").mouseleave(function() {
			var cover = $(this).closest(".cutter").find(".cover");
			cover.stop().animate({
				'background-position-x' : '200px',
				'background-position-y' : '200px'
			});

			//$(this).animate({top: 200, left: 200});
		});
		
		
		//var liLength = parseInt($(".cont-area").css("width"));
		/* var liLength1 = 0;
		var liLength2 = 0;
		var liLength = 0;
		$(".prev").click(function(e) {
			alert("a");
			liLength += 440;
			$(".caroufredsel-wrapper").find(".promotion").animate({"left" : liLength + "px"}, 800);

		});
		
		$(".next").click(function(e) {
			alert("b");
			liLength -= 440;
			$(".caroufredsel-wrapper").find(".promotion").animate({"left" : liLength + "px"}, 800);

		}); */
		
		
		/* var liLength1 = 0;
		var liLength2 = 0;
		var liLength = 0;
		
		var x = document.getElementsByClassName("campaignSlides");
		
		$(".promoSlides").eq(0).click(function(e) {
			liLength += 440;
			$(".cont-area").find(".caroufredsel-wrapper").animate({"left" : liLength + "px"}, 800);
			if ( liLength = 0 ){
				liLength = -(x.length*liLength);
			}
		
		});
		
		$(".promoSlides").eq(1).click(function(e) {
			liLength -= 440;
			maxLength = x.length*liLength;
			$(".cont-area").find(".caroufredsel-wrapper").animate({"left" : liLength + "px"}, 800);
			if ( x.left = maxLength ){
				liLength = 0;
			}
			
		}); */
		
		
	});
</script>

<script>

	var slideIndex = 1;
	
	/* campaign slide */
	showDivs(slideIndex);
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("campaignSlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	
	/* barotip slide */
	showDivs2(slideIndex);
	function plusDivs2(n) {
	  showDivs2(slideIndex += n);
	}
	function showDivs2(n) {
		  var i;
		  var x = document.getElementsByClassName("barotipSlides");
		  if (n > x.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
	}
	
	/* large-circle slide */
	showDivs3(slideIndex);
	function plusDivs3(n) {
	  showDivs3(slideIndex += n);
	}
	function currentDiv(n) {
	  showDivs3(slideIndex = n);
	}
	function showDivs3(n) {
	  var i;
	  var x = document.getElementsByClassName("promoSlides");
	  var dots = document.getElementsByClassName("pager-button");
	  //var dots = $(".pager > a");
	  
	  //console.log(n);
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  	  
	  for (i = 0; i < dots.length; i++) {
	     dots[i].className = dots[i].className.replace(" selected", "");
	  }  
	  dots[slideIndex-1].className += " selected";
	  	  
	  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		}
	  x[slideIndex-1].style.display = "block";
	}

</script>

</head>
<jsp:include page="/WEB-INF/view/common/header.jsp" />

<!-- <script>
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("campaignSlides");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
</script> -->

<%-- <div class="wrapper">
 <div class="jcarousel-wrapper">
     <div class="jcarousel">
         <ul> 
             <li><img src="<c:url value="/img/cate1.png"/>" width="540" height="400" alt=""></li>
             <li><img src="<c:url value="/img/cate2.png"/>" width="540" height="400" alt=""></li>
             <li><img src="<c:url value="/img/cate3.png"/>" width="540" height="400" alt=""></li>
             <li><img src="<c:url value="/img/cate4.png"/>" width="540" height="400" alt=""></li>
             <li><img src="<c:url value="/img/cate5.png"/>" width="540" height="400" alt=""></li>
             <li><img src="<c:url value="/img/cate6.png"/>" width="540" height="400" alt=""></li>
         </ul>
     </div>

     <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
     <a href="#" class="jcarousel-control-next">&rsaquo;</a>
     
     <p class="jcarousel-pagination">
         
     </p>
 </div>
</div> --%>


<div class="container" style="background-color: white;">

	<div class="conts">

		<div class="small-circle box"
			style="position: absolute; top: 0px; left: 0px;">
			<div class="cutter chicken" onclick="searchMenu('치킨')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 0px; left: 240px;">
			<div class="cutter chinese" onclick="searchMenu('중국집')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 0px; left: 480px;">
			<div class="cutter pizza" onclick="searchMenu('피자')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 0px; left: 720px;">
			<div class="cutter korean" onclick="searchMenu('한식,분식')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>

		<div class="large-circle box"
			style="position: absolute; top: 240px; left: 0px;">
			<div class="cutter promo">
				<div class="default">
					<div class="caroufredsel-wrapper">
						<ul class="list-inline" id="promotion">
							<li class="promoSlides" style="background-image: url(/BaeminCopy/img/cafeDesert.png);">
								<a href="https://www.baemin.com/evt/evt_20171018_01"></a>
							</li><!-- 
						 --><li class="promoSlides" style="background-image: url(/BaeminCopy/img/spaicy.png);">
								<a href="javascript:void(0)"></a>
							</li>
						</ul>
					</div>
					<div class="btn-control">
						<a class="prev" href="javascript:void(0)"  onclick="plusDivs3(-1)"></a>
						<a class="next" href="javascript:void(0)"  onclick="plusDivs3(1)"></a>
					</div>
					<div class="pager">
						<a class="pager-button selected" href="javascript:void(0)" onclick="currentDiv(1)">
						</a>
						<a class="pager-button" href="javascript:void(0)" onclick="currentDiv(2)">
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="small-circle box"
			style="position: absolute; top: 240px; left: 480px;">
			<div class="cutter jokbal" onclick="searchMenu('족발,보쌈')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 240px; left: 720px;">
			<div class="cutter night" onclick="searchMenu('야식')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 480px; left: 480px;">
			<div class="cutter tang" onclick="searchMenu('찜,탕')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 480px; left: 720px;">
			<div class="cutter japanese" onclick="searchMenu('돈까스,회,일식')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>

		<div class="small-circle box"
			style="position: absolute; top: 720px; left: 0px;">
			<div class="cutter dosirak" onclick="searchMenu('도시락')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 720px; left: 240px;">
			<div class="cutter fastfood" onclick="searchMenu('패스트푸드')">
				<div class="default">
					<div class="cover"></div>
				</div>
			</div>
		</div>

		<div class="large-circle box"
			style="position: absolute; top: 720px; left: 480px;">
			<div class="cutter game">
				<a href="https://www.baemin.com/service/sadari_game">
					<div class="default"></div>
				</a>
			</div>
		</div>

		<div class="small-circle box"
			style="position: absolute; top: 960px; left: 0px;">
			<div class="cutter baro" onclick="searchMenu('바로결제')">
				<!-- <div class="cover" style="background-position: -120px -240px;"></div> -->
				<div class="default"></div>
			</div>
		</div>
		<div class="small-circle box"
			style="position: absolute; top: 960px; left: 240px;">
			<div class="cutter nothing">
				<!-- <div class="cover"></div> -->
				<div class="default"></div>
			</div>
		</div>

	</div>

	<div class="bt-conts">
		<div class="row">
			<div class="col-md-6 col-xs-12 col-sm-12 lf-box">
				<div class="title-area">
					<h3 class="notice">공지사항</h3>
					<a class="btn btn-more" href="<c:url value='/service/service' />">더보기</a>
				</div>
				<div class="cont-area">
					<h4>
						<a class="text-ellipsis" href="<c:url value='/service/service' />"><!-- 
						-->[공지] 개인정보처리방침 일부 변경에 관한 안내<!-- 
					 --></a>
					</h4>
					<p>안녕하세요. (주)우아한 형제들의 배달의민족 개인정보처리방침을 일부 변경하게 되어 이를 알려드리고자...</p>
					<em class="text-muted">2017-10-17</em>
				</div>
			</div>

			<div class="col-md-6 col-xs-12 rt-box hidden-xs hidden-sm">
				<div class="title-area">
					<h3 class="baedal">배달의민족 소개</h3>
					<div class="btn-group">
						<a href="javascript:void(0)" class="btn btn-down">앱다운로드</a>
						<a href="<c:url value='/service/service' />" class="btn btn-more">더보기</a>
					</div>
				</div>
				<div class="cont-area">
					<div class="media"></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-xs-12 lf-box hidden-xs hidden-sm">
				<div class="title-area">
					<h3 class="woowa">우아한 나눔 캠페인</h3>
					<div class="btn-group">
						<a class="btn btn-view" href="javascript:void(0)" onclick="plusDivs(-1)">&lt;</a>
						<a class="btn btn-view" href="javascript:void(0)" onclick="plusDivs(1)">&gt;</a>
					</div>
				</div>
				<div class="cont-area">
					<div class="caroufredsel-wrapper">
						<ul class="list-inline">
							<li class="campaignSlides">
								<a href="http://www.woowahan.com/?page_id=3749" target="_blank">
									<span class="txt">
									<em class="txt-title">365일<br/>우유로 안부를 물어요!</em><br/><br/>
									<em class="txt-cont">배달의 민족이 함께하는 나눔문화<br/>혼자 사시는 노인분들께 우유를 배달해 드려요!</em></span>
									<span class="img"><img src="<c:url value="/img/woowa1.gif" />" ></span>
								</a>
							</li><!-- 
						 --><li class="campaignSlides">
								<a href="http://www.woowahan.com/?page_id=3985" target="_blank">
									<span class="txt">
									<em class="txt-title">우와!~한<br/>무료글꼴, 배달의민족 한나체·주아체</em><br/>
									<em class="txt-cont">배달의민족의 아이덴티티를 담은 한나체, 주아체는<br/>모두에게 무료로 제공되는 서체입니다.</em></span>
									<span class="img"><img src="<c:url value="/img/woowa2.gif" />" ></span>
								</a>
							</li><!-- 
							 --><li class="campaignSlides">
								<a href="http://www.woowahan.com/?page_id=5108" target="_blank">
									<span class="txt">
									<em class="txt-title">'풋~ 아~' 이런 브랜드 제품,<br/>즐겁지 아니한가!<br/></em><br/>
									<em class="txt-cont">배달의 만족스러운 브랜드 제품들!<br/>10x10에서 만나볼 수 있어요.</em></span>
									<span class="img"><img src="<c:url value="/img/woowa3.gif" />" ></span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="col-md-6 col-xs-12 rt-box hidden-xs hidden-sm">
				<div class="title-area">
					<h3 class="barotip">바로결제 팁</h3>
					<div class="btn-group">
						<a class="btn btn-view" href="javascript:void(0)" onclick="plusDivs2(-1)">&lt;</a>
						<a class="btn btn-view" href="javascript:void(0)" onclick="plusDivs2(1)">&gt;</a>
					</div>
				</div>
				<div class="cont-area">
					<div class="caroufredsel-wrapper">
						<ul class="list-inline">
							<li class="barotipSlides">
								<a href="https://www.baemin.com/service/baro_tip">
									<span class="txt">
									<em class="txt-title">다양한 결제수단을 사용해보세요.</em><br/><br/>
									신용카드, 휴대폰 결제, OK 캐쉬백,<br/>
									배달의민족 포인트/쿠폰으로 <br/>먹고 싶은 치킨, 피자를 시켜 먹을 수 있어요.</span>
									<span class="img"><img src="<c:url value="/img/baro1.gif" />" ></span>
								</a>
							</li><!-- 
						 --><li class="barotipSlides">
								<a href="https://www.baemin.com/service/baro_tip">
									<span class="txt">
									<em class="txt-title">포인트로 시켜먹어요.</em><br/><br/>
									치킨, 피자, 짜장면, 족발, 야식~<br/>어떤 음식을 시켜 먹든<br/>배달의 민족 통합 포인트가 쌓여요.</span>
									<span class="img"><img src="<c:url value="/img/baro2.gif" />" ></span>
								</a>
							</li><!-- 
						 --><li class="barotipSlides">
								<a href="https://www.baemin.com/service/baro_tip">
									<span class="txt">
									<em class="txt-title">한번 주문한 주소를 기억해요.</em><br/><br/>
									매번 똑같은 주소와 복잡한 메뉴를<br/>번거롭게 말하지 않아도,<br/>정확하고 편리하게 주문할 수 있어요.</span>
									<span class="img"><img src="<c:url value="/img/baro3.gif" />" ></span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	</div>

</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />