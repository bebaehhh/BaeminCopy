<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/view/common/header.jsp" />
<link rel="stylesheet" href="<c:url value="/css/service-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/faq-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/board-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/qna-style.css" />" />

<script type="text/javascript"
	src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>

<script type="text/javascript">
	
</script>

<div class="container">
	<ol class="home">
		<li><a href="http://localhost:8080/BaeminCopy/">홈</a></li>
		<li>> <strong>공지사항/이벤트</strong></li>
	</ol>

	<div style="background-color: white">
		<ul class="top">
			<li><a href="<c:url value="/service/service" />"><span class="service">서비스소개</span></a></li>
			<li><a style="color: #000; border-bottom: 6px solid #000;" href="<c:url value="/service/board" />"><span class="service">공지사항/이벤트</span></a></li>
			<li><a href="<c:url value="/service/faq" />"><span class="service">자주묻는질문</span></a></li>
			<li><a href="<c:url value="/service/qna" />"><span class="service">문의하기</span></a></li>
		</ul>
		<div class="faq">
			<div class="event">
				<div class="page-header">
					<h2 class="board">공지사항/이벤트</h2>
				</div>
				<div class="board-list-title">
					<span>제목</span><span id="boarddate">날짜</span>
				</div>
		
				<div class="group">
					<c:forEach items="${serviceNoticeEventList}" var="list">
						<div class="list-group">
							<div class="list-top">
								<a class="list-one-a" href="<c:url value="/service/board_det/${list.noticeEventId}" />">
									<span>${list.subject}</span>
								</a>
								<span id="writeDate">
									<fmt:formatDate value="${list.writeDate}" pattern="yyyy-MM-dd"/>
								</span>
							</div>
						</div>
					</c:forEach>
					<form id="searchForm" name="searchForm">
						<div class="test">
							${pager}
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/view/common/footer.jsp" />
