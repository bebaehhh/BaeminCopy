<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value="/css/oauthmember-style.css" />"/>
  <script src="<c:url value="/js/jquery-3.2.1.min.js" />" charset="utf-8"></script>
  <script type="text/javascript">
    $().ready(function(){
      $("#memberId").keyup(function () {
        if($.trim($(this).val()).length > 0) {
          $("#idBtn").css("display", "block");
        }

        if($.trim($(this).val()).length == 0) {
          $("#idBtn").css("display", "none");
        }
      });

      $("#idBtn").click(function () {
        $("#id").val("");
      });

      $("#password").keyup(function () {
        if($.trim($(this).val()).length > 0) {
          $("#passwordBtn").css("display", "block");
        }

        if($.trim($(this).val()).length == 0) {
          $("#passwordBtn").css("display", "none");
        }
      });

      $("#passwordBtn").click(function () {
        $("#password").val("");
      });
      
      $("#loginBtn").click(function() {
    	  
		  var memberId = $("#memberId").val();
		  var password = $("#password").val();
		  /* 아이디 및 비밀번호 입력 체크 */
    	  if( memberId.length == 0 || password.length == 0) {
    		  $(".comment").css("display", "block");
    	  }
    	  else {
    		  
    		  $.post("<c:url value='/oauthmember/doLogin'/>", {
    			  memberId : memberId,
    			  password : password
    		  }, function(response){
    			  if(response == "isSuccess") {
    				  location.href = "<c:url value='/'/>";
    			  }
    			  else {
    				  $(".comment").text("계정 정보가 일치하지 않습니다. 다시 입력 해주세요.");
    				  $(".comment").css("display", "block");
    			  }
    		  });
     	  }
   		});
      	// 배민ID만들기 버튼
      	 $("#sign_make").click(function() {
			window.open("<c:url value='/oauthmember/signup_step1' />", "배민ID만들기");
	  	});
      
      	// Id 찾기 버튼
      	$("#find-id-btn").click(function() {
			window.open("<c:url value='/oauthmember/find-id' />", "ID 찾기", "width=500, height=550, left=350, top=150");
	  	});
      	
      	// 비밀번호 찾기
      	 $("#find-pw-btn").click(function() {
			window.open("<c:url value='/oauthmember/find-id' />", "ID 찾기", "width=500, height=550, left=350, top=150");
	  	});
      	//배민ID 버튼
     	 $("#idInformation-btn").click(function() {
 			window.open("<c:url value='/oauthmember/baeminId' />", "배민ID 버튼");
 	  	});
    });
  </script>
</head>
<body>
<script>
	
	
	function statusChangeCallback(response) {
		console.log(response);
	}
	/* 페이스북 SDK 로드 시작 */
	window.fbAsyncInit = function() {
	  FB.init({
	    appId            : '121218938540771',
	    autoLogAppEvents : true,
	    xfbml            : true,
	    version          : 'v2.10'
	  });
	  /* 페이스북 로그인 유무 확인  */
		FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
		});
	};
	
	(function(d, s, id){
	   var js, fjs = d.getElementsByTagName(s)[0];
	   if (d.getElementById(id)) {return;}
	   js = d.createElement(s); js.id = id;
	   js.src = "//connect.facebook.net/en_US/sdk.js";
	   fjs.parentNode.insertBefore(js, fjs);
	 }(document, 'script', 'facebook-jssdk'));
	/* 페이스북 SDK 로드 끝 */
	
</script>
  <div id='loginWrapper'>
    <div id='content'>
      <!-- 로고 -->
      <div id='logo'>
        <img alt="배민로고" src="<c:url value="/img/login.png" />"/>
      </div>

      <!-- 로그인 -->
      <form id="doLoginForm">
	      <div id='login'>
	        <div id='login_id'>
	          <input type="text" id='memberId' name="memberId" placeholder="배민ID(이메일 또는 아이디)" />
	          <input type="button" id="idBtn" value="X" />
	        </div>
	
	        <div id='login_pw'>
	          <input type='password' id='password' name="password" placeholder="비밀번호 (4~20자)" />
	          <input type="button" id="passwordBtn" value="X" />
	        </div>
	      </div>
	      <p class="comment">계정 정보를 입력해 주세요.</p>
	
	      <!-- 로그인 버튼 -->
	      <div id='loginBtn'>
	        <input type="button" value="로그인"/>
	      </div>
      </form>

      <!-- 회원가입 -->
      <div id='sign'>
        <div id='sign_make'>
          <a href='#'>배민 ID만들기</a>
        </div>

        <div id='find'>
          <a id="find-id-btn" href='javascript:void(0)'>아이디 찾기</a>&nbsp;&nbsp;
          <a id="find-pw-btn" href='javascript:void(0)'>비밀번호 찾기</a>&nbsp;&nbsp;
        </div>
      </div>

      <!-- 페이스북 -->
      <div id='facebookBtn'>
        <button>페이스북으로 시작하기</button>
      </div>

      <!--배달의민족은 배민ID로 로그인하실 수 있습니다. 배민ID 안내 -->
      <div id='idInformation'>
        <p>배달의민족은 배민ID로 로그인하실 수 있습니다.</p>
        <a id="idInformation-btn" href="#">배민 ID안내</a>
      </div>

      </div>

    </div>

</body>
</html>