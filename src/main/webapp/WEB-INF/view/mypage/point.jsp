<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="/WEB-INF/view/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/commons-style.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/myreview.css"/>"/>
<link rel="stylesheet" href="<c:url value="/css/point.css"/>"/>
</head>
<body>
	<div class="container">
		<ol class="nonlistnumberonly paddingbottom5 paddingleft0">
			<li class="homelist homelittlefont">
			<a href="http://localhost:8080/BaeminCopy/">홈</a></li>
			<li class="homelist fontweightblack homelittlefont">> 마이페이지</li>
			<li class="homelist fontweightblack homelittlefont">> 포인트</li>
			<li class="homelist fontweightblack homelittlefont">> 배달의민족 포인트</li>
		</ol>
		<div style="background-color: white">
			<ul class="top">
				<li><a href="<c:url value="/mypage/baro_list" />"><span class="service">바로결제 내역</span></a></li>
				<li><a href="<c:url value="/mypage/myinfo" />"><span class="service">내 정보</span></a></li>
				<li><a href="<c:url value="/mypage/point" />" style="color: #000; border-bottom: 6px solid #000;"><span class="service">포인트</span></a></li>
				<li><a href="<c:url value="/mypage/myreview" />"><span class="service">리뷰 관리</span></a></li>
			</ul>
			
			<div class="margin_left_top" style="border-bottom: 0px;">
				<div class="inline-b" style="margin-bottom: 25px;">
					<h3 class="point-img">포인트</h3>
					<div class="baemin-point-img">배달의민족 포인트</div>
				</div>
					<ul class="ul-top-area" style="width:237px; padding-top:5px;">
						<li class="orange primary small-font li-row" style="float:right;">배달의민족 포인트</li>
					</ul>
				<div class="point-area">
					<div class="point-main">
						<div class="text-center">
							<span class="strong small-font">${sessionScope._USER_.nickName}님의 가용포인트</span><br/>
							<span class="strong point-font">${point}P</span>
							<p class="strong small-font text-muted">
								현재 적립포인트 ${point}P <em>|</em> 이번 달 소멸 예정 포인트 0P
							</p>
						</div>
					
						
						<dl>
							<dt>가용포인트</dt>
							<dd>적립된 포인트 중에서 현재 바로 쓸 수 있는 포인트입니다. 배달 완료 후 포인트를 적립해 드리며, 적립 후 24시간이 지난 뒤 사용이 가능합니다.</dd>
							<dt>적립포인트</dt>
							<dd>가용포인트 + 적립되었으나, 적립 후 24시간이 지나야 쓸 수 있는 포인트</dd>
							<dt>이번 달 소멸 예정 포인트</dt>
							<dd>포인트는 적립일로부터 1년간 사용 가능하며, 유효기간 경과 시 일 단위로 자동 소멸됩니다. </dd>
						</dl>
					</div>
					
					<div>
						<h5 class="font-size-more inline-b">포인트 적립/사용내역</h5>
						<div class="h5-desc">최근 1년간의 포인트 적립 및 사용내역을 확인하세요.</div>
					</div>
					<!--  
					<ul class="my-point-list">
						<li class="category">
							<div class="area-4 small-font">
								<div style="width:15%; float:left; text-align:center;">날짜</div>
								<div style="width:64%; float:left;">상세내역</div>
								<div style="width:65px; float:left; text-align:center;">
									<select>
										<option value selected>전체</option>
										<option value="1">적립</option>
										<option value="2">사용</option>
									</select>
								</div>
								<div style="width:10%; float:left; text-align:center;">포인트</div>
							</div>
						</li>
						<li>
							<c:forEach items="${pointInfoList }" var="pointInfoList">
								<tr>
								 	<td>${pointInfoList.orderListVO.pointsaveDate}</td>
									<td class="numberpadding">${pointInfoList.shopInfoVO.shop_name}</td>
									<td>적립</td>
									<td>${pointInfoList.orderListVO.pointsavePrice}</td>
								</tr>
							</c:forEach>
						</li>
					</ul>
					
					-->
					
					<table class="grid small-font">
					<colgroup>
						<col width="80" />
						<col width="120" />
						<col width="90" />
						<col width="40" />
						
					</colgroup>
					<tr>
						<th>날짜</th>
						<th>상세내역</th>
						<th>
							<div style="float:center; text-align:center;">
									<select>
										<option value selected>전체</option>
										<option value="1">적립</option>
										<option value="2">사용</option>
									</select>
							</div>
						</th>
						<th>포인트</th>
					
					</tr>
					<c:forEach items="${pointInfoList }" var="pointInfoList">
								<tr>
								 	<td>${pointInfoList.orderListVO.pointsaveDate}</td>
									<td class="numberpadding">${pointInfoList.shopInfoVO.shop_name}</td>
									<td>적립</td>
									<td class="strong" style="color:#ff4200;">${pointInfoList.orderListVO.pointsavePrice}</td>
								</tr>
					</c:forEach>
				</table>

				</div>
				
				
			</div>
			
		</div>
	

	</div>
<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>