<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/commons-style.css"/>"/>
</head>
<body>
	<div class="container">
		<ol class="nonlistnumberonly paddingbottom5 paddingleft0">
			<li class="homelist homelittlefont">
				<a href="http://localhost:8080/BaeminCopy/">홈</a>
			</li>
			<li class="homelist  homelittlefont">
				> 
				<a href="http://localhost:8080/BaeminCopy/mypage/mypage_m">마이페이지</a>
				> 
			</li>
			<li class="homelist fontweightblack homelittlefont">바로결제 내역</li>
		</ol>
		<div style="background-color: white">
			<ul class="top">
				<li><a style="color: #000; border-bottom: 6px solid #000;" href="<c:url value="/mypage/baro_list" />"><span class="service">바로결제 내역</span></a></li>
				<li><a href="<c:url value="/mypage/myinfo" />"><span class="service">내 정보</span></a></li>
				<li><a href="javascript:void(0);"><span class="service">포인트</span></a></li>
				<li><a href="<c:url value="/mypage/myreview" />"><span class="service">리뷰 관리</span></a></li>
			</ul>
			<div class="margin_left_top">
			<p class="homefont fontweightblack ">바로결제내역</p>
				<table class="grid">
					<colgroup>
						<col width="80" />
						<col width="40" />
						<col width="90" />
						<col width="120" />
						<col width="60" />
					</colgroup>
					<tr>
						<th>주문일시</th>
						<th>주문번호</th>
						<th>업소명</th>
						<th>주문금액</th>
						<th>진행상태</th>
					</tr>
					<c:forEach items="${memberList }" var="barolist">
						<tr>
						 	<td>${barolist.orderListVO.orderDate}</td>
							<td class="numberpadding font-orange fontweightblack">${barolist.orderListVO.orderlistId}</td>
							<td>${barolist.shopInfoVO.shop_name}</td>
							<td class="font-orange fontweightblack">${barolist.orderListVO.totalPrice}</td>
							<td><span class="span-orange font-white fontweightblack">${barolist.orderListVO.orderStatus}</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>