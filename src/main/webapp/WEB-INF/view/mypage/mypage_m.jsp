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
<script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
<script type="text/javascript">
  $().ready(function(){
	  
	  
  });
</script>
</head>
<body>
  <div class="container">
    <ol class="homepadding_bottom nonlistnumberonly marginbottom10 paddingleft0">
      <li class="homelist homelittlefont"><a href="http://localhost:8080/BaeminCopy/">홈</a></li>
      <li class="homelist fontweightblack homelittlefont">> 마이페이지</li>
      <li class="homefont fontweightblack">마이페이지</li>
    </ol>
    <div class="c vertical-top">
      <div>
        <img class="picturepaynow" src="<c:url value="/img/paynow.png" />" alt="바로결제 내역">
        <img class="picturemyinfo" src="<c:url value="/img/myinfo.png"/>" alt="내 정보">
        <img class="picturepoint" src="<c:url value="/img/point.png"/>" alt="포인트">
        <img class="picturemyreview" src="<c:url value="/img/myreview.png"/>" alt="리뷰 관리">
      </div>
      <div id="menu">
      <ol class="nonlistnumber widthfull paddingleft0">
        <li class="homelist backgroundblack paddingzero"><a class="c-padding" href="http://localhost:8080/BaeminCopy/mypage/baro_list"><p class="fontcolorwhite fontweightblack width25">바로결제 내역</p></a></li>
        <li class="homelist backgroundblack paddingzero"><a class="c-padding3" href="http://localhost:8080/BaeminCopy/mypage/myinfo"><p class="fontcolorwhite fontweightblack width25">내 정보</p></a></li>
        <li class="homelist backgroundblack paddingzero"><a class="c-padding3" href="http://localhost:8080/BaeminCopy/mypage/point"><p class="fontcolorwhite fontweightblack width25">포인트</p></a></li>
        <li class="homelist backgroundblack paddingzero"><a class="c-padding4" href="http://localhost:8080/BaeminCopy/mypage/myreview"><p class="fontcolorwhite fontweightblack width25">리뷰 관리</p></a></li>
      </ol>
      </div>
    </div>
    <div class="">
      <ol class="homepadding paddingleft0">
        <li class="homelist fontweightblack middlefontsize">최근시켰던 음식점</li>
        <li class="homelist underfontsize paddingleft10 textalign">최근주문 내역은 20개까지 저장됩니다.</li>
      </ol>
      <c:forEach items="${lastorderList }" var="lastorderList">
	      <ol class="homelist nonlistnumberonly backgroundwhite width100 padding20 marginright10">
	        <li class="fontweightblack">${lastorderList.shopInfoVO.shop_name}</li>
	        <li class="homelist orangecolor nomargin">
	        	<c:forEach var="i" begin="1" end="${lastorderList.shopInfoVO.star_point_avg}">★</c:forEach><!-- 
	        	--><c:forEach var="i" begin="${lastorderList.shopInfoVO.star_point_avg}" end="4">☆</c:forEach>
	        </li>
	        <li class="homelist rightside ">즐겨찾기 <a class="orangecolor fontweightblack" href="">${lastorderList.lastOrderBookmarkCount}</a></li>
	        <li class="homelist rightside marginright10">리뷰 <a class="orangecolor fontweightblack" href="">${lastorderList.lastOrderReviewCount}</a></li>
	      </ol>
      </c:forEach>
    </div>
    <div class="">
      <ol class="homepadding paddingleft0">
        <li class="homelist fontweightblack middlefontsize">즐겨찾기</li>
        <li class="homelist underfontsize paddingleft10 textalign">자주 이용하는 업소를 즐겨찾기에 등록해 보세요.</li>
        <li class="homelist">
        	<c:if test="${empty bookmarkList}">
          		<img class="margintop10" src="<c:url value="/img/favoritelist.jpg"/>" alt="즐겨찾기">
          	</c:if>
        </li>
      </ol>
      <c:forEach items="${bookmarkList }" var="bookmarklist">
	      <ol class="homelist nonlistnumberonly backgroundwhite width100 padding20 marginright10">
	        <li class="fontweightblack">${bookmarklist.shopInfoVO.shop_name}</li>
	        <li class="homelist orangecolor">
	        	<c:forEach var="i" begin="1" end="${bookmarklist.shopInfoVO.star_point_avg}">★</c:forEach><!--
	        	--><c:forEach var="i" begin="${bookmarklist.shopInfoVO.star_point_avg}" end="4">☆</c:forEach>
	        </li>
	        <li class="homelist rightside ">즐겨찾기 <a class="orangecolor fontweightblack" href="">${bookmarklist.bookmarkCount}</a></li>
	        <li class="homelist rightside marginright10">리뷰 <a class="orangecolor fontweightblack" href="">${bookmarklist.reviewCount}</a></li>
	      </ol>
	  </c:forEach>
    </div>
  </div>
  <jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>