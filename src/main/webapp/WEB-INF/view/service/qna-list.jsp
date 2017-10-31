<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/common/header.jsp" />
<link rel="stylesheet" href="<c:url value="/css/service-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/faq-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/qna-style.css" />" />


<div class="container">
	<ol class="home">
		<li><a href="<c:url value="/" />">홈</a></li>
		<li>> <strong>문의하기</strong></li>
	</ol>
	<div style="background-color: white">
		<ul class="top">
			<li><a href="<c:url value="/service/service" />"><span
					class="service">서비스소개</span></a></li>
			<li><a href="javascript:void(0);"><span class="service">공지사항/이벤트</span></a></li>
			<li><a href="<c:url value="/service/faq" />"><span
					class="service">자주묻는질문</span></a></li>
			<li><a style="color: #000; border-bottom: 6px solid #000;"
				href="<c:url value="/service/qna" />"><span class="service">문의하기</span></a></li>
		</ul>
		
		<div class="cont-area">
			<div class="page-header">
				<h2 class="qna">문의하기</h2>
				<ul class="links">
					<li>
						<a href="<c:url value="/service/qna" />">1:1 문의하기</a>
					</li>
					<li>
						<a class="on" href="<c:url value="/service/qna-list" />">나의 문의내역보기</a>
					</li>
				</ul>
			</div>
			
			<div class="qna-list">
				<form role="form" name="form" action="<c:url value="/service/qna-list" />" method="post">
					<div class="non-mem">
						<div>
							<p></p>
							<input type="email" placeholder="이메일을 입력해주세요.">
							<button type="button" class="btn-success">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>






<jsp:include page="/WEB-INF/view/common/footer.jsp" />