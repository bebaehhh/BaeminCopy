<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="<c:url value="/css/shop-style.css" />" />
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<script type="text/javascript">
	$().ready(function() {
		/* 로그인 유무에 따른 상태변경 시작 */
		<c:if test="${! empty sessionScope._USER_}">
			$(".notice").text("음식을 선택해주세요.");
			$(".ir-el").css("display", "inline-block");
			$(".bookmark").css("display", "block");
			$(".btn.btn-success").css("display", "none");
		</c:if>
		/* 로그인 유무에 따른 상태변경 끝 */
		
		/* toggle 이벤트 시작  */
		 $(".panel-heading").click(function() {
             var color = $(this).css("backgroundColor");
             /*alert(color);*/
             if(color != "rgb(34, 34, 34)") {
                 $(this).css("background-color", "#222");
                 $(this).css("background-image", "url(/BaeminCopy/img/ico-panel-default-close.png)");
             }
             else{
                 $(this).css("background-color", "#817c74");
                 $(this).css("background-image", "url(/BaeminCopy/img/ico-panel-default-open.png)");
             }
             $(this).closest(".panel").find(".panel-collapse.in").toggle("slow");
         });
		 /* toggle 이벤트 끝  */
		 
		 $(".inner").click(function() {
             $(this).closest(".panel").find(".panel-collapse.in").toggle("slow");
         });
		 
		 /* 리뷰더보기 ajax 이벤트 시작  */
		 $("#review_ajax_paging").click(function() {
			 
			$.post("<c:url value='/baeminboard/addReview' />", {} 
					,function(response) {
						if(response) {
							
							console.log(response);
							for(var i in response) {
									
								var media_small = $("<div class='media small'></div>");
								var pull_left = $("<a class='pull-left' href='javascript:void(0);'><span class='inner-brd'><img class='media-object' alt='user' src='<c:url value='/img/mamber_4.jpg' />'></span></a>");   
								var media_body = $("<div class='media-body'></div>");
								var media_heading = $("<div class='media-heading'></div>");
								var nick = $("<strong class='nick'><span>"+response[i].nickName+"</span></strong><em>|</em>");
								var time = $("<span class='time'>"+response[i].write_date+"</span>");
								var rating= $("<span class='rating pull-left'><span class='img_star star_rate'><span class='img_star inner_star' style='width:100.00%;'>별점</span></span></span>");
								var content = $("<p>"+response[i].review_content+"</p>");
								if(response.file_name != null) {
								var imgTag = $("<div class='img-review-group'><img class='lazy' alt='리뷰이미지' title='리뷰이미지' id='Review_Img03' src='http://192.168.201.29:8080/BaeminCopy/common/download/"+response[i].file_name+"' style='display: block;'></div>")     
								}
								
								media_heading.prepend(nick);
								media_heading.append(time);
								media_heading.append(rating);
								media_heading.append(content);
								media_body.append(media_heading);
								
								if(response.file_name != null) {
									media_body.append(imgTag); <!--if-->
								}
								
								media_small.append(pull_left);
								media_small.append(media_body);
								$(".view-review").append(media_small);
								
							}
							
						}
					});
			
		 });
		/* 리뷰더보기 ajax 이벤트 끝  */
		
		/* 즐겨찾기 등록 이벤트 시작 */
		$(".bookmark").click(function(){
			/* var loginYN = ${sessionScope._USER_.memberId};
			
			if(!loginYN) {
				alert("로그인 후 즐겨 찾기 등록이 가능합니다.");
				return;
			} */
			
			$.post("<c:url value='/baeminboard/addBookmark' />", {}, function(respose){
				
				if(respose == "success") {
					alert("즐겨찾기 등록이 완료되었습니다.");
					$(".bookmark").css("background-position","0 -14px");
				}
			});
		});
		/* 즐겨찾기 등록 이벤트 끝 */
		
	});

