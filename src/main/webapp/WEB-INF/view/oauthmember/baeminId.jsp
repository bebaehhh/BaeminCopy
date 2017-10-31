<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value="/css/baeminId.css" />"/>
<script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
<script type="text/javascript">
	//배민ID에 가입해볼까요 버튼
	$(function() {
		$(".baeminButton #baeminButton-btn").click(function() {
			location.href = "<c:url value='/oauthmember/signup_step1' />"; 
		});
	});

</script>
</head>
<body>
  <div id="baeminId">
    <div id="baeminIdPhoto">
      <!--로고-->
      <div id="baeminIdlogo">
        <img alt="배민id사진로고" src="<c:url value="/img/baeminid.png" />"/>
      </div>
      <!--내용-->
      <div class="baeminContent">
        <p>배민ID는 배달의민족 사이트를 간편하게 이용할 수 있는 아이디입니다.배민ID를
        만드시면 별도의 회원가입 없이 배달의민족에서 만든 서비스를 이용할 수 있습니다.</p>
        <p>배달의 민족 앱, 사장님사이트, 우리가게마케팅센터
            <br>배민닷컴에서 모두 이용 가능하며,
          <br>향후 이용할 수 있는 서비스는 다양해질 것입니다.</p>

      </div>
      <!--배민ID 가입해볼까요?-->
        <div class="baeminButton">
          <button id="baeminButton-btn">배민ID에 가입해볼까요?</button>
        </div>

    </div>


  </div>

</body>
</html>