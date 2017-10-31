<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/list-style.css" />" />

<jsp:include page="/WEB-INF/view/common/header.jsp" />

<script type="text/javascript">
	var windowHeight = 0;
	
	$(window).resize(function() {
		windowHeight = $(window).height();		/* 윈도우의 크기 */
	});
	
	$().ready(function(){
		
		windowHeight = $(window).height();		/* 윈도우의 크기 */
		var baro = $(".in-app");
		var offline = $(".offline");
		
		if(baro.data("baro") == "Y") {
			baro.addClass("on");
		}
		
		if(offline.data("offline") == "Y") {
			offline.addClass("on");
		}
		
		
		var totalCount = ${shopSearchVO.totalConut};
		
		if(totalCount == 0) {
			$(".shop-list").html("");
			$(".shop-list").text("웁쓰! 업소가 없네요..");
			$(".shop-list").addClass("no-shop-list");
			$(".no-shop-list").removeClass("shop-list");
			$("#list_sort").css('display', 'none');
		}
		
		$(window).scroll(function() {
			var emptyData = false;
			var maxHeight = $(document).height();		/* 현재 페이지의 높이 */
			var windowScrollTop = $(window).scrollTop();	/* 브라우저의 스크롤 위치값 */
			var currentScroll = (windowHeight*0.4) + windowScrollTop;
			console.log("도큐먼트"+maxHeight);
			console.log("윈도우"+windowHeight);
			console.log("브라우저의 스크롤 위치값 "+windowScrollTop);
			console.log("currentScroll값"+currentScroll);
			
			
			if(maxHeight <= currentScroll) {
				if(!emptyData) {
				
				$("#viewLoading").fadeIn(500);
				
				var pageNo = Number($("#pageNo").val()) + 1;
				$("#pageNo").val(pageNo.toString());
		
				$.post("<c:url value='/baeminboard/addShopInfo' />",
						$("#shopSearchVO").serialize(),
							function(response) {
								$("#viewLoading").fadeOut(500);
								if(!response) {
									for(var i in response) {
										var col_xs_12=$("<div class='col-xs-12 col-sm-12 col-md-6 col-lg-4' onclick='fn_mv_shopInfo('"+response[i].shop_id+"');'></div>");
										var shop_list_panel =$("<div class='thumbnail shop-list-panel of-h'></div>");
										var inner_brd = $("<span class='inner-brd'><span class='mask'></span><img src='http://192.168.201.29:8080/BaeminCopy/common/download/"+response[i].shop_photo_filename+"' alt='"+response[i].shop_name+"' style='display: inline'></span>");
										var caption = $("<div class='caption'></div>");
										var text_ellipsis = $("<h2 class='text-ellipsis' title='${info.shop_name}'>"+response[i].shop_name+"</h2>");
										var	rating = $("<span class='rating'><span class='img_star star_rate'><span class='img_star inner_star' style='width: 60.00%;'>별점</span></span></span>"); 			
										var address = $("<div class='address'>"+response[i].shop_address+"</div>");
										var shop_info_fav = $("<div class='shop-info-fav'><span> 리뷰 <strong class='text-primary'> 37 </strong></span><span> 사장님댓글 <strong class='text-primary'> 8 </strong></span></div>");
										var shop_info_tag =	$("<div class='shop-info-tag pay'><span class='in-app' data-baro='"+response[i].paynow_possible_yn+"'>바로결제</span><span class='offline' data-offline='"+response[i].pay_yn+"'>만나서결제</span></div>");
										shop_list_panel.prepend(inner_brd);
										caption.prepend(text_ellipsis);
										caption.append(rating);
										caption.append(address);
										caption.append(shop_info_fav);
										caption.append(shop_info_tag);
										shop_list_panel.append(caption);
										col_xs_12.prepend(shop_list_panel);
										$("#loadData").append(col_xs_12);
									}
								}
								else {
									emptyData=true;
								}
							});
				
				}
			}
		});
		
	});
	
	
	
	/* shop.jsp 이동 시작 */
	function fn_mv_shopInfo(shop_id) {
		var url='<c:url value="/baeminboard/shop/" />' + encodeURI(29, "UTF-8");
		location.href=url;
	}
	
	/* shop.jsp 이동 끝 */
</script>
<div class="container">
	<form id="shopSearchVO">
		<input type="hidden" name="searchKeyword" id="searchKeyword" value="${shopSearchVO.searchKeyword}"/>
		<input type="hidden" name="location" id="location" value="${shopSearchVO.location}"/>
		<input type="hidden" name="shop_id" id="shop_id" value="${shopSearchVO.shop_id}"/>
		<input type="hidden" name="pageNo" id="pageNo" value="${shopSearchVO.pageNo}"/>
		<input type="hidden" name="startNumber" id="startNumber" value="${shopSearchVO.startNumber}"/>
		<input type="hidden" name="endNumber" id="endNumber" value="${shopSearchVO.endNumber}"/>
		<input type="hidden" name="totalConut" id="totalConut" value="${shopSearchVO.totalConut}"/>
	</form>
	<div class="srch-result-info of-h small">
		<span class="pull-left"> 
			홈 > 
			<strong>${shopSearchVO.searchKeyword}</strong> 
			<em>|</em> 
			<strong>${shopSearchVO.location}</strong> 을 중심으로 총 
			<strong class="text-primary">${shopSearchVO.totalConut}</strong> 곳을 찾았습니다.
		</span>
		<form name="list-srot" id="list_sort" action="" method="post">
			<div class="pull-right">
				<select name="sort" id="sort" class="select"
					style="width: 150px; position: absolute; opacity: 0; font-size: 11.9px; height: 34px;">
					<option value="default">기본정렬로 보기</option>
					<option value="call">주문 순으로 보기</option>
					<option value="pnt">평점 순으로 보기</option>
					<option value="favorite">즐겨찾기 순으로 보기</option>
				</select> <span class="select-style" style="display: inline-block;"> <span
					class="select=style-inner"
					style="width: 148px; display: inline-block;">기본정렬로 보기</span>
				</span>
			</div>
		</form>
	</div>
	<section class="shop-list">
		<div class="row" id="loadData">
			<c:forEach items="${shopInfoVO}" var="info">
				
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" onclick="fn_mv_shopInfo(${info.shop_id});">
					<div class="thumbnail shop-list-panel of-h">
						<span class="inner-brd"> 
							<span class="mask"></span> 
							<img src="http://192.168.201.29:8080/BaeminCopy/common/download/${info.shop_photo_filename}" alt="네네치킨" style="display: inline">
						</span>
						<div class="caption">
							<h2 class="text-ellipsis" title="${info.shop_name}">${info.shop_name}</h2>
							<span class="rating"> 
								<span class="img_star star_rate">
									<span class="img_star inner_star" style="width: 60.00%;">별점</span>
								</span>
							</span>
							<div class="address">${info.shop_address}</div>
							<div class="shop-info-fav">
								<span> 리뷰 
									<strong class="text-primary"> 37 </strong>
								</span> 
								<span> 사장님댓글 
									<strong class="text-primary"> 8 </strong>
								</span>
							</div>
							<div class="shop-info-tag pay">
								<span class="in-app" data-baro="${info.paynow_possible_yn}">바로결제</span> 
								<span class="offline" data-offline="${info.pay_yn}">만나서결제</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<div id="viewLoading" style="display: none;">
			<span class="loading">로딩중</span>
		</div>
</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />