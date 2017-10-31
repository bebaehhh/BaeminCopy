<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/common/header.jsp" />
<link rel="stylesheet" href="<c:url value="/css/service-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/faq-style.css" />" />
<script type="text/javascript"
	src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>

<script type="text/javascript">
	$().ready(function() {
		
		var isclick = false;
		
		$("#sear-input").keyup(function(e) {
			if( e.keyCode == 13 ){
				movePage(0);
			}
		});
		
		$("#button").click(function(e) {
			movePage(0);
		});
		
		$(".list-one").click(function() {
			if (!isclick) {
				$(this).find("img").attr("src",'<c:url value="/img/list-group-black.png" />');
				isclick = !isclick;
				$(this).css({
					"background-color" : "#f4f2ee",
					"font-weight" : "bold"
				});
					$(this).parent().css({
						"background-color" : "#f4f2ee"
					});
			}
			else {
				$(this).find("img").attr("src",'<c:url value="/img/list-group.png" />');
				isclick = !isclick;
				$(this).css({
					"background-color" : "#fff",
					"font-weight" : "normal"
				});
			}
			$(this).next().slideToggle(function() {
			});
		});
		
	});
	
	function changeFaq(menu)	{
		$.post("<c:url value='/service/changeFaq' />", {searchKeyword: menu}, function(response) {
			/* alert(response); */
			if(response){
				$(".group").html("");
				var size = response.serviceFaqListVO.length;
				/* alert(size); */
				for(var i in response.serviceFaqListVO) {
					console.log(response.serviceFaqListVO[i]);
					var list_group = $("<div class='list-group'></div>");
					var list_one = $("<div class='list-one'></div>");
					var list_one_a= $("<a class='list-one-a' style='border-top: 1px solid #ccc;' href='javascript:void(0);'></a>");
					var img_span= $("<img alt='추가설명' src='<c:url value='/img/list-group.png' />'><span>"+response.serviceFaqListVO[i].faqMenu+"</span>"+"<span style='position:static;'>"+response.serviceFaqListVO[i].subject+"</span>");
					
					
					var list_add = $("<div class='list-add' style='height: auto; display: none;'></div>");
					var list_content = $("<div class='list-content'>"+response.serviceFaqListVO[i].content+"</div>");

					list_one_a.append(img_span);
					list_one.prepend(list_one_a);
					list_add.append(list_content);
					list_group.prepend(list_one);
					list_group.append(list_add);
					$(".group").append(list_group);
				}
				var pager = $(".group").append("<div class='test'></div>");
				pager.append(response.serviceSearchVO.pager);
				$(".group").append(pager);
			}
		});
	}
	
</script>		

<div class="container">
	<ol class="home">
		<li><a href="http://localhost:8080/BaeminCopy/">홈</a></li>
		<li>> <strong>자주묻는질문</strong></li>
	</ol>

	<div style="background-color: white">
		<ul class="top">
			<li><a href="<c:url value="/service/service" />"><span class="service">서비스소개</span></a></li>
			<li><a href="<c:url value="/service/board" />"><span class="service">공지사항/이벤트</span></a></li>
			<li><a style="color: #000; border-bottom: 6px solid #000; " href="<c:url value="/service/faq" />"><span class="service">자주묻는질문</span></a></li>
			<li><a href="<c:url value="/service/qna" />"><span class="service">문의하기</span></a></li>
		</ul>
		<form id="searchForm" name="searchForm">
		<input type="hidden">
			<div class="event">
				<img src="<c:url value="/img/faq-text1.png" />" alt="자주묻는질문소개">
				<div class="search">
					<input id="sear-input" type="text" name="searchKeyword" value="${ServiceSearchVO.searchKeyword}" />
					<input id="button" type="button" value="검색" />
				</div>
	
				<div class="faq">
						<ul class="faq-list">
							<li onclick="changeFaq('ALL');"><a class="faq-total" href="<c:url value="/service/faq" />">전체보기</a></li>
							<li onclick="changeFaq('회원가입');"><a class="faq-memb" href="javascript:void(0);">회원가입</a></li>
							<li onclick="changeFaq('바로결제');"><a class="faq-baro" href="javascript:void(0);">바로결제</a></li>
							<li onclick="changeFaq('리뷰관리');"><a class="faq-revi" href="javascript:void(0);">리뷰관리</a></li>
							<li onclick="changeFaq('이용문의');"><a class="faq-use" href="javascript:void(0);">이용문의</a></li>
							<li onclick="changeFaq('광고문의');"><a class="faq-adv" href="javascript:void(0);">광고문의</a></li>
							<li onclick="changeFaq('불편문의');"><a class="faq-ser" href="javascript:void(0);">불편문의</a></li>
							<li onclick="changeFaq('기타');"><a class="faq-etc" href="javascript:void(0);">기타</a></li>
						</ul>
					<div class="faq-list-title">
						<span>문의부분</span>제목
					</div>
					
					<div class="group">
					
						<c:forEach items="${serviceFaqList}" var ="list">
							<div class="list-group">
								<div class="list-one">
									<a class="list-one-a" href="javascript:void(0);">
									<img alt="추가설명" src="<c:url value="/img/list-group.png" />">
									<span>${list.faqMenu}</span>${list.subject}</a>
								</div>
								<div class="list-add" style="height: auto; display: none;">
									<div class="list-content">
										${list.content}
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="test">
							${pager}
						</div>
					</div>
					
					
				</div>
			</div>
		</form>
	</div>
</div>


<jsp:include page="/WEB-INF/view/common/footer.jsp" />