</script>
<div class="container">
	<section class="shop-info">
		<ol class="m-nav">
			<li><a href=""></a>홈</li>
			<li><strong><span>${shopInfoListVO.shopInfoVO.menu_category_name}</span></strong></li>
		</ol>
		<a href="#" class="bookmark" style ="display: none;">즐겨찾기</a>
		<div class="shop-basic-info box">
			<div class="of-h">
				<h1 class="pull-left">${shopInfoListVO.shopInfoVO.shop_name}</h1>
				<span class="pull-left address small"><em> | </em>
					${shopInfoListVO.shopInfoVO.shop_address}<em> | </em>
				</span> 
				<span class="rating"> 
					<span class="img_star star_rate"> 
						<span class="img_star inner_star" style="width: 78.00%">별점</span>
					</span> 
					<strong class="small">67명</strong>
				</span>
				<div class="shop-info-tag">
					<span class="card">카드결제</span> 
					<span class="phone on">휴대폰결제</span>
					<span class="point on">포인트적립</span>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="shop-menu-review">
				<div class="menu">
					<ul class="nav-menu-review">
						<li class="active-menu"><a href="#">메뉴</a></li><!--
                        --><li class="active-review"><a href="">리뷰</a></li>
					</ul>
					<div class="menu-sect panel-group">
						<div class="panel panel-default">
							<div class="panel-heading" id="">
								<h3 class="panel-title">
									<a class="accordion-toggle" href="#">추천메뉴</a>
								</h3>
							</div>
							<div class="panel-collapse in collapse">
								<div class="panel-body">
									<div class="row rec-menu">
										<c:forEach items="${shopInfoListVO.shopInfoVO.shopMenuCategoryList}" var="shopMenuCategoryList">
											<c:forEach items="${shopMenuCategoryList.shopMenuDetailList}" var="shopMenuDetailList">
												<c:if test="${shopMenuDetailList.recommend_menu_yn eq 'Y'}">
													<div class="col-lg-4">
														<div class="thumbnail shop-menu-panel">
															<c:if test="${not empty shopMenuDetailList.menu_photo_file}">
																<img src="http://192.168.201.29:8080/BaeminCopy/common/download/${shopMenuDetailList.menu_photo_file}" alt="${shopMenuDetailList.menu_name}">
															</c:if>
															<c:if test="${empty shopMenuDetailList.menu_photo_file}">
																<img alt="${shopMenuDetailList.menu_name}" src="<c:url value="/img/bg-noimg.png" />" class="noimg">
															</c:if>
															<div class="caption">
																<div class="small">
																	<span class="text-ellipsis">${shopMenuDetailList.menu_name}</span> 
																	<strong class="text-ellipsis pull-right">${shopMenuDetailList.menu_price}원</strong>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<c:forEach items="${shopInfoListVO.shopInfoVO.shopMenuCategoryList}" var="shopMenuCategoryList">
							<div class="panel panel-default" style="margin-top: 30px;">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle" href="#">${shopMenuCategoryList.category_name}</a>
									</h3>
								</div>
								<div class="panel-collapse in collapse">
									<div class="panel-body panel-body-brd">
										<div class="panel-body panel-inner-group"style="padding-top: 0;">
											<c:forEach items="${shopMenuCategoryList.shopMenuDetailList}" var="shopMenuDetailList">
												<div class="panel">
													<div class="inner panel-heading">
														<div class="panel-title of-h">
															<a class="accordion-toggle" href=""> <span>${shopMenuDetailList.menu_name}</span>
																<span class="menu-detail"></span>
															</a>
															<div class="basic-option-group">
																<strong class="price">${shopMenuDetailList.menu_price}원</strong>
																<span class="put-cart ir-el cur" id="outside_cart" title="장바구니담기" style="display: none;">장바구니</span> 
																<span class="opt-open cur fold">열기</span>
															</div>
														</div>
													</div>
													<div class="panel-collapse in collapse">
														<div class="panel-body panel-body-option">
															<div class="menu-info">
																<span class="inner-brd">
																	<c:if test="${not empty shopMenuDetailList.menu_photo_file}">
																		<img alt="${shopMenuDetailList.menu_name}" src="http://192.168.201.29:8080/BaeminCopy/common/download/${shopMenuDetailList.menu_photo_file}">
																	</c:if>
																	<c:if test="${empty shopMenuDetailList.menu_photo_file}">
																		<img alt="${shopMenuDetailList.menu_name}" src="<c:url value="/img/bg-noimg.png" />" class="noimg">
																	</c:if>
																</span>
																<span class="small">${shopMenuDetailList.menu_comment}</span>
															</div>
															<div class="select-option small">
																<div class="option-tit">
																	가격
																	<span class="text-primary">(필수선택)</span>
																</div>
																<ul class="select-group list-unstyled list-inline">
																	<li>· ${shopMenuDetailList.menu_price}원</li>
																</ul>
															</div>
															<c:if test="${fn:length(shopMenuDetailList.menuOptionList) > 1}" >
																<div class="select-option small">
																	<div class="option-tit">
																		추가선택
																		<span class="text-primary">(${fn:length(shopMenuDetailList.menuOptionList)}개까지 선택가능)</span>
																	</div>
																	<ul class="select-group list-unstyled list-inline">
																		<c:forEach items="${shopMenuDetailList.menuOptionList}" var="menuOptionList">
																			<li>· ${ menuOptionList.option_name} : ${ menuOptionList.option_price}원</li>
																		</c:forEach>
																	</ul>
																</div>
															</c:if>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>
					<div class="origin-mark">
						<dl>
							<dt>원산지</dt>
							<dd>${shopInfoListVO.shopInfoVO.madein_introduce_comment}</dd>
						</dl>
					</div>
				</div>

				<div class="review">
					<ul class="nav-menu-review">
						<li class="active-menu"><a href="#">메뉴</a></li><!--
                        --><li class="active-review"><a href="">리뷰</a></li>
					</ul>
					<div class="box no-tp-brd">
						<section class="view-review">
							<c:forEach items="${shopInfoListVO.reviewList}" var="ReviewList">
								<div class="media small">
									<a class="pull-left" href="javascript:void(0);">
										<span class="inner-brd">
											<img class="media-object" alt="user" src="<c:url value="/img/mamber_4.jpg" />">
										</span>
									</a>
									<div class="media-body">
										<div class="media-heading">
											<strong class="nick">
												<span>${ReviewList.oauthmemberVO.nickName}</span>
											</strong>
											<em>|</em>
											<span class="time">${ReviewList.write_date}</span>
											<span class="rating pull-left">
												<span class="img_star star_rate">
													<span class="img_star inner_star" style="width:100.00%;">별점</span>
												</span>
											</span>
											<p>${ReviewList.review_content}</p>
										</div>
										<c:if test="${not empty ReviewList.file_name}">
											<div class="img-review-group">
												<img class="lazy" alt="리뷰이미지" title="리뷰이미지" id="Review_Img03" src="http://192.168.201.29:8080/BaeminCopy/common/download/${ReviewList.file_name}" style="display: block;">
											</div>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</section>
						<div id="review_ajax_paging">
							<a href="javascript:void(0);" class="btn btn-default btn-block btn-md">
								<span class="btn-view-more">더보기</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="shop-info-det-cart">
				<div class="info-det">
					<h2 class="bold tog">업체상세정보</h2>
					<dl class="dl-horizontal sinfo xsmall">
						<dt>최소금액</dt>
						<dd>${shopInfoListVO.shopInfoVO.min_payment}원 부터</dd>
						<dt>운영시간</dt>
						<dd>${shopInfoListVO.shopInfoVO.shop_open_time} ~ ${shopInfoListVO.shopInfoVO.shop_close_time}</dd>
						<dt>전화번호</dt>
						<dd>
							<strong class="text-primary">${shopInfoListVO.shopInfoVO.shop_phonenumber}</strong>
						</dd>
						<dt>업소소개</dt>
						<dd>
							<div id="intro">
								${shopInfoListVO.shopInfoVO.shop_introduce}
							</div>
						</dd>
					</dl>
				</div>
				<div class="cart">
					<h2 class="bold tog">장바구니</h2>
					<div class="login hidden-xs hidden-sm">
						<p class="notice small text-center">바로결제를 사용하시려면 로그인을 해주세요.</p>
					</div>
					<button type="button" class="btn btn-success" onclick="fn_loginScrollOpen();">
						<span class="btn-cart-login">로그인하기</span>
					</button>
				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />