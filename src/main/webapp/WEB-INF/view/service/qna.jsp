<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/view/common/header.jsp" />
<link rel="stylesheet" href="<c:url value="/css/service-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/faq-style.css" />" />
<link rel="stylesheet" href="<c:url value="/css/qna-style.css" />" />

<script type="text/javascript" src="<c:url value="/js/jquery-3.2.1.min.js" />"></script>
	
<script type="text/javascript">
	$().ready(function() {
		$(".btn-terms-detail").click(function(e) {
			var checkAreaStatus = $(this).closest(".check-area").find(".terms-cont");
			
			if (checkAreaStatus.css("display") == "none") {
				checkAreaStatus.css("display", "block");
			}
			else {
				checkAreaStatus.css("display", "none");
			}
		});
	});
</script>


<div class="container">
	<ol class="home">
		<li><a href="<c:url value="/" />">홈</a></li>
		<li>> <strong>문의하기</strong></li>
	</ol>

	<div style="background-color: white">
		<ul class="top">
			<li><a href="<c:url value="/service/service" />"><span class="service">서비스소개</span></a></li>
			<li><a href="<c:url value="/service/board" />"><span class="service">공지사항/이벤트</span></a></li>
			<li><a href="<c:url value="/service/faq" />"><span class="service">자주묻는질문</span></a></li>
			<li><a style="color: #000; border-bottom: 6px solid #000;" href="<c:url value="/service/qna" />"><span class="service">문의하기</span></a></li>
		</ul>
		
		<section class="cont-area">
		
			<div class="page-header">
				<h2 class="qna">문의하기</h2>
				<ul class="links">
					<li>
						<a class="on" href="<c:url value="/service/qna" />">1:1 문의하기</a>
					</li>
					<li>
						<a href="<c:url value="/service/qna-list" />">나의 문의내역보기</a>
					</li>
				</ul>
			</div>
			
			<fieldset class="send-qna">
				<legend class="sr-only">문의하기</legend>
				<form class="form-horizontal" role="form" name="form" action="<c:url value="/service/qna-save" />" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="tit tit-name col-label">"이름"</label>
						<div class="col-cont">
							<input type="text" maxlength="19">
						</div>
					</div>
					
					<div class="form-group">
						<label class="tit tit-email col-label">"이메일 주소"</label>
						<div class="email col-cont">
							<input type="text" maxlength="19" >
							<span>@</span>
							<input class="address" type="text" maxlength="20">
						</div>
					</div>
					
					<div class="form-group">
						<label class="tit tit-phone col-label">"휴대폰 번호"</label>
						<div class="col-cont">
							<div class="phone">
								<div class="select-box">
									<select class="selectWrapper">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								</div>
								<input type="tel" maxlength="8" placeholder="'-'를 제외하고 입력해주세요.">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="tit tit-type col-label">"상담분류"</label>
						<div class="col-cont">
							<div class="select-box">
									<select class="selectWrapper">
										<option value="">상담분류</option>
										<option value="">오류문의</option>
										<option value="가입정보를 기재해주셔야">회원정보문의</option>
										<option value="">리뷰문의</option>
										<option value="">제휴문의</option>
										<option value="업소명:">업소정보문의</option>
										<option value="">이벤트</option>
										<option value="">기타</option>
									</select>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="tit tit-tit col-label">"제목"</label>
						<div class="col-cont">
							<input type="text" maxlength="19">
						</div>
					</div>
					
					<div class="form-group">
						<label class="tit tit-cont col-label">"문의내용"</label>
						<div class="col-cont">
							<textarea rows="10"></textarea>
						</div>
					</div>
					
					<div style="clear: both;"></div>
					
					<div class="form-group">
						<label class="col-label"></label>
						<div class="col-cont">
							<div class="file-group">
								<div class="file-name"></div>
							</div>
							<div style="clear: both;"></div>
							<p class="add" style="margin-bottom: 9px;">이미지 파일 (GIF, PNG, JPG)을 기준으로 최대 10MB이하, 최대 3개까지 등록가능 합니다.</p>
						</div>
					</div>
					
					<div style="clear: both;"></div>
					
					<div class="form-group">
						<label class="tit tit-pw col-label">"비밀번호"</label>
						<div class="col-cont">
							<input type="password">
							<p class="add">비회원은 비밀번호를 입력해야 나의 문의내역을 확인할 수 있습니다.</p>
						</div>
					</div>
					
					<div style="clear: both;"></div>
					
					<div class="form-group">
						<label class="tit tit-agree col-label">"이용동의"</label>
						<div class="col-cont">
							<div class="terms-agree">
								<div class="check-area">
									<input id="terms1" type="checkbox">
									<label for="terms1">개인정보 수집 및 이용에 동의합니다.</label>
									<a class="btn-terms-detail" href="javascript:void(0)">내용보기</a>
									<div class="terms-cont">
										<img src="<c:url value="/img/agree-cont.jpg" />" />
										<%-- ㈜우아한형제들은 이용자님께서 문의한 내용을 통해 소비자 불만 및 분쟁, 제휴상담을 처리하고자 최소한의 범위내에서 아래와 같이 개인정보를 수집·이용합니다.
										<br>
										<table>
											<colgroup>
												<col width="40%">
												<col width="60%">
											</colgroup>
											<tbody>
												<tr>
													<th>수집이용·목적</th>
													<td>문의하기</td>
												</tr>
												<tr>
													<th>수집항목</th>
													<td>이름, 이메일 주소, 휴대폰번호, 비밀번호(비회원의 경우)</td>
												</tr>
												<tr>
													<th>보유기간</th>
													<td>전자상거래등에서의소비자보호에관한법률에 따라 3년</td>
												</tr>
											</tbody>
										</table> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div style="clear: both;"></div>
					
					<button class="button">
						<span>문의하기</span>
					</button>
					
				</form>
			</fieldset>
			
		</section>

	</div>
</div>


<jsp:include page="/WEB-INF/view/common/footer.jsp" />