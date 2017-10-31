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
<link rel="stylesheet" href="<c:url value="/css/myreview.css"/>"/>
</head>
<body>
	<div class="container">
		<ol class="nonlistnumberonly paddingbottom5 paddingleft0">
			<li class="homelist homelittlefont">
			<a href="http://localhost:8080/BaeminCopy/">홈</a></li>
			<li class="homelist fontweightblack homelittlefont">> 마이페이지</li>
			<li class="homelist fontweightblack homelittlefont">> 리뷰 관리</li>
		</ol>
		<div style="background-color: white">
			<ul class="top">
				<li><a href="<c:url value="/mypage/baro_list" />"><span class="service">바로결제 내역</span></a></li>
				<li><a href="<c:url value="/mypage/myinfo" />"><span class="service">내 정보</span></a></li>
				<li><a href="<c:url value="/mypage/point" />"><span class="service">포인트</span></a></li>
				<li><a style="color: #000; border-bottom: 6px solid #000;" href="<c:url value="/mypage/myreview" />"><span class="service">리뷰 관리</span></a></li>
			</ul>
			
			<div class="margin_left_top">
				<div class="inline-b" style="margin-bottom: 25px;">
					<h3 class="review-img">리뷰 관리</h3>
					<div class="script-img">내가 작성한 리뷰를 수정하거나 삭제할 수 있습니다. 리뷰에 적합하지 않은 내용은 요청에 의해 비공개처리될 수 있습니다.</div>
				</div>
					<ul class="ul-top-area">
						<li class="orange primary small-font li-row">내가 작성한 리뷰 보기<em class="gray" style="font-weight: lighter;">|</em></li>
						<li><a href="<c:url value="/mypage/myreview_reg_possible" />" class="black small-font li-row">작성 가능한 리뷰 보기</a></li>
					</ul>
		
	          	<div class="no-review">
					<img src="<c:url value="/img/img-noreview.png" />" style="width:40%;">
				</div>
         
				
			</div>
			
		</div>
	

	</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>